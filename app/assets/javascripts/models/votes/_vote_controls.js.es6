App.Models.Votes._vote_control = class {
  constructor() {
    let controls = $("[data-js-role='vote-control']");
    for (var control of controls) {
      control.addEventListener( 'click', this, false );
    }
  }

  handleEvent(event) {
    let ogElement = event.target;
    if ( ogElement.dataset.jsRole === 'button' ) {
      // Implied from the constructor addEventListener()
      let control = event.currentTarget;
      let contentId = parseInt( control.dataset.contentId );
      let contentType = control.dataset.contentType;
      let vector = parseInt( ogElement.dataset.value );
      this.doVote( vector, contentId, contentType );
    }
  }

  doVote(vector, contentId, contentType) {
    let postData = { vector: vector, post_id: contentId };
    App._.http.post( 'votes', postData ).then( (resp) => {
      // Magic
    });
  }
};
