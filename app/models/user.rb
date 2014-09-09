class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

    has_many :forms


    validates :username, presence: true,
                                  uniqueness: true,
                                  :case_sensitive => false,
                                  format: {
                                    with: /\A[a-zA-Z0-9]+\Z/,
                                    message: "The Profile name should have no spaces"
                                  }

     validates :paynum, presence: true, uniqueness: true


    

    def email_required?
  		false
  	end

    def login=(login)
		@login = login
		end

		def login
			@login || self.username || self.email
		end

    attr_accessor :login

    def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
  			where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
		else
  			where(conditions).first
		end
	end

end
