/* Modules */
import m from 'mithril';

/* Helpers */
import api from 'utilities/api';

export default {
  oninit(){
    api.get({
      endpoint: 'users',
      query: {
        company: m.route.param('id')
      }
    });
  },
  view() {
    return [
      m('.d-block', [
        m('h1', 'Clients'),
        api.data.map((item) => {
          return [
            m('.d-block', item.attributes['first-name'] + item.attributes['last-name']),
            m('.d-block', item.attributes['email'])
          ];
        })
      ])
    ];
  },
};
