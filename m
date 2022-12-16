Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F068B64E608
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Dec 2022 03:50:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p60nc-0008OR-Bq;
	Fri, 16 Dec 2022 02:50:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p60nW-0008OJ-7u
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 02:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xkPRz4HuxnBRvPyPyjyiC/ZiYzctQfIpXzsctDoonPc=; b=U4QIinNFi6LOMn2aeriEjSdMBR
 y3xjxLoR4yhDQBB8D6HGiUMHvNr5DFb4SW8RGtLRz0G0abFcvyvEVKMEedFvDU4E1cqt5n1Me2KXp
 YsPoiLitipslfNT6nIrQu4dypBJSYmIimETe8FpJ5/gFisykYU6wEluf3oSggjKh3yog=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xkPRz4HuxnBRvPyPyjyiC/ZiYzctQfIpXzsctDoonPc=; b=TeSSAHjWMr/oBgDf7XY3b5/yC5
 qZ8cTmMqn+Tnb1sZ9XY8P2AkSM6AwO3tmm9Mk5AxkcIaX+wCSq5BejfmDGlZcBEsirCPYknP5bSOj
 WIlO2TsHKAnhUr9DCt5NkwUO1ccVIvyCXmucK4bogIHs+h6PUvBpjKIGc/85+ftJm6jM=;
