/* Modules */
import m from 'mithril';

const Api = {
  data: [],
  get(model) {
    m.request({
      method: 'GET',
      url: 'http://localhost:4000/api/v1/'+model.endpoint+'',
      data: model.query ? model.query : {},
      headers: {
        'Authorization': 'Bearer '+localStorage.getItem('token')+'',
        'Accept': 'application/json' // JSON API SPEC
      },
    }).then((response) => {
      Api.data = response.data;
    });
  }
};

export default Api;
