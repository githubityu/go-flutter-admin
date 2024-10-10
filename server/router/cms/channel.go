package cms

import (
	"github.com/gin-gonic/gin"
	"server/api"
)

type ChannelRouter struct {
}

func (receiver *ChannelRouter) InitChannelRouter(RouterGroup *gin.RouterGroup) {
	Router := RouterGroup.Group("channel")
	channelApi := api.ApiGroupApp.Cms.ChannelApi

	{
		Router.POST("addChannel", channelApi.AddChannel)
		Router.POST("getChannelList", channelApi.GetChannelList)
		Router.POST("deleteById", channelApi.DeleteById)
		Router.POST("editChannel", channelApi.EditChannel)
	}
}
