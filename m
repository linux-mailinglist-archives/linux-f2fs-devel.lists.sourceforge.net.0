Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFDA625833
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Nov 2022 11:25:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otRDu-0007Oe-6W;
	Fri, 11 Nov 2022 10:25:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1otRDQ-0007O0-5y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 10:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=shef+udH1+23RYxNjD9guO1Ey2dJ6Hr/P05JP2ik1qQ=; b=Yf4fv3ZIwbFZW3oW76jgXDZEuC
 XH4C0yHUvd+YJ425r965OSJTHiOpaxZIqyKVbKltxsQ/Bng0ENoELJaR+ZT9ufQiM3680f/HJ2UuG
 n+X+KU+DimRz/dgiM7K4rd7+ol4GPgGuPtEMcdOu7PjrGSfwRO5e/v8ieF4YDOow7E6s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=shef+udH1+23RYxNjD9guO1Ey2dJ6Hr/P05JP2ik1qQ=; b=YrOEnFHYZJw4IBtnMlDdbJBODN
 dTU3fA7SjDD5fTkGck7Yg6QliVMnYakH/boS+6p9JcVMSvEJamyDZ9HKtuWjjimRs8CqVoq8t1kyn
 NhaHgKqdh4i23GG/w1poEiXAG6nc1MuQ1kN6SvlF9K15XIZDU3IpxHBJV/MciTMGa714=;
Received: from mail-psaapc01on2067.outbound.protection.outlook.com
 ([40.107.255.67] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1otRDJ-0007ed-AG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 10:24:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpR8QGh3eEc47M8LpxwZdqf5ukmHcz9cHCAUnGdUnlWDaSfSVFqQB77t7Ve0r0hnF76pYBYI/zLTbghGlNlvmWX3lkh+SV6GS6MgbtwZc5NGg5kVbqKsC2mJ6u2+tYUX+i8wqEB2sX+Z7Vq2TX2lPj1SuYnX5MYIzZ884NwwDWIxdBTI9Feb5ANp10XObBGocJzaFUkBXhN06UqEYGi7BGDM/8yYKmUtedJvh7WXi4Sd8+uFP0IiQU6NIzd4nRNIcgO90hXRWHtix0aHbTOASA5lLpAUaWnj7MCNzDM+WK5otCmM9Hj5ARDmB0xGK+WxeVXMdyUxPLg0k/lMq5Gw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shef+udH1+23RYxNjD9guO1Ey2dJ6Hr/P05JP2ik1qQ=;
 b=K9RGKp6ahLSBSXkvYMP0DIw60aq8894Hzo8RqRv1bZ1vKuKqDGp081xMcSuaQNgnG0ngSdsq0yLwxLP8Sp/B9UVhOzZCMFofGvFBNiA3Z08d57tk2W1ptO40FSl0BDWtqNFo25Zh/ynOC3wr7j3lKHlwXioHEaE3dKRCVvUxNFdqR6qXWjh5beoIBzTz2hGOjNb1WsYKm5XSLeymm/rVew4O3sNsfxB+ufFt71JwtiJPV27VGaMiiRcbF6umOebr6ta1B9Qf0ROgj6uQQcxgEZOJYMK54VzHmFKeFzZgKRJjP/z+6jVF7WKS96wIlV6B6IxAPkV6xlu2pWte0d5ugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shef+udH1+23RYxNjD9guO1Ey2dJ6Hr/P05JP2ik1qQ=;
 b=c7uk3IW4nqi7RZj4g10AC3cU6bwUTiNWQLt4d+w78Ju0kDX6CoJ90D3m+/UBuigw3LGGBRkhtFEsgwxEVf1Smsuu8oPK3pI0mbT/Dp6ggXy0BL6g18niX0+bG1JEoSvdrnUK4z9iMhZOE7TNRfOKHRZqHwOJKk8PbTi24Uy1urc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 SG2PR02MB5901.apcprd02.prod.outlook.com (2603:1096:4:1d2::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.27; Fri, 11 Nov 2022 10:08:58 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::2954:8e56:dcd1:452c]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::2954:8e56:dcd1:452c%3]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 10:08:58 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 11 Nov 2022 18:08:30 +0800
