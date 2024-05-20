// TODO: import the `gleam/int` module
import gleam/float
import gleam/int
import gleam/string

// TODO: import the `gleam/float` module
// TODO: import the `gleam/string` module

pub fn pence_to_pounds(pence: Int) -> Float {
  int.to_float(pence) /. 100.0
}

pub fn pounds_to_string(pounds: Float) -> String {
  "£"
  |> string.append(float.to_string(pounds))
}
