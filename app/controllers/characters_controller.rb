class CharactersController < ApplicationController
  def index
    @result_set = Character.all(params[:page].to_i, params[:q])
  end
end
