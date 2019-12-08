import Vue from 'https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.esm.browser.min.js'

const HeaderComponent = {
    template: `
        <div>
            <h1>Single-file JavaScript Component</h1>
            <p>{{ message }}</p>
        </div>
    `,
    data() {
        return {
            message: 'Oh hai from the component'
        }
    }
};

new Vue({
    el: '#header-component',
    components: {
        HeaderComponent
    }
});
