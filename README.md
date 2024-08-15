# Coading

https://developers.google.com/identity/sign-in/web/server-side-flow

restrict alohabets and char in html
---------------------------------------------------------------------------------------------------
<input type="tel" name="phone" class="form-control" placeholder="123 456 78 90" maxlength="10" 
       aria-label="<?php echo site_phrase('phone'); ?>" aria-describedby="<?php echo site_phrase('phone'); ?>" 
       id="registration-phone" required oninput="this.value=this.value.replace(/[^0-9]/g,'');">

       -------------------------------------------------------------------------------------------
