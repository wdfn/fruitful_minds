from django.contrib import admin
from main.models import MessageBar

class MessageBarAdmin(admin.ModelAdmin):

    fields = ['text']
    list_display = ('text', 'pub_date')

admin.site.register(MessageBar, MessageBarAdmin)
# Register your models here.
