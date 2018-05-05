import io from 'socket.io-client';
import noty from 'noty';
import store from '@/store/index';

export const socket = process.env.NODE_ENV === 'production'
  ? io()
  : io(IP);

export default () => {
  let lostConnectionNoty;

  socket.on('connect', () => {
    socket.emit('browser connected');
  });

  socket.on('reconnect', () => {
    if (typeof lostConnectionNoty !== 'undefined') {
      lostConnectionNoty.close();
    }
  });

  socket.on('disconnect', () => {
    lostConnectionNoty = noty({
      width: 200,
      text: 'Lost connection with Reach. Please check your network, then try refreshing the page',
      type: 'error',
      dismissQueue: true,
      closeWith: false,
      timeout: false,
      theme: 'defaultTheme',
      layout: 'topRight',
      callback: {
        onClose: () => {
          noty({
            width: 200,
            text: 'Reach reconnected!',
            type: 'success',
            dismissQueue: true,
            closeWith: ['click'],
            timeout: 4000,
            theme: 'defaultTheme',
            layout: 'topRight'
          });
        }
      }
    });
  });

  socket.on('reachview upgrade version', msg => {
    if (msg['upgrade available']) {
      const availableVersion = msg['available version'].split('-')[0];

      noty({
        width: 200,
        text: `ReachView ${availableVersion} is available!`,
        type: 'success',
        dismissQueue: true,
        closeWith: ['click'],
        timeout: 4000,
        theme: 'defaultTheme',
        layout: 'topRight'
      })
    }
  });

  store.dispatch('device/activate');
  store.dispatch('settings/activate');
  store.dispatch('status/activate');
  store.dispatch('streams/activate');
};
