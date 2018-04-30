/* Modules */
import m from 'mithril';

/* Helpers */
import state from 'utilities/state';

export default {
  view(){
    return [
      m('.public-navbar', {
        style: {
          transform: state.drawer.menu ? 'translateX('+state.drawer.width+'px)' : 'translateX(0px)',
          transition: 'transform 600ms cubic-bezier(0.19, 1, 0.22, 1)',
        }
      }, [
        m('.float-left.drawer-transition', [
          m('button.d-block[type="button"]', {
            onclick: () => {
              if(state.drawer.menu) {
                state.drawer.menu = false;
              } else {
                state.drawer.menu = true;
              }
            }
          },[
            m('svg.public-navbar__hamburger', m('use[xlink:href="icons.svg#hamburger"]'))
          ]),
        ]),
        m('.float-right.drawer-transition', {
          style: {
            transform: state.drawer.menu ? 'translateX(-'+state.drawer.width+'px)' : 'translateX(0px)'
          }
        }, [
          state.authentication ?  m('a.pr-4.d-inline[href="/logout"]', {
            oncreate: m.route.link
          }, 'Logout') : m('a.d-inline[href="/login"]', {
            oncreate: m.route.link
          },[
            m('svg.public-navbar__login', m('use[xlink:href="icons.svg#login"]'))
          ])
        ])
      ])
    ];
  }
};
