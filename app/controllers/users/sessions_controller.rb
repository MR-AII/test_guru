# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    super
    flash[:notice] = t('.flash_greeting', current_user: current_user.first_name)
  end
end
