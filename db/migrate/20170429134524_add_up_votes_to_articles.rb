class AddUpVotesToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :up_votes, :integer
  end
end
