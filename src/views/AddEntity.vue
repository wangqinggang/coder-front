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
          <a-row>
            <p> </p>
          </a-row>
          <a-row :gutter="24">
            <a-col class="" :span="12">
                <a-form-item  label="PackageInfo"  >
                  <a-input placeholder="com.ideaworks.club" v-model:value="entity.packageName"/>
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
                    <a-form-item label="Data Type" > 
                    
                      <a-form-item label="Data Type"  >
                      <!-- <select default-value="String"
                      :v-model="item.dataType"  
                      :key="index"
                      class="option"
                      > -->
                      <select
                        v-model="item.dataType"
                        class="option"
                      >
                        <option value="String" >
                          String
                        </option>
                        <option value="Integer" >
                          Integer
                        </option>
                        <option value="Long" >
                          Long
                        </option>
                        <option value="Float" >
                          Float
                        </option>
                         <option value="Double" >
                          Double
                        </option>
                        <option value="Date" >
                          Date
                        </option>
                        <option value="Byte" >
                          Byte
                        </option>
                      </select>
                    </a-form-item>
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
    <a-button type="primary" @click="onSubmitAll()">
        Submit
    </a-button>
      <a-row type="flex" style="overflow: hidden;display: block;width:100%">
        <br>
        <br>
        <h1>Save Your Design</h1>
        <hr />
        <br>
      </a-row>
     <a-row>
      <a-button @click="exportDesign()">Export your design</a-button>
    </a-row>
    <a-row>
      <br>
    </a-row>
     <a-row>
      <a-input-search
        v-model:value="eastsoftTable"
        placeholder="Input EastSoft Table Name"
        enter-button="Get EastSoft Table Design"
        size="large"
        @search="getDesign()"
      />
    </a-row>
        <a-row>
      <br>
    </a-row>
    <a-row>
    <a-textarea v-model:value="entityJson" placeholder="Paste your design here, then click 'Import...' Button below." :rows="5" />
    </a-row>
    <a-row>
      <br>
    </a-row>
    <a-row>
      <a-button @click="importDesign()">Import your design</a-button>
    </a-row>

     <a-row type="flex" style="overflow: hidden;display: block;width:100%">
        <br>
        <br>
        <h1>Generated Code</h1>
        <hr />
        <br>
      </a-row>
    <a-tabs v-model:activeKey="activeKey">
    <a-tab-pane key="1" tab="Domain" >
      <a-row>
            <a-button @click="onSubmit('domain')">Regenerate Domain</a-button>
            &nbsp;&nbsp;&nbsp;&nbsp;
             <a-button @click="download('domain')">Download Domain</a-button>  
      </a-row>
      <hr>
      <a-textarea v-model:value="domain" placeholder="generated code" :rows="10" />
       
    </a-tab-pane>
    <a-tab-pane key="2" tab="DomainDTO">
      <a-row>
            <a-button @click="onSubmit('domainDTO')">Regenerate DomainDTO</a-button>
            &nbsp;&nbsp;&nbsp;&nbsp;
             <a-button @click="download('domainDTO')">Download DomainDTO</a-button>  
      </a-row>
      <hr>
      <a-textarea v-model:value="domainDTO" placeholder="generated code" :rows="10" />
      </a-tab-pane>
    <a-tab-pane key="3" tab="Service">
      <a-row>
            <a-button @click="onSubmit('service')">Regenerate service</a-button>
            &nbsp;&nbsp;&nbsp;&nbsp;
             <a-button @click="download('service')">Download service</a-button>  
      </a-row>
      <hr>
      <a-textarea v-model:value="service" placeholder="generated code" :rows="10" />
      <!-- <pre>
        {{this.service}}
      </pre> -->
       </a-tab-pane>
    <a-tab-pane key="4" tab="ServiceImpl" >
      <a-row>
          <a-button @click="onSubmit('serviceImpl')">Regenerate serviceImpl</a-button>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <a-button @click="download('serviceImpl')">Download serviceImpl</a-button>  
      </a-row>
      <hr>
      <a-textarea v-model:value="serviceImpl" placeholder="generated code" :rows="10" />
      </a-tab-pane>
    <a-tab-pane key="5" tab="Repository"  >
      <a-row>
          <a-button @click="onSubmit('repository')">Regenerate repository</a-button>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <a-button @click="download('repository')">Download repository</a-button>  
      </a-row>
      <hr>
      <a-textarea v-model:value="repository" placeholder="generated code" :rows="10" />
       </a-tab-pane>
    <a-tab-pane key="6" tab="Controller">
      <a-row>
          <a-button @click="onSubmit('controller')">Regenerate controller</a-button>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <a-button @click="download('controller')">Download controller</a-button>  
      </a-row>
      <hr>
      <a-textarea v-model:value="controller" placeholder="generated code" :rows="10" />
      </a-tab-pane>
    <template #tabBarExtraContent>
      <a-button @click="onSubmitAll()">Generate ALL</a-button>
      <br>
      <a-button @click="onSubmitAll()">Download ALL</a-button>
    </template>
  </a-tabs>
  </div>
  
