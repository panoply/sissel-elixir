/* Modules */
import m from 'mithril';

/* Utilities */
import api from 'utilities/api';

export default {
  oninit(){
    api.get({
      endpoint: 'stock'
    });
  },
  view() {
    return [
      m('.row', [
        m('.col-12', [
          m('ul.tabs', [
            m('li', 'Sync'),
            m('li', 'Shopify'),
            m('li', 'Centra'),
          ]),
          m('.tabs__content', [
            api.data.map((item) => {
              return [
                m('.row', [
                  m('.col-3', item.product),
                  m('.col-2', item.variant),
                  m('.col-1', item.size),
                  m('.col-2', item.ean),
                  m('.col-4', item.collection)
                ])
              ];
            })
          ])
        ])
      ])
    ];
  },
};
