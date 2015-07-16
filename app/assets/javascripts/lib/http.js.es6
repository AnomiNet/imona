// Wrapper around qwest to handle auth header and such
App.Lib.http = class {
  constructor() {
    this.cache = {
      userToken: null,
      baseOptions: null
    };
  }

  get( url, data, options ) {
    return qwest.get( this.toUrl(url), data, this.withBaseOpts(options) );
  }

  post( url, data, options ) {
    return qwest.post( this.toUrl(url), data, this.withBaseOpts(options) );
  }

  baseOptions() {
    if ( !( this.cache.baseOptions ) ) {
      this.cache.baseOptions = {
        dataType: 'json',
        headers: {
          'Content-type': 'application/json; charset=utf-8',
          'X-User-Token': this.userToken()
        }
      };
    }
    return this.cache.baseOptions;
  }

  withBaseOpts(options) {
    let baseOpts = this.baseOptions();
    for ( var attr in options ) {
      baseOpts[attr] = options[attr];
    }
    return baseOpts;
  }

  userToken() {
    if ( !( this.cache.userToken ) ) {
      this.cache.userToken = docCookies.getItem('user_token');
    }
    return this.cache.userToken;
  }

  toUrl(url) {
    return ( Conf.apiUrl + url );
  }
};
