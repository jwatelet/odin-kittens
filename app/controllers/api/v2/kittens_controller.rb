module Api
  module V2
    class KittensController < ApplicationController
      class Kitten < ::Kitten
        def as_json(options = {})
          super(options.merge(methods: [:random]))
        end

        def random
          rand(0..100)
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
