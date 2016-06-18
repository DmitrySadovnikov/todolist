class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, only: [:show, :edit, :update, :destroy]
  
  
  
  
  
  # GET /todo_lists/:todo_list_id/todo_items/:id(.:format)
  def show
  end

  
  # GET    /todo_lists/:todo_list_id/todo_items/new(.:format)
  def new
    @todo_item = @todo_list.todo_items.new
  end

  
  # GET    /todo_lists/:todo_list_id/todo_items/:id/edit(.:format)
  def edit
  end

  
  # GET    /todo_lists/:todo_list_id/todo_items/new(.:format)
  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)

    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to @todo_list, notice: 'Todo item was successfully created.' }
        format.json { render :show, status: :created, location: @todo_item }
      else
        format.html { render :new }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH  /todo_lists/:todo_list_id/todo_items/:id(.:format)      todo_items#update
  # PUT    /todo_lists/:todo_list_id/todo_items/:id(.:format)      todo_items#update
  
  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to @todo_list, notice: 'Todo item was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_item }
      else
        format.html { render :edit }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # DELETE /todo_lists/:todo_list_id/todo_items/:id(.:format)
  def destroy
    @todo_item.destroy
    respond_to do |format|
      format.html { redirect_to @todo_list, notice: 'Todo item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_item
      @todo_item = @todo_list.todo_items.find(params[:id])
    end

    def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_item_params
      params.require(:todo_item).permit(:title, :due_date, :description, :completed)
    end
end
