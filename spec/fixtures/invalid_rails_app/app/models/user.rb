User < Struct.new(:first_name, :last_name, :email, :password, :password_confirmation) do
  def full_name
    [first_name, last_name].join(' ')
  end
end
