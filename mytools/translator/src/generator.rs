use crate::{command::Command, labeler::Labeler};

pub fn generate_bootstrap() -> Vec<String> {
    let code = include_str!("./asm/bootstrap.asm").to_owned();
    code.lines().map(String::from).collect()
}

pub fn generate_code(labeler: &mut Labeler, command: Command) -> Vec<String> {
    match command {
        Command::Arithmetic(s) => generate_code_arithmetic(labeler, s.as_str()),
        Command::Call(s, u) => generate_code_call(labeler, s.as_str(), u),
        Command::Function(s, u) => generate_code_function(s.as_str(), u),
        Command::Goto(s) => vec![format!("@{s}"), "0;JMP".into()],
        Command::If(s) => generate_code_if(s.as_str()),
        Command::Label(s) => vec![format!("({s})")],
        Command::Pop(s, u) => generate_code_pop(s.as_str(), u),
        Command::Push(s, u) => generate_code_push(s.as_str(), u),
        Command::Return => generate_code_return(),
    }
}

fn generate_code_arithmetic(labeler: &mut Labeler, s: &str) -> Vec<String> {
    let code = match s {
        "add" => include_str!("./asm/add.asm").to_owned(),
        "sub" => include_str!("./asm/sub.asm").to_owned(),
        "neg" => include_str!("./asm/neg.asm").to_owned(),
        "eq" => format!(include_str!("./asm/eq.asm"), labeler.generate("$eq")),
        "gt" => format!(include_str!("./asm/gt.asm"), labeler.generate("$gt")),
        "lt" => format!(include_str!("./asm/lt.asm"), labeler.generate("$lt")),
        "and" => include_str!("./asm/and.asm").to_owned(),
        "or" => include_str!("./asm/or.asm").to_owned(),
        "not" => include_str!("./asm/not.asm").to_owned(),
        _ => panic!("Unknown operation '{s}'."),
    };

    code.lines().map(String::from).collect()
}

fn generate_code_call(labeler: &mut Labeler, s: &str, u: u16) -> Vec<String> {
    let code = format!(
        include_str!("./asm/call.asm"),
        s,
        5 + u,
        labeler.generate("$retn")
    );
    code.lines().map(String::from).collect()
}

fn generate_code_function(s: &str, u: u16) -> Vec<String> {
    let mut lines = vec![
        String::new(),
        format!("//** function {s}"),
        format!("({s})"),
    ];
    for _ in 0..u {
        lines.push(format!(include_str!("./asm/push_constant.asm"), 0));
    }
    lines
}

fn generate_code_if(s: &str) -> Vec<String> {
    let code = format!(include_str!("./asm/if.asm"), s);
    code.lines().map(String::from).collect()
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

fn generate_code_return() -> Vec<String> {
    let code = include_str!("./asm/return.asm");
    code.lines().map(String::from).collect()
}
