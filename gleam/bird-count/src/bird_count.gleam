pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [x] -> x
    [x, ..] -> x
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [x] -> [x + 1]
    [x, ..rest] -> [x + 1, ..rest]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [0, ..] -> True
    [] -> False
    [_, ..rest] -> has_day_without_birds(rest)
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [x] -> x
    [x, ..rest] -> x + total(rest)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [x, ..rest] if x >= 5 -> 1 + busy_days(rest)
    [_, ..rest] -> busy_days(rest)
  }
}
