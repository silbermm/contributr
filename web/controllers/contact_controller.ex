defmodule Contributr.ContactController do
  use Contributr.Web, :controller
  
  require Logger

  alias Contributr.Repo
  alias Contributr.Contact
  
  plug :action

  def index(conn, _params) do
    contacts = Repo.all(Contact)
    render conn, contacts: contacts
  end

  def create(conn, %{"name" => name, "phone" => phone}) do
    Logger.debug(name)
    Logger.debug(phone)
    contact = %{"name" => name, "phone" => phone}
		changeset = Contact.changeset(%Contact{}, contact)
    case Repo.insert(changeset) do 
      {:ok, inserted} -> 
        conn 
        |> put_status(:created)
        |> render contact: contact
      {:error, _} ->
        conn 
          |> put_status(:unprocessable_entity)
          |> render contact: %{}
    end
    
      end
end
