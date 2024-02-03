use crate::command::*;

pub fn generate_code(counter: &mut u16, command: Command) -> Vec<String> {
    match command {
        Command::Push(s, i) => generate_code_push(s.as_str(), i),
        Command::Pop(s, i) => generate_code_pop(s.as_str(), i),
        Command::Arithmetic(s) => generate_code_arithmetic(counter, s.as_str()),
        _ => unimplemented!(),
    }
}

fn generate_code_pop(s: &str, u: u16) -> Vec<String> {
    let code = match s {
        "argument" => format!(include_str!("./asm/pop.asm"), "ARG", u),
        "local" => format!(include_str!("./asm/pop.asm"), "LCL", u),
        "pointer" => format!(include_str!("./asm/pop_r.asm"), 3 + u),
        "static" => format!(include_str!("./asm/pop_r.asm"), 16 + u),
        "temp" => format!(include_str!("./asm/pop_r.asm"), 5 + u),
        "that" => format!(include_str!("./asm/pop.asm"), "THAT", u),
        "this" => format!(include_str!("./asm/pop.asm"), "THIS", u),
        _ => panic!("Unknown pop type '{s}'."),
    };

    code.lines().map(String::from).collect()
}

fn generate_code_push(s: &str, u: u16) -> Vec<String> {
    let code = match s {
        "argument" => format!(include_str!("./asm/push.asm"), "ARG", u),
        "constant" => format!(include_str!("./asm/push_constant.asm"), u),
        "local" => format!(include_str!("./asm/push.asm"), "LCL", u),
        "pointer" => format!(include_str!("./asm/push_r.asm"), 3 + u),
        "static" => format!(include_str!("./asm/push_r.asm"), 16 + u),
        "temp" => format!(include_str!("./asm/push_r.asm"), 5 + u),
        "that" => format!(include_str!("./asm/push.asm"), "THAT", u),
        "this" => format!(include_str!("./asm/push.asm"), "THIS", u),
        _ => panic!("Unknown push type '{s}'."),
    };

    code.lines().map(String::from).collect()
}

fn generate_code_arithmetic(counter: &mut u16, s: &str) -> Vec<String> {
    let code = match s {
        "add" => include_str!("./asm/add.asm").to_owned(),
        "sub" => include_str!("./asm/sub.asm").to_owned(),
        "neg" => include_str!("./asm/neg.asm").to_owned(),
        "eq" => format!(include_str!("./asm/eq.asm"), *counter),
        "gt" => format!(include_str!("./asm/gt.asm"), *counter),
        "lt" => format!(include_str!("./asm/lt.asm"), *counter),
        "and" => include_str!("./asm/and.asm").to_owned(),
        "or" => include_str!("./asm/or.asm").to_owned(),
        "not" => include_str!("./asm/not.asm").to_owned(),
        _ => panic!("Unknown operation '{s}'."),
    };
    *counter += 1;

    code.lines().map(String::from).collect()
}
