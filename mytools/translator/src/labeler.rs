use std::collections::HashMap;

pub struct Labeler {
    map: HashMap<String, u16>,
}

impl Labeler {
    pub fn new() -> Self {
        Self {
            map: HashMap::new(),
        }
    }
    pub fn generate(&mut self, name: &str) -> String {
        #[allow(clippy::single_match_else)]
        let counter = match self.map.get_mut(name) {
            Some(x) => x,
            None => {
                self.map.insert(String::from(name), 0);
                self.map.get_mut(name).unwrap()
            }
        };
        let label = format!("{name}.{counter}");
        *counter += 1;

        label
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn generate_test() {
        let mut labeler = Labeler::new();
        assert_eq!(labeler.generate("eq"), String::from("eq.0"));
        assert_eq!(labeler.generate("gt"), String::from("gt.0"));
        assert_eq!(labeler.generate("eq"), String::from("eq.1"));
    }
}
