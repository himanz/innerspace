# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Business.create(name: "Sangri-La Hotel", 
	              address: "188 University Ave", 
	              heading: 200, 
	              pano: "3L5NCiIf__oAAAQIt-clrA",
	              cbp: ",191.0,,0,-0.0"
	              )

Business.create(name: "Search Engine People Inc.",
                address: "1305 Pickering Pkwy #500",
                heading: 300,
                pano: "JSuPKuDL7l2DyHx0jF4nmg",
                cbp: ",316.42,,0,-0.0"
                )
