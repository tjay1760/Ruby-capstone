require_relative '../item'
require_relative 'label'

class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :id

  def initialize(cover_state, publisher, publish_date, id = nil)
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
