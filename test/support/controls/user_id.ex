defmodule Controls.UserID do
  def example do
    "some-user"
  end

  def other_example do
    "some-other-user"
  end

  def unique_example do
    "some-user-#{System.unique_integer([:positive])}"
  end
end