Received: from mail-sgaapc01on2116.outbound.protection.outlook.com
 ([40.107.215.116] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p60nU-000xxn-Hc for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 02:50:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYRiIEg8lcL9+DQhOd9n76TJy6up2hFBRMc/LYtjxJKr8QTPSbuC6PdIjSUYjpNLV9Q4hQbGesh7f0abKSVl4Y6fxdz6EUM1mwSNd6jzqWL8a1nSzsti47DGcYe0iHCPxIYdQSuLHHH2S781PFbybpreev/mbsna9dPkgggEgeTegRZyctY83lSV8tUt4zrMDrMP/fawKQ50E5qxcDY0tWdgklu9GvNpM45kQKuWj7snP4I+5sRjpWSUsO41KllO71BV1dMB2DpnTVfM7rgPAzVMtXIeHlCvs5UQJx8IFReDm9iAHVmH2LAqfUmRQk35teK3PBtf7Rnd5//j/bUHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkPRz4HuxnBRvPyPyjyiC/ZiYzctQfIpXzsctDoonPc=;
 b=EUtOx+CQtlTSh2b7GFBnpxgswzBMa8Q4AumNj4orb6clm3yUxWn8I3grZireMrL5Bx7CKClaXDPWcSkP/VZJCtAY4X+1a3XTY7GYHepyvboiCdYzcnTLq0qoC4mKV1grZrJ9AN6tLwjMjGHwkjtKhvIpdx/KV9/UOo6Lq5vaDrwGy94R7BXeIgISQ5jvJtRHoufMP94V/YNHekn3SUQFHKhkh8Pw38O/UcaxyWucNQvJfJRRhKh0ud5/dGTtWvhk8a/ptoJSrIKUAeCmf/t/TQC5EEDfBu+Q5Z5P4WLNv50pCbuCb4TZbSkpty72mpOOkZIRSGFC8axQxNNNqcwQLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkPRz4HuxnBRvPyPyjyiC/ZiYzctQfIpXzsctDoonPc=;
 b=P7b+CgqG877AE3qz8D3PCmkUmyM4wVxYUXmzw3Zg/5+E2wro6fZDkpdV62atrP6RJxq7INAcLOb9EoDywpbkWbw2EmL6/pK5TXaI5JVgUCPW34OoPBtYzLu4ExDzuQm6kkdD8kgt4d7RI50cxJFs4UkCPRi+dDPdrT5galksQxwRiE74icYDM7DDWaoD7Tn8QtGdUpMhNtV4PUz5t83Qi/8ZeFFjJJDWxEc5D30Nfli1epe4HUuN90xe31+6EZK0rBmy0jFhWsMMC9AEI7SDVvOghZEZfP5njptPh7+qDVTpzTDik9pj1Ovj52ohdgG2Xtme3AKxBWvcT7+Kus4/wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB3980.apcprd06.prod.outlook.com (2603:1096:4:f5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15; Fri, 16 Dec
 2022 02:49:55 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 02:49:55 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 16 Dec 2022 10:49:46 +0800
Message-Id: <20221216024946.77650-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <65a6b4e0-fe25-f341-0095-40c28d690eb1@kernel.org>
References: <65a6b4e0-fe25-f341-0095-40c28d690eb1@kernel.org>
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB3980:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f3eb661-0bd9-4981-8975-08dadf103629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KUIHtv8P497Jr2YP2LglpViwp039ZQ7dxKZEyVhE1mc3tDt9wt402xH1NxM+lSVyej343uJHc8lOlxax5VLKDor8e7BHDfYVnbwmS/PCARQkTHFGInWkIOIw0mSH8APPWqz9zLSRXn7kH+p4R6lpIj7mSoMbifk0V7trf7EIJkrNXUiZ+cx2RM8PSwcSZhyAm8HkDhxcfixCcOlFyj6uvxJIKC07E+pwZaX04+D68nMZK5XWPAtBoelBlnP1XKAzpyLFI3Ka8C7bj0W0MQP/R8S6Db4oCfbFalmBQilxrqkMdrdSkKB+sX0EwAAf88E+tWEZlb/+r8Ft+VINcjCNmO9uu0Fn3xR+jRSP2fJCz/o6faUz6JNtDCmY/y1bvTQQw7XMN2pJiZEYIEy0mHFL27cVDoKkzCv2cVvrHmeKdHRt32nThpZlNWjqj/6SF4qN8sFZZJEvKniqoBOG8GlPn4KZmLu2DSGQiqa8mL01EgTeBvdOPXB4rJf7XC//K+KWWka/1k0ESBZaI8wvCRt2F2bO/Eys8puLmYX9cg1LzWo9b9LDLbVFgYkAsDiThAo3yjpjPCD1CcB+QEWS9ThiT2Xozp/euIO+Tcgg0LYykHXEQbluFp87B/u/YHz+doSa/K8OMpZ2CQ4fMnEYOZInioafiofAbL/NTtuXf8HV/Xd2eDnBMrd7wjJ+BX/sMvnSY5dnmZ7oOKIZCosHIDPv16FFUBQ4wjvo3aXWVOVL+xA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199015)(36756003)(8676002)(6512007)(186003)(26005)(478600001)(966005)(66476007)(1076003)(6486002)(41300700001)(2616005)(4326008)(86362001)(66556008)(5660300002)(83380400001)(8936002)(2906002)(66946007)(6666004)(52116002)(316002)(6506007)(4744005)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YuFekqdUEcVOhtX+WRYPF1LAqrzzMaDhnEFMLVlhft7Pc74cBrqly1XC5RWh?=
 =?us-ascii?Q?iGTXZjnZTxIMscL6XmXelGkAX+7ym2Mc+57JCHaw3DNs00icGHYxEKfViDTF?=
 =?us-ascii?Q?6j+3C9g4ucTLEEfbR9RgILVhL3oQM1KMj9jZhsHxZVfcIksp1uAsR5ilV5zG?=
 =?us-ascii?Q?JjuhWuaWx1aVnFiUgD9XtczInqd9upnRwqh4+wQOeY1vP8Yo9Vnfm/X1rjcs?=
 =?us-ascii?Q?FLw7+1jTA7Sal/lcZvXeyh89pCIhCjfSCv6ZH6liQukNkSXDy4nYRAHA/2xL?=
 =?us-ascii?Q?bRcE1lBK0RzSjP+IV7RODYnb29E2ZmDYsiLUXX+Is3ge0zWlZ1wxd+MmyFI9?=
 =?us-ascii?Q?LjvBtDzUY3USzUzvphzBnOXIBn5UsTP+22in6QZ7uOwN7YIN6J4PErP4horE?=
 =?us-ascii?Q?sGc9CPNIRzd/wWYdp3HhEfJkSYlbojnQrDh4Oy8ktTJzLDLzZfIBccN77QnC?=
 =?us-ascii?Q?zoDGn172qiJgtjyoqJFKT/U9UptZi5jst5slwfTFbxHoGMVyu8EcOr0CG2/j?=
 =?us-ascii?Q?fbHBOri4tbFjMc3D6m0SNdM1BsFs4HcAjnpA+PCSo3svNIZnFbE67YKkDpMC?=
 =?us-ascii?Q?ZQX4vy/PRgU2qTrSNHigRRbalTkjnFgnxbtYXY1fau0KXiParfFvUITg3438?=
 =?us-ascii?Q?0vhdzKamUDclBhQfd5/ebeZfW8PZCi4VDNVF8eKAcB5UxqhCfZPm3zACchTy?=
 =?us-ascii?Q?KUBZ/SMFziwIJ6gVVU+wbDak3lwVp5tmnnZybAvVin0uLC5VXYTeDcPWPdIJ?=
 =?us-ascii?Q?iWJmdM1ucMV3ip+rbiZYHUJkBMcHIcXoVvyFxMCeUragHRbZTXkY3U71M4ML?=
 =?us-ascii?Q?sA6B+iJPim1h9E7n4e61yTDufrPAYrQl7umHwUx13n4DEeo4pnobColJVpjC?=
 =?us-ascii?Q?qJ3w/bm85uS4CEYXO2OEzWrE2MXAX3TtRXYlHVg50CxPYw5G0wzxpTxSt+AZ?=
 =?us-ascii?Q?ez5PGYlwEJzpeJBqmGsNd4KI4LVr50LL6sO11fn1yr0jUgOGQaKOqZ5uWL13?=
 =?us-ascii?Q?cMLz3uyCE4fKbJnV+AjJnBqoLR92aitvY5EIkwdmJQ7L6zKZ4xaG5neWBGIb?=
 =?us-ascii?Q?G56dl5ZqXxeRWzjaMyJp9ODUrPIz099MX9tEEmIJx1fc7BlYdDq0xMluyOyL?=
 =?us-ascii?Q?MhZA1LYLMNOOSUmsXrw07sy9bMvrVtSV3ATmmjg69Hu7l8pfo0bFAI72HjQ9?=
 =?us-ascii?Q?27NZZmSGB+uj8Zfurpwhv5TXOOn/5EhB9aC5k7rHc6jHQgdgdGp67kH/14KL?=
 =?us-ascii?Q?KQ0wM9bYOKArPb76dBYYpUD3RqQHOILHO61JJCr0Zr8I/UGkj0gokPhTxbcb?=
 =?us-ascii?Q?cOFYoKttlzHvQopEdTwxImdka5/oukOXExC8fx9Ysfn23uHA1x/oBcd/cp6r?=
 =?us-ascii?Q?68zQE2k5/3gNHqYOfLieqDLb8Da7hYNSpox82am29RrZwB18O683RcsBpXwV?=
 =?us-ascii?Q?KJkKGH9589OucacrTG16C8Hbxz4Id3Ougb15CbUd3TcJNeJZPlt6h+03+H3S?=
 =?us-ascii?Q?Hc4gygXCBeWLApzRE++ysL2RcOfcC7KaeOaGi4Bf8yGcq0/Ub8DzFVpiaNI9?=
 =?us-ascii?Q?e0JyHeYPurs8y2QO1GB3fU+xa8MQHBhA5induzME?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f3eb661-0bd9-4981-8975-08dadf103629
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 02:49:54.9383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3cYIpBUvrrF2jBYCJh9KAhPIjGUrqzC6mN1LzkGEwd0bjYvKx3SZMvkgPH+Y4KhYr5yW71mJfk73zQPdot9rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB3980
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > The website is available now,
 cool... :) > > https://patchwork.kernel.org/project/f2fs/
 The website link is accessible, but it seems like it still needs some work?
 According to my test, the patches from last night and today are not visible
 on the website. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.116 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.116 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1p60nU-000xxn-Hc
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add support for counting time of
 submit discard cmd
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> The website is available now, cool... :)
> 
> https://patchwork.kernel.org/project/f2fs/

The website link is accessible, but it seems like it still needs some work?
According to my test, the patches from last night and today are not visible on the website.

> Jaegeuk, your email address is out-of-update in above link, it needs to
> be updated.

> Maintainer	Jaegeuk Kim <jaegeuk.kim@samsung.com>

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
