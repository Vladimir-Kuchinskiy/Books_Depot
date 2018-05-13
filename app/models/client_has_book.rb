class ClientHasBook < ApplicationRecord

  belongs_to :book
  belongs_to :client

  def overeading?
    created_at < (Date.today - 31.days)
  end

end
