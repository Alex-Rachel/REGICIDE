package tserver

import (
	"Regicide/App/common"
	"Regicide/App/model"
	"Regicide/App/response"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

func GetRankList(ctx *gin.Context) {
	rankIndex := ctx.PostForm("rankIndex")
	switch rankIndex {
	case "1":
		{
			var ranks []model.RumenRank
			common.DB.Find(&ranks)
			response.Success(ctx, gin.H{"ranks": ranks}, "Info success")
			ctx.JSON(http.StatusOK, gin.H{
				"code": 200,
				"data": gin.H{
					"ranks": ranks,
				},
			})
		}
	case "2":
		{
			var ranks []model.EasyRank
			common.DB.Find(&ranks)
			response.Success(ctx, gin.H{"ranks": ranks}, "Info success")
			ctx.JSON(http.StatusOK, gin.H{
				"code": 200,
				"data": gin.H{
					"ranks": ranks,
				},
			})
		}
	case "3":
		{
			var ranks []model.NormalRank
			common.DB.Find(&ranks)
			response.Success(ctx, gin.H{"ranks": ranks}, "Info success")
			ctx.JSON(http.StatusOK, gin.H{
				"code": 200,
				"data": gin.H{
					"ranks": ranks,
				},
			})
		}
	case "4":
		{
			var ranks []model.HardRank
			common.DB.Find(&ranks)
			response.Success(ctx, gin.H{"ranks": ranks}, "Info success")
			ctx.JSON(http.StatusOK, gin.H{
				"code": 200,
				"data": gin.H{
					"ranks": ranks,
				},
			})
		}
	case "5":
		{
			var ranks []model.VeryHardRank
			common.DB.Find(&ranks)
			response.Success(ctx, gin.H{"ranks": ranks}, "Info success")
			ctx.JSON(http.StatusOK, gin.H{
				"code": 200,
				"data": gin.H{
					"ranks": ranks,
				},
			})
		}
	case "6":
		{
			var ranks []model.HunRank
			common.DB.Find(&ranks)
			response.Success(ctx, gin.H{"ranks": ranks}, "Info success")
			ctx.JSON(http.StatusOK, gin.H{
				"code": 200,
				"data": gin.H{
					"ranks": ranks,
				},
			})
		}
	case "10":
		{
			var ranks []model.RogRank
			common.DB.Find(&ranks)
			response.Success(ctx, gin.H{"ranks": ranks}, "Info success")
			ctx.JSON(http.StatusOK, gin.H{
				"code": 200,
				"data": gin.H{
					"ranks": ranks,
				},
			})
		}
	case "11":
		{
			var ranks []model.RogHunRank
			common.DB.Find(&ranks)
			response.Success(ctx, gin.H{"ranks": ranks}, "Info success")
			ctx.JSON(http.StatusOK, gin.H{
				"code": 200,
				"data": gin.H{
					"ranks": ranks,
				},
			})
		}
	case "7":
		{
			var ranks []model.OnlineRank
			common.DB.Find(&ranks)
			response.Success(ctx, gin.H{"ranks": ranks}, "Online")
			ctx.JSON(http.StatusOK, gin.H{
				"code": 200,
				"data": gin.H{
					"online": 1,
					"ranks":  ranks,
				},
			})
		}
	}
}

func PostRankData(ctx *gin.Context) {
	rankIndex := ctx.PostForm("rankIndex")
	userId := ctx.PostForm("userId")
	userName := ctx.PostForm("userName")
	completeType := ctx.PostForm("completeType")

	switch rankIndex {
	case "1":
		{
			var dbRank model.RumenRank
			common.DB.Where("Roleid = ?", userId).Find(&dbRank)
			if dbRank.Roleid == 0 {
				intuserId, _ := strconv.Atoi(userId)
				switch completeType {
				case "1":
					{
						dbRank := &model.RumenRank{Roleid: intuserId, Username: userName, GoldCount: 1, YinCount: 0, TongCount: 0}
						common.DB.Create(dbRank)
					}
				case "2":
					{
						dbRank := &model.RumenRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 1, TongCount: 0}
						common.DB.Create(dbRank)
					}
				case "3":
					{
						dbRank := &model.RumenRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 0, TongCount: 1}
						common.DB.Create(dbRank)
					}
				}
			} else {
				switch completeType {
				case "1":
					{
						goldCount := dbRank.GoldCount + 1
						common.DB.Model(&dbRank).Update(model.RumenRank{GoldCount: goldCount})
					}
				case "2":
					{
						yinCount := dbRank.YinCount + 1
						common.DB.Model(&dbRank).Update(model.RumenRank{YinCount: yinCount})
					}
				case "3":
					{
						tongCount := dbRank.TongCount + 1
						common.DB.Model(&dbRank).Update(model.RumenRank{TongCount: tongCount})
					}
				}
			}
		}
	case "2":
		{
			var dbRank model.EasyRank
			common.DB.Where("Roleid = ?", userId).Find(&dbRank)
			if dbRank.Roleid == 0 {
				intuserId, _ := strconv.Atoi(userId)
				switch completeType {
				case "1":
					{
						dbRank := &model.EasyRank{Roleid: intuserId, Username: userName, GoldCount: 1, YinCount: 0, TongCount: 0}
						common.DB.Create(dbRank)
					}
				case "2":
					{
						dbRank := &model.EasyRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 1, TongCount: 0}
						common.DB.Create(dbRank)
					}
				case "3":
					{
						dbRank := &model.EasyRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 0, TongCount: 1}
						common.DB.Create(dbRank)
					}
				}
			} else {
				switch completeType {
				case "1":
					{
						goldCount := dbRank.GoldCount + 1
						common.DB.Model(&dbRank).Update(model.EasyRank{GoldCount: goldCount})
					}
				case "2":
					{
						yinCount := dbRank.YinCount + 1
						common.DB.Model(&dbRank).Update(model.EasyRank{YinCount: yinCount})
					}
				case "3":
					{
						tongCount := dbRank.TongCount + 1
						common.DB.Model(&dbRank).Update(model.EasyRank{TongCount: tongCount})
					}
				}
			}
		}
	case "3":
		{
			var dbRank model.NormalRank
			common.DB.Where("Roleid = ?", userId).Find(&dbRank)
			if dbRank.Roleid == 0 {
				intuserId, _ := strconv.Atoi(userId)
				switch completeType {
				case "1":
					{
						dbRank := &model.NormalRank{Roleid: intuserId, Username: userName, GoldCount: 1, YinCount: 0, TongCount: 0}
						common.DB.Create(dbRank)
					}
				case "2":
					{
						dbRank := &model.NormalRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 1, TongCount: 0}
						common.DB.Create(dbRank)
					}
				case "3":
					{
						dbRank := &model.NormalRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 0, TongCount: 1}
						common.DB.Create(dbRank)
					}
				}
			} else {
				switch completeType {
				case "1":
					{
						goldCount := dbRank.GoldCount + 1
						common.DB.Model(&dbRank).Update(model.NormalRank{GoldCount: goldCount})
					}
				case "2":
					{
						yinCount := dbRank.YinCount + 1
						common.DB.Model(&dbRank).Update(model.NormalRank{YinCount: yinCount})
					}
				case "3":
					{
						tongCount := dbRank.TongCount + 1
						common.DB.Model(&dbRank).Update(model.NormalRank{TongCount: tongCount})
					}
				}
			}
		}
	case "4":
		{
			var dbRank model.HardRank
			common.DB.Where("Roleid = ?", userId).Find(&dbRank)
			if dbRank.Roleid == 0 {
				intuserId, _ := strconv.Atoi(userId)
				switch completeType {
				case "1":
					{
						dbRank := &model.HardRank{Roleid: intuserId, Username: userName, GoldCount: 1, YinCount: 0, TongCount: 0}
						common.DB.Create(dbRank)
					}
				case "2":
					{
						dbRank := &model.HardRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 1, TongCount: 0}
						common.DB.Create(dbRank)
					}
				case "3":
					{
						dbRank := &model.HardRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 0, TongCount: 1}
						common.DB.Create(dbRank)
					}
				}
			} else {
				switch completeType {
				case "1":
					{
						goldCount := dbRank.GoldCount + 1
						common.DB.Model(&dbRank).Update(model.HardRank{GoldCount: goldCount})
					}
				case "2":
					{
						yinCount := dbRank.YinCount + 1
						common.DB.Model(&dbRank).Update(model.HardRank{YinCount: yinCount})
					}
				case "3":
					{
						tongCount := dbRank.TongCount + 1
						common.DB.Model(&dbRank).Update(model.HardRank{TongCount: tongCount})
					}
				}
			}
		}
	case "5":
		{
			var dbRank model.VeryHardRank
			common.DB.Where("Roleid = ?", userId).Find(&dbRank)
			if dbRank.Roleid == 0 {
				intuserId, _ := strconv.Atoi(userId)
				switch completeType {
				case "1":
					{
						dbRank := &model.VeryHardRank{Roleid: intuserId, Username: userName, GoldCount: 1, YinCount: 0, TongCount: 0}
						common.DB.Create(dbRank)
					}
				case "2":
					{
						dbRank := &model.VeryHardRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 1, TongCount: 0}
						common.DB.Create(dbRank)
					}
				case "3":
					{
						dbRank := &model.VeryHardRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 0, TongCount: 1}
						common.DB.Create(dbRank)
					}
				}
			} else {
				switch completeType {
				case "1":
					{
						goldCount := dbRank.GoldCount + 1
						common.DB.Model(&dbRank).Update(model.VeryHardRank{GoldCount: goldCount})
					}
				case "2":
					{
						yinCount := dbRank.YinCount + 1
						common.DB.Model(&dbRank).Update(model.VeryHardRank{YinCount: yinCount})
					}
				case "3":
					{
						tongCount := dbRank.TongCount + 1
						common.DB.Model(&dbRank).Update(model.VeryHardRank{TongCount: tongCount})
					}
				}
			}
		}
	case "6":
		{
			var dbRank model.HunRank
			common.DB.Where("Roleid = ?", userId).Find(&dbRank)
			if dbRank.Roleid == 0 {
				intuserId, _ := strconv.Atoi(userId)
				switch completeType {
				case "1":
					{
						dbRank := &model.HunRank{Roleid: intuserId, Username: userName, GoldCount: 1, YinCount: 0, TongCount: 0}
						common.DB.Create(dbRank)
					}
				case "2":
					{
						dbRank := &model.HunRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 1, TongCount: 0}
						common.DB.Create(dbRank)
					}
				case "3":
					{
						dbRank := &model.HunRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 0, TongCount: 1}
						common.DB.Create(dbRank)
					}
				}
			} else {
				switch completeType {
				case "1":
					{
						goldCount := dbRank.GoldCount + 1
						common.DB.Model(&dbRank).Update(model.HunRank{GoldCount: goldCount})
					}
				case "2":
					{
						yinCount := dbRank.YinCount + 1
						common.DB.Model(&dbRank).Update(model.HunRank{YinCount: yinCount})
					}
				case "3":
					{
						tongCount := dbRank.TongCount + 1
						common.DB.Model(&dbRank).Update(model.HunRank{TongCount: tongCount})
					}
				}
			}
		}
	case "10":
		{
			talent1 := ctx.PostForm("talent1")
			talent2 := ctx.PostForm("talent2")
			talent3 := ctx.PostForm("talent3")
			inttalent1, _ := strconv.Atoi(talent1)
			inttalent2, _ := strconv.Atoi(talent2)
			inttalent3, _ := strconv.Atoi(talent3)
			var dbRank model.RogRank
			common.DB.Where("Roleid = ?", userId).Find(&dbRank)
			if dbRank.Roleid == 0 {
				intuserId, _ := strconv.Atoi(userId)
				switch completeType {
				case "1":
					{
						dbRank := &model.RogRank{Roleid: intuserId, Username: userName, GoldCount: 1, YinCount: 0, TongCount: 0, Talent1: inttalent1, Talent2: inttalent2, Talent3: inttalent3}
						common.DB.Create(dbRank)
					}
				case "2":
					{
						dbRank := &model.RogRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 1, TongCount: 0, Talent1: inttalent1, Talent2: inttalent2, Talent3: inttalent3}
						common.DB.Create(dbRank)
					}
				case "3":
					{
						dbRank := &model.RogRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 0, TongCount: 1, Talent1: inttalent1, Talent2: inttalent2, Talent3: inttalent3}
						common.DB.Create(dbRank)
					}
				}
			} else {
				switch completeType {
				case "1":
					{
						goldCount := dbRank.GoldCount + 1
						common.DB.Model(&dbRank).Update(model.RogRank{GoldCount: goldCount, Talent1: inttalent1, Talent2: inttalent2, Talent3: inttalent3})
					}
				case "2":
					{
						yinCount := dbRank.YinCount + 1
						common.DB.Model(&dbRank).Update(model.RogRank{YinCount: yinCount, Talent1: inttalent1, Talent2: inttalent2, Talent3: inttalent3})
					}
				case "3":
					{
						tongCount := dbRank.TongCount + 1
						common.DB.Model(&dbRank).Update(model.RogRank{TongCount: tongCount, Talent1: inttalent1, Talent2: inttalent2, Talent3: inttalent3})
					}
				}
			}
		}
	case "11":
		{
			talent1 := ctx.PostForm("talent1")
			talent2 := ctx.PostForm("talent2")
			talent3 := ctx.PostForm("talent3")
			inttalent1, _ := strconv.Atoi(talent1)
			inttalent2, _ := strconv.Atoi(talent2)
			inttalent3, _ := strconv.Atoi(talent3)
			var dbRank model.RogHunRank
			common.DB.Where("Roleid = ?", userId).Find(&dbRank)
			if dbRank.Roleid == 0 {
				intuserId, _ := strconv.Atoi(userId)
				switch completeType {
				case "1":
					{
						dbRank := &model.RogHunRank{Roleid: intuserId, Username: userName, GoldCount: 1, YinCount: 0, TongCount: 0, Talent1: inttalent1, Talent2: inttalent2, Talent3: inttalent3}
						common.DB.Create(dbRank)
					}
				case "2":
					{
						dbRank := &model.RogHunRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 1, TongCount: 0, Talent1: inttalent1, Talent2: inttalent2, Talent3: inttalent3}
						common.DB.Create(dbRank)
					}
				case "3":
					{
						dbRank := &model.RogHunRank{Roleid: intuserId, Username: userName, GoldCount: 0, YinCount: 0, TongCount: 1, Talent1: inttalent1, Talent2: inttalent2, Talent3: inttalent3}
						common.DB.Create(dbRank)
					}
				}
			} else {
				switch completeType {
				case "1":
					{
						goldCount := dbRank.GoldCount + 1
						common.DB.Model(&dbRank).Update(model.RogHunRank{GoldCount: goldCount, Talent1: inttalent1, Talent2: inttalent2, Talent3: inttalent3})
					}
				case "2":
					{
						yinCount := dbRank.YinCount + 1
						common.DB.Model(&dbRank).Update(model.RogHunRank{YinCount: yinCount, Talent1: inttalent1, Talent2: inttalent2, Talent3: inttalent3})
					}
				case "3":
					{
						tongCount := dbRank.TongCount + 1
						common.DB.Model(&dbRank).Update(model.RogHunRank{TongCount: tongCount, Talent1: inttalent1, Talent2: inttalent2, Talent3: inttalent3})
					}
				}
			}
		}
	}

	ctx.JSON(http.StatusOK, gin.H{
		"code": 200,
		"data": gin.H{
			"type": "PostRank",
		},
	})
}
