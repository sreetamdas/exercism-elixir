defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 and not legacy? -> :trace
      level == 0 and legacy? -> :unknown
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and not legacy? -> :fatal
      level == 5 and legacy? -> :unknown
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label == :error ->
        :ops

      label == :fatal ->
        :ops

      label == :unknown ->
        cond do
          legacy? -> :dev1
          true -> :dev2
        end

      true ->
        nil
    end
  end
end
