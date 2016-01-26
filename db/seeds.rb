if Rails.env.development?
  @owner                       = User.new
  @owner.email                 = "test@example.com"
  @owner.password              = "test"
  @owner.password_confirmation = "test"
  @owner.save!
end
