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

     validates :paynum, presence: true


    def office_array
      [["5 Dearbor","5"],["7 Livonia","7"],["13 Commerce","13"],["15 Milford","15"],["17 Southfield / Lathrup Village","17"],["21 Southgate","21"],["23 Plymouth/Canton","23"],["24 Brighton","24"],["27 Clinton Township","27"],["28 Royal Oak","28"],["31 Ann Arbor","31"],["32 Fraser","32"],["34 Troy","34"],["35 Clarkston/Waterford","35"],["39 Rochester","39"],["42 Grosse Pointe - JJ","42"],["43 Dexter ","43"],["45 West Bloomfield","45"],["51 Novi","51"],["56 Bloomfield Hills - Max Broock","56"],["57 Clarkston - Max Broock Realtors","57"],["58 Birmingham - Max Broock Realtors","58"],["59 Rochester - Max Broock Realtors","59"],["72 St. Clair Shores","72"],["73 Dearborn Height","73"],["74 Shelby Twp","74"],["78 Milan","78"],["79 Saline","79"]]
    end

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
