rows = CSV::parse(File.open("./db/documents2.csv") {|f| f.read})

rows.each_with_index do |row, index|
		next if index == 0
		s_id = Storage.find_by_code(row[2]).id
		t_id = Team.find_by_title(row[4]).id
		l_id = LegalEntity.find_by_title(row[3]).id
		unless row[6].nil?
			c_id = City.find_by_title(row[6].strip).id 
		else
			c_id = nil
		end
		y_id = TeamType.find_by_title(row[5].strip).id
		Document.create!(code: row[1], storage_id: s_id, legal_entity_id: l_id, team_id: t_id, city_id: c_id, team_type_id: y_id, description: row[7])
end