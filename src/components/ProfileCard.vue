<template>
  <div
    class="profile-card"
    :class="extraClass"
    @click="selected = !selected">
    <img class="profile-card__image"
      v-lazy="profile.avatar"/>

    <div class="profile-card__main">
      <div class="profile-card__details">
        <div class="profile-card__row">
          <h1 class="profile-card__name" v-html="highlightText(profile.name)"/>
          <p class="profile-card__email" v-html="highlightText(profile.email)"/>
        </div>

        <h2 class="profile-card__title" v-html="highlightText(profile.title)"/>
        <p class="profile-card__body"
          v-html="highlightText(`${profile.address}, ${profile.city}`)"/>
      </div>

      <p class="profile-card__button"
        v-text="selected ? 'SKIP SELECTION' : 'MARK AS SUITABLE'"/>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ProfileCard',
  props: {
    profile: {
      type: Object,
      required: true,
    },
    highlight: {
      type: String,
      default: '',
    },
  },

  data() {
    return {
      selected: false,
    };
  },

  computed: {
    extraClass() {
      return {
        'profile-card--selected': this.selected,
      };
    },
  },

  methods: {
    highlightText(text) {
      return text.replace(new RegExp(this.highlight, 'gi'), '<mark>$&</mark>');
    },
  },
};
</script>

<style lang="scss" scoped>
.profile-card {
  display: flex;
  width: 100%;
  height: 136px;
  background: #FAFAFA;
  box-shadow: 0px 0px 2px rgba(0, 0, 0, 0.12), 0px 2px 2px rgba(0, 0, 0, 0.24);
  border-radius: 3px;
  box-sizing: border-box;
  overflow: hidden;

  @media only screen and (max-width: 768px) {
    height: auto;
  }

  &:hover {
    cursor: pointer;
    box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.12), 0px 4px 4px rgba(0, 0, 0, 0.24);
  }

  &--selected {
    border: 1px solid #4765FF;

    .profile-card__button {
      border-top: 1px solid transparent;
    }
  }

  &__main {
    width: 100%;
    text-align: left;
  }

  &__row {
    width: 100%;
    display: flex;
    flex-flow: row;
    justify-content: space-between;

    @media only screen and (max-width: 768px) {
      flex-flow: column;
      flex-direction: column-reverse;
    }
  }

  &__details {
    padding: 10px 8px 2px 28px;
  }

  &__image {
    width: 134px;
    height: 136px;
    flex-shrink: 0;
    background: #bcbcbc;
    object-fit: contain;
    object-position: bottom;

    @media only screen and (max-width: 768px) {
      height: auto;
    }
  }

  &__name {
    font-family: Roboto;
    font-style: normal;
    font-weight: normal;
    font-size: 24px;
    line-height: 32px;
    color: rgba(0, 0, 0, 0.87);

    @media only screen and (max-width: 768px) {
      font-size: 14px;
      line-height: 16px;
      margin-top: 16px;
    }
  }

  &__title {
    font-family: Roboto;
    font-style: normal;
    font-weight: bold;
    font-size: 14px;
    line-height: 20px;
    color: rgba(0, 0, 0, 0.543846);
  }

  &__body {
    font-family: Roboto;
    font-style: normal;
    font-weight: normal;
    font-size: 14px;
    line-height: 24px;
    color: rgba(0, 0, 0, 0.54);
  }

  &__button {
    font-family: Roboto;
    font-style: normal;
    font-weight: 500;
    font-size: 14px;
    line-height: 16px;
    color: #009688;
    padding: 15px 8px 15px 32px;
    border-top: 1px solid rgba(0, 0, 0, 0.12);
  }
}
</style>
