class CreateQuestionsets < ActiveRecord::Migration
  def change
    create_table :questionsets do |t|

      t.timestamps
    end
  end
end
