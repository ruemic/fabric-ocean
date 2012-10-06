class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  # User can own a favorite
  has_many :favorites

  def favorable(opts={})

    # favorable_type
    type = opts[:type] ? opts[:type] : :product
    type = type.to_s.capitalize

    # add favorable_id to condition if id is provided
    con = ["user_id = ? AND favorable_type = ?", self.id, type]

    # append favorable id to the query if an :id is passed as an option into the
    # function, and then append that id as a string to the "con" Array
    if opts[:id]
      con[0] += " AND favorable_id = ?"
      con << opts[:id].to_s
    end

    # Return all Favorite objects matching above conditions
    favs = Favorite.all(:conditions => con)

    case opts[:delve]
    when nil, false, :false
      return favs
    when true, :true
      # get list of all favorited object ids
      fav_ids = favs.collect{|f| f.favorable_id.to_s}

      if fav_ids.size > 0
        # turn the Capitalized favorable_type into an actual class Constant
        type_class = type.constantize

        # build a query that only selects
        query = []
        fav_ids.size.times do
          query << "id = ?"
        end
        type_conditions = [query.join(" AND ")] + fav_ids

        return type_class.all(:conditions => type_conditions)
      else
        return []
      end
    end
  end
end


