<template>
  <a-layout id="components-layout-demo-custom-trigger">
    <a-layout-sider v-model:collapsed="collapsed" :trigger="null" collapsible>
       <div class="logo" />
      <a-menu theme="dark" mode="inline" v-model:selectedKeys="selectedKeys">
        <router-link to="/about">
        <a-menu-item key="1">
          <QuestionCircleOutlined />
            
            <span >About</span> 
        </a-menu-item>
        </router-link>
        <router-link to="/info">
        <a-menu-item key="2">
            <InfoCircleOutlined />
            <span >Project Info</span>
        </a-menu-item>
        </router-link>
        <router-link :to="'/add'">
        <a-menu-item key="3">
            <PlusSquareOutlined />
            <span >Add Entity</span>
        </a-menu-item>
        </router-link>
         <router-link to="/list">
        <a-menu-item key="4">
            <OrderedListOutlined />
            <span >Entity List</span>
        </a-menu-item>
        </router-link>
        <router-link to="/download">
        <a-menu-item key="5">
            <DownloadOutlined />
            <span >Download</span>
        </a-menu-item>
        </router-link>
        <router-link to="/support">
        <a-menu-item key="6">
            <WechatOutlined />
            <span >Support Me</span>
        </a-menu-item>
        </router-link>
      </a-menu>
    </a-layout-sider>
    <a-layout>
      <a-layout-header style="background: #fff; padding: 0">
        <a-row :gutter="[24,4]">
          <a-col :span="3">
        <menu-unfold-outlined
          v-if="collapsed"
          class="trigger"
          @click="() => (collapsed = !collapsed)"
        />
        <menu-fold-outlined v-else class="trigger" @click="() => (collapsed = !collapsed)" />
          </a-col>
          <a-col :span="6"/>
          <a-col :span="6"><h1>Coder -- Your Coding Assistant!</h1></a-col>
          <a-col :span="6"/>
          <a-col :span="3"><user-outlined /></a-col>
        </a-row>
        
      </a-layout-header>

       <a-layout-content
        :style="{ margin: '24px 16px', padding: '24px', background: '#fff', minHeight: '280px' }"
      >
        <div :style="{ padding: '30px', background: '#fff', textAlign: 'center' }">
           <router-view></router-view>
        </div>
      </a-layout-content>
      <a-layout-footer :style="{ textAlign: 'center'}">
        www.ideaworks.club ©2021 Created by William
      </a-layout-footer>
    </a-layout> 
  </a-layout>
</template>
<script>
import { defineComponent,ref } from 'vue';
import {
  WechatOutlined,
  MenuUnfoldOutlined,
  MenuFoldOutlined,
  UserOutlined,
  InfoCircleOutlined,
  QuestionCircleOutlined,
  PlusSquareOutlined,
  DownloadOutlined,
  OrderedListOutlined
} from '@ant-design/icons-vue';

export default defineComponent({
  components: {
  WechatOutlined,
  MenuUnfoldOutlined,
  MenuFoldOutlined,
  UserOutlined,
  InfoCircleOutlined,
  QuestionCircleOutlined,
  PlusSquareOutlined,
  DownloadOutlined,
  OrderedListOutlined
  },
  setup() {
    return {
      selectedKeys: ref(['1']),
      collapsed: ref(false),
    };
  }
});
  
</script>
<style>
#components-layout-demo-custom-trigger{
  min-height: 100vh
}
#components-layout-demo-custom-trigger .trigger {
  font-size: 18px;
  line-height: 64px;
  padding: 0 24px;
  cursor: pointer;
  transition: color 0.3s;
}

#components-layout-demo-custom-trigger .trigger:hover {
  color: #1890ff;
}

#components-layout-demo-custom-trigger .logo {
  height: 32px;
  background: rgba(255, 255, 255, 0.3);
  margin: 16px;
}

.site-layout .site-layout-background {
  background: #fff;
}
</style>
