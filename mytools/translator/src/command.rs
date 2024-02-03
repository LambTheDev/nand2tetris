pub enum Command {
    Arithmetic(String),
    Push(String, u16),
    Pop(String, u16),
    Label(String),
    Goto(String),
    If(String),
    Function(String, u16),
    Return,
    Call(String, u16),
}
