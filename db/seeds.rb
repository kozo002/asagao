if Admin.count == 0
  admin = Admin.new(
    email: 'sample@example.com',
    password: 'samplepass',
    password_confirmation: 'samplepass'
  )
  admin.skip_confirmation!
  admin.save!
end
