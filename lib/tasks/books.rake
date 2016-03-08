namespace :books do

  desc "Adds a book to database by specifying only an image file."

  task add: :environment do
    @image_file = ARGV[1].split('=').last
    puts "Insert a book with cover: #{@image_file}"

    if Book.where(coverpath: coverpath).count > 0
      puts "This cover is already used."
      abort
    end

    row = {}
    row[:title] = title
    row[:category_id] = category_id
    row[:author_id] = author_id
    row[:publisher_id] = publisher_id
    row[:isbn] = isbn
    row[:year] = year
    row[:price] = price
    row[:buy] = buy
    row[:excerpt] = excerpt
    row[:format] = format
    row[:pages] = pages
    row[:coverpath] = coverpath

    book = Book.new(row)
    if book.save
      puts 'Success: New book successfully created'
    else
      puts 'Error on book creation'
    end
  end

  def title
    title = File.basename(@image_file, File.extname(@image_file))
    @title = title.sub('_', ' ').titleize
  end

  def category_id
    Category.all.sample.id
  end

  def author_id
    Author.all.sample.id
  end

  def publisher_id
    Publisher.all.sample.id
  end

  def isbn
    rand().to_s[2..-1]
  end

  def year
    rand(2009..2016)
  end

  def price
    "$ %0.2f" % (rand(15..200) + rand(0.00..0.99))
  end

  def buy
    "http://www.google.com"
  end

  def excerpt
    @title + ' Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
  end

  def format
    ['Hardbound', 'Paperback'].sample
  end

  def pages
    rand(100..300)
  end

  def coverpath
    'covers/' + @image_file
  end

end
