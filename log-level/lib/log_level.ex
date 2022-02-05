defmodule LogLevel do
  def to_label(level, legacy?) do
    # Please implement the to_label/2 function
    cond do
      level == 0 and not legacy? -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and not legacy? -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    # Please implement the alert_recipient/2 function
    log_label = to_label(level, legacy?)
    cond do
      log_label == :error or log_label == :fatal -> :ops
      log_label == :unknown and legacy? -> :dev1
      log_label == :unknown and !legacy? -> :dev2 
      true -> false
    end
  end
end
