defmodule Contributr.ContactView do
  use Contributr.Web, :view

  def render("index.json", %{contacts: contacts}) do 
    contacts
  end

  def render("create.json", %{contact: contact}) do 
    contact
  end
end
