class Seed
  def self.begin
    seed = Seed.new
    seed.generate_quotes
  end

  def generate_quotes
    20.times do |i|
      author =
      quote = Quote.create!(
        author: Faker::Book.author,
        content: Faker::ChuckNorris.fact
      )
      puts "Quote #{i}: Author is #{quote.author} and qutation is '#{quote.content}'."
    end
  end
end

Seed.begin
