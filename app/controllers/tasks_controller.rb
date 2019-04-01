class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @tasks = Task.all
    render 'tasks/index.jbuilder'
  end

  def create
    puts "creating task"
    @task = Task.new(task_params)
    puts "inspecting task"
    puts @task.inspect

    saved = @task.save

    return render json: {}, status: :bad_request if !saved
    render 'tasks/create.jbuilder'
  end

  def destroy
    puts "destorying task"
    @task = Task.find_by(id: params[:id])

    # if @task and @task.destroy  // this is also clean way to do it
    return render json: {success: false}, status: :not_found if @task.id == nil
    @task.destroy
    render json: {success: true}
  end

  def mark_complete
    puts "marking task as complete"
    @task = Task.find_by(id: params[:id])
    if @task
      puts "in task positive loop"
      #@task.completed = true
      @task.update(completed: "true")
      #@task.save
      puts @task.inspect
      render 'tasks/mark_complete.jbuilder'
    else
      render json: {success: false}
    end
  end

  def mark_active
    puts "marking task as not completed"
    @task = Task.find_by(id: params[:id])
    if @task
      @task.completed = false
      @task.save
      render 'tasks/mark_complete.jbuilder'
    else
      render json: {success: false}
    end
  end

  private
    def task_params
      p = params.require(:task).permit(:content, :completed)
      puts p.inspect
      return p
    end

end
