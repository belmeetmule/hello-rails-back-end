# Greetings Controller for API
module Api
  module V1
    # Greetings Controller for API
    class GreetingsController < ApplicationController
      def index
        # generate random number between 1 and 5
        random_number = rand(1..5)
        # return a random greeting
        @greeting = Greeting.find(random_number)
        return json_response(@greeting) if @greeting
        
        json_response({ message: 'No Greeting Found' }, :not_found)
      end

      private

      def json_response(object, status = :ok)
        render json: object, status:
      end
    end
  end
end
