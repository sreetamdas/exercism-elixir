defmodule NameBadge do
  def print(id, name, department) do
    id_part = if id == nil, do: "", else: "[#{id}] - "

    department_part =
      if department == nil, do: " - OWNER", else: " - #{String.upcase(department)}"

    id_part <> name <> department_part
  end
end
