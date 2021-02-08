<template>
  <div class="profile-list"
    v-infinite-scroll="loadMore"
    infinite-scroll-disabled="busy"
    infinite-scroll-distance="10"
    ref="list">
    <ProfileCard
      v-for="(profile, index) in data"
      class="profile-list__item"
      :profile="profile"
      :key="`${index}-profile.email`"
      :highlight="filter"/>
  </div>
</template>

<script>
import ProfileCard from '@/components/ProfileCard.vue';

export default {
  name: 'ProfileList',
  components: {
    ProfileCard,
  },

  props: {
    profiles: {
      type: Array,
      default: () => [],
    },
    filter: {
      type: String,
      default: '',
    },
  },

  data() {
    return {
      busy: false,
      page: 1,
    };
  },

  computed: {
    data() {
      return this.profiles.slice(0, this.page * 10);
    },
  },

  methods: {
    loadMore() {
      if (this.busy) {
        return;
      }
      this.busy = true;

      setTimeout(() => {
        this.page += 1;
        this.busy = false;
      }, 100);
    },
  },

  watch: {
    filter() {
      this.$refs.list.scrollTop = 0;
    },
  },
};
</script>

<style lang="scss" scoped>

.profile-list {
  width: 100%;
  height: 100%;
  background: #fff;
  overflow: hidden;
  overflow: scroll;

  &__item {
    margin: 0 0 20px;

    &:last-child {
      margin: 0 0 10px;
    }
  }
}
</style>
