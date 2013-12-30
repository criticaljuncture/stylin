Rails.application.routes.draw do
  mount Stylin::Engine => '/styleguides' if Rails.env.development?
end
