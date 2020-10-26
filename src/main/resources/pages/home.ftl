<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="edge">
    <meta name="keywords" content="个人网站,个人网页,个人站点,个人博客,HerbertYu,于洪波的个人网站,web,技术分享">
    <meta name="description" content="每一行代码都有一个成为参天大树的梦想">
    <meta name="AUTHOR" content="于洪波">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="shortcut icon" href="/static/img/favicon.ico">
<!--    <link href="/static/js/lib/element-ui/index.css" rel="stylesheet">-->
    <link href="${wolf.static}/font-icon/icomoon/style.css" rel="stylesheet">
    <link href="${wolf.static}/css/style.css?v=${version}" rel="stylesheet">
    <script src="${wolf.static}/js/lib/vue.js"></script>
<!--    <script src="${wolf.static}/js/lib/element-ui/index.js"></script>-->
    <title>HerbertYu | 个人网站 | web_技术分享_于洪波的个人网站</title>
    <style>

    </style>
</head>
<body>
<section id="app">
    <section class="wrap">

        <!--        <div class='loader-container' v-bind:style="{ display: (isLoading ?'block':'none') }">-->
        <div class='loader-container' v-show="isLoading">
            <div class='loader-obj'></div>
        </div>

        <div class="kit">
            <i :title="kit.isFullScreen ? '取消全屏' : '全屏'" @click="toggleFullscreen" class="icon-fullscreen"></i>
        </div>

        <section id="index">

            <div id="index-bg">
                <div class="mask-radial-gradient"></div>
            </div>

            <div class="header" :class="{scroll: header.scroll}">
                <header class="header-title" :class="{scroll: header.scroll}">Welcome to here!</header>
                <nav>
                    <ul class="left-nav-url">
                        <li class="nav" :class="{active: nav.active=='index'}" @click="navigate('index')"><a
                                href="javascript:;">首页</a></li>
                        <li class="nav"><a href="javascript:;">博客</a></li>
                        <li class="nav"><a href="javascript:;">音乐</a></li>
                        <li class="nav" :class="{active: nav.active=='links'}" @click="navigate('links')"><a
                                href="javascript:;">🔗链接</a></li>
                    </ul>
                    <ul class="right-nav-url">
                        <li class="nav"><a class="icon-community" :class="{active:header.account}"
                                           v-on:click="toggleAccountLayer" title="登录"
                                           href="javascript:;"></a></li>
                        <li class="nav"><a class="icon-github" title="github" target="_blank"
                                           href="https://github.com/HerbertYu234/y-web-portal"></a></li>
                        <li class="nav"><a class="icon-setting" :class="{active:header.settings}"
                                           v-on:click="toggleSettingsLayer" title="设置"
                                           href="javascript:;"></a></li>
                    </ul>
                </nav>
            </div>

            <component v-bind:is="com.indexContent" v-on:go-detail="goDetail" test="hahaha" :mclazz="getContentClass"
                       v-show="!com.detail"></component>

            <v-detail-content-comp v-if="com.detail" v-on:go-back="goBack"></v-detail-content-comp>

            <!--            <div class="footer">
                            <footer>
                                <p class="weak">Thank God, we are still alive</p><br>
                                <p>Designed and developed by Herbert Yu.</p>
                                <p>Copyright © 2010-2019 herbertyu.com. All Rights Reserved.</p>
                            </footer>
                        </div>-->
            <v-footer></v-footer>
        </section>

        <!--<section id="earth" class="mask-radial-gradient" style="opacity: 1;">
            <canvas id="earth-container" style="margin: 20px" width="700" height="700"></canvas>
        </section>-->
        <v-earth></v-earth>

    </section>

    <div class="mask-layer" v-show="header.account">
        <div class="login" v-if="account.layer_login">
            <div class="head">
                <h4>登录</h4>
                <button @click="toggleAccountLayer"><span>x</span></button>
            </div>
            <div class="body">
                <form>

                    <div class="form-groupA">
                        <label for="username">用户名</label>
                        <input type="text" id="username" placeholder="请输入用户名" autocomplete="off">
                    </div>

                    <div class="form-groupA">
                        <label for="password">密码</label>
                        <input type="password" id="password" placeholder="请输入密码">
                    </div>

                    <div class="form-groupA txt-center">
                        <a href="javascript:;" class="confirm">登录</a>
                    </div>

                    <div class="form-groupA">
                        没有账号？<span class="go-regist" @click="goRegist">注册</span>
                        <a href="javascript:;" class="forgetPwd">忘记密码</a>
                    </div>

                    <div class="form-groupA" style="position: relative; border-bottom: 1px solid #aaa;">
                        <span class="more-login-way">更多登录方式</span>
                    </div>

                    <div class="form-groupA txt-center">
                        <a class="login-way icon-11qq"></a>
                        <a class="login-way icon-10wechat"></a>
                    </div>
                </form>
            </div>
        </div>


        <div class="login" v-else-if="account.layer_regist">
            <div class="head">
                <h4>注册</h4>
                <button @click="toggleAccountLayer"><span>x</span></button>
            </div>
            <div class="body">
                <form>

                    <div class="form-groupA">
                        <label for="username">用户名</label>
                        <input type="text" id="username" placeholder="请输入用户名" autocomplete="off">
                    </div>

                    <div class="form-groupA">
                        <label for="password">密码</label>
                        <input type="password" id="password" placeholder="请输入密码">
                    </div>

                    <div class="form-groupA">
                        <label for="verify-code">验证码</label>
                        <input type="text" id="verify-code" placeholder="请输入验证码" autocomplete="off">
                        <img src="${wolf.static}/img/icon/idencode.png" style="cursor: pointer">
                    </div>

                    <div class="form-groupA txt-center">
                        <a href="javascript:;" class="confirm">注册</a>
                    </div>

                    <div class="form-groupA">
                        已有账号？<span class="go-login" @click="goLogin">登录</span>
                    </div>

                    <div class="form-groupA" style="position: relative; border-bottom: 1px solid #aaa;">
                        <span class="more-login-way">更多登录方式</span>
                    </div>

                    <div class="form-groupA txt-center">
                        <a class="login-way icon-11qq"></a>
                        <a class="login-way icon-10wechat"></a>
                    </div>
                </form>
            </div>
        </div>

    </div>


</section>


<script src="${wolf.static}/js/lib/planetaryjs/planetary-bundle.js"></script>
<script src="${wolf.static}/js/lib/better-scroll/bscroll.min.js"></script>
<script type="module" src="${wolf.static}/js/app/main.js"></script>
</body>
</html>