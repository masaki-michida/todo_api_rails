class V1::TodosController < ApplicationController

  def index
    if params[:id]
      render json: todo
    else
      users = User.all
      render json: users
    end
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    if todo.destroy
      render json: todo
    end
  end


  private

  def todo_params
    params.require(:todo).permit(:title,:user_id)
  end

end
