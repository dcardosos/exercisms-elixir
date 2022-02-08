defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name |>
    String.trim() |>
    String.at(0)
  end

  def initial(name) do
    name |>
    String.upcase |>
    HighSchoolSweetheart.first_letter() |>
    Kernel.<>(".")
  end

  def initials(full_name) do
    full_name |>
    String.split |>
    Enum.map(fn x -> HighSchoolSweetheart.initial(x) end) |>
    Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    i1 = HighSchoolSweetheart.initials(full_name1)
    i2 = HighSchoolSweetheart.initials(full_name2) 

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{i1}  +  #{i2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
