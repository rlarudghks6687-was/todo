<script setup>
//onBeforeMounr: 컴포넌트가 마운트되기 전에 수행해야 할 작업을 처리할 때 사용
import { ref, computed, onBeforeMount } from "vue";
const users = ref([]);
const count = computed(() => {
  return users.value.length;
});

const findAllList = async () => {
  // http://localhost:3000/users
  let list = await fetch(`/api/users`)
    .then((res) => res.json())
    .catch((err) => console.log(err));

  users.value = list;
};
const dateFormat = (dateVal) => {
  let newDate = new Date(dateVal);
  let year = newDate.getFullYear();
  let month = ("0" + (newDate.getMonth() + 1)).slice(-2);
  let day = ("0" + newDate.getDate()).slice(-2);
  return `${year}-${month}-${day}`;
};

import { useRouter } from "vue-router";
const router = useRouter(); //vue Router 객체를 반환
//특정 회원을 선택(<tr> 클릭) 시 상세 페이지로 이동
const goToDetail = (userNo) => {
  router.push({ name: "userInfo", params: { no: userNo } });
};
onBeforeMount(() => {
  findAllList();
});
</script>
<template>
  <div class="container">
    <table class="table text-center">
      <caption>
        Total:
        {{
          count
        }}
      </caption>
      <thead>
        <tr>
          <th>No.</th>
          <th>아이디</th>
          <th>이름</th>
          <th>성별</th>
          <th>가입날짜</th>
          <!--yyyy-MM-dd-->
        </tr>
      </thead>
      <tbody>
        <tr v-for="info in users" v-on:click="goToDetail(info.user_no)">
          <td>{{ info.user_no }}</td>
          <td>{{ info.user_id }}</td>
          <td>{{ info.user_name }}</td>
          <td>{{ info.user_gender == "M" ? "남" : "여" }}</td>
          <td>{{ dateFormat(info.join_date) }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<!-- // RouterLink: Vue Router에서 a 태그 대신 사용
// RouterView: 별도의 페이지 리로딩없이 url에 매핑된 페이지를 렌더링 -->