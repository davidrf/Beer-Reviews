# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

[
  'Altbier',
  'Amber/Red Ale',
  'Barleywine',
  'Baltic Porter',
  'Belgian Dubbel',
  'Belgian Tripel',
  'Belgian Quad',
  'Belgian Strong Ale',
  'Berliner Weisse',
  'Bière de Garde',
  'Black IPA',
  'Blonde Ale',
  'Bock',
  'Brown Ale',
  'Cream Ale',
  'Doppelbock',
  'Double IPA',
  'Eisbock',
  'Flanders Red Ale',
  'Fruit Beer',
  'Golden Ale',
  'Gose',
  'Gueuze',
  'Hefeweizen',
  'Imperial Stout',
  'IPA',
  'IPL',
  'Kölsch',
  'Lager',
  'Light Lager',
  'Lambic',
  'Oktoberfest/Märzen',
  'Old Ale',
  'Oud bruin',
  'Pale Ale',
  'Pilsner',
  'Porter',
  'Pumpkin',
  'Radler',
  'Saison/Farmhouse Ale',
  'Scotch Ale/Wee Heavy',
  'Sour Ale',
  'Stout',
  'Triple IPA',
  'Weizenbock',
  'Wheat Beer',
  'White IPA',
  'Wild Ale',
  'Witbier'
].each do |style_name|
  Style.find_or_create_by!(name: style_name)
end

user = User.where(email: "joeschmo@gmail.com")
if user.blank?
  user = User.new(email: "joeschmo@gmail.com", password: "12345678", password_confirmation: "12345678")
  user.save
end

