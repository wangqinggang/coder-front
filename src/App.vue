<template>
  <a-layout id="components-layout-demo-fixed-sider">
    <a-layout-sider :style="{ overflow: 'auto', height: '100vh', position: 'fixed', left: 0 }"
    v-model="collapsed" :trigger="null" collapsible>
      <router-link to="/">
        <div class="logo" />
      </router-link>
      <a-menu theme="dark" mode="inline" :default-selected-keys="['4']">
        <router-link to="/about">
        <a-menu-item key="1">
            <a-icon type="info-circle" />
            <span class="nav-text">About</span>
        </a-menu-item>
        </router-link>
        <router-link to="/info">
        <a-menu-item key="2">
            <a-icon type="video-camera" />
            <span class="nav-text">Project Info</span>
        </a-menu-item>
        </router-link>
        <router-link to="/add">
        <a-menu-item key="3">
            <a-icon type="user" />
            <span class="nav-text">Add Entity</span>
        </a-menu-item>
        </router-link>
         <router-link to="/list">
        <a-menu-item key="4">
            <a-icon type="user" />
            <span class="nav-text">Entity List</span>
        </a-menu-item>
        </router-link>
        <router-link to="/download">
        <a-menu-item key="5">
            <a-icon type="user" />
            <span class="nav-text">Download</span>
        </a-menu-item>
        </router-link>
        <router-link to="/support">
        <a-menu-item key="6">
            <a-icon type="user" />
            <span class="nav-text">Support Me</span>
        </a-menu-item>
        </router-link>
      </a-menu>
    </a-layout-sider>
    <a-layout :style="{ marginLeft: '200px' }">
      <a-layout-header style="background: #fff; padding: 0">
        <a-icon
          class="trigger"
          :type="collapsed ? 'menu-unfold' : 'menu-fold'"
          @click="() => (collapsed = !collapsed)"
        />
      </a-layout-header>

      <a-layout-content :style="{ margin: '24px 16px 0', overflow: 'initial' }">
        <div :style="{ padding: '30px', background: '#fff', textAlign: 'center' ,height: '600px'}">
           <router-view></router-view>
        </div>
      </a-layout-content>
      <a-layout-footer :style="{ textAlign: 'center'}">
        Ant Design ©2018 Created by Ant UED
      </a-layout-footer>
    </a-layout>
  </a-layout>
</template>
<script>
export default {
  data() {
    return {
      collapsed: false,
    };
  },
}
</script>
<style>
#components-layout-demo-fixed-sider .logo {
  height: 32px;
  background: rgba(255, 255, 255, 0.2);
  margin: 16px;
}
</style>
