class ImagesController < ApplicationController
  before_action :set_image, only: %i[show edit update destroy]
  before_action :set_locale

  # GET /images or /images.json
  def index
    @images = Image.all
  end

  # GET /images/1 or /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images or /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        # Ensure the locale is passed correctly in the redirect
        format.html { redirect_to image_path(@image, locale: I18n.locale), notice: "Image was successfully created." }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1 or /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        # Ensure the locale is passed correctly in the redirect
        format.html { redirect_to image_path(@image, locale: I18n.locale), notice: "Image was successfully updated." }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1 or /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@image) }
      format.html { redirect_to images_url(locale: I18n.locale), notice: "Image was successfully deleted." }
    end
  end

  private

  # Set the image based on the ID in the params
  def set_image
    @image = Image.find(params[:id])
  end

  # Set the locale for the request
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # Only allow a list of trusted parameters through
  def image_params
    params.require(:image).permit(:title, :description, :file)
  end
end
