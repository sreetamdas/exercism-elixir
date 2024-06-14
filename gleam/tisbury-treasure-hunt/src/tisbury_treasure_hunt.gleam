import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  let #(str, int) = place_location

  #(int, str)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  treasures
  |> list.filter(fn(treasure) {
    treasure_location_matches_place_location(place.1, treasure.1)
  })
  |> list.length()
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case found_treasure.0, place.0, desired_treasure.0 {
    "Brass Spyglass", "Abandoned Lighthouse", _ -> True
    "Amethyst Octopus", "Stormy Breakwater", "Crystal Crab" -> True
    "Amethyst Octopus", "Stormy Breakwater", "Glass Starfish" -> True
    "Vintage Pirate Hat", "Harbor Managers Office", "Model Ship in Large Bottle"
    -> True
    "Vintage Pirate Hat",
      "Harbor Managers Office",
      "Antique Glass Fishnet Float"
    -> True
    _, _, _ -> False
  }
}
