module TodoItemsHelper

  private
  def set_todo_list
    # list_id = TodoList.first.id
    # @todo_list = TodoList.find(list_id)

    item_id=@todo_list.todo_items.first.id
    @todo_item=@todo_list.todo_items.find(item_id)
  end
end
