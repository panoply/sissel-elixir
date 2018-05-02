/* Modules */
import m from 'mithril';

/* Utilities */
import api from 'utilities/api';
import data from 'utilities/data';

export default {
  oninit(){
    api.get({
      endpoint: 'clients'
    });
  },
  view() {
    return [
      m('.row', [
        m('.col-12', [
          m('.d-block', data.admin.dashboard.greeting),
          api.data.map((item) => {
            return [
              m('a[href="/dashboard/clients/'+item.id+'"]', {
                oncreate: m.route.link
              }, item.company)
            ];
          })
        ])
      ])
    ];
  },
};
