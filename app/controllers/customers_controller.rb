class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /customers
  # GET /customers.json
  def index
    #@customers = Customer.all
    #@customers = Customer.where(user_id: current_user.id, closed: false )
    @customers = Customer.where(user_id: current_user.id ).order("last_name, first_name")
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end
  
  def new_entry
    @customer = Customer.new
    #-------------------------------------------------
    #@todo.created = DateTime.now.to_datetime
    #@todo.completed = ""
    #@todo.closed = ""
    #-------------------------------------------------
    puts "Olemme new_entry sisällä"
    # Modal
    respond_to do |format|
      format.html
      format.js
    end
    #
  end

  # GET /customers/1/edit
  def edit
  end
  
   def edit_entry
     @customer = Customer.find(params[:id])
     puts "edit_entry"
     # Modal
    respond_to do |format|
      format.html
      format.js
    end 
  end

  # POST /customers
  # POST /customers.json
  def create
    puts "Olemme create"
    puts current_user.id
    puts "Olemme create: 2"
    @customer = Customer.new(customer_params)
    @customer.user_id = current_user.id
    puts "Olemme create: 3"
    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_path, notice: 'Asiakas luotu.' }
        format.json { render :index, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    puts "update"
    respond_to do |format|
      if @customer.update(customer_param)
        format.html { redirect_to customers_path, notice: 'Asiakkaan tiedot päivitetty.' }
        format.json { render :indes, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Asiakkaan tiedot poistettu.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customers).permit(:first_name, :last_name, :phone_nbr, :street, :zip_code, :city, :user_id )
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_param
      params.require(:customer).permit(:first_name, :last_name, :phone_nbr, :street, :zip_code, :city, :user_id )
    end
  
    def modal_params
      params.permit(:active)
    end
end
