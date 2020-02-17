use std::cmp::Ordering;
use std::fmt;
use std::num::ParseFloatError;
use std::ops::{Add, Mul, Sub};
use std::str::FromStr;
use thiserror::Error;

#[derive(Copy, Clone, PartialEq, PartialOrd, Debug)]
pub struct Complex(pub f64, pub f64);

impl Add<Complex> for Complex {
    type Output = Complex;

    fn add(self, rhs: Complex) -> Self::Output {
        Complex(self.0 + rhs.0, self.1 + rhs.1)
    }
}

impl Sub<Complex> for Complex {
    type Output = Complex;

    fn sub(self, rhs: Complex) -> Self::Output {
        Complex(self.0 - rhs.0, self.1 - rhs.1)
    }
}

impl Mul<Complex> for Complex {
    type Output = Complex;

    fn mul(self, rhs: Complex) -> Self::Output {
        let Complex(a1, b1) = self;
        let Complex(a2, b2) = rhs;

        let a = a1 * a2 - b1 * b2;
        let b = a1 * b2 + b1 * a2;

        Complex(a, b)
    }
}

impl Into<Complex> for f64 {
    fn into(self) -> Complex {
        Complex(self, 0.0)
    }
}

impl fmt::Display for Complex {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self.1.partial_cmp(&0.) {
            None => Err(fmt::Error),
            Some(sign) => match sign {
                Ordering::Equal => write!(f, "{}", self.0),
                Ordering::Less => write!(f, "{} - {}i", self.0, self.1.abs()),
                Ordering::Greater => write!(f, "{} + {}i", self.0, self.1),
            },
        }
    }
}

#[derive(Error, Debug, PartialEq)]
pub enum ComplexParsingError {
    #[error("Expected one or two components. Got {0}")]
    InvalidComponentsCount(usize),
    #[error("Failed to parse component")]
    ComponentParseFailed(#[from] ParseFloatError),
}

impl FromStr for Complex {
    type Err = ComplexParsingError;

    fn from_str(value: &str) -> Result<Self, Self::Err> {
        let parts = value.split(",").map(|a| a.trim()).collect::<Vec<_>>();

        if parts.len() > 2 {
            return Err(ComplexParsingError::InvalidComponentsCount(parts.len()));
        }

        let floats_result: Result<Vec<f64>, ParseFloatError> =
            parts.into_iter().map(|s| s.parse::<f64>()).collect();

        floats_result
            .map(|numbers| match numbers.len() {
                1 => numbers[0].into(),
                _ => Complex(numbers[0], numbers[1]),
            })
            .map_err(|e| ComplexParsingError::ComponentParseFailed(e))
    }
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn sum() {
        let a = Complex(1., 2.);
        let b = Complex(2., 3.);

        assert_eq!(a + b, Complex(3., 5.))
    }

    #[test]
    fn sub() {
        let a = Complex(1., 2.);
        let b = Complex(2., 3.);

        assert_eq!(b - a, Complex(1., 1.))
    }

    #[test]
    fn mul() {
        let a = Complex(1., 2.);
        let b = Complex(2., 3.);

        assert_eq!(a * b, Complex(-4., 7.))
    }

    #[test]
    fn scalar_to_complex() {
        let a: Complex = 1.2.into();

        assert_eq!(a, Complex(1.2, 0.))
    }

    #[test]
    fn parse_simple() {
        let a = "1.2".parse::<Complex>();
        assert_eq!(a.unwrap(), 1.2.into())
    }

    #[test]
    fn parse_complex() {
        let a = "2., 1.2".parse::<Complex>();
        assert_eq!(a.unwrap(), Complex(2., 1.2))
    }

    #[test]
    fn display() {
        let a: Complex = (1.).into();
        let b = Complex(-1., -1.);
        let c = Complex(1., 1.);

        assert_eq!(format!("{}, {}, {}", a, b, c), "1, -1 - 1i, 1 + 1i")
    }
}
