/* Modules */
import m from 'mithril';

export default {
  view(){
    return [
      m('.admin-navbar', [
        m('.row', [
          m('.col-6.align-self-center', [
            m('button[type="button"]',[
              m('svg.admin-navbar__logo', m('use[xlink:href="icons.svg#logo"]'))
            ]),
          ]),
          m('.col-6.text-right.align-self-center', [
            m('a[href="/logout"]', {
              oncreate: m.route.link
            },[
              m('svg.admin-navbar__login', m('use[xlink:href="icons.svg#login"]'))
            ])
          ])
        ])
      ])
    ];
  }
};
