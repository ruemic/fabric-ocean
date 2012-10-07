module UsersHelper

  def user_favorites_for(user=@current_user, opts={})
    # confirm that the user variable is of class User
    raise ArgumentError unless user.class == User

    @test = user.to_s
    # Take the type from the options hash and create multiple forms of it
    type = opts[:type] ? opts[:type] : :product
    type = type.to_sym
    type_plural = type.to_s.pluralize.to_sym
    type_constant = type.to_s.capitalize.constantize

    # get all objects of that type
    all_of_type = type_constant.all

    # get all favorites of that type for the selected user
    favs = user.favorable(:type => type)
    rows = ""

    # do this if there actually any objects of selected type
    if all_of_type.size > 0
      all_of_type.each do |aot|
        # determine whether each object has already been favorited by the user,
        # and check the checkbox if so
        is_fav = nil
        favs.each do |f|
          if f.favorable_id == aot.id
            is_fav = true
            break
          end
        end
        is_checked = is_fav ? true : false

        # override the existing favorites if they've been checked or unchecked by
        # the user over the course of changing the form
        if params[:favorites]
          is_checked = params[:favorites][type_plural].member?(aot.id.to_s) ? true : false
        end

        # create the check box, and create the rows for the form table
        # make it so that all of the checked box values are the selected favorable
        # ids, and make sure that they're in an array at
        # params[:favorites][:whatever_type] by setting the names of the checkboxes
        # as favorites[:whatever_type][]

        check_box = check_box_tag(aot.name, aot.id, is_checked, :name => "favorites[#{type_plural.to_s}][]")
        rows += "  <tr>"
        rows += td(:value => :label, :inner => label_tag(aot.name))
        rows += td(:value => :input, :inner => check_box)
        rows += "  </tr>"
      end
    end

    # return all of our rower
    return rows
  end

  def table_cell(opts={})
    param = opts[:param] ? opts[:param] : :class
    o = "    <td "
    o += " #{param.to_s}=\"#{opts[:value].to_s}\"" if opts[:value]
    o += ">\n"
    o += "      #{opts[:inner].to_s}\n" if opts[:inner]
    o += "    </td>"
    return o
  end
  alias_method :td, :table_cell
  alias_method :tc, :table_cell

end
