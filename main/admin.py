from django.contrib import admin
from main.models import MessageBar, ImageSlideshow, UserProfile

class MessageBarAdmin(admin.ModelAdmin):

    fields = ['text']
    list_display = ('text', 'pub_date')

class ImageSlideshowAdmin(admin.ModelAdmin):

    fields = ['photo', 'quote', 'attribution']
    list_display = ('photo', 'quote')

class UserProfileAdmin(admin.ModelAdmin):

    fields = ['user']
    list_display = ('user',)

admin.site.register(MessageBar, MessageBarAdmin)
admin.site.register(ImageSlideshow, ImageSlideshowAdmin)
admin.site.register(UserProfile, UserProfileAdmin)
# Register your models here.
