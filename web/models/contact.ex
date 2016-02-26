defmodule Contributr.Contact do
  use Ecto.Model

  schema "contacts" do
    field :name
    field :phone
    
    timestamps
  end

	@required_fields ~w(name phone)
  @optional_fields ~w()

	def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end 

end
