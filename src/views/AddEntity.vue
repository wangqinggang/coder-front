<template>
  <div class="add">
    <h1>Add Entity</h1>
    <hr>
    <br>
    

    <a-form :layout="formLayout" v-model="entity">
      <div class="gutter-example">
          <a-row :gutter="16">
            <a-col class="gutter-row" :span="6">
              <div class="gutter-box">
                <a-form-item  label="Entity Name"  > 
                  <a-input placeholder="Entity name" v-model="entity.entityName"/>
                </a-form-item>
              </div>
            </a-col>
            <a-col class="gutter-row" :span="6">
              <div class="gutter-box">
                <a-form-item label="Table Name" >
                  <a-input placeholder="Table name" v-model="entity.tableName"/>
                </a-form-item>
              </div>
            </a-col>
            <a-col class="gutter-row" :span="6">
              <div class="gutter-box">
                <a-form-item   label="Rest Tag"  >
                    <a-input placeholder="@Api annotation tag" v-model="entity.apiTag"/>
                </a-form-item>
              </div>
            </a-col>
            <a-col class="gutter-row" :span="6">
              <div class="gutter-box">
                <a-form-item  label="Comment"  >
                  <a-input placeholder="Entity Info" v-model="entity.comment"/>
                </a-form-item>
              </div>
            </a-col>
          </a-row>
        </div>
        <br>
        <br>
        <br>

         <h1>Add Feild</h1>
         <hr>
         <br>
      <div class="gutter-example">
          <a-row :gutter="16">
            <a-col class="gutter-row" :span="6">
              <div class="gutter-box">
                <a-form-item label="Feild Name" >
                  <a-input placeholder="Feild name" />
                </a-form-item>
                <a-form-item label="Table Feild Name">
                  <a-input placeholder="Table feild name" />
                </a-form-item>

              </div>
            </a-col>
            <a-col class="gutter-row" :span="6">
              <div class="gutter-box">
                <!-- <a-form-item label="Data Type" > 
                  <a-input placeholder="Data type" />
                </a-form-item> -->
                <a-form-item label="Data Type" > 
                  <!-- <a-select default-value="String" style="width: 200px">
                    <a-select-opt-group>
                      <span><a-icon type="user" />Numbers</span>
                      <a-select-option value="Integer">
                        Integer
                      </a-select-option>
                      <a-select-option value="Long">
                        Long
                      </a-select-option>
                      <a-select-option value="Double">
                        Double
                      </a-select-option>
                    </a-select-opt-group>
                    <a-select-opt-group label="String">
                      <a-select-option value="String">
                        String
                      </a-select-option>
                    </a-select-opt-group>
                  </a-select> -->
                </a-form-item>
                <a-form-item  label="Length"  > 
                  <a-input placeholder="Length" />
                </a-form-item>
              </div>
            </a-col>
            <a-col class="gutter-row" :span="6">
              <div class="gutter-box">
                <a-form-item  label="Comment" >
                  <a-input placeholder="Entity Info" />
                </a-form-item>
              </div>
            </a-col>
            <a-col class="gutter-row" :span="6">
              <div class="gutter-box">
                
              </div>
            </a-col>
          </a-row>
        </div>




    </a-form>
    <!-- <a-form-item :wrapper-col="buttonItemLayout.wrapperCol">
      <a-button type="primary">
        Submit
      </a-button>
    </a-form-item> -->
    <br>
    <a-button type="primary" @click="onSubmit">
        Submit
    </a-button>
  </div>
</template>

<script>
export default {
 data() {
    return {
      formLayout: 'inline',
      entity:{},
    };
  },
  computed: {

  },
  methods: {
    onSubmit() {
      console.log('submit!', this.entity);
    },
  },
}
</script>

<style>
.add {
  text-align: left;
  padding: 50px;
}
</style>