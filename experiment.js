window.set  = 1;
window.step = 1;
window.csv  = 'Набор,Номер изображения,Ответ';

$(".start_button").on("click", function(e) {
  $(".intro").addClass("hide");
  next_step();
  e.preventDefault();
});

$(document).on('click', ".answer img", function(e) {
  // Задерживаем его
  alert("Спасибо! Нажмите ОК для следующего вопроса.");

  // Выбранный ответ
  chosen_answer = $(this).attr("data-number");
  window.csv += "\n" + window.set + "," + window.step + "," + chosen_answer

  // Следующий шаг
  $(".answer").addClass("hide");
  window.step += 1;
  next_step();

  e.preventDefault();
});

$(".download_button").on("click", function(e) {
  var blob = new Blob([window.csv], {type: "text/plain;charset=utf-8"});
  saveAs(blob, "result_" + window.set + ".txt");
});

function next_step() {
  if(step < 5) {
    // Preparation
    $(".question img").attr("src", "images/" + window.step + "/0.jpg");
    $(".answer img").each(function(index) {
      $(this).attr("src", "images/" + window.step + "/" + index + ".jpg");
      $(this).attr("data-number", index);
    });

    $(".question").removeClass("hide");

    // Original
    setTimeout(function() {
      $(".question").addClass("hide");
      $(".relax").removeClass("hide");
    }, 1500);

    // Relax
    setTimeout(function() {
      $(".relax").addClass("hide");
      $(".answer").randomize().removeClass("hide");
    }, 5000);
  } else {
    $(".thankyou").removeClass("hide");
  }
}

$.fn.randomize = function(selector){
  var $elems = selector ? $(this).find(selector) : $(this).children(),
    $parents = $elems.parent();

  $parents.each(function(){
    $(this).children(selector).sort(function(){
      return Math.round(Math.random()) - 0.5;
    }).remove().appendTo(this);
  });

  return this;
};