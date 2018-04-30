/* Modules */
import m from 'mithril';

/* Utilities */
import Auth from 'utilities/auth';

export default {
  oninit() {
    m.route.set('/secret');
  },
  view() {
    return [
      m('.row.justify-content-center', [
        m('.col-5', [
          m('.login', {
            class: Auth.error ? 'login__error' : '',
          }, [
            m('form.login__form', [
              m('input[type="email"][placeholder="Email Address"]', {
                oninput: m.withAttr('value', Auth.setEmail),
                value: Auth.email
              }),
              m('input[type="password"][placeholder="Password"]', {
                oninput: m.withAttr('value', Auth.setPassword),
                value: Auth.password
              }),
              m('.d-block.text-left.py-2', [
                m('a[href="/forgot-password"]', 'Forgot Password?')
              ]),
              m('button[type="submit"]', {
                class: Auth.error ? 'login__error' : '',
                onclick: Auth.login
              }, 'Secure Login'),
              Auth.error ? m('.login__error.text', 'Login Failed, Try again.') : null,
            ])
          ])
        ])
      ])
    ];
  },
};
