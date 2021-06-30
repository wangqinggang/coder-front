import {createRouter,createWebHistory} from 'vue-router'
import Home from '@/views/Home.vue'
import About from '@/views/About.vue'
import AddEntity from '@/views/AddEntity.vue'
import ProjectInfo from '@/views/ProjectInfo.vue'
import EntityList from '@/views/EntityList.vue'
import SupportMe from '@/views/SupportMe.vue'
import Download from '@/views/Download.vue'

const routes=[
    {
        path: '/',
        name: 'Home',
        component: Home
    },
    {
        path: '/about',
        name: 'About',
        component: About
    },
    {
        path: '/info',
        name: 'ProjectInfo',
        component: ProjectInfo
    },
    {
        path: '/add',
        name: 'AddEntity',
        component: AddEntity
    },
    {
        path: '/list',
        name: 'EntityList',
        component: EntityList
    },
    {
        path: '/support',
        name: 'SupportMe',
        component: SupportMe
    },
    {
        path: '/download',
        name: 'Download',
        component: Download
    }
]

const router = new createRouter({
    history:createWebHistory(),
    routes
})

export default router