task :generate_random_order => :environment do
  lo = Lo.find Moped::BSON::ObjectId.from_string("5375156f759b741405000002")
  qnt_exer = lo.exercises.count

  order = (1..qnt_exer).to_a
  order.shuffle!

  lo.exercises.each_with_index do |exer, index|
    exer.update_attribute(:position, order[index])
  end
end
