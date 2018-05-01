/* Modules */
import m from 'mithril';

/* Helpers */
import state from 'utilities/state';

export default {
  view(){
    return [
      m('.slide-menu.left', {
        style: {
          transform: state.drawer.menu ? 'translateX('+state.drawer.width+')' : 'translateX(0px)'
        }
      },[
        m('nav', [
          m('ul.Menu', [
            m('li', m('a[href="/"]', 'Home')),
            m('li', m('a[href="/about"]', 'About')),
            m('li', m('a[href="/clients"]', 'Clients')),
            m('li', m('a[href="/contact"]', 'Contact')),
          ])
        ])
      ]),
    ];
  }
};
