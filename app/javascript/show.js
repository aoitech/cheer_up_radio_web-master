function show() {
  const RadioIndexUrls = document.getElementsByClassName("radio__index_url");
  RadioIndexUrlsA = Array.from(RadioIndexUrls);

  RadioIndexUrlsA.forEach(function (index) {
    index.addEventListener("click", () => {
      const indexId = index.getAttribute("data-id");
      const RadioIndexes = document.getElementsByClassName("radio__index");
      RadioIndexesA = Array.from(RadioIndexes);

      RadioIndexesA.forEach(function (content) {
        if(content.getAttribute("style") == "display:none;") {
          const contentId = content.getAttribute("data-id");
          if (contentId == indexId) {
            content.removeAttribute("style", "display:none;");
          }
        } else {
          content.setAttribute("style", "display:none;");
        }
      })
    })
  })
}
window.addEventListener("load", show);