class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
    @price = Event.find(params[:event_id]).price
  end


  def index
    @attendance = Attendance.all
  end


  def create
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new(participant_id: current_user.id,
                                 event_id: params[:event_id])
    if @attendance.save
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })

      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: Event.find(params[:event_id]).price,
        description: 'Rails Stripe customer',
        currency: 'eur',
      })

      redirect_to @event
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

end
