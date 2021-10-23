# xkcd rdr
xkcd comic book reader

![upload](https://user-images.githubusercontent.com/21968377/138002732-1879b901-9b38-4bb8-acec-f6b4f062896b.png)

## ⚡️ Project Overview
Project is written in SwiftUI by applying VOODO architecture - I hear you say: "WTF is voodo?" - and I am right there with you.
But this is just a twist on the MVVM architecture, with naming more adapted to SwiftUI [more on that here](https://swiftuivoodo.com/)

🖌 Design-wise, i tried to keep in line with the simple one colour design, but also wanted to add a BIT of colour at least :) Did not want to go too crazy, and focused on good UX where users controls are closest to the right thumb (bottom right). 

🏎 Also, introduced zoom as some comics were way too wide.

Overall API is very much straightforward and app was written to fit in well with the current state of the API with some possibilities of expansion. Ideally for this kind of project some intermediary API would work really well, as we would be able to include some pagination and optimise calls if needed. Seeing how data is very static, this seems like a good solution.

For now, app performs all the basic functions: browse, save favorites to coreData and examine comic explanations.

In terms of requirements v1.0 has covered:
- [x] browse through the comics,
- [x] see the comic details, including its description,
- [x] search for comics by the comic number as well as text,
- [x] get the comic explanation
- [x] favorite the comics, which would be available offline too,
- [x] send comics to others,
- [ ] get notifications when a new comic is published,
- [ ] support multiple form factors.


## 🧱 Architecture
VOODO architectures main components are **V**iew, **O**bservable**O**bject and **D**ata**O**bject. Bigger apps could have multiple Observables or dataObject but in this instance I decided one "set" would suffice to cover the whole app as it is fairly simple.

DataObject would usually be separate from the CoreData in a from of Persistency class or similar, but again, this being a simple app i decided to keep then bundled together. Otherwise dataObject would interact with the persistency class instead of observableObject talking directly to it through dataObject.

That is the real beauty of this architecture. Not being static but very modular, and as long as the flow makes sense and separation of concerns is in place, it just 👌 works!

Main 🧠 of the whole app is ObservableObject which holds the @Published property. Any change to that property would redraw the screen, so whenever we get new data from the web or fetch it locally, and store it in the main variable, there is no need to worry about stale data.

It also holds 2 UserDefault properties or *AppStorage*, which saves users location and latest ever comic. Being this data is very simple, i decided to save it there instead of coreData.


## 🕸 Networking 
Basic networking in place by utilising Combine. We could add a debounce as well, but this kind of interaction does not seem to require it.
Even though API calls are very simple and 1 call could be enough for the app, i made it so there is quite a bit of room for expansion and modularity.

## 🔎 Search
Search API is broken in the source API(server 500). This is where an intermediary API would get the job done, but seeing as its a bit out of scope, and not something i am familiar with, i proposed a (hopefully interesting) solution where user can find comics based on the #number. Also, usage of the picker is just an added "eye candy" of sorts :) To make things a tad more interesting.
![srch 1](https://user-images.githubusercontent.com/21968377/138003017-87ec2e6b-121e-46de-80a6-d3fea506cec6.png)

## 🔭 Explanation
I kind of could just place an external URL for explanation or open the page in local WebView, but felt that would take away from the app experience, so i had a bit of fun and extracted that HTML into a string and placed it in the app. 🤷‍♂️
![exp 1](https://user-images.githubusercontent.com/21968377/138002867-c8f934ba-fe1c-4bd0-b2b1-779dd7806393.png)

## 🗺 Navigation 
Opted for the solution with 2 buttons after few iterations. I had a swipe left-right solution as well, but in some cases there are comics that are way too small, and therefore require zoom, which i enabled with a single tap on the image. Then, user would be able to swipe left and right to read the comic easier.

Being how API only gets one comic per call, i considered introducing lazy loading for previous/next 5 comics, but kinda felt it would be out of scope.
![nav 1](https://user-images.githubusercontent.com/21968377/138003113-b060c7e2-9337-4769-8d63-8dd77b4039c0.png)


## If you've gotten this far, thank you! 🙌