</template>

<script>
import axios from 'axios'
import { defineComponent, ref } from 'vue';
export default {
 data() {
    return {
      formLayout: 'inline', 
      // baseUrl:'http://localhost:8888/api/code/',// 接口请求的baseURL
      // domainUrl:'http://localhost:8888/api/code/domain',// domain 实体
      // domainDTOUrl:'http://localhost:8888/api/code/dto', // domain 数据传输对象
      // serviceUrl:'http://localhost:8888/api/code/service', // Domain 领域service
      // serviceImplUrl:'http://localhost:8888/api/code/service-impl', // domain 领域service实现
      // repositoryUrl:'http://localhost:8888/api/code/repository',// domain 的 repository 持久化对象
      // controllerUrl:'http://localhost:8888/api/code/controller',// domain 的 API 接口

      // prod
      baseUrl:'http://localhost:8888/api/code/',// 接口请求的baseURL
      domainUrl:'http://localhost:8888/api/code/domain',// domain 实体
      domainDTOUrl:'http://localhost:8888/api/code/dto', // domain 数据传输对象
      serviceUrl:'http://localhost:8888/api/code/service', // Domain 领域service
      serviceImplUrl:'http://localhost:8888/api/code/service-impl', // domain 领域service实现
      repositoryUrl:'http://localhost:8888/api/code/repository',// domain 的 repository 持久化对象
      controllerUrl:'http://localhost:8888/api/code/controller',// domain 的 API 接口

      eastsoftUrl: 'http://localhost:8888/api/table/entityDTO', // Eastsoft 表结构设计
      eastsoftTable:'S_USER', // 需要查找的表名

      domain:'',// domain 实体
      domainDTO:'', // domain 数据传输对象
      service:'', // Domain 领域service
      serviceImpl:'', // domain 领域service实现
      repository:'',// domain 的 repository 持久化对象
      controller:'',// domain 的 API 接口
      entityJson: '', // 用户导出设计

      entity: {
        packageName: "",
        entityName: "User",
        tableName: "USER",
        comment: "用户表",
        apiTag: "用户API",
        entityFields:[
          {
            dataType: "String",
            fieldName: "id",
            tableFieldName: "ID",
            length:36,
            fieldComment:"主键",
            isKey: true,
            isRequired: true,
          },
          {
            dataType: "String",
            fieldName: "name",
            tableFieldName: "NAME",
            length:30,
            fieldComment:"用户名",
            isKey: false,
            isRequired: false,
          },
          {
            dataType: "Integer",
            fieldName: "age",
            tableFieldName: "AGE",
            length:10,
            fieldComment:"年龄",
            isKey: false,
            isRequired: false,
          },
          {
            dataType: "Date",
            fieldName: "brithday",
            tableFieldName: "BIRTHDAY",
            length:0,
            fieldComment:"出生日期",
            isKey: false,
            isRequired: false,
          },
        ]
      },
      activeKey: ref('1'),
    };
  },
  computed: {

  },
  methods: {
    getDesign(){
       axios({
          method: 'get',
          url: this.eastsoftUrl,
          params: {'tableName':this.eastsoftTable},
        }).then((result) => {
          var json = JSON.stringify(result.data,null,4)
          // console.log(json)
          this.entityJson = json
        }).catch((error) => {
          console.log(error);
        });

    },
    changeText(){
      this.entity = JSON.parse(this.entityJson)
    },
    exportDesign(){
      this.entityJson = JSON.stringify(this.entity,null,4)
    },
    importDesign(){
      this.entity = JSON.parse(this.entityJson)
    },
    getFile(methodUrl){
      console.log(methodUrl)
        axios({
          method: 'post',
          url: methodUrl,
          data: this.entity,
          responseType: 'blob'
        }).then((result) => {
          let filename=result.headers.filename;
          let data=result.data;
          if(!data) {
            return;
          }
          let url=window.URL.createObjectURL(new Blob([data]));
          let a=document.createElement('a');
          a.style.display='none';
          a.href=url;
          a.setAttribute('download', filename);
          document.body.appendChild(a);
          a.click(); //执行下载
          window.URL.revokeObjectURL(a.href);
          document.body.removeChild(a);
          this.download(data);
        }).catch((error) => {
          console.log(error);
        });
      },
    download(methodType){
      if (methodType==='domain') {
        this.getFile(this.domainUrl+"File")
      }else if (methodType==='domainDTO') {
        this.getFile(this.domainDTOUrl+"File")
      }else if (methodType==='service') {
       this.getFile(this.serviceUrl+"File")
      }else if (methodType==='serviceImpl') {
        this.getFile(this.serviceImplUrl+"File")
      }else if (methodType==='repository') {
        this.getFile(this.repositoryUrl+"File")
      }else if (methodType==='controller') {
        this.getFile(this.controllerUrl+"File")   
      }
      
    },
    onSubmitAll(){
      this.onSubmit('domain')
      this.onSubmit('domainDTO')
      this.onSubmit('service')
      this.onSubmit('repository')
      this.onSubmit('serviceImpl')
      this.onSubmit('controller')
    },
    async getResult(methodUrl){
       let res;
         await axios({        
          method: 'post',        
          url: methodUrl,
          data: this.entity
        }).then((result) => {         
          res = result.data
        })    
        return res
    },
    onSubmit(methodType) {
      if (methodType==='domain') {
        this.getResult(this.domainUrl).then(res => {
          this.domain = res
        })
      }else if (methodType==='domainDTO') {
        this.getResult(this.domainDTOUrl).then(res => {
          this.domainDTO = res
        })
      }else if (methodType==='service') {
        this.getResult(this.serviceUrl).then(res => {
          this.service = res
        })
      }else if (methodType==='serviceImpl') {
        this.getResult(this.serviceImplUrl).then(res => {
          this.serviceImpl = res
        })
      }else if (methodType==='repository') {
        this.getResult(this.repositoryUrl).then(res => {
          this.repository = res
        })
      }else if (methodType==='controller') {
        this.getResult(this.controllerUrl).then(res => {
          this.controller = res
        })
      }
    
    },
    addNewFeild(){
      this.entity.entityFields.push({
        dataType: "String",
        fieldName: "",
        tableFieldName: "",
        length:0,
        fieldComment:"",
        isKey: false,
        isRequired: false,
      })
    },
    show(i){
      if(i===0){
        return false
      }else{
        return true
      }
    },
    deleteItem(i){
      console.log(i)
      let index = this.entity.entityFields.indexOf(i);
      this.entity.entityFields.splice(index,1)
    },
    
  },
}
</script>

<style>
.add {
  text-align: left;
  padding: 50px;
}
.option{
  padding: 4px 11px;
  box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-variant: tabular-nums;
    list-style: none;
    font-feature-settings: 'tnum';
    position: relative;
    display: inline-block;
    padding: 4px 11px;
    color: rgba(0, 0, 0, 0.85);
    font-size: 14px;
    line-height: 1.5715;
    background-color: #fff;
    background-image: none;
    border: 1px solid #d9d9d9;
    border-radius: 2px;
    transition: all 0.3s;
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