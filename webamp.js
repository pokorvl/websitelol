function handleClick() {
  const app = document.getElementById("app");
  app.innerHTML = "Loading Winamp (:";
  
  // Load Webamp first
  $.getScript("https://unpkg.com/webamp@1.5.0/built/webamp.bundle.min.js")
    .done(() => {
      // Load butterchurn and presets in parallel (optional but recommended)
      $.when(
        $.getScript("https://unpkg.com/butterchurn@2.6.7/lib/butterchurn.min.js"),
        $.getScript("https://unpkg.com/butterchurn-presets@2.4.7/lib/butterchurnPresets.min.js")
      ).done(() => {
        // Remove click listener after scripts load
        document.getElementById("callWebamp").removeEventListener("click", handleClick);

        // Initialize Webamp with your tracks served locally
        const webamp = new Webamp({
          initialTracks: [
            {
              metaData: { artist: "Vráťa Hošek", title: "Sudety" },
              url: "/Music/01 - Vrata Hosek - Sudety.m4a",
              duration: 95,
            },
            {
              metaData: { artist: "Vráťa Hošek", title: "Tři Kříže (hákový)" },
              url: "/Music/02 - Vrata Hosek - Tři Kříže (hákový).m4a",
              duration: 102,
            },
            {
              metaData: { artist: "Vráťa Hošek", title: "Dáda" },
              url: "/Music/03 - Vrata Hosek - Dáda.m4a",
              duration: 131,
            },
            {
              metaData: { artist: "Vráťa Hošek", title: "Když mě zvali na panáka" },
              url: "/Music/04 - Vrata Hosek - Když mě zvali na panáka.m4a",
              duration: 160,
            },
            {
              metaData: { artist: "Vráťa Hošek", title: "Liebensraum" },
              url: "/Music/05 - Vrata Hosek - Liebensraum.m4a",
              duration: 45,
            },
            {
              metaData: { artist: "Vráťa Hošek", title: "Balada o Hermannu Göringovi" },
              url: "/Music/06 - Vrata Hosek - Balada o Hermannu Göringovi.m4a",
              duration: 133,
            },
            {
              metaData: { artist: "Vráťa Hošek", title: "Valašská" },
              url: "/Music/07 - Vrata Hosek - Valašská.m4a",
              duration: 122,
            },
            {
              metaData: { artist: "Vráťa Hošek", title: "Hess" },
              url: "/Music/08 - Vrata Hosek - Hess.m4a",
              duration: 30,
            },
            {
              metaData: { artist: "Vráťa Hošek", title: "Atom" },
              url: "/Music/09 - Vrata Hosek - Atom.m4a",
              duration: 135,
            },
            {
              metaData: { artist: "Vráťa Hošek", title: "Kleště a letlampa" },
              url: "/Music/10 - Vrata Hosek - Kleště a letlampa.m4a",
              duration: 116,
            },
            {
              metaData: { artist: "Vráťa Hošek", title: "Sebereflexivní" },
              url: "/Music/11 - Vrata Hosek - Sebereflexivní.m4a",
              duration: 174,
            },
          ],
        });

        webamp.renderWhenReady(app);

        // Remove the callWebamp element (if you want)
        const callWebampElem = document.getElementById("callWebamp");
        if (callWebampElem) callWebampElem.remove();

      }).fail(() => {
        app.innerHTML = "Failed to load butterchurn scripts.";
        console.error("Failed to load butterchurn or butterchurn-presets scripts.");
      });
    })
    .fail(() => {
      app.innerHTML = "Failed to load Webamp script.";
      console.error("Failed to load Webamp script.");
    });
}

// Attach listener to element with id "callWebamp"
document.getElementById("callWebamp").addEventListener("click", handleClick);