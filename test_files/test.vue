<template>

    <div class="uk-form-select pk-filter" :class="{'uk-active': value }">
    </div>

</template>

<script>

    module.exports = {
        created: function () {
            if (this.value === undefined) {
                this.value = '';
            }
        },
    };

</script>

<script setup lang="ts">

    function foo() {
        console.log('foo');
    }

</script>
