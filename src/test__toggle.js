import Toggle from '@/components/common/Toggle';
import { expect } from 'chai';
import i18n from '@/modules/localizationModule';
import { mount } from 'avoriaz';

describe('Toggle.vue', () => {
  let wrapper;

  describe('Render behavior', () => {
    beforeEach(() => {
      wrapper = mount(Toggle, {
        propsData: {
          title: 'default title',
          value: true,
          color: 'primary'
        },
        i18n
      });
    });

    it('Should render correct title', (done) => {
      const readLabelText = () => wrapper
        .first('.toggle__label').text().trim();

      expect(readLabelText()).to.equal('default title');
      wrapper.setProps({ title: 'new title' });
      expect(readLabelText()).to.equal('new title');

      done();
    });

    it('Should render correct color', (done) => {
      const checkClass = (color) =>
        wrapper.first('.toggle__handle').hasClass(`toggle__handle--${color}`);

      expect(checkClass('primary')).to.be.true;
      wrapper.setProps({ color: 'danger' });
      expect(checkClass('danger')).to.be.true;

      done();
    });
  });

  describe('Click behavior', () => {
    const checkClass = () => wrapper.hasClass('toggle--checked');
    const findSwitchElem = () => wrapper.first('.toggle__switch');

    beforeEach(() => {
      wrapper = mount({
        data() {
          return {
            model: true,
            disabled: false
          };
        },

        components: { Toggle },
        template: '<toggle v-model="model" :disabled="disabled"/>'
      }, {
        i18n
      });
    });

    it('Should toggle active class on click', (done) => {
      expect(checkClass()).to.be.true;
      findSwitchElem().trigger('click');

      wrapper.vm.$nextTick(() => {
        expect(checkClass()).to.be.false;
        done();
      });
    });

    it('Should not toggle active class on click when disabled', (done) => {
      expect(checkClass()).to.be.true;
      wrapper.setData({ disabled: true });
      findSwitchElem().trigger('click');

      wrapper.vm.$nextTick(() => {
        expect(checkClass()).to.be.true;
        done();
      });
    });
  });
});