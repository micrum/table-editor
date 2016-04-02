class FragmentsController < ApplicationController
  def index
    @fragments = Fragment.all
  end
end
