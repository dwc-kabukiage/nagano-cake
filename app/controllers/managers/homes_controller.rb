class Managers::HomesController < ApplicationController
  def top
    @members = Member.all
  end
end
