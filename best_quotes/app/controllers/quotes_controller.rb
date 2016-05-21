require "erubis"
class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, :noun => :winking
  end

  def quote_1
    quote_1 = Rulers::Model::FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def exception
    raise "It's a bad one!"
  end
end
