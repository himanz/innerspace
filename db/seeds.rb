# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: "Hotel")
Category.create(name: "Office")
Category.create(name: "University")

Business.create(name: "Sangri-La Hotel", 
	              address: "188 University Ave", 
	              heading: 200, 
	              pano: "3L5NCiIf__oAAAQIt-clrA",
	              cbp: ",191.0,,0,-0.0",
	              category_id: 1
	              )

Business.create(name: "Search Engine People Inc.",
                address: "1305 Pickering Pkwy #500",
                heading: 300,
                pano: "JSuPKuDL7l2DyHx0jF4nmg",
                cbp: ",316.42,,0,-0.0",
                category_id: 2
                )

Business.create(name: "York University",
	              address: "4700 Keele St",
	              heading: 200,
	              pano: "2QJ-106Lsy2mP9jgSNUpGQ",
	              cbp: "249.99,,0,1.8199997",
	              category_id: 3)

Business.create(name: "University of Toronto Scarborough",
	              address: "1265 Military Trail",
	              heading: 200,
	              pano: "GWKQJ94LFA5mEjB_xrp7MQ",
	              cbp: ",190.85,,0,4.75",
	              category_id: 3)