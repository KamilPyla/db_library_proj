class Punishment < ApplicationRecord
  belongs_to :reader

  def reader
    Reader.where("id = #{reader_id}").first
  end
end
