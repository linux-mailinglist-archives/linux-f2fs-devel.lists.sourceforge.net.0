Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C5A590B91
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Aug 2022 07:39:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oMNOd-0000SD-Of;
	Fri, 12 Aug 2022 05:39:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guoweichao@oppo.com>) id 1oMNOc-0000S7-7k
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Aug 2022 05:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FlHmyTfV+bXZsXtLtwiXGTmTlGPRpEnszpZfPlCnGDM=; b=Xq6cVGz39YPlDCN9IhWTetr7FL
 +FMvnCtfuMb10c+4rcRq8wOAlqZLJXyyIcX0lr0RCFKcUKIggKp9xR3YtKqobRrcdzGxkOsUsNVHK
 2OOT3jzEb+ftCgYSfZQvjaxxKlPx/EFSCcS9P/ymVWenzDHTSJtsTdBCCtSsP4FyVhOw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FlHmyTfV+bXZsXtLtwiXGTmTlGPRpEnszpZfPlCnGDM=; b=g
 cpvGkbqO621w3+k/O1U8zWlSmmYED415sOq4nHNftBYVLL9G9csnlbOigRk+HFZmVg/uB8jvSg4aQ
 zQkgm++TWfeHjiJy1WrCc3tc0xysyJBamhilvCQvxnS2I/lLddAH+8Sb/a2EMiRXABYzq9snYZoqx
 aOco6tew5zK/9FZI=;
