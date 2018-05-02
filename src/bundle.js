/* Stylesheet */
import './sass/styles.js';

/* Modules */
import m from 'mithril';

/* Utilities */
import state from 'utilities/state';

/* Public */
import Hero from 'public/components/hero'; // Layout
import Home from 'public/home';
import Login from 'public/login';

/* Admin */
import Admin from 'admin/components/layout'; // Layout
import Dashboard from 'admin/dashboard';
import Stock from 'admin/stock';

/* Mounted Element */
const root = document.getElementById('app');

/* Public Router */
m.route(root, '/', {
  '/': {
    render() {
      return m(Hero, m(Home));
    },
  },
  '/login': {
    render(){
      return m(Hero, m(Login));
    }
  },
  '/logout': {
    onmatch() {
      if (localStorage.getItem('token')) {
        localStorage.removeItem('token');
        state.authentication = false;
        m.route.set('/');
      }
    }
  },
  '/secret': {
    onmatch() {
      if (!localStorage.getItem('token')) {
        m.route.set('/login');
      } else {
        state.authentication = true;
        m.route.set('/dashboard');
      }
    }
  },
  '/dashboard': {
    render(){
      return m(Admin, m(Dashboard));
    }
  },
  '/stock': {
    render(){
      return m(Stock, m(Dashboard));
    }
  }
});
