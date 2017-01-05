class Api::V1::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/vnd.giaiphuongtrinhbachai.v1' }

  def create
    ketqua = {}
    a = params[:user][:a].to_f
    b = params[:user][:b].to_f
    c = params[:user][:c].to_f
    delta = b*b - 4*a*c
    if delta == 0
      root = -b/(2*a)
      ketqua[:title] = "Phuong trinh bac hai co 1 nghiem kep:"
      ketqua[:nghiem_1] = root
      ketqua[:value] = 'nghiem_kep'
    elsif delta > 0
      root1 = (-b-Math.sqrt(delta))/(2*a)
      root2 = (-b+Math.sqrt(delta))/(2*a)
      ketqua[:title] = "Phuong trinh bac hai co 2 nghiem thuc:"
      ketqua[:nghiem_2] = root1
      ketqua[:nghiem_3] = root2
      ketqua[:value] = 'nghiem_thuc'
    else
      root3 = (-b/(2*a)- Math.sqrt(-delta)/(2*a))
      root4 = (-b/(2*a) + Math.sqrt(-delta)/(2*a))
      ketqua[:title] = "Phuong trinh bac hai co 2 nghiem phuc:"
      ketqua[:nghiem_4] = root3
      ketqua[:nghiem_5] = root4
      ketqua[:value] = 'nghiem_phuc'
    end
    render :status => 200, :json => { :success => true, :ketqua => ketqua }
  end
end
