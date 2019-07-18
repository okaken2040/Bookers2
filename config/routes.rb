Rails.application.routes.draw do
  get '' =>'root#top', as: 'top'
	get 'home/about' => 'root#about', as: 'about'

	root to: 'user#show'

  devise_for :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
	resources :users, only: [:index, :show, :edit, :update]
end
