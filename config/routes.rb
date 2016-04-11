Rails.application.routes.draw do
  root "landing#index"
  # get  "landing#next_day"

  get "/:next_day", to: "landing#next_day", as: "next_day"
end
