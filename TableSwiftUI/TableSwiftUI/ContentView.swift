//
//  ContentView.swift
//  TableSwiftUI
//
//  Created by Dominguez, Harley on 3/25/26.
//

import SwiftUI
import MapKit


let data = [
    Item(name: "The Meadow Center", address: "211 San Marcos Springs Dr", acreage: "252", desc: "The Meadows Center for Water and the Environment is an educational center located on the San Marcos' Spring Lake. Originally \"Aquarena Springs theme park\", the area now serves as a University-owned research hub. The Meadows Center is a great greenspace due to its appeal to multiple audiences. Guests can take the historic glass-bottom boat tour, see live specimens at the Discovery Hall or Wetlands Boardwalk, and get diver certification in the lake's waters. Its large body of water makes the Meadows Center a great location for spotting sea fowl such as the Wood Duck or Belted Kingfisher, and you're nearly guaranteed to see a Great Blue Heron at the lake's edge.", lat: 29.8935445, long: -97.929246, imageName: "meadow", webLink: "https://www.meadowscenter.txst.edu/", category: "Water Features"),
    Item(name: "Rio Vista Park", address: "555 Cheatham Street", acreage: "17", desc: "Rio Vista Park is one of the many stops on the San Marcos River Walk. This location includes a casual stroll through paved walkways and over old wooden bridges, the river almost always in view. There are many evergreen trees along the path, making it easy to spot songbirds such as Mourning Doves and Northern Cardinals in the branches. There are also several public amenities, such as a tennis court, restrooms, tables and seating, a pavilion, and more. The river itself is perfect for kayaking, tubing, or swimming, with equipment available to rent nearby. Ivar's River Pub is conveniently located across from Rio Vista Parking for hikers, swimmers, and birders who are feeling peckish.", lat: 29.878533, long: -97.931734, imageName: "rio", webLink: "https://sanmarcostx.gov/facilities/facility/details/rio-vista-park-41", category: "Water Features"),
    Item(name: "Blanco Shoals Natural Area", address: "1201 E River Ridge Parkway", acreage: "89", desc: "Blanco Shoals Natural Area is different from other greenspaces on this list due to its distance from urban developments and large open fields. Unlike other natural areas in San Marcos, Blanco Shoals is completely undeveloped, with no facilities nor official trails. However, the untouched greenery is an ideal setting for multiple local bird species. On my early morning birding trip in February, I saw over 10 species of birds, familiar and new. They could be seen foraging in the shrubs, flying through the branches of leafless-trees, or floating on the water. This greenspace is best suited for experienced birders who are willing to exercise patience and silence to find signs of life in this tranquil open space.", lat: 29.9069381, long: -97.9045758, imageName: "blanco", webLink: "https://www.sanmarcostx.gov/facilities/facility/details/Blanco-Shoals-Natural-Area-51", category: "Water Features"),
    Item(name: "Prospect Park", address: "1414 Prospect St", acreage: "10", desc: "Prospect Park is one lower trailhead that is part of the massive Purgatory Creek Natural Area. Only 10 acres big, this location is small but mighty, with lots of narrow, rocky trails. Prospect Park is lacking in many facilities due to this size, having only a few parking spots, a bike rack, and a couple of benches. Despite the natural setting with plentiful trees, I did not spot many birds other than a few songbirds. However, it is still a good spot for those interested in hiking or mountain biking.", lat: 29.8752881, long: -97.929246, imageName: "prospect", webLink: "https://www.sanmarcostx.gov/facilities/facility/details/Prospect-Park-Natural-Area-65", category: "Rocky"),
    Item(name: "Schulle Canyon Natural Area", address: "100 Ridgewood Lane", acreage: "21", desc: "Schulle Canyon Natural Area sounds like a grand, expansive location, but is in actuality rather quaint. Nestled in a quiet neighborhood, this is another greenspace with few urban developments. Schulle Canyon includes the standard yet minimal facilities such as parking spots, trash cans, and benches. It is less rocky and branchy than Prospect Park, but not as open as Blanco Shoals. Though Schulle Canyon seems somewhat average, I had a great time birding there. Another prominent feature of Schulle Canyon is its birdhouses and birdwatching station. The station, dedicated to one Mark Taylor, features a bench and a free-to-use bird identification pamphlet. Through the wooden openings of the station, guests can observe birds in the birdhouses or using the birdbath. Though I never saw any birds at the birding station, I did see a lot of activity from various songbirds in the trees. This location is a lovely setting for those who want a casual experience that still provides the opportunity to see wildlife.", lat: 29.893716, long: -97.955386, imageName: "schulle", webLink: "https://www.sanmarcostx.gov/facilities/facility/details/Schulle-Canyon-Natural-Area-54", category: "Quiet"),
    Item(name: "Purgatory Creek Park", address: "2102 Hunter Road", acreage: "1000+", desc: "Purgatory Creek Park is the main access point to the 1000+ acre Purgatory Creek Natural Area. It has several marked rocky paths along with benches, parking, and a bathroom. The trees of this greenspace are especially beautiful, with Spanish Moss lining one of the main paths. However, I did not see many birds, even early in the morning. In addition, a major drawback of the location is its proximity to the highway. Even deep into the area, I could hear driving cars. For those willing to ignore the noise, Purgatory Creek Park is best for hiking rather than spotting fauna.", lat:  29.8641547, long: -97.9637278, imageName: "purgatory", webLink: "https://www.sanmarcostx.gov/facilities/facility/details/Purgatory-Creek-Natural-Area-52", category: "Large"),
    Item(name: "Spring Lake Natural Area", address: "921 Aquarena Springs Dr", acreage: "251", desc: "Spring Lake Natural Area is a park above Spring Lake in walking distance to the Meadows Center. The second largest of the greenspaces on this list, it has multiple branching trails with differing natural features as well as facilities like benches, a bathroom, and plenty of parking. The main trail I took went through shady trees, winding rocky paths, a flat meadow, and up through a branchy forest. Though my trip initially had few birds in it, I was lucky to witness several Yellow-crested Kingbirds, Bewick's Wrens, and a Tufted Titmouse in the branchy section of my hike. I often heard birds more than I saw them, but the sheer amount of species I identified ultimately made my experience very enjoyable. The combined flat and rough ground of this natural area means some trails are better suited to birders and leisurely walkers while others are best for bikers and hikers. Spring Lake Natural Area is a great space to observe birds in the trees or appreciate the varied environment.", lat: 29.8909132, long: -97.9057468, imageName: "spring", webLink: "https://www.meadowscenter.txst.edu/explorespringlake/springlakenaturalarea.html", category: "Large")
]
struct Item: Identifiable {
    //initiaklize same order as data set list
    let id = UUID()
    let name: String
    let address: String
    let acreage: String
    let desc: String
    let lat: Double
    let long: Double
    let imageName: String
    let webLink: String
    let category: String
    
}



