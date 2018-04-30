/* Stylesheet */
import './sass/styles.js';

/* Modules */
import m from 'mithril';

/* Utilities */
import state from 'utilities/state';

/* Layout */
import Hero from 'layout/hero';
import Admin from 'layout/admin';

/* Public Views */
import Home from 'public/home';
import Login from 'public/login';

/* Admin Views */
import Dashboard from 'admin/dashboard';
import Clients from 'admin/clients';

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
  '/dashboard/clients': {
    render(){
      return m(Admin, m(Clients));
    }
  },
  '/dashboard/clients/:id': {
    render(){
      return m(Admin, m(Clients));
    }
  }
});
