/* Modules */
import m from 'mithril';

const Auth = {
  email: '',
  password: '',
  error: false,
  setEmail(value) {
    Auth.email = value;
  },
  setPassword(value) {
    Auth.password = value;
  },
  login() {
    m.request({
      method: 'POST',
      url: 'http://localhost:4000/api/v1/login',
      data: {
        email: Auth.email,
        password: Auth.password
      },
      headers: {
        'Content-Type': 'application/json', // JSON API SPEC
      }
    }).then((data) => {
      localStorage.setItem('token', data.jwt);
      m.route.set('/secret');
    }).catch(() => {
      Auth.error = true;
    }).then(() => {
      setTimeout(() => Auth.error = false, 800);
    });
  }
};

export default Auth;
