
namespace :zara do
  desc "TODO"
  task :importcsv, [:filename] => :environment do |task, args|
    
    puts args[:filename]
    rows =CSV::parse(File.open(args[:filename]) {|f| f.read})
    puts rows.count
    puts Storage.count


rows.each_with_index do |row, index|
		next if index == 0
		if Storage.where(code: row[2]).count <1 then
			Storage.create!(title: row[2], code: row[2])
			s_id = Storage.find_by_code(row[2]).id
		else
			s_id = Storage.find_by_code(row[2]).id
		end
		
		if Team.where(title: row[4]).count < 1 then
			Team.create!(title: row[4])
			t_id = Team.find_by_title(row[4]).id
		else
			t_id = Team.find_by_title(row[4]).id
		end

		if TeamType.where(title: row[5]).count < 1 then
			TeamType.create!(title: row[5])
			ty_id = TeamType.find_by_title(row[5]).id
		else
			ty_id = TeamType.find_by_title(row[5]).id
		end


			if LegalEntity.where(title: row[3]).count < 1 then
				LegalEntity.create!(title: row[3])
				l_id = LegalEntity.find_by_title(row[3]).id
			else
				l_id = LegalEntity.find_by_title(row[3]).id
			end

			unless row[6].nil?
				c_id = City.find_by_title(row[6].strip).id 
			else
				c_id = nil
			end
		
			item = Document.create!(code: row[0], storage_id: s_id, legal_entity_id: l_id, team_id: t_id, team_type_id: ty_id, city_id: c_id,  description: row[7])
			puts item
	end
  end

end