Brewery.find_or_create_by!(name: "Bayerische Staatsbrauerei Weihenstephan", year: 1040, city: "Freising", country: "Germany", description: "The Bavarian State Brewery Weihenstephan, founded in 1040, is the oldest existing brewery in the world. As directed by operation of Bavaria it is run as a modern company, which brews beers of the highest quality and successfully sells worldwide in over 40 countries. The unique combination of tradition and science gives the brewer the quality standard 'premium bavaricum' and national and international awards for their 'Weihenstephan beers.'")
Brewery.find_or_create_by!(name: "Bear Republic Brewing Company", year: 1995, city: "Healdsburg", state: "CA", country: "United States", description: "Bear Republic was established by the Norgrove family in 1995, with Richard G. Norgrove as brewmaster. The name is said to refer to California's 1846 Bear Flag Revolt. In 2006, Bear was named Small Brewing Company and Small Brewing Company Brewer of the Year at the Great American Beer Festival. Bear's best-selling product is Racer 5, an India Pale Ale which accounted for about three-quarters of the company's 2009 sales.")
Brewery.find_or_create_by!(name: "Boulevard Brewing Company", year: 1989, city: "Kansas City", state: "MO", country: "United States", description: "Boulevard began in 1988 when founder John McDonald started construction of the brewery in a turn-of-the-century brick building on Kansas City’s historic Southwest Boulevard. A vintage Bavarian brewhouse was installed with used equipment from a closed brewery in Bavaria, Germany, and the first batches of beer were produced in the fall of 1989. Based on the historic example set by the local and regional breweries that were once common throughout the United States prior to Prohibition, the brewery has a focus on providing locally-brewed beer for the Kansas City region.")
Brewery.find_or_create_by!(name: "Brasserie d'Achouffe", year: 1982, city: "Achouffe", country: "Belgium", description: "Towards the end of the 1970s, Pierre Gobron and Christian Bauweraerts decided to create their own beer in their own brewery. With initially only a small amount of money available to them, they started out on what the fans of the brewery call the ‘Chouffe story’. At the beginning its founders thought of it as a hobby, but the brewery developed at such a rate that, one by one, they decided to devote themselves to the adventure full-time.")
Brewery.find_or_create_by!(name: "Brewery Ommegang", year: 1997, city: "Cooperstown", state: "NY", country: "United States", description: "Ommegang began brewing Belgian-style ales in 1997. Founded by Don Feinberg and Wendy Littlefield, owners of Vanberg & DeWulf beer import company, and three family owned Belgian breweries including Duvel Moortgat. Ommegang started up in a purpose-built building based on a traditional Belgian farmhouse, set on a former 136-acre hop farm in the Susqehanna River Valley, four miles south of Cooperstown, New York in the Town of Milford.")
Brewery.find_or_create_by!(name: "Brouwerij Duvel Moortgat", year: 1871, city: "Breendonk-Puurs", country: "Belgium", description: "The Duvel Moortgat group, founded in 1871, is an independent producer of authentic speciality beers and premium brands. Around the world, the group is considered to be the leading producer of blond, bottle conditioned, high fermentation beers, a dominant position owed largely to the success of its best-selling product Duvel. A niche player, Duvel Moortgat occupies a leading position in the strategic segments of speciality beers and premium brands like Duvel, Maredsous, Bel Pils and Vedett.")
Brewery.find_or_create_by!(name: "Dogfish Head Brewery", year: 1995, city: "Milton", state: "DE", country: "United States", description: "Dogfish Head Brewery opened in 1995 and produces 175,000 barrels of beer annually. It has been a rapidly growing brewery – it grew nearly 400% between 2003 and 2006. The brewery was featured prominently in the documentary Beer Wars and was the subject of the Discovery Channel series Brew Masters, which premiered Sunday, November 21, 2010. The brewery takes its name from Dogfish Head, Maine where Calagione spent summers as a child.")
Brewery.find_or_create_by!(name: "Jack's Abby Brewing", year: 2011, city: "Framingham", state: "MA", country: "United States", description: "Jack's Abby Brewing was formally founded in January of 2011 by three brothers, Jack, Eric and Sam Hendler, who grew up in a family business. The ideas behind it, however, date back over ten years to when Jack was still in college experimenting with home brews. After graduating, Jack became the head brewer of one of the largest brewpubs in the eastern US. He earned joint diplomas in Brewing Technology from Siebel Institute of Chicago and Doemans Academy of Munich. Currently he is a member of the Master Brewers Association.")
Brewery.find_or_create_by!(name: "Jolly Pumpkin Artisan Ales", year: 2004, city: "Dexter", state: "MI", country: "United States", description: "Jolly Pumpkin was founded by Ron Jeffries in 2004. It operates two pubs, one in Ann Arbor and the other in Traverse City. Jolly Pumpkin produces a variety of unfiltered and unpasteurized 'rustic country' beers. Jolly Pumpkin ages their beers in wine barrels which contain naturally occurring microbiological cultures including brettanomyces.")
Brewery.find_or_create_by!(name: "Left Hand Brewing Company", year: 1993, city: "Longmont", state: "CO", country: "United States", description: "Left Hand began in December 1990 with a homebrewing kit founder Dick Doore received from his brother. According to Dick, 'it was all downhill from there.' By 1993, Dick had teamed up with college buddy Eric Wallace and they resolved to start a brewery. On September 21, 1993, they incorporated as Indian Peaks Brewing Company, and purchased a former meat-packing plant next to the St. Vrain River outside downtown Longmont, Colorado.")
Brewery.find_or_create_by!(name: "North Coast Brewing Company", year: 1988, city: "Fort Bragg", state: "CA", country: "United States", description: "Under the leadership of brew master Mark Ruedrich, North Coast Brewing Company has developed a strong reputation for quality having won more than 70 awards in national and international competitions. In addition to Red Seal Ale, Old Rasputin Russian Imperial Stout, Scrimshaw Pilsner, and other fine North Coast brands, the brewery has resurrected the old Acme label with a heritage dating back to the San Francisco of the 1860’s.")
Brewery.find_or_create_by!(name: "Pretty Things Beer And Ale Project", year: 2008, city: "Somerville", state: "MA", country: "United States", description: "It all started in Yorkshire, England, at the time home to beer-brewer Dann Paquette and his wife Martha. Dann was brewing at a small family-owned 'real ale' brewery in Harrogate and Martha was a scientist in York. On the weekends they'd explore the nearby Moors and Dales and the small towns and pubs that are dotted about them. One of these small towns, Ripon is home to a fantastic cathedral, which stands guard over an ancient Saxon crypt, hidden down a narrow staircase.")
Brewery.find_or_create_by!(name: "Samuel Adams (Boston Beer Company)", year: 1984, city: "Boston", state: "MA", country: "United States", description: "The Samuel Adams brand began in 1984 with Samuel Adams Lager, a 4.8% abv amber or Vienna lager. Jim Koch, the sixth-generation, first-born son to follow in his family's brewing footsteps, brewed his first batch of the beer in his kitchen, using the original family recipe for Louis Koch Lager. In December 1984, Koch left his career at Boston Consulting Group and along with Rubin and Lamadrid, founded the Samuel Adams brewery.")
Brewery.find_or_create_by!(name: "Sierra Nevada Brewing Company", year: 1980, city: "Chico", state: "CA", country: "United States", description: "Sierra Nevada Brewing is one of the most popular craft breweries currently operating in the United States. Its Pale Ale is world renowned, and the brewery produces almost 700,000 barrels of beer per year. Sierra Nevada's Pale Ale is the second best-selling craft beer in the United States, behind the Boston Beer Company's Samuel Adams Boston Lager. Sierra Nevada's specialty brews include the winter seasonal Celebration, which is similar to the pale ale, but hoppier; and Summerfest, a lager which is citrusy and sunny.")
Brewery.find_or_create_by!(name: "Slumbrew", year: 2011, city: "Somerville", state: "MA", country: "United States", description: "Our story began nearly 15 years ago as our founders Caitlin Jewell and Jeff Leiter traveled around the country (and the world) trying to understand a renaissance in brewing that is now described as craft beer. With over 10 years as an avid home brewer, and construction of a small 350 square foot test lab brewery in Somerville, MA for recipe creation, Caitlin and Jeff set out in 2011 to make their beers available in Massachusetts.")
Brewery.find_or_create_by!(name: "Southern Tier Brewing Company", year: 2004, city: "Lakewood", state: "NY", country: "United States", description: "Southern Tier Brewing Company was founded in 2004 by Phineas DeMink and Allen Yahn with the vision of bringing small batch brewing back to a region rich in brewing tradition. In 2003 Skip and Phin purchased the defunct Old Saddle Back Brewing Co. in Pittsfield, Massachusetts. All the equipment was removed and brought back to Lakewood, New York and set up at its new 10,000 square foot home, The Southern Tier Brewing Company.")
Brewery.find_or_create_by!(name: "The Lost Abbey", year: 2006, city: "San Marcos", state: "CA", country: "United States", description: "Founded in 2006, Port Brewing and The Lost Abbey produce an extensive line-up of continental and American-inspired ales and lagers. Under the direction of visionary brewmaster and co-founder Tomme Arthur, the brewery has garnered dozens of awards in its seven-year history including the 2007 Great American Beer Festival Small Brewery of the Year, The 2008 world Beer Cup Champion Small Brewery and the 2013 Champion Brewery at the San Diego International Beer Festival.")
Brewery.find_or_create_by!(name: "Tröegs Brewing Company", year: 1997, city: "Hershey", state: "PA", country: "United States", description: "Tröegs Brewery was founded in 1996 in Harrisburg, Pennsylvania, by brothers John and Chris Trogner. The name Tröegs is a combination of a nickname derived from the surname Trogner and the Dutch word kroeg ('pub'). The brewery was originally located at 800 Paxton Street in Harrisburg. Their first keg was sold to a Harrisburg restaurant in July, 1997. Tröegs began construction of their new brewery in 2010 and moved from Harrisburg to Hershey in fall 2011.")
Brewery.find_or_create_by!(name: "Unibroue", year: 1990, city: "Chambly", state: "Quebec", country: "Canada", description: "From the very beginning, Unibroue has carved out a special niche in the beer world with top quality products and a brand rooted deep in Quebec culture. It made history by becoming the first North American beer maker to use a brewing method inspired by the two-centuries-old tradition developed by Trappist monks in Europe—particularly in Belgium. Over the years, Unibroue has remained faithful to its origins even as it has grown to become an icon of the brewing world.")
Brewery.find_or_create_by!(name: "Victory Brewing Company", year: 1996,  city: "Downingtown", state: "PA", country: "United States", description: "Victory Brewing Company is a privately held craft brewery headquartered in Downingtown, Pennsylvania. Begun by Bill Covaleski and Ron Barchet, childhood friends who met on a school bus in 1973, the brewery formally began operations in February of 1996. Victory, Pennsylvania’s widely acclaimed brewery and restaurant, now serves fans of fully flavored beers in 34 states with innovative beers melding European ingredients and technology with American creativity.")