struct ContentView: View {
    
    // add this at the top of the ContentView struct. In this case, you can choose the coordinates for the center of the map and Zoom levels
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.878533, longitude: -97.931734), span: MKCoordinateSpan(latitudeDelta: 0.07, longitudeDelta: 0.07))
    
    let categories = ["All"] + Array(Set(data.map { $0.category })).sorted()
    @State private var selectedCategory = "All"

    var filteredData: [Item] {
        if selectedCategory == "All" {
            return data
        } else {
        return data.filter { $0.category == selectedCategory }
        }
    }
           
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text ("San Marcos Greenspaces")
                    .font(.title)
                    .padding(.top, 30)
                    .bold()
                // include the Picker code at the top of the main VStack on the List View
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { category in
                    Text(category).tag(category)
                }
                }
                .pickerStyle(.menu)
                List(filteredData, id: \.name) { item in
                // enclose the entire HStack in the NavigationLink to create the link to the Detail View and send the data
            NavigationLink(destination: DetailView(item: item)) {
                    HStack {
                        Image(item.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.address)
                                .font(.subheadline)
                            Text("\(item.acreage) acres")
                                .font(.subheadline)
                        } // end internal VStack
                    } // end HStack
                // make sure you add the additional curly brace to close the Navigation Link
            } // end NavigationLink
                } // end List
                
                Map(coordinateRegion: $region, annotationItems: data) { item in
                              MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: item.lat, longitude: item.long)) {
                                  Image(systemName: "mappin.circle.fill")
                                      .foregroundColor(.red)
                                      .font(.title)
                                      .overlay(
                                          Text(item.name)
                                              .font(.subheadline)
                                              .foregroundColor(.black)
                                              .fixedSize(horizontal: true, vertical: false)
                                              .offset(y: 25)
                                      )
                              }
                          } // end map
                          .frame(height: 300)
                          .padding(.bottom, -30)
                        
                
            } // end VStack
            .listStyle(PlainListStyle())
             //   .navigationTitle("San Marcos Greenspaces")
                
                
                    
                        
        } // end NavigationView
          } // end body

}//end contentview

struct DetailView: View {
    
    
    @State private var region: MKCoordinateRegion
    
    init(item: Item) {
        self.item = item
        _region = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: item.lat, longitude: item.long), span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)))
    }
    
    let item: Item
    
    var body: some View {
        ScrollView {
        VStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 200)
                
            Text("Address: \(item.address)")
                .font(.subheadline)
            //Text("Description: \(item.desc)")
            //dscription here
            Text(item.desc)
                .font(.subheadline)
                .padding(10)
            /*  Link("View Official Website", destination: (item.webLink))*/
        /*  Link("View Official Website",
                 destination: URL(Item: (item.webLink)!) */
            
            // include this within the VStack of the DetailView struct, below the content. Reads items from data into the map. Be careful to close curly braces properly.
            
            Map(coordinateRegion: $region, annotationItems: [item]) { item in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: item.lat, longitude: item.long)) {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.red)
                        .font(.title)
                        .overlay(
                            Text(item.name)
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .fixedSize(horizontal: true, vertical: false)
                                .offset(y: 25)
                        )
                }
            } // end Map
            .frame(height: 300)
            .padding(.bottom, -60)
            
            
            
            
            
        } // end VStack
        .navigationTitle(item.name)
        Spacer()
    } // end body
    }
  } // end DetailView


#Preview {
    ContentView()
}
