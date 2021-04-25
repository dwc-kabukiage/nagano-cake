class MembersController < ApplicationController

def show
  @member = current_member
end

def hide
  @member = current_member
   #is_deletedカラムにフラグを立てる(defaultはfalse)
  @member.update(is_deleted: true )
  #ログアウトさせる
  reset_session
  flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
  redirect_to root_path
end


def edit
  @member = current_member
end

def withdraw
@member = current_member
end

def update
  @member = current_member
 if @member.update(member_params)
   flash[:success] = "successfuly"
  redirect_to members_path
 else
  render:edit
 end
end

private

def member_params
  params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
end
# def new
#   @member = Member.new
# end

# def create
#   @member = Member.new(member_params) #user_paramsはPOSTデータをチェックするメソッド

#   if @member.save
#     flash[:success] = '新しいユーザーを登録しました。'
#     redirect_to @member
#   else
#     flash.now[:danger] = 'ユーザーの登録に失敗しました。'
#     render :new
#   end
# end

# def edit
#   @member = Member.find(params[:id])
# end
end

