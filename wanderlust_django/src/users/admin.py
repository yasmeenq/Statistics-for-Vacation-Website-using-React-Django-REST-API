from django.contrib import admin
from .models import UserModel, RoleModel
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin


class UserAdmin(BaseUserAdmin):
    list_display = ('first_name', 'last_name', 'email', 'role', 'is_active', 'is_staff')
    
    fieldsets = BaseUserAdmin.fieldsets + (
        (None, {'fields': ('role',)}),  # Use 'role' instead of 'roleID'
    )

    add_fieldsets = BaseUserAdmin.add_fieldsets + (
        (None, {'fields': ('role',)}),  # Use 'role' instead of 'roleID'
    )


admin.site.register(UserModel, UserAdmin)


class RoleAdmin(admin.ModelAdmin):
    list_display = ('roleID', 'roleName')

admin.site.register(RoleModel, RoleAdmin)
