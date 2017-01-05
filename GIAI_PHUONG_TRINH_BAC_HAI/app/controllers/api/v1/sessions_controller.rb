class Api::V1::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/vnd.giaiphuongtrinhbachai.v1' }

  def create
    Rails.logger.info "TTTTTTTTTt:#{params[:user][:b].inspect}"
    a = params[:user][:a]
    b = params[:user][:b]
    c = params[:user][:c]
    delta = b*b - 4*a*c
    if delta == 0
      root = -b/(2*a)
      puts "Phuong trinh bac hai co 1 nghiem kep: " "%6.4f" % root
    elsif delta > 0
      root1 = (-b-Math.sqrt(delta))/(2*a)
      root2 = (-b+Math.sqrt(delta))/(2*a)
      puts "Phuong trinh bac hai co 2 nghiem thuc:"
      puts "X1 = " "%6.4f" % root1
      puts "X2 = " "%6.4f" % root2
    else
      puts "Phuong trinh bac hai co 2 nghiem phuc:"
      printf("X1 = %6.4f-%6.4fi\n", -b/(2*a), Math.sqrt(-delta)/(2*a))
      printf("X1 = %6.4f+%6.4fi\n", -b/(2*a), Math.sqrt(-delta)/(2*a))
    end
  end
end
