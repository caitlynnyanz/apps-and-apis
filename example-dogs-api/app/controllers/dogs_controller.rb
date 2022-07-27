class DogsController < ApplicationController
  def create 
    dog = Dog.create(
      name: params[:name],
      age: params[:age],
      breed: params[:breed],
      user_id: current_user.id
    )
    render json: dog.as_json
  end

  def update 
    dog_id = params[:id]
    dog = Dog.find_by(id: dog_id)

    dog.name = params[:name] || dog.name
    dog.age = params[:age] || dog.age
    dog.breed = params[:breed] || dog.breed

    dog.save
    render json: dog.as_json
  end

  def destroy
    dog_id = params[:id]
    dog = Dog.find_by(id: dog_id)

    dog.destroy
    render json: {message: "Dog successfully removed from database!"}
  end
end
