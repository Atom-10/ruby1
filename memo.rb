require "csv"

puts "1 (新規でメモを作成する) / 2 (既存のメモを編集する)"

memo_type = gets.to_i

if memo_type == 1 
  
  puts "拡張子を除いたファイル名を入力してください"

  new_file = gets.chomp
  
  CSV.open("#{new_file}.csv" , "w") do |csv|
  end
  
  CSV.open("#{new_file}.csv", "w") do |new_file|
    puts "メモしたい内容を入力してください"
    puts "Ctrl＋D (終了)"
    while memo = gets
      new_file << [memo]
    end
  end

elsif memo_type == 2
  puts "既存のメモ---------------"
  Dir.glob("*.csv") do |file|
    puts file
  end
  puts "-----------------------"
  
  puts "拡張子を除いたファイル名を入力してください"
  
  new_file = gets.chomp
  
  CSV.open("#{new_file}.csv" , "a") do |csv|
  end
  
  CSV.open("#{new_file}.csv", "a") do |new_file|
    puts "追記したい内容を入力してください"
    puts "Ctrl＋D (終了)"
    while memo = gets
      new_file << [memo]
    end
  end
end
