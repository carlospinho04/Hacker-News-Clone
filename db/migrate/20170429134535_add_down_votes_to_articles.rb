class AddDownVotesToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :down_votes, :integer
  end
end
