package cms

import "server/service"

type ApiGroup struct {
	ArticleApi
	ChannelApi
}

var (
	articleService = service.ServiceGroupApp.Cms.ArticleService
	channelService = service.ServiceGroupApp.Cms.ChannelService
)
