class SetInteractionsZero < ActiveRecord::Migration[5.0]
	def change
		change_column_default :events, :interactions, from: nil, to: 0
	end

end

