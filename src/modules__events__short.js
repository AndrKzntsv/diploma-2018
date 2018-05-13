import io from 'socket.io-client';
import store from '@/store/index';

export const socket = process.env.NODE_ENV === 'production' ? io() : io(IP);

export default () => {
  let lostConnectionNoty;

  socket.on('connect', () => { ... });
  socket.on('reconnect', () => { ... });
  socket.on('disconnect', () => { ... });
  socket.on('reachview upgrade version', msg => { ... });

  store.dispatch('device/activate');
  store.dispatch('settings/activate');
  store.dispatch('status/activate');
  store.dispatch('streams/activate');
};
