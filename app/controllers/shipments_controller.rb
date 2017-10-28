class ShipmentsController < ApplicationController
  before_action :set_shipment #, only: [:shipment_cost, :show, :edit, :update, :destroy]

  # GET /shipments
  # GET /shipments.json
  def index
    @shipments = Shipment.all
  end
=begin
  def contains_point?(point, polygon)
    c = false
    i = -1
    j = polygon.size - 1
    while (i += 1) < polygon.size
      if ((polygon[i].y <= point.y && point.y < polygon[j].y) ||
          (polygon[j].y <= point.y && point.y < polygon[i].y))
        if (point.x < (polygon[j].x - polygon[i].x) * (point.y - polygon[i].y) /
            (polygon[j].y - polygon[i].y) + polygon[i].x)
          c = !c
        end
      end
      j = i
    end
    return c
  end
=end

  def transformPolygonToGoogleType(polygon)
    lat_longitudes = polygon.split(',')
    new_polygon = []
    lat_longitudes[0] = lat_longitudes[0].sub('POLYGON ((', '')
    lat_longitudes[lat_longitudes.length - 1] = lat_longitudes[lat_longitudes.length - 1].sub('))', '')
    lat_and_lng = lat_longitudes[0].split(' ')
    lat_and_lng[0] = lat_and_lng[0].sub(' ', '')
    position = { lat: lat_and_lng[0].to_f, lng: lat_and_lng[1].to_f }
    new_polygon.append(position)
    pos = 0
    lat_longitudes.each { |lat_longitude|
      if (pos != 0) && (pos != lat_longitudes.length-1)
      lat_and_lng = lat_longitude.split(' ')
      lat_and_lng[1] = lat_and_lng[1].sub(' ', '')
      position = { lat: lat_and_lng[1].to_f, lng: lat_and_lng[2].to_f }
      new_polygon.append(position)
      elsif pos == (lat_longitudes.length - 1)
        lat_and_lng = lat_longitudes[lat_longitudes.length - 1].split(' ')
        lat_and_lng[0] = lat_and_lng[0].sub(' ', '')
        position = { lat: lat_and_lng[0].to_f, lng: lat_and_lng[1].to_f }
        new_polygon.append(position)
      end
    }
    return new_polygon
  end


  def shipment_cost

    responseCost = RestClient::Request.execute method: :get, url: 'https://delivery-rates.mybluemix.net/cost', user: '184067', password: 'un27YeBum1wA'
    case responseCost.code
      when 500
        render json: {'error' => 'Service Unavailable'}
    end
    response = RestClient::Request.execute method: :get, url: 'https://delivery-rates.mybluemix.net/areas', user: '184067', password: 'un27YeBum1wA'
    response_json = JSON.parse(response)
    response_json_validated = []
    case response.code
    when 200
      area_infos = []
      #response_json.each { |area|

        #cost_area_json = JSON.parse(area['costToAreas'])
        #area['costToAreas'] = cost_area_json
        #polygon_json = JSON.parse(area['polygon'])
        #area['polygon'] = polygon_json
        #response_json_validated.append(area)

        #area_info = InfoArea.new#(area['costToAreas'], area['id'], area['name'], transformPolygonToGoogleType(area['polygon']))
        #area_info.cost_to_areas = JSON.parsearea['costToAreas']
        #area_info.area_id = area['id']
        #area_info.area_name = area['name']
        #area_info.polygon = area['polygon']

        #area_infos.append(area_info)
        #area_info.save
      #}
      render json: { 'area_info' => response_json, 'cost' => JSON.parse(responseCost) }
      when 500
        render json: {'error' => 'Service Unavailable'}

    end
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
  end

  # GET /shipments/new
  def new
    @shipment = Shipment.new
  end

  # GET /shipments/1/edit
  def edit
  end

  # POST /shipments
  # POST /shipments.json
  def create
    @shipment = Shipment.new(shipment_params)

    respond_to do |format|
      if @shipment.save
        format.html { redirect_to @shipment, notice: 'Shipment was successfully created.' }
        format.json { render :show, status: :created, location: @shipment }
      else
        format.html { render :new }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /shipments/1
  # PATCH/PUT /shipments/1.json
  def update
    respond_to do |format|
      if @shipment.update(shipment_params)
        format.html { redirect_to @shipment, notice: 'Shipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipment }
      else
        format.html { render :edit }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    @shipment.destroy
    respond_to do |format|
      format.html { redirect_to shipments_url, notice: 'Shipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shipment
    if params[:id].nil? == false
      @shipment = Shipment.find(params[:id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shipment_params
    params.require(:shipment).permit(:origin, :destination, :price, :sender_mail, :receiver_mail, :cadet_mail, :origin_postal_address, :destination_postal_address, :is_price_estimated, :state)
  end
end
