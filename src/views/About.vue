<template>
  <div class="about">
    <h1>About</h1>
    <br>
    <p>
      This project is front-end of Coder. 
    </p>
    <p>
      Coder is a Java code generator. It has two parts one is a back-end service that saves domain entity information provided by the user, another is a front-end UI that provide visual designing for domain entity.
    </p>
    <p>
      Coder aims to manage domain entity of software this domain entities will be saved on the remote database. 
      When you first start your new Java software program, you can design your domain entity according to 
      requirements, then you can download spring-boot-stater-project which contains all the basic domain xxxEntity
       that you designed, and xxxDTO, xxxRepository, xxxService, xxxController that back-end service generated 
       for you. The spring-boot-start-project provides basic CRUD restful API contains GET PUT POST and DELETE, 
       it also provides conditional search API with pageable.
    </p>
    <p>
      This project is the first version of coder, if you have some good ideas please contact me, tell me 
      which function do you like best and tell me why not provide xxx function. 
    </p>
    <p>
      author email: wqg599252594@qq.com.
    </p>
    <p>
      <img src="../assets/coder.png" alt="coder UI design" style="height:500px;">
    </p>
  </div>
</template>

<script>
export default {

}
</script>

<style>
.about {
  text-align: left;
  padding: 50px;
}
</style>