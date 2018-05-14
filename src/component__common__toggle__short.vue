<template>
  ...
</template>

<script>
  export default {
    props: {
      // Текст
      title: {
        type: String,
        default: null
      },
      // Значение
      value: {
        type: Boolean,
        required: true
      },
      // Цвет
      color: {
        type: String,
        default: 'success',
        validator(color) { ... }
      },
      // Доступность для изменения
      disabled: {
        type: Boolean,
        default: false
      }
    },
    computed: { ... },
    methods: { ... }
  };
</script>

<style scoped lang='scss'>
  ...
</style>
