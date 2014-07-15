# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "jon@jon.com", password: "12345678", admin: true)

Category.create(name: "Hotel")
Category.create(name: "Office")
Category.create(name: "University")
Category.create(name: "Golf Course")
Category.create(name: "Attractions")
Category.create(name: "Park")

# Business.create(name: "Sangri-La Hotel", 
# 	              address: "188 University Ave", 
# 	              heading: 200, 
# 	              pano: "3L5NCiIf__oAAAQIt-clrA",
# 	              cbp: ",191.0,,0,-0.0",
# 	              category_id: 1
# 	              )

# Business.create(name: "Search Engine People Inc.",
#                 address: "1305 Pickering Pkwy #500",
#                 heading: 300,
#                 pano: "JSuPKuDL7l2DyHx0jF4nmg",
#                 cbp: ",316.42,,0,-0.0",
#                 category_id: 2
#                 )

# Business.create(name: "York University",
# 	              address: "4700 Keele St",
# 	              heading: 200,
# 	              pano: "2QJ-106Lsy2mP9jgSNUpGQ",
# 	              cbp: "249.99,,0,1.8199997",
# 	              category_id: 3)

# Business.create(name: "University of Toronto Scarborough",
# 	              address: "1265 Military Trail",
# 	              heading: 200,
# 	              pano: "GWKQJ94LFA5mEjB_xrp7MQ",
# 	              cbp: ",190.85,,0,4.75",
# 	              category_id: 3)

# Business.create(name: "Trump International Hotel & Tower Toronto",
# 	              address: "325 Bay St",
# 	              heading: 245,
# 	              pano: "lr-gpNgxscTiRweCykPb5A",
# 	              cbp: ",236.0,,0,-0.0",
# 	              category_id: 1)

Business.create(name: "Deerhurst Highlands Golf Course",
	              address: "1235 Deerhurst Dr",
	              heading: 200,
	              pano: "EhNek1P-56N9g13_kol5OQ",
	              cbp: ",208.89,,0,0.91000366",
	              category_id: 4,
	              latitude: 45.342201,
	              longitude: -79.142333)

Business.create(name: "The White House",
	              address: "1600 Pennsylvania Ave NW, Washington, DC, United States",
	              heading: 180,
	              pano: "SMTdfWYGoav_usWjGTiMgQ",
	              cbp: ",180.0,,0,-0.0",
	              category_id: 5,
	              latitude: 38.897632,
	              longitude: -77.036507)

# Business.create(name: "The Links at Crowbush Cove Golf Course",
# 	              address: "710 Canavoy Road West Saint Peters, PE",
# 	              heading: 180,
# 	              pano: "vuYqBpa45N10WMtF2kerCw",
# 	              cbp: ",127.84,,0,14.610001",
# 	              category_id: 4)

Business.create(name: "High Park",
	              address: "1873 Bloor St W, Toronto, ON",
	              heading: 0,
	              pano: "_HiEA17QmFiDCtNOlzQ5kQ",
	              cbp: ",14.2,,0,11.029999",
	              category_id: 6,
	              latitude: 43.643243,
	              longitude: -79.467211)


