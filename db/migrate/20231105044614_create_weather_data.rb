class CreateWeatherData < ActiveRecord::Migration[7.1]
  def change
    create_table :weather_data do |t|
      t.float :temperature
      t.string :description
      t.string :city

      t.timestamps
    end
  end
end
