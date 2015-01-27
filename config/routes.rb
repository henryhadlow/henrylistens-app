Rails.application.routes.draw do
  root "episodes#index", :defaults => { :format => 'rss' }
  get 'episodes/index'
  get 'episodes/import'

  # single match defaulting to XML (/plots/1 is the same as /plots/1.xml)
  # match 'posts/:id' => 'posts#show', :defaults => { :format => 'xml' }

  # # using resources, defaulting to XML (all action use XML by default)
  # resources :posts, :defaults => { :format => 'xml' }

  # # using resources and mixing with other options
  # resources :posts,
  #           :only => [:new, :create, :destroy],
  #           :defaults => { :format => 'xml' }
end
