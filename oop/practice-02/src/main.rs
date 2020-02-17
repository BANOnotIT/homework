use std::io;
use std::io::BufRead;

mod cmplx;

use cmplx::Complex;

fn main() {
    println!("Enter first complex number X+iY like X, Y:");
    let first: Complex = get_line()
        .trim()
        .parse()
        .expect("Incomplete syntax for complex number");

    println!("Enter second complex number:");
    let second: Complex = get_line()
        .trim()
        .parse()
        .expect("Incomplete syntax for complex number");

    println!("Chose option to process with numbers (+, -, *):");
    match get_line().trim() {
        "+" => println!("sum: {}", first + second),
        "-" => println!("sub: {}", first - second),
        "*" => println!("multiplied: {}", first * second),

        _ => println!("No operation selected"),
    }

    println!("Exiting")
}

fn get_line() -> String {
    let mut line = String::new();
    let stdin = io::stdin();
    stdin.lock().read_line(&mut line).unwrap();
    line
}
