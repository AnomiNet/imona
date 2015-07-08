// Controller:Action based init
App.init = () => {
  var $body = $("body");
  var controller = $body[0].dataset.controller;
  var action = $body[0].dataset.action;

  // Shared init
  App.Models.Shared.init();

  var activeController = App.Models[controller];
  if (activeController !== undefined) {
    if ( activeController.init ) {
      activeController.init();
    }

    if ( activeController[action] ) {
      activeController[action]();
    }
  }
};

document.onreadystatechange = () => {
  if (document.readyState == "interactive") {
    App.init();
  }
};
