import gleam/int
import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

fn item_price(item: Pizza, total: Int) -> Int {
  let item_price = case item {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(item) -> 1 + item_price(item, total)
    ExtraToppings(item) -> 2 + item_price(item, total)
  }

  item_price + total
}

pub fn pizza_price(pizza: Pizza) -> Int {
  item_price(pizza, 0)
}

pub fn order_price(order: List(Pizza)) -> Int {
  case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }
  |> int.add(compute_order(order, 0))
}

fn compute_order(order: List(Pizza), total: Int) -> Int {
  case order {
    [] -> total
    [pizza, ..rest] -> pizza_price(pizza) + compute_order(rest, total)
  }
}
