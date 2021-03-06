# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "jon@jon.com", password: "12345678", admin: true, first_name: "Jon", last_name: "Jon")

Category.create(name: "Hotel")
Category.create(name: "Office")
Category.create(name: "University")
Category.create(name: "Golf Course")
Category.create(name: "Attractions")
Category.create(name: "Park")
Category.create(name: "Amusement Park")
Category.create(name: "Stadium")
Category.create(name: "World Heritage Site")
Category.create(name: "Island")
Category.create(name: "Historical")
Category.create(name: "Ocean")

Business.create(name: "Sangri-La Hotel", 
	              address: "188 University Ave", 
	              heading: 200, 
	              pano: "3L5NCiIf__oAAAQIt-clrA",
	              cbp: ",191.0,,0,-0.0",
	              category_id: 1,
                latitude: 43.64937,
                longitude: -79.386129,
                city: "Toronto",
                state: "Ontario",
                country: "Canada"  
	              )

Business.create(name: "Search Engine People Inc.",
                address: "1305 Pickering Pkwy #500",
                heading: 300,
                pano: "JSuPKuDL7l2DyHx0jF4nmg",
                cbp: ",316.42,,0,-0.0",
                category_id: 2,
                latitude: 43.833183,
                longitude: -79.088571,
                city: "Pickering",
                state: "Ontario",
                country: "Canada"
                )

Business.create(name: "York University",
	              address: "4700 Keele St",
	              heading: 200,
	              pano: "2QJ-106Lsy2mP9jgSNUpGQ",
	              cbp: "249.99,,0,1.8199997",
	              category_id: 3,
	              latitude: 43.773344,
	              longitude: -79.502026,
	              city: "Toronto",
                state: "Ontario",
                country: "Canada")

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
	              longitude: -79.142333,
	              city: "Huntsville",
                state: "Ontario",
                country: "Canada")

Business.create(name: "The White House",
	              address: "1600 Pennsylvania Ave NW",
	              heading: 180,
	              pano: "SMTdfWYGoav_usWjGTiMgQ",
	              cbp: ",180.0,,0,-0.0",
	              category_id: 5,
	              latitude: 38.897632,
	              longitude: -77.036507,
	              city: "Washington",
                state: "DC",
                country: "United States")

# Business.create(name: "The Links at Crowbush Cove Golf Course",
# 	              address: "710 Canavoy Road West Saint Peters, PE",
# 	              heading: 180,
# 	              pano: "vuYqBpa45N10WMtF2kerCw",
# 	              cbp: ",127.84,,0,14.610001",
# 	              category_id: 4)

Business.create(name: "High Park",
	              address: "1873 Bloor St W",
	              heading: 0,
	              pano: "_HiEA17QmFiDCtNOlzQ5kQ",
	              cbp: ",14.2,,0,11.029999",
	              category_id: 6,
	              latitude: 43.643243,
	              longitude: -79.467211,
	              city: "Toronto",
                state: "Ontario",
                country: "Canada")

Business.create(name: "Six Flags Magic Mountain",
	              address: "26101 Magic Mountain Pkwy",
	              city: "Valencia",
	              state: "California",
	              country: "United States",
	              heading: 200,
	              pano: "upyOW0YA61H3MfMnkebYww",
	              cbp: ",267.58,,0,10.300003",
	              latitude: 34.426096,
	              longitude: -118.598395,
	              category_id: 7)

Business.create(name: "Arena Corinthians",
	              address: "Av. Miguel Inácio Curi, 111",
	              city: "Sau Paulo",
	              state: "Sau Paulo",
	              country: "Brazil",
	              heading: 100,
	              pano: "6CvzzzgvWrE2FgzGbyZVYQ",
	              cbp: ",94.01,,0,21.779999",
	              latitude: -23.545262,
	              longitude: -46.474248,
	              category_id: 8)

Business.create(name: "Maracana Stadium",
	              address: "Rua Professor Eurico Rabelo",
	              city: "Maracana",
	              state: "Rio de Janeiro",
	              country: "Brazil",
	              heading: 100,
	              pano: "FswHxum2YNghwNhyqpFgSQ",
	              cbp: ",30.8,,0,-4.3499985",
	              latitude: -22.912165,
	              longitude: -43.230249,
	              category_id: 8)

Business.create(name: "Angkor Wat",
	              address: nil,
	              city: nil,
	              state: "Siem Reap",
	              country: "Cambodia",
	              heading: 50,
	              pano: "bjZSpboXyy8vj71FfP532w",
	              cbp: ",323.48,,0,3.3799973",
	              latitude: 13.412281,
	              longitude: 103.866829,
	              category_id: 9)

Business.create(name: "Taj Mahal",
	              address: nil,
	              city: "Agra",
	              state: "Uttar Pradesh",
	              country: "India",
	              heading: 0,
	              pano: "ypwvZafR9EHGbeK0JPItLg",
	              cbp: ",3.4,,0,-10.18",
	              latitude: 27.173351,
	              longitude: 78.042109,
	              category_id: 5)

Business.create(name: "Half Moon Island",
	              address: nil,
	              city: nil,
	              state: "South Shetland Islands",
	              country: "Antarctica",
	              heading: 200,
	              pano: "ZzuMubmHCfCGGo3ePSlpCQ",
	              cbp: ",233.34,,0,0.48000336",
	              latitude: -62.596087,
	              longitude: -59.901655,
	              category_id: 10)

Business.create(name: "Taierzhuang Ancient Town",
	              address: nil,
	              city: "Zaozhuang",
	              state: "Shandong",
	              country: "China",
	              heading: 275,
	              pano: "rY5ZW6S3sFUAAAAGOzOdpg",
	              cbp: ",279.31,,0,5.470001",
	              latitude: 34.557692,
	              longitude: 117.74251,
	              category_id: 11)

Business.create(name: "Hirosaki Park",
	              address: nil,
	              heading: 200,
	              pano: "lH4hVUykWK8whL1cUaPu3w",
	              cbp: ",191.6,,0,9.269997",
	              category_id: 6,
	              latitude: 40.608106,
	              longitude: 140.464319,
	              city: "Hirosaki",
                state: "Aomori",
                country: "Japan")

Business.create(name: "Tubbataha Reefs Natural Park",
	              address: nil,
	              city: nil,
	              state: "Cagayancillo",
	              country: "Phillipines",
	              heading: 375,
	              pano: "J67g8IADDUUAAAQWx3Mt6g",
	              cbp: ",0.0,,0,-0.0",
	              latitude: 8.93619,
	              longitude: 120.008698,
	              category_id: 12)