Message-Id: <20221111100830.953733-2-shengyong@oppo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111100830.953733-1-shengyong@oppo.com>
References: <20221111100830.953733-1-shengyong@oppo.com>
X-ClientProxiedBy: TYAPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::27) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|SG2PR02MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: d5863c15-af71-428b-1134-08dac3ccbfa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YG6ZgsYbBuHgd7WV3dQXvyb9M56o8pGGPQD0Dn3Be0UouybyrbLqb5jppWrT10w7oeyY0ooqXUfwXiuEThF3r1SJyX2Khd+QF8NurcCjet2MDUZDM69TOC1WljC7zx6YxpTR5OfumzAgc3vMe9+hBilsP2rY0T0BjTH5+8OOqqHZpEWiBHJ7stsmH0T13oRC4JYBS/B2IaVhZUNnvZehnZGb1JA0mdGyjtMlkNuN5xTH0m+6Hana0LSSIWLFJoMJKC0ee5aH2iiIxbnCdrStn8/pS/EzH/Ya5GdYxapclPmhkrrNmXR6vt2Ugw2G+CHURWeWjuCioZaG45dF+M82JjlepIUCbHEjRrysEyXvO8MDKbDHmao0w/ZiIt4YZ9KRCTPoC/X9bnlZBCgavYYQFLW43raFwT+4pvhHtkZtVd9VkydBoK0q+LWqIiCxsuCdtxF+R6gBUqQ0JOjRoZ1UzgnPJ7ET6OLyf71yX30fgo7S7KDXomnI8fMM4T/1NktE1p0ue8ES3H1zE7NwMxzpb3VDfR0mirkPOUIr9z0z9mmG66c4Swt2dr/I35oPbTd2AVpi7Q9JpgW9UorW3SJ0wyRoXRc5cXlGWv+V1rugvEbEyK2nV244ArqjWWhTTT7Xdhqhyx/XiDTEYwZiTjgsssm5DxQ86THt/ux2082I20yp8+MKwh7rp4kwO4zLtxCbyTylCHexe33ovqzPrSsf9uZHy02sdKTqcDFa/PtmpYVSuWp4jF/lyKnJSAU6dQD6koC02HG1oZuNpp5vfK0I6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199015)(36756003)(38350700002)(6512007)(83380400001)(86362001)(478600001)(6486002)(186003)(2906002)(38100700002)(1076003)(52116002)(26005)(6506007)(8936002)(4326008)(107886003)(66946007)(5660300002)(6666004)(316002)(66556008)(41300700001)(2616005)(66476007)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7zeBI5g3YeQPF4DF/RaXB4y48FMDk5xXozC+XwjzLChbomAYQ1vbdxHhbliD?=
 =?us-ascii?Q?d/KO2/JHeCfilj5JsYtIYDYoJNeUKmV/IOv89m82tx4wdWzzYN9ovkWKS2k9?=
 =?us-ascii?Q?AiYiBJApzVA1xsC5UlgRLzI82bXWL3oAizxRQn7y1z5eCxnsMbX+bfJq50u7?=
 =?us-ascii?Q?XTFAUvI10j1eyWxOw5YkgD+sAzdZk13lTo6umA8AUt5gdCF73e+adqVZb1kU?=
 =?us-ascii?Q?rO2yV3bHCYSOkRfpHFm1wfAEceFKrrcgrZ/ou0IIfTkfgneAHu2SPHM7ZRY3?=
 =?us-ascii?Q?b2zrGwJarl50l5mxVjV2XC3ch81r1cdXqemUe1Jgryc6bdJ7ljwcw+1f9gfS?=
 =?us-ascii?Q?yuoNjYHbjNs1tpE03xpQyICAvm63aGT0S92dIWEtcfUqpEYhnyU1+MO3RC6F?=
 =?us-ascii?Q?5crZ/1t33h+RW4hePKMeA1g9etpUjrCzDDx2icyjw1hV+Hp7MfMr2DewWUH8?=
 =?us-ascii?Q?bEuvgnIpOXqqYqZDd09aHMrfoa0r6PH9y/sFp4Ch2CkHh502GoCsrihN2Ap3?=
 =?us-ascii?Q?wIrf5fi1HKqQlcFUd5s8S1/OMg0ITzlkzUrWgnnwLyg28D4alp2Oqdp+ORlq?=
 =?us-ascii?Q?UsoU0dGd1vjKONFi6zeIFx4TfXC6phYeukrAZEFHqMJzzfkjfmOwFnGKiKUJ?=
 =?us-ascii?Q?UFWkkrgUw/xvaSx499mDhjRyRYSE16k3vscRqpSy+Z9llcH7hcv8KiwNwaQw?=
 =?us-ascii?Q?iUQg1XwY09slPDsizbCyQJFC2YleGzkr7FhImY42Yp20YqFc+wHvZPiGzXs9?=
 =?us-ascii?Q?vvUKIn7xgpJ6ZRBzmjbvuxRzfrrHMRjfbwq6IQm+xeJ2Lx542iMDnPLcHZaV?=
 =?us-ascii?Q?iQE8fJGnhDmFnmOTbCwYAS5SEgq2s2lahyTpybR6EXKXYzHHrOl7BlkWINKR?=
 =?us-ascii?Q?2nNE6lwqpCDi2pY472Tppko5hT7iS3FogFnIlh9UqbQ77Hjcq3qmtMoZc3U6?=
 =?us-ascii?Q?4TsJBLVTXaWVP+mozoSau3yCx6t92smko8JdhOJhKrIL9oI71NxihqppMU6f?=
 =?us-ascii?Q?8WsY6QJzCdIqmTdD0UpZy9j8iWgNGCWX1j9QnmzZD2DccKlLIqaw5jR+WTU8?=
 =?us-ascii?Q?GVbd7iitThxZrxOv8nui872pGjzZj2BAaDRxh3M454N2CkQ3CsycjPMk9gtL?=
 =?us-ascii?Q?mZKm1yWTB/KIA18t1/+L9a3YqxK7Ea1xXllp7hYa85AAFt2GAB4Op3DUGSrC?=
 =?us-ascii?Q?Gr220pkctZC7jDQoAj4BwmyDYbQ5p+j6VZsTZdtDaI39TiFOmEPrv9d/wtfD?=
 =?us-ascii?Q?/hdzn9mGOV8c+MVp9Qh60lntXazNehWJ9CzCXhYsH83omj07sYMcYWJhlgdT?=
 =?us-ascii?Q?YrQ94s3Q/7Ppi6LY/tvY6JIcl7am22M206e3Rf7uOYEdepelBS2aRa640Tju?=
 =?us-ascii?Q?qlmaoJxCBOQxNK7YoQnTO2WuX0cQf6A/RF9XOAugMdkBW+dgPLsp1x0bx/me?=
 =?us-ascii?Q?dTWMkJU2FBTquHGt/+qIi9C64yqX46LSIC9ADisS6Z50adH7LH1AHFiK7XFh?=
 =?us-ascii?Q?VgkNv4vfMEEiE7ty/16M3KyT0qiKMIjPQK1ydlI2VfXaXkUtBcOqcPkF18qa?=
 =?us-ascii?Q?7DPCqknJanqH0LWt8s77n2u2ZgpZWj5FuY57cDZM?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5863c15-af71-428b-1134-08dac3ccbfa6
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:08:58.4922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQHIdZ2XP/W/pBENT11fEA535s5f9F1oy5pAQPyzcAYIeKbPhivUmpDH4nxmXVccTXSp+VDpnusRWC+dvMF/aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB5901
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since the file name has already passed to f2fs_new_inode(), 
 let's move set_file_temperature() into f2fs_new_inode(). Signed-off-by: Sheng
 Yong <shengyong@oppo.com> --- fs/f2fs/namei.c | 6 +++--- 1 file changed,
 3 insertions(+), 3 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1otRDJ-0007ed-AG
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: move set_file_temperature into
 f2fs_new_inode
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since the file name has already passed to f2fs_new_inode(), let's
move set_file_temperature() into f2fs_new_inode().

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/namei.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 36e251f438568..04bc7ec5e29e9 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -131,6 +131,9 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
 		set_inode_flag(inode, FI_INLINE_DATA);
 
+	if (name && !test_opt(sbi, DISABLE_EXT_IDENTIFY))
+		set_file_temperature(sbi, inode, name);
+
 	stat_inc_inline_xattr(inode);
 	stat_inc_inline_inode(inode);
 	stat_inc_inline_dir(inode);
@@ -357,9 +360,6 @@ static int f2fs_create(struct user_namespace *mnt_userns, struct inode *dir,
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
-	if (!test_opt(sbi, DISABLE_EXT_IDENTIFY))
-		set_file_temperature(sbi, inode, dentry->d_name.name);
-
 	inode->i_op = &f2fs_file_inode_operations;
 	inode->i_fop = &f2fs_file_operations;
 	inode->i_mapping->a_ops = &f2fs_dblock_aops;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
