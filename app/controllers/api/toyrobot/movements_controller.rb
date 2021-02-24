class Api::Toyrobot::MovementsController < ApplicationController
  before_action :toy

  def create
    move.simulation
    render json: {location: move.final}
  end

  private

  def move
    @move ||= ToySimulation.new(toy, commands)
  end

  def commands
    @commands ||= params[:commands]
  end

  def toy
    @toy ||= ::Toy.where(id: params[:id]).first_or_create
  end
end
