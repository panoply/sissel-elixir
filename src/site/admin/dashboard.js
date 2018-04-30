/* Modules */
import m from 'mithril';

/* Helpers */
import api from 'utilities/api';
import Data from 'utilities/data';

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
          m('.d-block', Data.admin.dashboard.greeting),
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
