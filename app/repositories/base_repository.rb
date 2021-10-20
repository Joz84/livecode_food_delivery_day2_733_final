require "csv"

class BaseRepository
    def initialize(csv_file)
        @elements = []
        @next_id = 1
        @csv_file = csv_file 
        load_csv if File.exist?(@csv_file)
    end

    # CREATE
    def create(element)
        element.id = @next_id
        @elements << element
        @next_id += 1
        save_csv
    end

    # READ
    def all
        @elements
    end 

    # UPDATE
    def find(id)
        @elements.find { |element| element.id == id }
    end

    private

    def save_csv
        csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
        CSV.open(@csv_file, 'wb', csv_options) do |csv|
            csv << csv_headers
            @elements.each do |element|
                csv << element.csv_fields
            end
        end
    end

    def load_csv
        csv_options = { headers: :first_row, header_converters: :symbol }
        CSV.foreach(@csv_file, csv_options) do |row|
            @elements << define_element(row)
        end
        if @elements.empty?
            @next_id = 1
        else
            @next_id = @elements.last.id + 1
        end
    end
end