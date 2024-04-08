module Api
  module V1
    class KittensController < ApplicationController
      class Kitten < ::Kitten
        def as_json(options = {})
          super(options.merge(except: [:created_at, :updated_at]))
        end
      end

      def index
        @kittens = Kitten.all
        respond_to do |format|
          format.json { render json: @kittens }
        end
      end

      def show
        @kitten = Kitten.find(params[:id])

        respond_to do |format|
          format.json { render json: @kitten }
        end
      end
    end
  end
end
