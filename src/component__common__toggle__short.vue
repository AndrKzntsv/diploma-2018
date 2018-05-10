<template>
  ...
</template>

<script>
  export default {
    props: {
      title: {                   // Текст
        type: String,
        default: null
      },
      value: {                   // Значение
        type: Boolean,
        required: true
      },
      color: {                   // Цвет
        type: String,
        default: 'success',
        validator(color) { ... }
      },
      disabled: {                // Доступность для изменения
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
