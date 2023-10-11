defmodule InvestifyWeb.UserLoginLive do
  use InvestifyWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center justify-center px-6 pt-8 mx-auto md:h-screen pt:mt-0 dark:bg-gray-900">
      <.header class="text-center">
        <:subtitle>
          <.link
            navigate={~p"/users/register"}
            class="flex items-center justify-center mb-8 text-2xl font-semibold lg:mb-10 dark:text-white"
          >
            <svg
              class="w-6 h-6 text-gray-800 dark:text-yellow-400"
              aria-hidden="true"
              xmlns="http://www.w3.org/2000/svg"
              fill="currentColor"
              viewBox="0 0 20 20"
            >
              <path d="M11.074 4 8.442.408A.95.95 0 0 0 7.014.254L2.926 4h8.148ZM9 13v-1a4 4 0 0 1 4-4h6V6a1 1 0 0 0-1-1H1a1 1 0 0 0-1 1v13a1 1 0 0 0 1 1h17a1 1 0 0 0 1-1v-2h-6a4 4 0 0 1-4-4Z" />
              <path d="M19 10h-6a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h6a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1Zm-4.5 3.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2ZM12.62 4h2.78L12.539.41a1.086 1.086 0 1 0-1.7 1.352L12.62 4Z" />
            </svg>
            <span class="pl-4">Investify</span>
          </.link>
        </:subtitle>
      </.header>
      <div class="w-full max-w-xl p-6 space-y-8 sm:p-8 bg-white rounded-lg shadow dark:bg-gray-800">
        <div class="text-sm font-medium text-gray-500 dark:text-gray-400">
          Sign in to account, Don't have an account?
          <.link
            navigate={~p"/users/register"}
            class="text-primary-700 hover:underline dark:text-primary-500"
          >
            Sign up
          </.link>
          for an account now.
        </div>
        <.simple_form
          for={@form}
          id="login_form"
          action={~p"/users/log_in"}
          phx-update="ignore"
          class="mt-8 space-y-6"
        >
          <div>
            <.label for="Email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
              Your email
            </.label>
            <.input
              field={@form[:email]}
              type="email"
              label="Email"
              required
              placeholder="name@company.com"
              class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            />
          </div>

          <div>
            <.label
              for="Password"
              class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
            >
              Your password
            </.label>
            <.input
              field={@form[:password]}
              type="password"
              label="Password"
              required
              placeholder="••••••••"
              class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            />
          </div>

          <div>
            <.input
              field={@form[:remember_me]}
              type="checkbox"
              label="Keep me logged in"
              class="bg-gray-50 border border-gray-300 text-white sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            />
          </div>

          <div class="text-sm font-medium text-gray-500 dark:text-gray-400">
            <.link
              href={~p"/users/reset_password"}
              class="text-primary-700 hover:underline dark:text-primary-500"
            >
              Forgot your password?
            </.link>
          </div>

          <:actions>
            <.button
              phx-disable-with="Signing in..."
              class="w-full px-5 py-3 text-base font-medium text-center text-white bg-primary-700 rounded-lg hover:bg-slate-800 focus:ring-4 focus:ring-primary-300 sm:w-auto dark:bg-slate-900 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
            >
              Sign in <span aria-hidden="true">→</span>
            </.button>
          </:actions>
        </.simple_form>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    email = live_flash(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
