class Account::TradesController < Account::ApplicationController
  account_load_and_authorize_resource :trade, through: :team, through_association: :trades

  # GET /account/teams/:team_id/trades
  # GET /account/teams/:team_id/trades.json
  def index
    delegate_json_to_api
  end

  # GET /account/trades/:id
  # GET /account/trades/:id.json
  def show
    delegate_json_to_api
  end

  # GET /account/teams/:team_id/trades/new
  def new
  end

  # GET /account/trades/:id/edit
  def edit
  end

  # POST /account/teams/:team_id/trades
  # POST /account/teams/:team_id/trades.json
  def create
    respond_to do |format|
      if @trade.save
        format.html { redirect_to [:account, @trade], notice: I18n.t("trades.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @trade] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/trades/:id
  # PATCH/PUT /account/trades/:id.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to [:account, @trade], notice: I18n.t("trades.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @trade] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/trades/:id
  # DELETE /account/trades/:id.json
  def destroy
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @team, :trades], notice: I18n.t("trades.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  if defined?(Api::V1::ApplicationController)
    include strong_parameters_from_api
  end

  def process_params(strong_params)
    # 🚅 super scaffolding will insert processing for new fields above this line.
  end
end
