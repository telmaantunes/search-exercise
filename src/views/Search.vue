<template>
  <main class="search-view">
    <div class="search-view__container">
      <div class="search-view__inner-container">
        <ProfileSearch
          class="search-view__bar"
          v-model="filter"
          v-on:keyup="onChange"/>

        <ProfileList
          v-if="profiles.length"
          class="search-view__list"
          :profiles="filteredData"
          :filter="filter"/>
      </div>
    </div>
  </main>
</template>

<script>
import axios from 'axios';
import ProfileList from '@/components/ProfileList.vue';
import ProfileSearch from '@/components/ProfileSearch.vue';

const API_ENDPOINT = 'https://gist.githubusercontent.com/allaud/093aa499998b7843bb10b44ea6ea02dc/raw/c400744999bf4b308f67807729a6635ced0c8644/users.json';

export default {
  name: 'Search',
  components: {
    ProfileSearch,
    ProfileList,
  },

  data() {
    return {
      profiles: [],
      filteredData: [],
      filter: this.$route.params.filter || '',
    };
  },

  methods: {
    onChange() {
      if (this.$route.params.filter !== this.filter) {
        window.history.replaceState({}, '', `/${this.filter}`);
      }
      this.filterData();
      this.page = 1;
    },

    filterData() {
      if (this.filter || this.filter === '') {
        this.filteredData = this.profiles;
      }

      const filter = this.filter.toLowerCase();
      this.filteredData = this.profiles.filter((item) => item.address.toLowerCase().match(filter)
          || item.city.toLowerCase().match(filter)
          || item.email.toLowerCase().match(filter)
          || item.name.toLowerCase().match(filter)
          || item.title.toLowerCase().match(filter));
    },
  },

  created() {
    axios.get(API_ENDPOINT)
      .then(({ data }) => {
        this.profiles = data;
        this.filterData();
      });
  },
};
</script>

<style lang="scss" scoped>
$input-height: 68px;

.search-view {
    height: 100vh;
    padding: 54px 0 65px;

    @media only screen and (max-width: 768px) {
      padding: 0;
    }

    &__container {
      padding: 19px 13px;
      background: #fff;
      width: 50%;
      height: 100%;
      min-width: 564px;
      max-width: 900px;
      margin: 0 auto;

      @media only screen and (max-width: 768px) {
        width: 100%;
        min-width: 100%;
        margin: 0;
      }
    }

    &__inner-container {
      border-right: 1px solid rgba(0, 0, 0, 0.08);
      height: 100%;
    }

    &__bar {
      margin-bottom: 20px;
      padding-right: 12px;
    }

    &__list {
      height: calc(100% - #{$input-height});
      padding-right: 12px;

      @media only screen and (max-width: 768px) {
        height: 100%;
      }
    }
  }
</style>
