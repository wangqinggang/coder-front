<template>
  <div class="add">
    <h1>Add Entity</h1>
    <hr>
    <br>
    <a-form :model="entity" :layout="formLayout" >
      <div class="gutter-example">
          <a-row :gutter="24">
            <a-col class="" :span="6">
                <a-form-item  label="Entity Name"  > 
                  <a-input placeholder="Entity name" v-model:value="entity.entityName"/>
                </a-form-item>
            </a-col>
            <a-col class="" :span="6">
                <a-form-item label="Table Name" >
                  <a-input placeholder="Table name" v-model:value="entity.tableName"/>
                </a-form-item>
            </a-col>
            <a-col class="" :span="6">
                <a-form-item  label="Rest Tag Value"  >
                    <a-input placeholder="@Api annotation tag value" v-model:value="entity.apiTag"/>
                </a-form-item>
            </a-col>
            <a-col class="" :span="6">
                <a-form-item  label="Comment"  >
                  <a-input placeholder="Entity Info" v-model:value="entity.comment"/>
                </a-form-item>
            </a-col>
          </a-row>
              
        </div>
        
        <a-row type="flex" style="overflow: hidden;display: block;width:100%">
          <br>
          <br>
         <h1>Add Feild</h1>
         <hr />
         <br>
        </a-row>
        
      <div class="gutter-example"  v-for="(item, index) in entity.entityFields" :key="index">
        <a-row :gutter="24" >
            <a-col class="" :span="6">
                    <a-form-item label="Data Type"  v-model:value="item.dataType">
                      <a-select default-value="String">
                        <a-select-option value="String">
                          String
                        </a-select-option>
                        <a-select-option value="Integer">
                          Integer
                        </a-select-option>
                        <a-select-option value="Long">
                          Long
                        </a-select-option>
                      </a-select>
                    </a-form-item>
                    
                    <span v-show="show(index)" @click="deleteItem(item)" style="display:block">
                      <svg t="1625662119938" class="icon" 
                      viewBox="0 0 1024 1024" version="1.1" 
                      xmlns="http://www.w3.org/2000/svg" p-id="1191" 
                      width="20" height="20">
                      <path d="M512 1024C229.376 1024 0 794.624 0 512S229.376 0 512 0s512 229.376 512 512-229.376 512-512 512z m0-975.36C257.024 48.64 48.64 257.024 48.64 512c0 254.976 207.872 463.36 463.36 463.36S975.36 767.488 975.36 512 766.976 48.64 512 48.64z" fill="#8A8A8A" p-id="1192"></path><path d="M548.864 512l195.072-195.072c9.728-9.728 9.728-25.6 0-36.864l-1.536-1.536c-9.728-9.728-25.6-9.728-35.328 0L512 475.136 316.928 280.064c-9.728-9.728-25.6-9.728-35.328 0l-1.536 1.536c-9.728 9.728-9.728 25.6 0 36.864L475.136 512 280.064 707.072c-9.728 9.728-9.728 25.6 0 36.864l1.536 1.536c9.728 9.728 25.6 9.728 35.328 0L512 548.864l195.072 195.072c9.728 9.728 25.6 9.728 35.328 0l1.536-1.536c9.728-9.728 9.728-25.6 0-36.864L548.864 512z" fill="#8A8A8A" p-id="1193"></path></svg>
                    <br>
                    </span>
                    <span  @click="addNewFeild()" style="display:block">
                     <svg t="1625664833994" class="icon" 
                     viewBox="0 0 1024 1024" version="1.1" 
                     xmlns="http://www.w3.org/2000/svg" p-id="2694" 
                     width="20" height="20"><path d="M512 951a439.11 439.11 0 0 1-170.89-843.49 439.11 439.11 0 0 1 341.78 809A436.29 436.29 0 0 1 512 951z m0-830a389.74 389.74 0 1 0 152.19 30.72A388.57 388.57 0 0 0 512 121z" p-id="2695"></path><path d="M198.98 488h626.04v48H198.98z" p-id="2696"></path><path d="M488 198.98h48v626.04h-48z" p-id="2697"></path></svg>
                    </span>
            </a-col>
            <a-col class="" :span="6">
                <a-form-item label="Field Name" >
                  <a-input placeholder="Field name" v-model:value="item.fieldName"/>
                </a-form-item>
                <br>
                <a-form-item  label="String Length"  >
                    <a-input placeholder="String length" v-model:value="item.length"/>
                </a-form-item>
            </a-col>
            <a-col class="" :span="6">
                <a-form-item   label="Table Field"  >
                    <a-input placeholder="table field name" v-model:value="item.tableFieldName"/>
                </a-form-item>
                <br>
                <a-form-item  label="Comment"  >
                  <a-input placeholder="Field comment" v-model:value="item.fieldComment"/>
                </a-form-item>
            </a-col>
            <a-col class="" :span="6">
                <a-form-item >
                  <a-form-item label="isKey">
                    <a-switch v-model:checked="item.isKey"/>
                  </a-form-item>
                  <br>
                  <a-form-item label="isRequired">
                    <a-switch v-model:checked="item.isRequired" />
                  </a-form-item> 
                </a-form-item>
               
            </a-col>

        </a-row>
            <br>
             <hr style= "border:1px dashed #000">
             <br>
      </div> 

            
 
    </a-form>
  
    <br>
    
    <br style="display:block">
    <a-button type="primary" @click="onSubmit">
        Submit
    </a-button>
  </div>
  
</template>

<script>
import axios from 'axios'

export default {
 data() {
    return {
      formLayout: 'inline',
      entity: {
        entityName: "User",
        tableName: "USER",
        comment: "用户表",
        apiTag: "用户API",
        entityFields:[
          {
            dataType: "String",
            fieldName: "name",
            tableFieldName: "NAME",
            length:30,
            fieldComment:"用户名",
            isKey: false,
            isRequired: true,
          },
        ]
      },
    };
  },
  computed: {

  },
  methods: {
    onSubmit() {
      console.log('submit!', this.entity.entityName);
      // axios({        
      //   method: 'post',        
      //   url: 'http://localhost:8888/api/code/domain',
      //   data: this.entity
      // }).then((result) => {         
      //   console.log(result)      
      // })     
    },
    addNewFeild(){
      this.entity.entityFields.push({
        dataType: "String",
        fieldName: "Input your property name",
        tableFieldName: "",
        length:0,
        fieldComment:"",
        isKey: false,
        isRequired: false,
      })
    },
    show(i){
      if(i==0){
        return false
      }else{
        return true
      }
    },
    deleteItem(i){
      console.log(i)
      let index = this.entity.entityFields.indexOf(i);
      this.entity.entityFields.splice(index,1)
    }
  },
}
</script>

<style>
.add {
  text-align: left;
  padding: 50px;
}

/* #card {
  background: #fff;
  border-radius: 2px;
  display: inline-block;
  height: 100%;
  margin: 1rem;
  position: relative;
  width: 100%;
}
#card :hover {
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
} */
</style>