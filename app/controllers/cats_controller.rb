class CatsController < ApplicationController
  before_action :load_static_cats

  # GET /adopt vagy GET /cats
  def index
    @cats = @all_cats

    if params[:tag].present? && params[:tag] != "All"
      @cats = @cats.select { |cat| cat.tags.to_a.include?(params[:tag]) }
    end
  end

  # GET /adopt/:id vagy GET /cats/:id
  def show
    @cat = @all_cats.find { |c| c.id.to_s == params[:id].to_s } || @all_cats.first
  end

  # POST /adopt/:id/reserve
  def reserve
    @cat = @all_cats.find { |c| c.id.to_s == params[:id].to_s } || @all_cats.first
    redirect_to cat_details_path(@cat.id), notice: "#{@cat.name} sikeresen lefoglalva örökbefogadásra!"
  end

  private

  def load_static_cats
    @all_cats = [
      Cat.new(
        id: 1,
        name: "Mici",
        age: 2,
        gender: 1,
        spayed_or_neutered: true,
        tags: ["Tabby", "Bújós", "Szobatiszta"],
        images: ["cat1.jpg", "cat2.jpg", "cat3.jpg"],
        desc: ["Mici egy rendkívül barátságos, bújós cica. Nagyon szereti a gyerekeket, teljesen szobatiszta és békés természetű."]
      ),
      Cat.new(
        id: 2,
        name: "Cirmi",
        age: 1,
        gender: 0,
        spayed_or_neutered: false,
        tags: ["Orange", "Játékos", "Energikus"],
        images: ["cat4.jpg", "cat5.jpg"],
        desc: ["Cirmi egy energikus, kíváncsi fiatal kandúr. Imád játszani, kertes házba vagy aktív gazdinak ideális választás."]
      ),
      Cat.new(
        id: 3,
        name: "Foltos",
        age: 3,
        gender: 0,
        spayed_or_neutered: true,
        tags: ["Tuxedo", "Nyugodt", "Fekete-fehér"],
        images: ["cat6.jpg", "cat7.jpg"],
        desc: ["Foltos egy kiegyensúlyozott, nyugodt felnőtt cica. Szeret az ablakban napozni és dorombolni."]
      ),
      Cat.new(
        id: 4,
        name: "Hógolyó",
        age: 4,
        gender: 1,
        spayed_or_neutered: true,
        tags: ["White", "Csendes"],
        images: ["cat8.jpg"],
        desc: ["Csendes, tiszta fehér bundájú cica, aki egyedüli kedvencként érzi magát a legjobban."]
      )
    ]
  end
end