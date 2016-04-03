class FragmentsController < ApplicationController

  def index
    @fragments = Fragment.all
  end

  def create
    @fragment = Fragment.new(fragment_params)
    if @fragment.save
      render json: @fragment
    else
      render json: @fragment.errors, status: :unprocessable_entity
    end
  end

  def update
    @fragment = Fragment.find(params[:id])
    if @fragment.update(fragment_params)
      render json: @fragment
    else
      render json: @fragment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @fragment = Fragment.find(params[:id])
    @fragment.destroy
    head :no_content
  end

  private

  def fragment_params
    params.require(:fragment).permit(:datatype, :value)
  end
end
