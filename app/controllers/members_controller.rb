class MembersController < ApplicationController

def show
  @member = Member.find(params[:id])
end

def hide
  @member = Member.find(params[:id])
   #is_deletedカラムにフラグを立てる(defaultはfalse)
  @member.update(is_deleted: true)
  #ログアウトさせる
  reset_session
  flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
  redirect_to root_path
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
