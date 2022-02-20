# frozen_string_literal: true

module Api
  class UploadersController < ApplicationController
    before_action :set_uploader, only: [:show, :update, :destroy]

    # GET /api/uploaders
    def index
      @uploaders = Uploader.all

      render json: {type: :uploader, data: @uploaders, count: @uploaders.length}
    end

    # GET /api/uploaders/:id or /api/uploaders/:slug
    def show
      render json: {type: :uploader, data: @uploader}
    end

    # POST /api/uploaders
    def create
      @uploader = Uploader.new(uploader_params)

      if @uploader.save
        render json: {type: :uploader, data: @uploader.reload}, status: :created
      else
        render json: {errors: @uploader.errors}, status: :unprocessable_entity
      end
    end

    # PUT /api/uploaders
    def update
      if @uploader.update(uploader_params)
        render json: @uploader
      else
        render json: @uploader.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/uploaders
    def destroy
      @uploader.destroy
    end

    private

    def set_uploader
      @uploader = Uploader.find_by!(slug: params[:slug])
    end

    def uploader_params
      params.require(:uploader).permit(:image)
    end
  end
end

