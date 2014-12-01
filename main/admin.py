from django.contrib import admin
from main.models import MessageBar

class MessageBarAdmin(admin.ModelAdmin):

    fieldsets = [
        (None, {'fields': ['text']}),
        ('Date information', {'fields': ['pub_date'], 'classes': ['collapse']}),
    ]


admin.site.register(MessageBar)
# Register your models here.
