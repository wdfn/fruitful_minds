from django.contrib import admin
from main.models import MessageBar, ImageSlideshow

class MessageBarAdmin(admin.ModelAdmin):

    fields = ['text']
    list_display = ('text', 'pub_date')

class ImageSlideshowAdmin(admin.ModelAdmin):

    fields = ['photo', 'quote', 'attribution']
    list_display = ('photo', 'quote')

admin.site.register(MessageBar, MessageBarAdmin)
admin.site.register(ImageSlideshow, ImageSlideshowAdmin)
# Register your models here.
