# z2x
Script to analyse data on participants of "Zeit Online Z2X Konferenz" and visualise the network. 
The z2x Conference is held annualy in Berlin and there are also local conferences. 
The  https://z2x.zeit.de/neue-visionaere/ shows a subset of 1000 participants and provides data on what they are interested in and in which conferences they took part.
The goal of the analysis is to show how z2x is connecting young driven people all across GErmany. 

1. I first scrape all the available data on https://z2x.zeit.de/neue-visionaere/ and group them by event which they attended
2. I geocode the location of all participants
3. I plot the data on a German map
4. I recreated the famous FB network plot (https://www.facebook.com/notes/facebook-engineering/visualizing-friendships/469716398919/)
