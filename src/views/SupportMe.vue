<template>
  <h1>
      SupportMe
  </h1>
  <div class="next-col" style="padding-left: 10px; padding-right: 10px;">
    <div style="margin-bottom: 20px; position: relative; float: left; width: 100%; min-width: 284px; padding: 0px; overflow: hidden; box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 2px 0px, rgba(0, 0, 0, 0.1) 0px 2px 2px 0px; background: rgb(255, 255, 255);">
      <div style="text-align: center; padding: 20px 0px; border-bottom: 1px solid rgb(222, 222, 222);">
        <div style="width: 150px; height: 150px; overflow: hidden; margin: 0px auto;">
          <img src="https://yungouos.oss-cn-shanghai.aliyuncs.com/YunGouOS/merchant/images/native.png" alt="头像" style="width: 100%;"></div>
          <p style="font-size: 20px; margin: 10px;">扫码支付</p>
          <p style="font-size: 15px; color: rgb(153, 153, 153);">打开"微信扫一扫，扫描二维码完成支付</p>
          </div><div style="margin: 15px 0px; text-align: center;"> 赞助金额：<span class="next-input next-input-single next-input-large">
            <!-- <input placeholder="输入赞助金额" type="text" height="100%" value="5"> -->
            <a-input placeholder="输入赞助金额" 
            :min="2" prefix="￥" suffix="RMB"
            :formatter="value => `￥ ${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',')"
            :parser="value => value.replace(/\￥\s?|(,*)/g, '')"
            style="width: 200px"
            v-model:value="price"/>
            <!-- <a-input-number 
              placeholder="输入赞助金额"
              v-model:value="price"
              :min="2"
              :formatter="value => `￥ ${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',')"
              :parser="value => value.replace(/\￥\s?|(,*)/g, '')"
            /> -->
          </span>
          &nbsp;
          <a-button type="primary" @click="showModal">支付赞助</a-button>


          <a-modal v-model:visible="visible"  width="350px" title="使用微信扫码支付" @ok="handleOk" cancelText=取消 okText="支付完成">
            <a-image
              :preview=false
              :width="300"
              :src="payImg"
            />
          </a-modal>
  </div></div></div>
</template>

<script>
import { defineComponent, ref } from 'vue';
import axios from 'axios'
export default defineComponent({
  setup() {
    const price = ref(10);
    
    const visible = ref(false);
    const payImg = ref("https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png");

    const showModal = () => {    
            getImg()
    };
    const getImg = () => {
      axios({        
              method: 'get',        
              url: 'http://localhost:8888/api/WechatPay/'+ price.value
              // data: {price: price.value},
            }).then((result) => {      
              console.log(price.value);   
              console.log(result.data ); 
              // payImg= ref(result.data);    
               payImg.value = result.data
               visible.value = true; 
            })
    };

    const handleOk = e => {
      console.log(e);
      visible.value = false;
    };
    return {
      price,
      visible,
      showModal,
      handleOk,
      payImg,
    };
  },
  methods: {
    supportMe(){

    }
  }
});
</script>

<style>

</style>