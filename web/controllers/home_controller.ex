defmodule Contributr.HomeController do
  use Contributr.Web, :controller

	plug Ueberauth

  def index(conn, _params) do
    render(conn, "index.html", page_title: "Edit The Thing")
  end

	def login(conn, _params) do
		render(conn, "login.html", page_title: "Login")
	end

end
