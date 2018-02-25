class GroupingsController < ApplicationController
  before_action :set_grouping, only: [:destroy]

  # DELETE /groupings/1
  # DELETE /groupings/1.json
  def destroy
    group = @grouping.group
    @grouping.destroy
    respond_to do |format|
      format.html { redirect_to edit_group_path(group) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grouping
      @grouping = Grouping.find(params[:id])
    end

end
