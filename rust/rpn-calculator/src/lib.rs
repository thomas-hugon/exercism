use std::ops::{Add, Sub, Mul, Div};

#[derive(Debug)]
pub enum CalculatorInput {
    Add,
    Subtract,
    Multiply,
    Divide,
    Value(i32),
}

pub fn evaluate(inputs: &[CalculatorInput]) -> Option<i32> {
    let mut stack = vec![];

    for input in inputs {
        match input {
            CalculatorInput::Add => { apply(&mut stack, i32::add)?; }
            CalculatorInput::Subtract => { apply(&mut stack, i32::sub)?; }
            CalculatorInput::Multiply => { apply(&mut stack, i32::mul)?; }
            CalculatorInput::Divide => { apply(&mut stack, i32::div)?; }
            CalculatorInput::Value(x) => stack.push(*x)
        }
    }

    stack.pop()
        .filter(|_| stack.is_empty())
}


fn apply<F: FnOnce(i32, i32) -> i32>(stack: &mut Vec<i32>, op: F) -> Option<()> {
    let y = stack.pop()?;
    let x = stack.pop()?;
    stack.push(op(x,y));
    Some(())
}