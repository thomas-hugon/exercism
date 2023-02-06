use std::fmt::{Display, Formatter, Result};

pub struct Roman(String);

impl Display for Roman {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
        write!(f, "{}", self.0)
    }
}

impl From<u32> for Roman {
    fn from(num: u32) -> Self {
        fn part(num: usize, div: usize, one: &str, five: &str, ten: &str) -> String {
            match num / div {
                val if val >= 9 => format!("{}{}", one, ten),
                val if val >= 5 => format!("{}{}", five, one.repeat(val - 5)),
                val if val >= 4 => format!("{}{}", one, five),
                val if val >= 1 => one.repeat(val),
                _ => String::new(),
            }
        }

        Roman(
            String::new()
                + &part(num as usize, 1000, "M", "", "")
                + &part(num as usize % 1000, 100, "C", "D", "M")
                + &part(num as usize % 100, 10, "X", "L", "C")
                + &part(num as usize % 10, 1, "I", "V", "X"),
        )
    }
}
