/* Modules */
import m from 'mithril';

/* Utilities */
import Data from 'utilities/data';

export default {
  view() {
    return [
      m('a.d-block[href="/"]', { oncreate: m.route.link }, [
        m('svg.hero__logo', m('use[xlink:href="icons.svg#logo"]'))
      ]),
      m('.hero__caption.d-block', Data.public.hero_caption),
      m('.row.justify-content-center.pt-4.no-gutters', [
        m('.col-auto', [
          m('svg.icon__centra', m('use[xlink:href="icons.svg#centra"]'))
        ]),
        m('.col-2', [
          m('svg.icon__plus', m('use[xlink:href="icons.svg#plus"]'))
        ]),
        m('.col-auto', [
          m('svg.icon__shopify', m('use[xlink:href="icons.svg#shopify"]'))
        ])
      ])
    ];
  },
};
