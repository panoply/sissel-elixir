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
            m('li', m('a[href="/"]', { oncreate: m.route.link }, 'Home')),
            m('li', m('a[href="/about"]',{ oncreate: m.route.link }, 'About')),
            m('li', m('a[href="/clients"]', 'Clients')),
            m('li', m('a[href="/contact"]', 'Contact')),
          ])
        ])
      ]),
      m(Navbar),
      m('.hero.row.justify-content-center.align-items-center', {
        style: {
          transform: state.drawer.menu ? 'translateX('+state.drawer.width+'px)' : 'translateX(0px)',
          overflow: state.drawer.menu ? 'hidden' : ''
        }
      },[
        m('.col-7.align-self-center.text-center.drawer-transition', {
          style: {
            transform: state.drawer.menu ? 'translateX(-'+state.drawer.width/2+'px)' : 'translateX(0px)'
          }
        },[
          m('div', v.children)
        ])
      ]),
      state.drawer.menu ? m('.panel-overlay', {
        onclick() {
          state.drawer.menu = false;
        }
      }) : null,
    ];
  }
};
