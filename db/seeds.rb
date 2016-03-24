10.times do |n|
  email = "long#{n+1}@gmail.com"
  User.create!(
    name: FFaker::Name.name ,
    email: email,
    password: 12345678)
end

4.times do |n|
  name = "long#{n+1}"
   Category.create!(
    name: name,
    strong_point: Faker::Number.between(1, 10)
    )
end

Category.all.each do |cate|
  4.times do |n|
    name = cate.name + "yang#{n+1}"
    CategoryNd.create!(
      name: name,
      category_id: cate.id
    )
  end
end

Category.all.each do |cate|
  cate.category_nds.all.each do |nd|
    2.times do |n|
      ms = "P#{cate.id}#{nd.id}#{n+1}"
      Product.create!(
        name: Faker::Commerce.product_name,
        ms: ms,
        price: Faker::Commerce.price,
        sale: Faker::Commerce.price,
        category_nd_id: nd.id
        )
    end
  end
end
Category.create(name: "Sale 50%",strong_point: 1)
5.times do |n|
  CategoryProduct.create(
    product_id: n+1,
    category_id: Category.last.id)
end

Product.all.each do |p|
  CategoryProduct.create!(
    product_id: p.id,
    category_id: p.category_nd.category.id)
end

User.all.each do |u|
  4.times do |n|
    p_id = 4*(u.id) + n
    Cart.create(
      user_id: u.id,
      product_id: p_id)
  end
end

  Provincial.create(name: "Ha Noi")
  Provincial.create(name: "Ho Chi Minh")
8.times do |n|
  provincial_id = n %2 +1
  name = "Quan#{n+1}"
  District.create(provincial_id: provincial_id,
    name: name)
end

4.times do |n|
  strong_point = n+1
  Slide.create(strong_point: strong_point)
end
