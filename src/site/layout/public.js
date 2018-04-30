/* Modules */
import m from 'mithril';

/* Helpers */
import state from 'utilities/state';

/* Layout */
import Navbar from 'components/navbar';

export default {
  view(v){
    return [
      m('.slide-menu.left', {
        style: {
          transform: state.drawer.menu ? 'translateX('+state.drawer.width+'px)' : 'translateX(0px)'
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
      m(Navbar),
      m('.drawer-transition', {
        style:{
          transform: state.drawer.menu ? 'translateX('+state.drawer.width+'px)' : 'translateX(0px)'
        }
      }, m('.public', v.children)),
      state.drawer.menu ? m('.panel-overlay', {
        onclick() {
          state.drawer.menu = false;
        }
      }) : null,
    ];
  }
};
