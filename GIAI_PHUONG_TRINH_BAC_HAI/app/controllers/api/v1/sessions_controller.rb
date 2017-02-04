class Api::V1::SessionsController < Devise::SessionsController
  require 'cmath'
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/vnd.giaiphuongtrinhbachai.v1' }
  
  def create
    ketqua = {}
    a = params[:user][:a].to_i
    b = params[:user][:b].to_i
    c = params[:user][:c].to_i
    a2 = a * 2
    if a != 0
      delta = (b*b) - (4*a*c)
      sqrt_delta = CMath.sqrt(delta)
      if delta > 0
        x1 = (-b + sqrt_delta)/a2
        x2 = (-b - sqrt_delta)/a2
        ketqua[:title] =  "x1: #{x1} - x2: #{x2}"
      else
        if delta == 0
          x = -b/a
          ketqua[:title] =  "PT nghiệm kép x1 = x2 = : #{x}"
        else
          ketqua[:title] =  "Vô nghiệm"
        end
      end
    else
      ketqua[:title] =  "Ko phải ptb2"
    end
    render :status => 200, :json => { :success => true, :ketqua => ketqua }
  end
end
