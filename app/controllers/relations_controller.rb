class RelationsController < ApplicationController
  before_action :set_relation, only: [:destroy]
  before_action :require_admin, only: :destroy

  # DELETE /relations/1
  # DELETE /relations/1.json
  def destroy
    book = @relation.book
    @relation.destroy
    respond_to do |format|
      format.html { redirect_to edit_book_path(book), notice: 'Author was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relation
      @relation = Relation.find(params[:id])
    end

end
