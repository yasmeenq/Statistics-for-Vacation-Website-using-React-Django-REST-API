from django.db import models
from django.contrib.auth.models import AbstractUser, Group, Permission, BaseUserManager, AbstractBaseUser
from django.utils import timezone


class CustomUserManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('The Email field must be set')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        
        return self.create_user(email, password, **extra_fields)



class RoleModel(models.Model):
    roleID = models.AutoField(primary_key=True)
    roleName = models.CharField(max_length=45, blank=True, null=True)

    def __str__(self):
        return self.roleName or "missing role"

    class Meta:
        managed = True
        db_table = 'roles'


class UserModel(AbstractUser):
    userID = models.AutoField(primary_key=True)
    role = models.ForeignKey(RoleModel, on_delete=models.SET_NULL, null=True)
    email = models.EmailField(unique=True)  # Email field must be unique
    username = models.CharField(max_length=150, unique=True, blank=True, null=True) 

    # Set USERNAME_FIELD to email
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []  # No additional required fields

    # Add default values
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_superuser = models.BooleanField(default=False)

    class Meta:
        managed = True
        db_table = 'users'
        permissions = [
            ('can_view_users', 'Can view user')
        ]

    def __str__(self):
        return f"{self.first_name} {self.last_name} {self.role or 'missing role'}"

    groups = models.ManyToManyField(
        Group,
        related_name="custom_user_set",
        blank=True,
        help_text="The groups this user belongs to. A user will get all permissions granted to each of their groups.",
        verbose_name="groups",
    )
    user_permissions = models.ManyToManyField(
        Permission,
        related_name="custom_user_permissions_set",
        blank=True,
        help_text="Specific permissions for this user.",
        verbose_name="user permissions",
    )
    
    objects = CustomUserManager()

