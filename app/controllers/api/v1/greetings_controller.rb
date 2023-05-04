class Api::V1::GreetingsController < ApplicationController
    def index
         # generate random number between 1 and 5
         random_number = rand(1..5)
         # return a random greeting
         @greeting = Greeting.find(random_number)
         if @greeting
            return json_response(@greeting)
        else
            return json_response({message: "No Greeting Found"}, :not_found)
        end

    end

    private

    def json_response(object, status = :ok)
        render json: object, status: status
    end
end
