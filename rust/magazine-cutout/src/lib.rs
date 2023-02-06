// This stub file contains items which aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

use std::collections::HashMap;

pub fn can_construct_note(magazine: &[&str], note: &[&str]) -> bool {
    let mut magazine_words = HashMap::new();
    for word in magazine {
        *magazine_words.entry(word).or_insert(0) += 1;
    }

    for word in note {
        let remaining = magazine_words.get_mut(word);
        match remaining {
            None | Some(0) => return false,
            Some(remaining) => *remaining -= 1
        }
    }

    true
}
