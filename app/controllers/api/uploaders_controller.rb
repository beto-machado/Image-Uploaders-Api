# frozen_string_literal: true

module Api

  class UploadersController < ApplicationController
    before_action :set_uploader, only: [:show, :update, :destroy]

    def index
      @uploaders = Uploader.all

      render json: @uploaders
    end

    def show
      render json: @uploader
    end

    def create
      @uploader = Uploader.new(uploader_params)

      if @uploader.save
        render json: @uploader, status: :created, location: @uploader
      else
        render json: @uploader.errors, status: :unprocessable_entity
      end
    end

    def update
      if @uploader.update(uploader_params)
        render json: @uploader
      else
        render json: @uploader.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @uploader.destroy
    end

    private

    def set_uploader
      @uploader = Uploader.find(params[:id])
    end

    def uploader_params
      params.require(:uploader).permit(:image)
    end
  end
end

