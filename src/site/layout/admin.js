/* Modules */
import m from 'mithril';

/* Layout */
import Navbar from 'admin/components/navbar';

/* Utilities */
import Data from 'utilities/data';

export default {
  oninit(){
    m.route.set('/secret');
  },
  view(v){
    return [
      m(Navbar),
      m('.dashboard', [
        m('.row.no-gutter', [
          m('.col-2.dashboard__sidebar.bg-ash', [
            m('ul', [
              Data.admin.menu.map((item) => {
                return [
                  m('li', [
                    m('a[href="'+item.url+'"]', [
                      m('svg.icon', m('use[xlink:href="icons.svg#'+item.icon+'"]')),
                      m('span', item.name)
                    ])
                  ])
                ];
              })
            ])
          ]),
          m('.col-10.dashboard__content', [
            m('.block.p-5', v.children)
          ])
        ])
      ])
    ];
  }
};
