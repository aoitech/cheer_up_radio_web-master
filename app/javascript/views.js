window.addEventListener("load", function () {
  let count_up = 0;
  $(`video[type="video/mp4"]`).on("play", function () {
    count_up++;
    $("#radio_views").text(`${count_up}回`);
  })
})