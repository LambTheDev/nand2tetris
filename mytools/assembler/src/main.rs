use std::collections::HashMap;
use std::env;
use std::fs::File;
use std::io::{BufRead, BufReader, LineWriter, Write};

type Result<T> = std::result::Result<T, Box<dyn std::error::Error>>;

fn main() -> Result<()> {
    let mut symbol_map: HashMap<String, u16> = HashMap::from([
        (String::from("SCREEN"), 16384),
        (String::from("KBD"), 24576),
        (String::from("SP"), 0),
        (String::from("LCL"), 1),
        (String::from("ARG"), 2),
        (String::from("THIS"), 3),
        (String::from("THAT"), 4),
    ]);
    let mut addr_next = 16_u16;
    for i in 0..16_u16 {
        let key = format!("R{}", i);
        symbol_map.insert(key, i);
    }
    let input_path = env::args().nth(1).ok_or("expected input")?;
    let output_path = input_path.replace(".asm", ".hack");

    let reader = BufReader::new(File::open(&input_path)?);

    let mut line_number = 0_u16;
    for line in reader.lines().flatten() {
        let stripped = strip(&line);
        if !stripped.is_empty() {
            match parse_label(stripped) {
                Some(key) => {
                    symbol_map.insert(String::from(key), line_number);
                }
                _ => line_number += 1,
            }
        }
    }

    let reader = BufReader::new(File::open(&input_path)?);
    let writable = File::create(output_path)?;
    let mut writer = LineWriter::new(writable);

    for line in reader.lines().flatten() {
        let stripped = strip(&line);
        let is_label = &stripped.starts_with('(');
        if !stripped.is_empty() && !is_label {
            let translated = translate(&mut symbol_map, &mut addr_next, stripped)?;
            writeln!(writer, "{}", translated)?;
            line_number += 1;
        }
    }

    Ok(())
}

fn parse_label(line: &str) -> Option<&str> {
    if line.starts_with('(') {
        let mut chars = line.chars();
        chars.next();
        chars.next_back();
        Some(chars.as_str())
    } else {
        None
    }
}

fn strip(line: &str) -> &str {
    let without_comment = line.find("//").map_or_else(|| line, |index| &line[..index]);
    without_comment.trim()
}

fn translate(
    symbol_map: &mut HashMap<String, u16>,
    addr_next: &mut u16,
    line: &str,
) -> Result<String> {
    match line.chars().next() {
        Some('@') => translate_a(symbol_map, addr_next, line),
        Some(_) => translate_d(line),
        None => unreachable!(),
    }
}

fn translate_a(
    symbol_map: &mut HashMap<String, u16>,
    addr_next: &mut u16,
    line: &str,
) -> Result<String> {
    let str = &line[1..];
    let address: u16 = match str::parse(str) {
        Ok(address) => address,
        _ => match symbol_map.get(str) {
            Some(address) => *address,
            _ => {
                let addr = *addr_next;
                *addr_next += 1;
                symbol_map.insert(String::from(str), addr);
                addr
            }
        },
    };
    Ok(format!("{:016b}", address))
}

fn translate_d(line: &str) -> Result<String> {
    let dest_map = HashMap::from([
        ("M", "001"),
        ("D", "010"),
        ("MD", "011"),
        ("A", "100"),
        ("AM", "101"),
        ("AD", "110"),
        ("AMD", "111"),
    ]);
    let comp_map = HashMap::from([
        ("0", "101010"),
        ("1", "111111"),
        ("-1", "111010"),
        ("D", "001100"),
        ("A", "110000"),
        ("!D", "001101"),
        ("!A", "110001"),
        ("-D", "001111"),
        ("-A", "110011"),
        ("D+1", "011111"),
        ("A+1", "110111"),
        ("D-1", "001110"),
        ("A-1", "110010"),
        ("D+A", "000010"),
        ("D-A", "010011"),
        ("A-D", "000111"),
        ("D&A", "000000"),
        ("D|A", "010101"),
    ]);
    let jump_map = HashMap::from([
        ("JGT", "001"),
        ("JEQ", "010"),
        ("JGE", "011"),
        ("JLT", "100"),
        ("JNE", "101"),
        ("JLE", "110"),
        ("JMP", "111"),
    ]);

    let (dest, rest) = match line.split_once('=') {
        Some((dest, rest)) => (Some(dest), rest),
        None => (None, line),
    };
    let (comp, jump) = match rest.split_once(';') {
        Some((comp, jump)) => (comp, Some(jump)),
        None => (rest, None),
    };

    let mut r = String::from("111");

    // a
    let is_comp_m = comp.contains('M');
    r.push(if is_comp_m { '1' } else { '0' });

    // cccccc
    let comp_a = comp.replace('M', "A");
    r.push_str(comp_map.get(comp_a.as_str()).ok_or("expected comp")?);

    let str_dest = match dest {
        Some(dest) => dest_map.get(dest).ok_or("expected dest")?,
        None => "000",
    };
    r.push_str(str_dest); // ddd

    let str_jump = match jump {
        Some(jump) => jump_map.get(jump).ok_or("expected jump")?,
        None => "000",
    };
    r.push_str(str_jump); // jjj

    Ok(r)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn strip_whitespace() -> Result<()> {
        let actual = strip("   ");
        assert_eq!(actual, "");
        Ok(())
    }

    #[test]
    fn strip_comment_line() -> Result<()> {
        let actual = strip("// comment");
        assert_eq!(actual, "");
        Ok(())
    }

    #[test]
    fn strip_comment() -> Result<()> {
        let actual = strip("    D=M  // D=i");
        assert_eq!(actual, "D=M");
        Ok(())
    }

    #[test]
    fn translate_a() -> Result<()> {
        let mut symbol_map: HashMap<String, u16> = HashMap::new();
        let mut addr_next = 16_u16;
        let actual = translate(&mut symbol_map, &mut addr_next, "@3")?;
        assert_eq!(actual, "0000000000000011");
        Ok(())
    }

    #[test]
    fn translate_a_symbol() -> Result<()> {
        let mut symbol_map: HashMap<String, u16> = HashMap::new();
        let mut addr_next = 16_u16;
        translate(&mut symbol_map, &mut addr_next, "@i")?;
        let actual = translate(&mut symbol_map, &mut addr_next, "@j")?;
        assert_eq!(actual, "0000000000010001");
        Ok(())
    }

    #[test]
    fn translate_dest_amd() -> Result<()> {
        let mut symbol_map: HashMap<String, u16> = HashMap::new();
        let mut addr_next = 16_u16;
        let actual = translate(&mut symbol_map, &mut addr_next, "AMD=1")?;
        assert_eq!(&actual[10..13], "111");
        Ok(())
    }

    #[test]
    fn translate_comp() -> Result<()> {
        let mut symbol_map: HashMap<String, u16> = HashMap::new();
        let mut addr_next = 16_u16;
        let actual = translate(&mut symbol_map, &mut addr_next, "1")?;
        assert_eq!(&actual[4..10], "111111");
        Ok(())
    }
}
