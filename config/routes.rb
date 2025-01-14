Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_photo_id", { :controller => "photos", :action => "show" })
  post("/create_photo", { :controller => "photos", :action => "create" })
  post("/update_photo/:update_id", { :controller => "photos", :action => "update" })
  get("/delete_photo/:delete_id", { :controller => "photos", :action => "destroy" })
end
