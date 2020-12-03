class SearchController < ApplicationController
  def search_people
    if params["q"].present?
      abc = params["q"].downcase
      # Person.where("LOWER(first_name) = ? OR LOWER(last_name) = ?", abc, abc)
      # @person_search = Person.where("first_name ILIKE ? OR last_name ILIKE ?", abc, abc)
      @people = Person.where(Person.arel_table[:first_name].lower.matches("%#{abc.downcase}%")).or(Person.where(Person.arel_table[:last_name].lower.matches("%#{abc.downcase}%")))
      respond_to do |format|
        format.js { render layout: false, content_type: "text/javascript", collection: @people}
      end
    else
      flash[:error] = "Search cannot be blank!"
      redirect_to root_path
    end
  end

  def search_books
    if params["q"].present?
      abc = params["q"].downcase
      # Person.where("LOWER(first_name) = ? OR LOWER(last_name) = ?", abc, abc)
      # @person_search = Person.where("first_name ILIKE ? OR last_name ILIKE ?", abc, abc)
      @books = Book.where(Book.arel_table[:title].lower.matches("%#{abc.downcase}%")).or(Book.where(Book.arel_table[:author].lower.matches("%#{abc.downcase}%")))
      respond_to do |format|
        format.js { render layout: false, content_type: "text/javascript", collection: @people}
      end
    else
      flash[:error] = "Search cannot be blank!"
      redirect_to root_path
    end
  end
end