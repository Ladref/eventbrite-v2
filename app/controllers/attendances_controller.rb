class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
    @price = Event.find(params[:event_id]).price
  end


  def index
    @attendances = Attendance.all
  end


  def create
    puts "You are in the create method"
    puts "*"*40
    @event = Event.find(params[:event_id])

    customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })

    charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @event.price,
        description: 'Rails Stripe customer',
        currency: 'eur',
      })

    @attendance = Attendance.new(participant_id: current_user.id,
                                 event_id: params[:event_id],
                               stripe_customer_id: charge.customer)

    if @attendance.save
      flash[:success] = "You are now registered to the event."
      redirect_to @event
    end

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path


  end

end
