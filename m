Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC0B721486
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Jun 2023 05:57:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q5ert-0001kt-Qa;
	Sun, 04 Jun 2023 03:57:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1q5ert-0001kn-3B
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jun 2023 03:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=znLPrhISL+BRItr0eTMnw0fYKvVmvSqavBuyeJ/Ahzs=; b=SyY3qh2hQ3Nm4TGG7wQ+ETrW7B
 XkCMzEwC4a6kZsVjVGGjariEyIAEMUQ+VrqJLCaqlKlm0RWebfUOeDu8XSHvzSLGZU3gHkibAj64Z
 0eQXjLqceLnO0Ke/QZ6ukWYYyhNH4i37WxNm/WLYXl5C4VT8JUrdXYjVNhuGHX28bDF8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=znLPrhISL+BRItr0eTMnw0fYKvVmvSqavBuyeJ/Ahzs=; b=hwW1iMofvExD8FklDZD1T/15SL
 vtXSjiRWarjhsAyim31KOilHZHHck6EJsYGBVF0ANB/dUNGn3yF/Y944DVhoWqpJhf9rWhkIiUCBJ
 eN3diebESm66v+hnSLRDvfdkS9bSh4xle5Eazo1p5xVbhFl4FMG2b9AR++c16/33HU3Q=;
Received: from mail-psaapc01on2050.outbound.protection.outlook.com
 ([40.107.255.50] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q5err-0000P8-8m for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jun 2023 03:57:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZMzwdNhf+7TiR2ZosIJx1oNLCffcq5GQZrlfcVUD5dblMqeGg2kX+mmc0IQYPWntG8yaZiyyY1jZ+JB4q28fNEtNy1pBycwDBQqNPGpnZSuWvmjN5Z9Lud1GBlfEK1w7E/aLV+NlNS8QOdUyWayZeKbCotl7M1XD2TiJLm/1bYSzTndiusTdbPac1rgr6do4TTxf+2enpycegb2L3H+U9wGbu6/3dMkMJ9ObFIC/Icskr0aVMoXbvhWzu87Z92bsTZy4ClHcpA9UHTATdgfcv6uUGGnRY+pLHPiNCylIE3t5q0S+w6n2+GnOBIcl6XdIdSOijF5kgK08TlJKJ5UTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znLPrhISL+BRItr0eTMnw0fYKvVmvSqavBuyeJ/Ahzs=;
 b=XFJVDllYpbp9W56Wd5nqvzp+1951DJrhTpavU8k51YhtpiMWzMyh+t+qXPns9lhyqk6tvS0ZxspT7Jh+hgEbuOOtRA+ZI3ToazeMlkAXX5ioRgxpGcAaV7xs7SFqTKS5gWrkLTwJDRyqsoMKooIrnTusueEDdiQrjSNE01/EfeHy5AHX1+1ZmerEshmtSCHkPN5aEkfV03xeDnRreE78gHeLsCOIm6MKLQz9Suqycu2Tp4/EAxJ/ryK3s4RHSWY9Xx7/9lrhogKWdH0kB/MJT/HqW6KlF2Et+cGJe1JWI8liAYMLXiLd0c9IkNknw0CiDqp3/z3DMzfq9wokyj9b4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znLPrhISL+BRItr0eTMnw0fYKvVmvSqavBuyeJ/Ahzs=;
 b=ndr512Ck/fCWDIedRWUZBLSfKOK9CiHi1Qto0AiQ3nxVoB4BQNLJqlEPd01XZbGE2VVWt/FLRwrC3jzChghaiN3kP4Dvq7PCtpUQ2zDNvuxPQYBh8mRpExOxtPtEnuFX3vYcJVyDGXnufJ2Os8d9mpNYfxt6HZVFsQ2Xis0Sh1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 SG2PR02MB4314.apcprd02.prod.outlook.com (2603:1096:0:c::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.13; Sun, 4 Jun 2023 03:57:07 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::1bc4:fbb5:b757:83ee]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::1bc4:fbb5:b757:83ee%5]) with mapi id 15.20.6477.013; Sun, 4 Jun 2023
 03:57:07 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun,  4 Jun 2023 11:56:23 +0800
