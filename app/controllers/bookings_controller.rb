class BookingsController < ApplicationController

  def index
    # 入力画面を表示
    @booking = Booking.new
    render :action => 'index'
  end

  def confirm
    # 入力値のチェック
    @booking = Booking.new(params[:booking])
    if @booking.valid? # OK。確認画面を表示
      @estimate = estimate(@booking)
      render :action => 'confirm'
    else # NG。入力画面を再表示
      render :action => 'retype'
    end
  end

  def thanks
    # メール送信
    @booking = Booking.new(params[:booking])
    @estimate = estimate(@booking)
    BookingMailer.received_email(@booking, @estimate).deliver
    # 完了画面を表示
    render :action => 'thanks'
  end

  def retype
    # 入力画面を表示
    @booking = Booking.new
    render :action => 'retype'
  end

  def estimate(booking)

    number_of_people = booking.number_of_people.to_i #宿泊人数
    period = booking.period.to_i #宿泊日数
    monthly_rent = 30000 #家賃/月
    daily_rent = 1000 #家賃/日
    monthly_utility = 9000 #共益費/月
    daily_utility = monthly_utility / 30 #共益費/日
    commission = 10000 #入居手数料

    if period < 30
      4000 * period
    else
      total_rent = monthly_rent * (period / 30) + daily_rent * (period % 30)
      total_utility = monthly_utility * (period / 30) + daily_utility * (period % 30)
      (total_rent + total_utility + commission) * number_of_people
    end

  end
end