Received: from mail-psaapc01on2067.outbound.protection.outlook.com
 ([40.107.255.67] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oMNOP-0007zX-JI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Aug 2022 05:39:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8A6D9szxu5pkDwgXok9fGXLJBGjBVCireW0IfvAafzhTApjNkB159oUkFXrXohcDKzKXtG/VZBmrRLkc3bCwa/hU0IUBFIc//bNl1gF6Iws8BJ6qq2Sjsyp5UeuX0e8LSwcnA/XwHAw006nFGGtU62esdXtab+w7URi4mM/PF+LXusgZed4Yy+Cs7eWmwtgqgPKdrmBq0PVDrq1BG9RsFNn6nh1Bt03YSKGSsQL5s27CwGdyZn8LIyhZ3rMyZqJmzp9sR+BjBkxfXvXB/pMUFNlTGalniD1EcYUhgajHYl9LG7uI1fS8KFVE3qWS31qDkgkPMgbo0j+WchV1fKjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlHmyTfV+bXZsXtLtwiXGTmTlGPRpEnszpZfPlCnGDM=;
 b=g3H15NQsn1fW02EJp4dHuAMri/oS5h5B+hwRP9ZeIqcq6pH8IEFPx34BGsFw3S0tuNOQBhuPvSuc6hCXkMQshiPC1nB5okThEWQNtitKQHTtbUhxVp9XrGvpvc7AZNoip0i1UXp+/jlYRId9SH9wjp6XL+wpYq7cvuv3wvOJpye2j3Uc8Z4eVIvWos5lnJyy3pCijPuhTP3joAq7yKMNFZxVT/n9Pg9fSx03yGnEFxOOhWg1CiM80rVoM6NSuCQeEE5rHkfXKi/gaTq11SfH88k/8wpcSJPsVilvWvyoZTzP7s+K3BwmPo/tC0E5Tfm1ytsqBLCEaqeaoYak9yx5Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlHmyTfV+bXZsXtLtwiXGTmTlGPRpEnszpZfPlCnGDM=;
 b=adFCOGGqoG2rM/v9GNjYb9TblhvjyJ7Wo8Esp5URg9AlGFbaUIpYh51QrukPur1sD4yrcc+jDA0xtd9J/jOXWHH7kTwdnQcjPld8XdMAgf0af2PFuKeiIbSVKy9Mo3jKlRJ3SdLTm/pVxm9HoM/r0cDiLVwYgaf1rSwj0/xQUJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB6118.apcprd02.prod.outlook.com (2603:1096:4:1f8::10)
 by TY0PR02MB6170.apcprd02.prod.outlook.com (2603:1096:400:278::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.25; Fri, 12 Aug
 2022 05:24:30 +0000
Received: from SI2PR02MB6118.apcprd02.prod.outlook.com
 ([fe80::2948:e45:ee81:63f]) by SI2PR02MB6118.apcprd02.prod.outlook.com
 ([fe80::2948:e45:ee81:63f%7]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 05:24:29 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 12 Aug 2022 13:23:45 +0800
Message-Id: <1660281825-9623-1-git-send-email-guoweichao@oppo.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SI2P153CA0027.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::22) To SI2PR02MB6118.apcprd02.prod.outlook.com
 (2603:1096:4:1f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5163fd5e-142b-4b9d-672d-08da7c22ee2a
X-MS-TrafficTypeDiagnostic: TY0PR02MB6170:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4efpJoOtEo8IhbpyYXUqBgPpCaop8Ds4qEan172iObX6Nz5oLDfqU/WqqR8xCjJrcDNElQErO1PbUa8k5muz4lczoD35//LeQUpweKh51MQJv/480h14+7JMQsJEDPTYDzuc3YRnPro8SQahMKZ/TA6hR1j13FDyIAeGZ1TIW1zsBpKRodOayDq8s2jMbAci7spvLLEfg9Ryr5RK8wQLpMBwO0R+ZOEO+4YPqo+N2eaCw1/yOCkXmxVT//U/Bmjwf1j/ULpOD2wft5E/U95AnuN6mClMYa/9KT4O2oK/lQVG0GreiEJgAyY/6+l4qDRHJTC5FgX1cN+RAkEbgnlrYDKYwaa9VJLNfnHnvgAZl1kf2lHs8/uaDVGPTFTCOyadbUacwJCDlh+odMICfZCkyuJjO1IQNx+dvRdxL0F/7L1IEvu/RCQTlTIwjGhqdUBp6rtg2WE+Q1TgawbrGXykdTzNNxcdXHFKvo2Snh585L4HOlDHY4akgEmjBrlM0JMs+cu2uNKTt4Li3NGiXaj+eRgm/HcV8dDe1yFrIPsMvrB9jtmICBMNFr1sd/9P3dTRuEGFAJeK3xvk/klZ4d4vSjE1zYMpHm1lZXGlWUW0M355cGUWdJSotYAopUr6vlz3qnq/RQ/9wcVLqzZEEynWkgMpNaC7ljDbi5CWbo2tvwkzoFvNhn5iBkWi3CwHqyvr06NhFmB7r1XT5NlXU4bnR1Sfpi9cIAFwcNKN4fbb5MuGa6ajeo1dWjRt7sdj4iMQKP/7KFz/YFQCKz9ycGOfhZYHGoGQFSWzE/KDD50XTj4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB6118.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(38100700002)(8936002)(38350700002)(478600001)(2616005)(5660300002)(107886003)(186003)(6486002)(316002)(36756003)(52116002)(2906002)(41300700001)(86362001)(6506007)(83380400001)(26005)(4326008)(6512007)(8676002)(66946007)(66556008)(66476007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cKGHLEWDu1E1CqGomFpqrVEItwkwLBT7WKcZf6/9K8nhOUpq80Zff0zt0BHj?=
 =?us-ascii?Q?smU3W1/iCyR6FVpKEXYsw5rclV60wP1JwxvF8hFXzwsH+slvgCNIwMZ8LWTt?=
 =?us-ascii?Q?khOJjcU1jFqollsqJW1TvQ8nuAbpm24uaN797ONKZkbrl5e/zGhkg9BJp9U8?=
 =?us-ascii?Q?dioaiQWhi0TUCOLYwxVzhLZ1v9zhDe2MKsyosz1D6+VfpwYKP179tK2bGKuZ?=
 =?us-ascii?Q?1LoUtvBSjrm/dAaa7e8G4wg29ZBwbLFfyMOQEkQHQSZFRsHLpqcU0hAYO3lC?=
 =?us-ascii?Q?PJhoRYvWldWzv3ftoj/Q0Dtgm50Yn1/zuqxFeFB0t+VWCtR0Tk23Ly6bP6u+?=
 =?us-ascii?Q?cPMGCTypWc0pHVjmG6eDKv7Afw4pQbppJoqftDo1ZsmpJvApJNEH1VSACuNI?=
 =?us-ascii?Q?2GYlmW2wJjw6ptULG7wmMW1tWRQm66Wrb6rnrWlM7GKFGDO76TK6q0vpZW7z?=
 =?us-ascii?Q?Tx+H8lqQoRgIO/PvVunEIwd1F9rwIal3x17v52kkIr0/OGF24hpG6mMzVqp3?=
 =?us-ascii?Q?Kx0BEzHwiZ1SzQPezc/BUY1Sg3ueprG3iJRllmE3ppyKwZObvZlQ71ug3/ij?=
 =?us-ascii?Q?LxEDPAQBPw78fK+eMOoyQtK70Iu2UOy+nQ2Gc70HcSLRI8g0cSqWTea3o0jT?=
 =?us-ascii?Q?SWek5ClFFFLdy+FAu08cIIWqmU0NRPttu9nH3DFXE6yygS5Yk/oqceNPrcW5?=
 =?us-ascii?Q?9CgrCQXvUXYVuTYzEFX8McsDe4OXSrKCAkJzJ59X/sHGIw8IUJFVACjTD2Av?=
 =?us-ascii?Q?cjDLa46VTeqx1J/vgbk0yfRoxF1FhC2Xj/gf2BK4Bo3OH29g/j36pd9y0qEK?=
 =?us-ascii?Q?M3sZRN7T+nENZMAhc1lNxkTdsNmDzPrBNyiatGDkP5uEiOegV7bgM8khCgb1?=
 =?us-ascii?Q?TRjs96O6ITWMh8ZypCteeiOAnjgVtB3P7aypKWfZzoO+PSrGBy8EguIUOLVc?=
 =?us-ascii?Q?InA4hXKy1FX2Y+XI8GLLyEXDQ4XTidooVMQnMpC10A1q/xkgTRhp5C/RJgiO?=
 =?us-ascii?Q?YmtSFEqJmt/6vHo9cgwhREr14G5GkJjZRZ/DLRATe0zwPpBb6u2Rn5WYbOR8?=
 =?us-ascii?Q?LL2mNPkWEcHNdPBSxR6pkQH7uTaB2sMkYt5Ev0Uuk0tp6VkeQDlXuKUJ1kPL?=
 =?us-ascii?Q?3utETA3f7pFIV56VbGHp32LTRgXCHzohn4+GQQnvsjJ4vCljTauNfcLjD/CN?=
 =?us-ascii?Q?v5s73ZhREGLc5jGVhgaPFMochJK2HNdrMi98IXvaVNp8wE21okiXDpSIKBSF?=
 =?us-ascii?Q?WyNc1ns8H4+8m39onytFVb1dSBZpfQ9uSxd0aZrtaVb98GZkIyT0h409xgtL?=
 =?us-ascii?Q?aKF48macz68k/M0WOPhuayyPB95nXDroqK6DNnQqQP33zgUUKIuwuVZ/GThO?=
 =?us-ascii?Q?WYp/0FOsPRyY9NUiTUqLe03fotJhbyOkkzgvJfLaNIA9kkPjrLv+AqAHQFg6?=
 =?us-ascii?Q?wBAosGMRp1n0Zii4NnocmOU/mBvk4JqFgBXMqDp9ZbIF9lQt71evNGeAqs6z?=
 =?us-ascii?Q?F57Cfnj4eUxwE3gd97q6nteR84zoz4WoTH6n/kWpOZhCmLk8guOr8qfLFxWp?=
 =?us-ascii?Q?3Ov1oMM3wBLdmBtaPEm3aSEMeiF2YBK7jHP3KRHX7KlayFEpPA9g5cEkr/eq?=
 =?us-ascii?Q?nQ=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5163fd5e-142b-4b9d-672d-08da7c22ee2a
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB6118.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 05:24:29.4722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQH2wOc9GQ/qBbq3lah0nNAE1p5RoTZw3Ms/0ZjL+iPkWhitwl/dVEFEASSbaOEeHT84E+QxqwC/hpkHJ98Z3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6170
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  We now use walltime for monthly period check. However the
 walltime is: * unstable(timestamp register reset) and settable(modified by
 user) * unreasonable(e.g: device power-off for one month, no data c [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oMNOP-0007zX-JI
Subject: [f2fs-dev] [PATCH] fsck.f2fs: use elapsed_time in checkpoint for
 period check
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
From: Weichao Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Weichao Guo <guoweichao@oppo.com>
Cc: zhangshiming@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We now use walltime for monthly period check. However the walltime is:
* unstable(timestamp register reset) and settable(modified by user)
* unreasonable(e.g: device power-off for one month, no data changed)

When the walltime changes to the past before one month or the future
after one month, the period check in next fsck will fail to skip or
start a full scan. So, let's use the elapsed_time in checkpoint as
current time for period check.

Signed-off-by: Weichao Guo <guoweichao@oppo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index e2caac0..a34308e 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -939,6 +939,7 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 {
 	char buf[F2FS_BLKSIZE];
+	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
 
 	sbi->raw_super = malloc(sizeof(struct f2fs_super_block));
 	if (!sbi->raw_super)
@@ -980,14 +981,11 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 		}
 #else
 		if (!c.no_kernel_check) {
-			struct timespec t;
 			u32 prev_time, cur_time, time_diff;
 			__le32 *ver_ts_ptr = (__le32 *)(sbi->raw_super->version
 						+ VERSION_NAME_LEN);
 
-			t.tv_sec = t.tv_nsec = 0;
-			clock_gettime(CLOCK_REALTIME, &t);
-			cur_time = (u32)t.tv_sec;
+			cur_time = (u32)get_cp(elapsed_time);
 			prev_time = le32_to_cpu(*ver_ts_ptr);
 
 			MSG(0, "Info: version timestamp cur: %u, prev: %u\n",
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
