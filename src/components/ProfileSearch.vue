<template>
  <div class="profile-search">
    <SearchSVG class="profile-search__icon"/>
    <input
      class="profile-search__input"
      v-bind:value="value"
      v-bind="$attrs"
      v-on="inputListeners">
  </div>
</template>

<script>
import SearchSVG from '@assets/svgs/search.svg';

export default {
  name: 'ProfileSearch',
  components: {
    SearchSVG,
  },

  props: {
    value: {
      type: String,
    },
  },

  computed: {
    inputListeners() {
      const listeners = { ...this.$listeners };
      delete listeners.change; // Change should not be bound externally

      return Object.assign(listeners, {
        input: this.onInput,
      });
    },
  },

  methods: {
    onInput(event) {
      const { value } = event.target;
      this.$emit('input', value);
    },
  },
};
</script>

<style lang="scss" scoped>
.profile-search {
  width: 100%;
  height: 48px;
  position: relative;

  &__input {
    width: 100%;
    height: 100%;
    background: transparent;
    border: none;
    background: #FAFAFA;
    box-shadow: 0px 0px 2px rgba(0, 0, 0, 0.12), 0px 2px 2px rgba(0, 0, 0, 0.24);
    border-radius: 2px;

    font-family: Roboto;
    font-style: normal;
    font-weight: normal;
    font-size: 24px;
    line-height: 28px;
    color: rgba(0, 0, 0, 0.75);
    padding-left: 50px;

    &:focus,
    &:active {
      border: none;
      outline: none;
    }
  }

  &__icon {
    position: absolute;
    left: 20px;
    top: 16px;
    width: 18px;
    height: 18px;
  }
}
</style>
