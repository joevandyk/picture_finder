PictureFinder::Application.routes.draw do
  match "find" => 'find#create', :method => 'post'
  root :to => 'welcome#index'
end
