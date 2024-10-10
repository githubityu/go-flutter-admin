package cms

import (
	"errors"
	"go.uber.org/zap"
	"gorm.io/gorm"
	"server/global"
	"server/model/cms"
	"server/model/cms/request"
)

type ChannelService struct {
}

// AddChannel 添加
func (cs *ChannelService) AddChannel(channel request.ChannelParams) bool {
	var model cms.ChannelModel
	model.Name = channel.Name
	model.Code = channel.Code
	if err := global.TD27_DB.Create(&model).Error; err != nil {
		global.TD27_LOG.Error("创建栏目失败", zap.Error(err))
		return false
	}

	return true
}

// EditChannel 修改栏目
func (cs *ChannelService) EditChannel(channel request.EditChannel) (err error) {
	var model cms.ChannelModel

	if err = global.TD27_DB.Where("id = ?", channel.ID).Find(&model).Error; errors.Is(err, gorm.ErrRecordNotFound) {
		global.TD27_LOG.Error("栏目不存在", zap.Error(err))
		return
	}
	err = global.TD27_DB.Model(&model).Updates(map[string]any{
		"name": channel.Name,
		"code": channel.Code,
	}).Error
	return
}

// GetChannelList 获取列表
func (cs *ChannelService) GetChannelList(reqParams request.ChannelSearchParams) ([]cms.ChannelModel, int64, error) {

	//获取分页信息
	limit := reqParams.PageSize
	offset := reqParams.PageSize * (reqParams.Page - 1)

	db := global.TD27_DB.Model(&cms.ChannelModel{})
	if reqParams.Code != "" {
		db.Where("code like ?", "%"+reqParams.Code+"%")
	}

	var total int64
	db.Count(&total)
	var channelList []cms.ChannelModel

	if err := db.Find(&channelList, reqParams.PageInfo).Limit(limit).Offset(offset).Error; err != nil {
		return nil, 0, err
	}
	return channelList, total, nil

}

// DeleteByeId 删除
func (cs *ChannelService) DeleteByeId(id uint) (err error) {
	var model cms.ChannelModel
	if err = global.TD27_DB.Where("id = ?", id).Find(&model).Error; errors.Is(err, gorm.ErrRecordNotFound) {
		global.TD27_LOG.Error("栏目不存在", zap.Error(err))
		return
	}
	err = global.TD27_DB.Unscoped().Delete(&model).Error
	return
}
