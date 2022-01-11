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
	}

	ctx.JSON(http.StatusOK, gin.H{
		"code": 200,
		"data": gin.H{
			"type": "PostRank",
		},
	})
}

// func Resigter(ctx *gin.Context) {
// 	DB := common.GetDB()
// 	//获取参数
// 	name := ctx.PostForm("name")
// 	telephone := ctx.PostForm("telephone")
// 	password := ctx.PostForm("password")
// 	//数据验证
// 	if len(name) >= 15 {
// 		ctx.JSON(http.StatusUnprocessableEntity, gin.H{"code": 422, "msg": "用户名不能大于15位数"})
// 		return
// 	}
// 	if len(name) == 0 {
// 		name = util.RandomString(10)
// 	}
// 	log.Println(name)
// 	if len(telephone) != 11 {
// 		response.Response(ctx, http.StatusUnprocessableEntity, 422, nil, "手机号必须为11位数")
// 		return
// 	}
// 	if len(password) < 6 {
// 		response.Response(ctx, http.StatusUnprocessableEntity, 422, nil, "密码不能少于6位数")
// 		return
// 	}
// 	//判断手机号是否存在
// 	if isTelephoneExist(DB, telephone) {
// 		response.Response(ctx, http.StatusUnprocessableEntity, 422, nil, "用户已存在")
// 		return
// 	}
// 	//创建用户
// 	//加密密码
// 	hasedPassword, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
// 	if err != nil {
// 		response.Response(ctx, http.StatusInternalServerError, 500, nil, "密码加密错误")
// 		return
// 	}
// 	newUser := model.User{
// 		Name:      name,
// 		Telephone: telephone,
// 		Password:  string(hasedPassword),
// 		// Password:  password,
// 	}
// 	DB.Create(&newUser)

// 	//发放token
// 	token, err := common.ReleaseToken(newUser)
// 	if err != nil {
// 		ctx.JSON(http.StatusInternalServerError, gin.H{"code": 500, "msg": "系统异常"})
// 		log.Printf("token generated error: %v", err)
// 		return
// 	}
// 	//返回结果
// 	response.Success(ctx, gin.H{"token": token}, "Resigter Success")
// }

// func Login(ctx *gin.Context) {
// 	DB := common.GetDB()
// 	//使用map 获取请求参数	方式1
// 	var requestMap = make(map[string]string)
// 	json.NewDecoder(ctx.Request.Body).Decode(&requestMap)

// 	//使用结构体 获取请求参数 方式2
// 	// var requestUser = model.User{}
// 	// json.NewDecoder(ctx.Request.Body).Decode(&requestUser) //方式一
// 	// ctx.Bind(&requestUser) //方式二

// 	//获取参数
// 	telephone := requestMap["telephone"]
// 	password := requestMap["password"]
// 	//数据验证
// 	if len(telephone) != 11 {
// 		response.Response(ctx, http.StatusUnprocessableEntity, 422, nil, "手机号必须为11位数")
// 		return
// 	}
// 	if len(password) < 6 {
// 		response.Response(ctx, http.StatusUnprocessableEntity, 422, nil, "密码不能少于6位数")
// 		return
// 	}
// 	//判断手机号是否存在
// 	var user model.User
// 	DB.Where("telephone = ?", telephone).First(&user)
// 	if user.ID == 0 {
// 		response.Response(ctx, http.StatusUnprocessableEntity, 422, nil, "用户不存在")
// 		return
// 	}

// 	//判断账号密码正确与否
// 	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password)); err != nil {
// 		ctx.JSON(http.StatusBadRequest, gin.H{"code": 400, "msg": "密码错误"})
// 		return
// 	}
// 	//发放token
// 	token, err := common.ReleaseToken(user)
// 	if err != nil {
// 		ctx.JSON(http.StatusInternalServerError, gin.H{"code": 500, "msg": "系统异常"})
// 		log.Printf("token generated error: %v", err)
// 		return
// 	}
// 	//返回结果
// 	response.Success(ctx, gin.H{"token": token}, "登录成功")
// 	// ctx.JSON(200, gin.H{
// 	// 	"code": 200,
// 	// 	"data": gin.H{
// 	// 		"token": token,
// 	// 	},
// 	// 	"msg": "登录成功",
// 	// })
// }