Beer.find_or_create_by!(name: "Golden Monkey", user: user, brewery: Brewery.find_by(name: "Victory Brewing Company"), style: Style.find_by(name: "Belgian Tripel"), abv: 9.5, ibu: 20, description: "Strong and sensual, this golden, Belgian-style ale glows. The richness of German malts and Belgian yeast are tempered by a sparkling approach and overall light body. Abundant herbal, fruity notes make Golden Monkey one to savor.")
Beer.find_or_create_by!(name: "La Fin Du Monde", user: user, brewery: Brewery.find_by(name: "Unibroue"), style: Style.find_by(name: "Belgian Tripel"), abv: 9, ibu: 19, description: "Floral bouquet, aromas of honey, spice, coriander, malt, and alcohol. Mildly yeasty with a complex palate of malt, fruit and spice notes followed by a smooth, dry finish.")
Beer.find_or_create_by!(name: "Hennepin Farmhouse Saison", user: user, brewery: Brewery.find_by(name: "Brewery Ommegang"), style: Style.find_by(name: "Saison/Farmhouse Ale"), abv: 7.7, ibu: 24, description: "With tons of complex spicy notes, including coriander, orange peel and grains of paradise, and no flavor overpowering the palate, Ommegang’s Hennepin is truly a very well-balanced and enjoyable brew.")
Beer.find_or_create_by!(name: "Baby Tree", user: user, brewery: Brewery.find_by(name: "Pretty Things Beer And Ale Project"), style: Style.find_by(name: "Belgian Quad"), abv: 9, description: "Baby Tree is inspired by the great monastic Belgian ales. It is a dark garnet in color, with dark fruity flavors. Best drunk from a stemmed glass.")
Beer.find_or_create_by!(name: "Porter Square Porter", user: user, brewery: Brewery.find_by(name: "Slumbrew"), style: Style.find_by(name: "Porter"), abv: 6.5, ibu: 31, description: "Rich black porter with a unique blend of chocolate, coffee, roasted and nutty flavors. Brewed with cocoa powder and conditioned with cacao nibs from Taza Chocolate. Bold flavors from the cacao nibs and black malts are balanced with a special blend of pale malts, oats and wheat to produce a lush and lingering mouthfeel.")
Beer.find_or_create_by!(name: "La Chouffe", user: user, brewery: Brewery.find_by(name: "Brasserie d'Achouffe"), style: Style.find_by(name: "Golden Ale"), abv: 8, ibu: 20, description: "La Chouffe is an unfiltered blonde beer, which is re-fermented in the bottle as well as in the keg. It is pleasantly fruity, spiced with coriander, and with a light hop taste.")
Beer.find_or_create_by!(name: "Hopback Amber Ale", user: user, brewery: Brewery.find_by(name: "Tröegs Brewing Company"), style: Style.find_by(name: "Amber/Red Ale"), abv: 6, ibu: 55, description: "The flavor is a fantastic blend of floral hints with caramel base and a pleasant taste of hops. It isn’t too bitter and finishes strong with one last burst of flavor which is sweet and satisfying.")
Beer.find_or_create_by!(name: "60 Minute IPA", user: user, brewery: Brewery.find_by(name: "Dogfish Head Brewery"), style: Style.find_by(name: "IPA"), abv: 6, ibu: 60, description: "Our flagship beer. A session India Pale Ale brewed with Warrior, Amarillo & 'Mystery Hop X.' A powerful East Coast I.P.A. with a lot of citrusy hop character. THE session beer for beer geeks like us!")
Beer.find_or_create_by!(name: "Milk Stout", user: user, brewery: Brewery.find_by(name: "Left Hand Brewing Company"), style: Style.find_by(name: "Stout"), abv: 6, ibu: 25, description: "Milk sugar in your stout is like cream in your coffee. Dark and delicious, America's great milk stout will change your perception about what a stout can be. Preconceived notions are the blinders on the road to enlightenment. Udderly delightful.")
Beer.find_or_create_by!(name: "Racer 5 IPA", user: user, brewery: Brewery.find_by(name: "Bear Republic Brewing Company"), style: Style.find_by(name: "IPA"), abv: 7.5, ibu: 75, description: "This hoppy American IPA is a full bodied beer brewed with American pale and crystal malts, and heavily hopped with Chinook, Cascade, Columbus and Centennial. There's a trophy in every glass.")
Beer.find_or_create_by!(name: "Bière de Mars", user: user, brewery: Brewery.find_by(name: "Jolly Pumpkin Artisan Ales"), style: Style.find_by(name: "Bière de Garde"), abv: 7, description: "A sustaining beer that is brewed to comfort in the gusty ides of March and welcome in a wealth of warmer weather.")
Beer.find_or_create_by!(name: "Pumking", user: user, brewery: Brewery.find_by(name: "Southern Tier Brewing Company"), style: Style.find_by(name: "Pumpkin"), abv: 8.6, ibu: 30, description: "Holy Halloween, this is delicious! Creamy, slightly sweet, spice essence but not like drinking pumpkin pie. This is, frankly, perfection.")
Beer.find_or_create_by!(name: "Copper Legend", user: user, brewery: Brewery.find_by(name: "Jack's Abby Brewing"), style: Style.find_by(name: "Oktoberfest/Märzen"), abv: 5.9, ibu: 22, description: "Our Octoberfest is malty, smooth and exceedingly drinkable. It is perfect to celebrate and honor today’s legends. We use locally grown wheat from MA, Munich malt and noble hops.")
Beer.find_or_create_by!(name: "Old Rasputin", user: user, brewery: Brewery.find_by(name: "North Coast Brewing Company"), style: Style.find_by(name: "Imperial Stout"), abv: 9, ibu: 75, description: "A rich, intense brew with a robust palate, a fruity nose and a warming finish. Very complex.")
Beer.find_or_create_by!(name: "Duvel", user: user, brewery: Brewery.find_by(name: "Brouwerij Duvel Moortgat"), style: Style.find_by(name: "Belgian Strong Ale"), abv: 8.5, description: "Four generations of the Moortgat family have brought together Pilsener malts, Bohemian hops, and a unique yeast strain to create this intense, aromatic and beguiling ale.")
Beer.find_or_create_by!(name: "Weihenstephaner Hefeweissbier", user: user, brewery: Brewery.find_by(name: "Bayerische Staatsbrauerei Weihenstephan"), style: Style.find_by(name: "Hefeweizen"), abv: 5.4, ibu: 14, description: "Our golden-yellow wheat beer, with its fine-pored white foam, smells of cloves and impresses consumers with its refreshing banana flavour. It is full bodied and with a smooth yeast taste.")
Beer.find_or_create_by!(name: "Samuel Adams Boston Lager", user: user, brewery: Brewery.find_by(name: "Samuel Adams (Boston Beer Company)"), style: Style.find_by(name: "Lager"), abv: 4.7, ibu: 30, description: "Samuel Adams Boston Lager® is the best example of the fundamental characteristics of a great beer, offering a full, rich flavor that is both balanced and complex.")
Beer.find_or_create_by!(name: "Duck Duck Gooze", user: user, brewery: Brewery.find_by(name: "The Lost Abbey"), style: Style.find_by(name: "Wild Ale"), abv: 7, description: "As with all sour ales, the initial sip wakes up your dull senses. There is an elevated level of Acetic Acids working their magic in this beer. The first sip assaults the palate in an enamel stripping bottom of the pH chain sort of way.")
Beer.find_or_create_by!(name: "Bigfoot", user: user, brewery: Brewery.find_by(name: "Sierra Nevada Brewing Company"), style: Style.find_by(name: "Barleywine"), abv: 9.6, ibu: 90, description: "Bigfoot is a beast of a beer, brimming with bold flavors of bittersweet malt and heaps of aggressive whole-cone Pacific Northwest hops.")
Beer.find_or_create_by!(name: "80-Acre Hoppy Wheat Beer", user: user, brewery: Brewery.find_by(name: "Boulevard Brewing Company"), style: Style.find_by(name: "Wheat Beer"), abv: 5.5, ibu: 20, description: "With roots in two of today's most popular brewing styles, 80-Acre Hoppy Wheat Beer is the result of careful cultivation by our brewers and cellarmen. Their efforts to craft a hybrid yielded a delightfully distinctive ale with the aroma of an IPA and the refreshing taste of a wheat beer.")