Message-Id: <20230604035623.58572-2-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <e49e9c41-19c7-7cc5-897e-136ebc027f3e@kernel.org>
References: <e49e9c41-19c7-7cc5-897e-136ebc027f3e@kernel.org>
X-ClientProxiedBy: SG2P153CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096::19) To
 SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|SG2PR02MB4314:EE_
X-MS-Office365-Filtering-Correlation-Id: 866a1aff-95b1-4fdc-453a-08db64afc3f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jjz/Ga/EP3uV/xfR8rAauU8Ia198v75X6WmCuE5KkobA0tRCtR+K/BRhppRAL2EQQ4kDZPmk8pKGhaKkBG6/DZvkXwcOb/6x3mZGi1DHCv9DL7ssOcSbqdPIrGZls0iJdbgxn/FYErRWWuSH8xBcNYFQ3ABr4czvXs96887/mhEAPe67RjLLw0k6a5zgEeO9AMkN2ODZAYUiGbW9yiTE3Dio4f/fcmLBLmx9adV6RtUOE59StqYSVEjcRaNNBUhinBQ6C5qshPBGR3UJF5CvqpAly0cMBynUOxUf/IsvrRUcInv4A/cJX/eA85nJdMVTZoiWmYhwZ7bZOSAyLJ0Sh209eHRGTHzUkxCY5y1lbEvwHyzatUJIyX8adtBg6XmyZc8CepnsGrBeG6T7qU3uFGWzVdBEajS5ZAMMZkZG7RSs5wEVWb43yfDnWMaXdQW9BRJWuUo/+/oigGw4peGOXfV4Qr2o2qM2keouXC693jSPJy+dZ2OZD67Rtt3wqwU5x3KrQl+21irB81uGUuN/o4kPiOXKHNMg+Svj90lU+Uw76hqxMGlPijASI/gDylt6P5qHg13bVtMjF+oZx0ePtX4/l+EBbYU/SOrhLfCGFWpmO/B3Mnfi9rszN3G+UezD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199021)(38350700002)(478600001)(5660300002)(8936002)(8676002)(36756003)(86362001)(2906002)(66946007)(4326008)(66556008)(66476007)(316002)(38100700002)(41300700001)(83380400001)(6512007)(2616005)(6506007)(1076003)(26005)(186003)(107886003)(52116002)(6486002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tu5IecQdHUubaS3NbcUHz6EfaQNU2nv6Se54tN1t5yD3a3oVBPCKPB7PmGeb?=
 =?us-ascii?Q?gg0P0YlIgzTQhstEDo2WNYNZJ8NhTrHtmvWzTvf9HRCK9nfaZVYFzQZ8AglL?=
 =?us-ascii?Q?nI8AZSEFpVGObF3Cr41zU6x5byQGQu3NEsz5yC3Oy7rHHvHG+NVAyXPLyuYv?=
 =?us-ascii?Q?Gmdz9Au94jImBPwF6/qUcQoWBUt6imkuLJmvFxceyxrQneA0r5snMBIWz31l?=
 =?us-ascii?Q?oYhg+DuW1aSDRg8xhbgp+vY5nidwu8dWfA1uwoFRKuCar8DGrPbPvwClpODz?=
 =?us-ascii?Q?KPZL2L4uDq0bu/kiiVNIUw9I3OoalUh0w6HCS5izXmQp7kIV/wcRMzSleLQP?=
 =?us-ascii?Q?3BQM7yKcji77DWnri+vPEXXLJQXflTUCEbqGE+H6lOtzS7atkv/80y9qMgun?=
 =?us-ascii?Q?gTYG6mNGT4TrMLrVtkTHr0680HDERgLJ1lP+2juldnnn2et+hvnojbczACnx?=
 =?us-ascii?Q?ec7VuQ59NPeh2C6HIroNWAlbVHg7xL210zR4PjldPoeFaSnKqZQiMD0u/VcR?=
 =?us-ascii?Q?BfV2o1sJTuAX07Sg8xkZ5P8693f1I0eIPIDik6w55tcLXzWk7LMLDkG/zjAC?=
 =?us-ascii?Q?FgsNWj9JfSwpDw5IP0c+HPr/f8x+Cij+Wsge21rCDzmPrAvPY5O+yhrV3JpC?=
 =?us-ascii?Q?CzRPeYjWyf71P9Btncy1SadsIh3VtVUQ72MsSCtfD840X1UoMbF5MoSZVQ2K?=
 =?us-ascii?Q?3/AllcLnYpHKGnBDlKsZxqHxvGMUq7HGhgMZc+Gf3F2frreNWPc45qxpuXpH?=
 =?us-ascii?Q?IsUDgBbKWaQR8TSTkArWErjVVxE4nUpZhnUeToX7JQMSfbRl1zDFflgZeipF?=
 =?us-ascii?Q?7a67RellCvgXPAE6sVXn7h65QZCgqG9FxpjN0w7sg+jo91h+FLIAB8gOvPH7?=
 =?us-ascii?Q?rYBz+bd0fKHkYrn3ZQYX967ObdsJG8cAPkC+y9MGK8Ba3Xxok7jDlN6Elp/c?=
 =?us-ascii?Q?zZrjNHeqwR8B6xpbCkkyXpParaEkGsA8H2Wvv0WWCVeA+vdvR7651rNcQqqh?=
 =?us-ascii?Q?T1JXz/62d3tO6eHmOZx78hrLxAYa0dB0nzUMTJnMauwJmvcb7d3H2KlK7lOT?=
 =?us-ascii?Q?ME3HYPH7ezLL/DF22z8cdsl8RCNlVaaGVlBaBhF5rGxTPACYQDto2V+ND3aM?=
 =?us-ascii?Q?9O3FUjmDIvTyJtMj+o8aosztHCfge6jJtJSHphyMBfvG3zzVmXviBhK5mZiP?=
 =?us-ascii?Q?2DL93PYhhTzFg++rF6uBPKP0IxuoRpFgWZAxwcfLofYtKQOkOU/uoZwTeK30?=
 =?us-ascii?Q?NXLCXNzHAGI23ZdBCzYDH/xdpRSMv6O28+PbaSO58sVQ4qn4tXWs9CW59gVA?=
 =?us-ascii?Q?ZRrlitFPN2mP6k48/iholXXWBy6It1gUAGsV7jD5QfZdsoLbtyI3IQMY7Bhe?=
 =?us-ascii?Q?N533fbIma0+6XYaSzMF+DHv62xocaYpwCd6OOLkUEp+2Uw1Ew0H3jPrVWbI7?=
 =?us-ascii?Q?UICXmi2INflsg9hmDo5zyPoxzSY3zuOYQX62K724x1qK+KUJ1RZnnjViRVyY?=
 =?us-ascii?Q?AaqdGkkg8HwRxPVdqm8ntUWwmI8Dm14OhFzING9euLyMBo9vaxBKhFjljr4h?=
 =?us-ascii?Q?+A1BR79FfTAevyf/ALDcRZ6TWbpQ+98n8m8kF7X/?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 866a1aff-95b1-4fdc-453a-08db64afc3f8
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2023 03:57:07.4368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpTOkt6ocT9pvTfdEjo5Y2qSlt+3Xq12lIHD4K8fw6szkB4Jwrv8ayT/Ldki62jBe8uLINlujsaYN/GhwqYVNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB4314
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert old compression ioctls to get extra attr ioctls.
 Signed-off-by:
 Sheng Yong <shengyong@oppo.com> --- tools/f2fs_io/f2fs_io.c | 25
 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q5err-0000P8-8m
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs_io: convert compression ioctls to
 [get|set]_attr
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert old compression ioctls to get extra attr ioctls.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 tools/f2fs_io/f2fs_io.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 70e0347..f6e6057 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1012,7 +1012,9 @@ static void do_copy(int argc, char **argv, const struct cmd_desc *cmd)
 
 static void do_get_cblocks(int argc, char **argv, const struct cmd_desc *cmd)
 {
-	unsigned long long blkcnt;
+	struct f2fs_extra_attr attr = {
+		.field = F2FS_EXTRA_ATTR_COMPR_BLOCKS,
+	};
 	int ret, fd;
 
 	if (argc != 2) {
@@ -1023,11 +1025,11 @@ static void do_get_cblocks(int argc, char **argv, const struct cmd_desc *cmd)
 
 	fd = xopen(argv[1], O_RDONLY, 0);
 
-	ret = ioctl(fd, F2FS_IOC_GET_COMPRESS_BLOCKS, &blkcnt);
+	ret = ioctl(fd, F2FS_IOC_GET_EXTRA_ATTR, &attr);
 	if (ret < 0)
 		die_errno("F2FS_IOC_GET_COMPRESS_BLOCKS failed");
 
-	printf("%llu\n", blkcnt);
+	printf("%llu\n", (unsigned long long)attr.attr);
 
 	exit(0);
 }
@@ -1090,6 +1092,7 @@ static void do_reserve_cblocks(int argc, char **argv, const struct cmd_desc *cmd
 
 static void do_get_coption(int argc, char **argv, const struct cmd_desc *cmd)
 {
+	struct f2fs_extra_attr attr = {0};
 	struct f2fs_comp_option option;
 	int ret, fd;
 
@@ -1099,11 +1102,15 @@ static void do_get_coption(int argc, char **argv, const struct cmd_desc *cmd)
 		exit(1);
 	}
 
+	attr.field = F2FS_EXTRA_ATTR_COMPR_OPTION;
+	attr.attr_size = sizeof(option);
+	attr.attr = (unsigned long)&option;
+
 	fd = xopen(argv[1], O_RDONLY, 0);
 
-	ret = ioctl(fd, F2FS_IOC_GET_COMPRESS_OPTION, &option);
+	ret = ioctl(fd, F2FS_IOC_GET_EXTRA_ATTR, &attr);
 	if (ret < 0)
-		die_errno("F2FS_IOC_GET_COMPRESS_OPTION failed");
+		die_errno("F2FS_IOC_GET_EXTRA_ATTR failed");
 
 	printf("compression algorithm:%u\n", option.algorithm);
 	printf("compression cluster log size:%u\n", option.log_cluster_size);
@@ -1119,6 +1126,7 @@ static void do_get_coption(int argc, char **argv, const struct cmd_desc *cmd)
 
 static void do_set_coption(int argc, char **argv, const struct cmd_desc *cmd)
 {
+	struct f2fs_extra_attr attr = {0};
 	struct f2fs_comp_option option;
 	int fd, ret;
 
@@ -1130,12 +1138,15 @@ static void do_set_coption(int argc, char **argv, const struct cmd_desc *cmd)
 
 	option.algorithm = atoi(argv[1]);
 	option.log_cluster_size = atoi(argv[2]);
+	attr.field = F2FS_EXTRA_ATTR_COMPR_OPTION;
+	attr.attr_size = sizeof(option);
+	attr.attr = (unsigned long)&option;
 
 	fd = xopen(argv[3], O_WRONLY, 0);
 
-	ret = ioctl(fd, F2FS_IOC_SET_COMPRESS_OPTION, &option);
+	ret = ioctl(fd, F2FS_IOC_SET_EXTRA_ATTR, &attr);
 	if (ret < 0)
-		die_errno("F2FS_IOC_SET_COMPRESS_OPTION failed");
+		die_errno("F2FS_IOC_SET_EXTRA_ATTR failed");
 
 	printf("set compression option: algorithm=%u, log_cluster_size=%u\n",
 			option.algorithm, option.log_cluster_size);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
