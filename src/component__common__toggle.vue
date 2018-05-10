<template>
  <div
    class="toggle"
    :class="{
      'toggle--checked': value,
      'toggle--disabled': disabled
    }"
  >
    <span
      class="toggle__label"
      @click="toggleClick(toggleClickValue)"
      :class="{
        'toggle__label--default': !title,
        'toggle__label--disabled': disabled
      }"
    >
      {{ title ? title : $t('components.toggle["Off"]') }}
    </span>

    <div
      class="toggle__switch"
      @click="toggleClick()"
    >
      <i
        class="toggle__handle"
        :class="[
          toggleColorClass,
          value ? 'toggle__handle--on' : 'toggle__handle--off',
          { 'toggle__handle--disabled': disabled }
        ]"
      ></i>
    </div>
    <span
      class="toggle__label"
      :class="[
        'toggle__label--default',
        { 'toggle__label--disabled': disabled }
      ]"
      v-if="!title"
      @click="toggleClick('on')"
    >
      {{ $t('components.toggle["On"]') }}
    </span>
  </div>
</template>

<script>
  export default {
    props: {
      title: {
        type: String,
        default: null
      },
      value: {
        type: Boolean,
        required: true
      },
      color: {
        type: String,
        default: 'success',
        validator(color: string) {
          return ['primary', 'danger', 'success', 'warning', 'info'].includes(color);
        }
      },
      disabled: {
        type: Boolean,
        default: false
      }
    },
    computed: {
      toggleClickValue() {
        return this.title ? null : 'off';
      },
      toggleColorClass() {
        return this.value ? `toggle__handle--${this.color}` : '';
      }
    },
    methods: {
      toggleClick(value: boolean) {
        if (!this.disabled) {
          switch (value) {
            case 'on':
              if (!this.value) {
                this.$emit('input', true);
              } else {
                return;
              }

              break;
            case 'off':
              if (this.value) {
                this.$emit('input', false);
              } else {
                return;
              }

              break;
            default:
              this.$emit('input', !this.value);
          }
        }
      }
    }
  };
</script>

<style scoped lang='scss'>
  @import '~@/assets/styles/_colors';

  $colorsMap: (
    primary: $color-primary,
    danger: $color-danger,
    success: $color-success,
    warning: $color-warning,
    info: $color-info
  );

  .toggle {
    display: inline-block;

    &__switch {
      display: inline-block;
    }

    &__handle {
      display: inline-block;

      margin: -5px 2px -3px;
      padding: 1px 15px 1px 1px;

      cursor: pointer;
      transition: border 0.4s,
                  box-shadow ease-in 0.4s,
                  background-color 1.2s, padding ease-out 0.2s;

      border-radius: 20px;
      box-shadow: inset 0 0 2px rgba(0, 0, 0, 0.5);

      &--disabled {
        cursor: not-allowed;
        opacity: 0.5;
      }

      &--on {
        padding-right: 1px;
        padding-left: 15px;
      }

      @each $key, $value in $colorsMap {
        &--#{$key} {
          border-color: $value;
          box-shadow: $value 0 0 0 16px inset;
        }
      }

      &:before {
        display: block;

        width: 14px;
        height: 14px;

        content: '';

        border-radius: 14px;
        background: white;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.4);
      }
    }

    &__label {
      cursor: pointer;

      &--disabled {
        cursor: not-allowed;

        &.toggle__label--default {
          opacity: 0.5;
        }
      }
    }
  }
</style>
