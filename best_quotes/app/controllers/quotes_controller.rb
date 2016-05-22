require "erubis"
class QuotesController < Rulers::Controller
  def index
    quotes = FileModel.all
		puts quotes
    render :index, :quotes => quotes
  end

  def a_quote
    render :a_quote, :noun => :winking
  end

  def quote_1
    quote_1 = Rulers::Model::FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth one k pixels",
      "attribution" => "Me"
    }

    m = FileModel.create attrs
    render :quote, :obj => m
  end

	def update_quote
		# raise "POST route only" unless env["REQUEST_METHOD"] == "POST"

		quote_1 = FileModel.find(1)
		quote_1["submitter"] = "Jim Carrey the Joker"

		quote_1.save

		render :quote, :obj => quote_1
	end

  def show
    quote = FileModel.find(params["id"])
    ua = request.user_agent
    render :quote, :obj => quote, :ua => ua
  end

  def quotes_by_submitter
    render :by_submitter, :quotes => FileModel.find_all_by_submitter("Amelie")
  end

  def exception
    raise "It's a bad one!"
  end
end
