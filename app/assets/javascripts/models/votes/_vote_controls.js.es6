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

      // Unvote by re-clicking
      let currentVector = parseInt( control.dataset.currentUserVote );
      if ( currentVector === vector ) {
        vector = 0;
      }

      this.doVote( vector, contentId, contentType );
    }
  }

  doVote(vector, contentId, contentType) {
    let postData = { vector: vector, post_id: contentId };
    App._.http.post( '/votes', postData ).then( (resp) => { this.voteDone(resp); } );
  }

  voteDone(resp) {
    // NOTE: Only handles voting on posts right now
    if ( typeof resp === 'object' && resp.hasOwnProperty( 'vector' ) && resp.hasOwnProperty( 'post_id' ) ) {
      let control = this.getControl( 'post', resp['post_id'] );
      if (!control) { return; }
      control.dataset.currentUserVote = resp['vector'];
    }
  }

  getControl(contentType, contentId) {
    return $(`[data-js-role='vote-control'][data-content-type='${contentType}'][data-content-id='${contentId}']`)[0];
  }
};
