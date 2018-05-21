Rails.application.routes.draw do
  	# get "/abc", to: "welcome#index"
 	# 預設8個網址
	# - index: 列表
	# - create: 新增
	# - new:
	# - id/edit: 編輯
	# - id: 個別頁面
	# - update: 更新
	# - destroy: 刪除
  	resources :candidates do
      member do
        put :vote # candidates#vote
        # pus "vote", to: candidates#vote
      end
    end

  	# user/2/book/2
  	# book/2
  	# resources :users do
  	# 	# only: 只顯示特定頁面
  	# 	# resources :books, only:[:index, :new, :create]
  	# 	resources :books, shallow: true
  	# end
  	# resources :books, except:[:index, :new, :create]

  	# 擴充網址
  	# collection
  	# member
end
