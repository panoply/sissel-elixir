/* Modules */
import m from 'mithril';

/* Helpers */
import state from 'utilities/state';
import data from 'utilities/data';

/* Layout */
import Navbar from 'navbar';

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
            data.public.menu.map((item) => {
              return [
                m('li', [
                  m('a[href="'+item.url+'"]', { oncreate: m.route.link }, item.name)
                ])
              ];
            })
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
