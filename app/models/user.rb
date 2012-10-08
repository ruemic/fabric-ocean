class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :favorites

  attr_accessible :email, :password, :password_confirmation, :user_id

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

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

    # Return all Favorite objects matching the above conditions
    favs = Favorite.all(:conditions => con)

    case opts[:delve]
    when nil, false, :false
      return favs
    when true, :true
      # get a list of all favorited object ids
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