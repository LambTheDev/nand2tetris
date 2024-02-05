#![warn(clippy::all, clippy::pedantic)]

use std::env;
use std::fs::File;
use std::io::{BufRead, BufReader, LineWriter, Write};

mod command;
mod generator;
mod labeler;

use labeler::Labeler;

use crate::command::Command;
use crate::generator::generate_code;

type Result<T> = std::result::Result<T, Box<dyn std::error::Error>>;

fn main() -> Result<()> {
    let input_path = env::args().nth(1).ok_or("expected input")?;
    let output_path = input_path.replace(".vm", ".asm");

    let reader = BufReader::new(File::open(&input_path)?);
    let writable = File::create(output_path)?;
    let mut writer = LineWriter::new(writable);
    let mut labeler = Labeler::new();

    for line in reader.lines().flatten() {
        let command = parse(&line)?;
        if command.is_none() {
            continue;
        }
        let lines = generate_code(&mut labeler, command.unwrap());
        for code in lines {
            writeln!(writer, "{code}")?;
        }
    }
    Ok(())
}

fn parse(line: &str) -> Result<Option<Command>> {
    let without_comment = line.find("//").map_or_else(|| line, |index| &line[..index]);
    let trimmed = without_comment.trim();
    if trimmed.is_empty() {
        return Ok(None);
    }
    let mut iterator = trimmed.split(' ');
    let command_type = iterator.next();
    let arg1 = iterator.next();
    let arg2 = iterator.next().map(str::parse::<u16>).transpose()?;

    match (command_type, arg1, arg2) {
        (Some("function"), Some(arg1), Some(arg2)) => {
            Ok(Some(Command::Function(String::from(arg1), arg2)))
        }
        (Some("function"), _, _) => Err("Missing args for function".into()),
        (Some("call"), Some(arg1), Some(arg2)) => Ok(Some(Command::Call(String::from(arg1), arg2))),
        (Some("call"), _, _) => Err("Missing args for call".into()),
        (Some("goto"), Some(arg1), _) => Ok(Some(Command::Goto(String::from(arg1)))),
        (Some("goto"), _, _) => Err("Missing args for goto".into()),
        (Some("if-goto"), Some(arg1), _) => Ok(Some(Command::If(String::from(arg1)))),
        (Some("if-goto"), _, _) => Err("Missing args for if-goto".into()),
        (Some("label"), Some(arg1), _) => Ok(Some(Command::Label(String::from(arg1)))),
        (Some("label"), _, _) => Err("Missing args for label".into()),
        (Some("pop"), Some(arg1), Some(arg2)) => Ok(Some(Command::Pop(String::from(arg1), arg2))),
        (Some("pop"), _, _) => Err("Missing args for pop".into()),
        (Some("push"), Some(arg1), Some(arg2)) => Ok(Some(Command::Push(String::from(arg1), arg2))),
        (Some("push"), _, _) => Err("Missing args for push".into()),
        (Some("return"), _, _) => Ok(Some(Command::Return)),
        (Some(x), None, None) => Ok(Some(Command::Arithmetic(String::from(x)))),
        (Some(x), _, _) => Err(format!("Unknown command '{x}'").into()),
        _ => unreachable!(),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parse_empty() -> Result<()> {
        let actual = parse("")?;
        assert!(actual.is_none());
        Ok(())
    }

    #[test]
    fn parse_comment() -> Result<()> {
        let actual = parse("// this is a comment")?;
        assert!(actual.is_none());
        Ok(())
    }

    #[test]
    fn parse_push() -> Result<()> {
        let actual = parse("push constant 7")?;
        match actual {
            Some(Command::Push(s, u)) => {
                assert_eq!(s, "constant");
                assert_eq!(u, 7);
            }
            _ => panic!(),
        }
        Ok(())
    }

    #[test]
    fn parse_arithmetic() -> Result<()> {
        let actual = parse("add")?;
        assert!(matches!(actual, Some(Command::Arithmetic(x)) if x == "add"));
        Ok(())
    }
}
