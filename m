Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9C569980A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Feb 2023 15:56:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSfgk-0000e6-QI;
	Thu, 16 Feb 2023 14:56:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pSfgf-0000dy-52
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 14:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RQHbNpcMJh3MOvgeTQA8bvKfy6mnW3VY6ldmmLIrzys=; b=aQZiw+zzzuk0C4WH55EZnb/HqR
 o3QyXJA1BqZmsX0FfQh1TC/0yPRszgQ+1i3/muXBz7mgcnBAOndmDmEfk4hZajk/e1bdcWT83Wx2m
 7lvTxMC3gTvRHPCK6NDQcFcDn25Fo5+SFAFAzDA76sgG0zBh3wyS2CvB7kxQ9QCpRlFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RQHbNpcMJh3MOvgeTQA8bvKfy6mnW3VY6ldmmLIrzys=; b=Y
 P32YwVcyiDQNDzM+gr2vZ8qMdTjpg03tRY/3kpb5J4+MlAAnfRVrxarVYYsyA5JPj6/pOmwcKbGQR
 dpJaIFaJGfn7cD9DHScqQMVFtDZqSvTeCn7FyEJqMngDAMUosMhUYdZ6Pk7Ugrg3yb5L7xPz7Ekv4
 c5wLMYHapHqMCAPA=;
Received: from mail-sgaapc01on2102.outbound.protection.outlook.com
 ([40.107.215.102] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSfgZ-0002PB-33 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 14:56:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfCoRKDjNwZkf/AGFMA+ujEIbsb7Ry2/g0h/aRPpUdAnTCh8iDypIZGMuRTfZrjxbKwzs2h1uRON+wBy8/x8k3GNXlhqmomDULL7fVyb77u232+VVfE604C/4i9kuf2bYG7iBgvEJNSvZ4LClRbC3FRL6RJ7VhdhFflpjvgROVrxehCB0XV1NPNl1MEwlMEyVT3a6Q9gphatrl+LrW26BUcNQ+Pli96UM2Lyx98At8AxAqSBTQBWfSasW0NMv/viDzCmu/sSHukaKj7HwfiAySvc0ZUdPDVCT4uDfMe/hSfcPUpSoFSDzvO+B1K3pFew9z7kU9SH5Du/IcqcVfNO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQHbNpcMJh3MOvgeTQA8bvKfy6mnW3VY6ldmmLIrzys=;
 b=I/faMSVCveVUFG7fvyPR5JfpnK0F2ANGXeHdyD8/lNr4qHLe01cZjuVZi0f5M0be5uSuNk0T9ZPPKw6LA2DlkO6JVhNpddmO22Rrnrr48Hkxq+3+2CtXaP9s3k2Rn7qeDMCh2I8Kh1Nl28qUsN+cwaEJmjFs10u3f7LgKfhZhCB8cFggMt4R97mje25XJLykT2EAzYygAt4qgjlwM+16SsNFWYvWATaagUEPnlQneSur9APw8iFJA277sG5S57OC5xBr2Knq/E+dJJae02yqCq7fxjA/XP17E5f5eRBOvcIwgicWixh7C/w5P1LwydewTAoBav5tWObUUAZtftovbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQHbNpcMJh3MOvgeTQA8bvKfy6mnW3VY6ldmmLIrzys=;
 b=oIqLi+zceOLgnULKHul8WdVYGhKaOEduPCs8dUEZCucJNU4/BfmDbIL8OCn4G6SYvMr4vFUk9qsiEEQn9/ws8lHFPhGRPvZhV/lDsfqKaYgYf8i/vZkGCoNi3cG1MQZWSwBx/COIJ1nswVmH0jHB/v8UFnUrlut5CWkom+ekAmrKMykuDyBfzdqqGXSWzEKZSS0nPjC5M/fxJbR7tOuPQpgHGN/hD6qqXO/dR7EZ1y+/5DKOl7pDt3+M1MR6iqwkcgpn4AShj43Y8j+wDuE4SjTw4/h7v16tKcuLYbDMl/jlLXp1izWGtgBHpPzqDrAM7xZIvWNVBqLYuk83sh00mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by TY0PR06MB5104.apcprd06.prod.outlook.com (2603:1096:400:1b8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Thu, 16 Feb
 2023 14:56:27 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190%3]) with mapi id 15.20.6111.009; Thu, 16 Feb 2023
 14:56:27 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 16 Feb 2023 22:56:17 +0800
Message-Id: <20230216145617.27150-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:3:17::16) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|TY0PR06MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f12e81-288c-4cc1-e5bc-08db102dfab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 04ZdL2WpDA2+Ug8QhJTud4EhKc/iBp0JxHFapXne4at4ZQau6T7nSAyTGklpO+rh8QQ4lOl2GzCWQtEA+yQtA3fPd15B1Mi+3HurxKs+vNVsI319J+fs1Mt/vQ27f7XrBFgMvCOS3c+b17FxMotUdQLjt9YvOnnx80QxNuIyod+wrMMA64EcfOgZg1Lu14k9NH6gLoVsCWDQ4xl+D6tNWwUIfE1O6FsHy2qYTZHkUYMa40MEEEtGkVrfrGUbdjPxNhXRsdpflRjj5HbWYSGWn2xkdfy7hPjoKOQF9GEEocVK6dxd0QAl/XTcaxzH+p3b9qTIRrGODRkVy1AdHGHnLMdrGuuyf7iKT9/8r2dcsT48je7BiKkJSpH2rlqNBvEh0LyjG8pEMwrt5iAtlsDaEVuEMnAGWrJLZR/LP69GJNHgGGzn1zYREkSWdqnAHlGP4ihneNjThtJAidvYQWDuFUs3XH5hhv/aErEhas5etIDRLu4+8+cMDVaJ/uu334QupXp+N80VZ8RwAm+PIF6y/DhXT6lnrKhopmh+isJPOUIhmvtpZtVpXoz5cwUcnEfgHLtE10JaDwcBu9quXFcPppqn8i9NBrULAMEMpHiREBy/BqyzDJHdHe7rPMw6ZBzDbgyoY5bSeFTohL3vXqHEEAw2dhAS7PAMqI/E3P4ShKFTvvvR+m21DgoVLH8u5vK/s/r79HJ1e1Q0+8Gt3TWIrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199018)(107886003)(1076003)(186003)(26005)(6506007)(478600001)(6512007)(86362001)(6666004)(2616005)(6486002)(52116002)(83380400001)(316002)(66946007)(8936002)(5660300002)(8676002)(4326008)(66476007)(2906002)(66556008)(41300700001)(38100700002)(36756003)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nbGc5asf3DzXSnl4magDcosaKnPFvhXWqPWZgRoAH1Bcon9iE2JCr8V+lWkv?=
 =?us-ascii?Q?Lxc/1xJHDJbv5vR98Bii8BbiCpIMKDsn1z0s3OxuKcL8kDICs90h0d/Q05vv?=
 =?us-ascii?Q?5qE6yKDgDyLHOeropu0kaPbayGykpN/5KUtviCjBX+czO31rr3pK7e4WFdeF?=
 =?us-ascii?Q?x0fxo6DdxX7QFnBY/YSQ9tj35UG2BOlRx2A8CQf7kHpzbCJhxBZu40aIi4YA?=
 =?us-ascii?Q?9fnBQeU+m+tnO+q10xHddQ/B0p8V1xlPn42Rgryoq6z61NXGO8jc+ENKwVtq?=
 =?us-ascii?Q?7IGpAcsmgo/aoQE3tK3wjwloYoRacFODMlGRWWMCwTBevOmdtTCaklAtvVTn?=
 =?us-ascii?Q?dRFTALJPqcxj8vUvvtKIp/OOJrMIYZ+3fMUSJCq/NIK1m/mtvIEz3lqAyi8W?=
 =?us-ascii?Q?IyQbTVjL+CMSmGXsN1jRnDofO3CawBsgXFAq0unn4d5JLp6E4vBhWlZ7FE+T?=
 =?us-ascii?Q?p4SlHb+nj6tSmklgl/bhBLwGjA+FUk0wuLwSbw/VxyO0EpN0TG7SO0nslx8b?=
 =?us-ascii?Q?x+51KCnjSCiHn6xRD6X1gOeLsWTcf+4lE6ykNcFT9e3afEIIYIH+upqE/eex?=
 =?us-ascii?Q?BScePoP+Uf9dS9Y+r1YSX9dAF7wZc9dMnmYrmPMF3ukPNS9D/zW27qnQFyR4?=
 =?us-ascii?Q?nKbxMMVKI2TUp+iSVCAlbH1410YtWA/xkH7PAA9A/giwgCe3t1wgF7yBcVDk?=
 =?us-ascii?Q?qs5CLO46dbY70IXujjZ5/vMU2HV+eh6tV/2KcjAHvlckHiV7hKCZH9fiDOB3?=
 =?us-ascii?Q?z9ht8lQIVG+USchbGLNdu5qLsosS31LVx4geFzFFR1+H33YldzjBwyLSSD7w?=
 =?us-ascii?Q?xVtj1j1z8RyjReLI4LX5HBZdx7XUB4EmhQWYo4kDM6egaqjLBLjkvEf+KYTJ?=
 =?us-ascii?Q?qu9k5D8cz4WR3SEfxmLEhAPQF66sZs1YZXdnLDrQGSAGsr76rEi4655KlX47?=
 =?us-ascii?Q?3EssA9kr21Aas/VN7tZywOafEuKCgCYxuodPNT9k+3uJzM7Tyk3uAK2gV7+A?=
 =?us-ascii?Q?ck4+vwDSYiEdnznLPmjHqJqogGeC4PsDwrBJcEcZBmj1N6VmCBfAqYgLF+2d?=
 =?us-ascii?Q?5/2xrI5BqJ9L4cmbW6h/Il9OEudfaBvIhD3ML6OTqmjR9n+/MYZaY3j51j5l?=
 =?us-ascii?Q?iPn/OxXCqRAm0Yf35TCJy6EC+Rgapkzy/C5aB0xHXbMTPEhW/4JZSSmOScs1?=
 =?us-ascii?Q?D87YOCWXhbPn/mvFz5fUVTHSYaYT8u/hSmeVCDx3j0KlDGp5MqGkuwagAoOH?=
 =?us-ascii?Q?8H+E50GnAHOjDUutbzQLUBYDRD6frmM0Ob6dOrxHVVFDDhwp42ULjQVhbb0J?=
 =?us-ascii?Q?OzZgOcBrBPIKB74KAXaAZztECyYcDQQm1rnUUdTOZAG7gNDQ798hSGViyAVk?=
 =?us-ascii?Q?4KdIu0KctnUONVVqJMyG79oen41Gh97sQ34SjDHJZoTY5F/mu3IF4s0OwvmI?=
 =?us-ascii?Q?tUhK1/DvP1iOOgm5mZh9+4Jk4u7Q1dq/H3jdljyQGhmDZR4sFcPOub7YUQfr?=
 =?us-ascii?Q?R/iD9mFDSO4qQQ7nNKQhG3vwDKO8MerOd8Ji2L9WQgmPdZGZTQmYS8LGIAd5?=
 =?us-ascii?Q?BD8fJXYw5LDYVl3US3M8yfrTff2KH+Tjd4qhrZ8G?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f12e81-288c-4cc1-e5bc-08db102dfab1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:56:27.0167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Mko74GjDBXDXIcxdMPaTgL/DRZh/iZSgn+bEk88ILAPIlrpaP3BIk5djzBT+CwaPPJlDdRFaN98NbxGHILyww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5104
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: BIT reduce the s_flag array size. Signed-off-by: Yangtao Li
 <frank.li@vivo.com> --- fs/f2fs/debug.c | 36 ++++++++++++++++++ fs/f2fs/f2fs.h
 | 6 +++++- 2 files changed, 23 insertions(+), 19 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.102 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.102 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1pSfgZ-0002PB-33
Subject: [f2fs-dev] [PATCH] f2fs: convert to MAX_SBI_FLAG instead of 32 in
 stat_show()
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

BIT reduce the s_flag array size.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/debug.c | 36 ++++++++++++++++++------------------
 fs/f2fs/f2fs.h  |  6 +++++-
 2 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 30a77936e3c5..ab3e9cbd53ee 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -336,22 +336,22 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 #endif
 }
 
-static char *s_flag[] = {
-	[SBI_IS_DIRTY]		= " fs_dirty",
-	[SBI_IS_CLOSE]		= " closing",
-	[SBI_NEED_FSCK]		= " need_fsck",
-	[SBI_POR_DOING]		= " recovering",
-	[SBI_NEED_SB_WRITE]	= " sb_dirty",
-	[SBI_NEED_CP]		= " need_cp",
-	[SBI_IS_SHUTDOWN]	= " shutdown",
-	[SBI_IS_RECOVERED]	= " recovered",
-	[SBI_CP_DISABLED]	= " cp_disabled",
-	[SBI_CP_DISABLED_QUICK]	= " cp_disabled_quick",
-	[SBI_QUOTA_NEED_FLUSH]	= " quota_need_flush",
-	[SBI_QUOTA_SKIP_FLUSH]	= " quota_skip_flush",
-	[SBI_QUOTA_NEED_REPAIR]	= " quota_need_repair",
-	[SBI_IS_RESIZEFS]	= " resizefs",
-	[SBI_IS_FREEZING]	= " freezefs",
+static char *s_flag[MAX_SBI_FLAG] = {
+	[SBI_IS_DIRTY]		= "fs_dirty",
+	[SBI_IS_CLOSE]		= "closing",
+	[SBI_NEED_FSCK]		= "need_fsck",
+	[SBI_POR_DOING]		= "recovering",
+	[SBI_NEED_SB_WRITE]	= "sb_dirty",
+	[SBI_NEED_CP]		= "need_cp",
+	[SBI_IS_SHUTDOWN]	= "shutdown",
+	[SBI_IS_RECOVERED]	= "recovered",
+	[SBI_CP_DISABLED]	= "cp_disabled",
+	[SBI_CP_DISABLED_QUICK]	= "cp_disabled_quick",
+	[SBI_QUOTA_NEED_FLUSH]	= "quota_need_flush",
+	[SBI_QUOTA_SKIP_FLUSH]	= "quota_skip_flush",
+	[SBI_QUOTA_NEED_REPAIR]	= "quota_need_repair",
+	[SBI_IS_RESIZEFS]	= "resizefs",
+	[SBI_IS_FREEZING]	= "freezefs",
 };
 
 static const char *ipu_mode_names[F2FS_IPU_MAX] = {
@@ -384,8 +384,8 @@ static int stat_show(struct seq_file *s, void *v)
 			"Disabled" : (f2fs_cp_error(sbi) ? "Error" : "Good"));
 		if (sbi->s_flag) {
 			seq_puts(s, "[SBI:");
-			for_each_set_bit(j, &sbi->s_flag, 32)
-				seq_puts(s, s_flag[j]);
+			for_each_set_bit(j, &sbi->s_flag, MAX_SBI_FLAG)
+				seq_printf(s, " %s", s_flag[j]);
 			seq_puts(s, "]\n");
 		}
 		seq_printf(s, "[SB: 1] [CP: 2] [SIT: %d] [NAT: %d] ",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 21596e0266ba..e24180c0e4af 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1293,7 +1293,10 @@ struct f2fs_gc_control {
 	unsigned int nr_free_secs;	/* # of free sections to do GC */
 };
 
-/* For s_flag in struct f2fs_sb_info */
+/*
+ * For s_flag in struct f2fs_sb_info
+ * Modification on enum should be synchronized with s_flag array
+ */
 enum {
 	SBI_IS_DIRTY,				/* dirty flag for checkpoint */
 	SBI_IS_CLOSE,				/* specify unmounting */
@@ -1310,6 +1313,7 @@ enum {
 	SBI_QUOTA_NEED_REPAIR,			/* quota file may be corrupted */
 	SBI_IS_RESIZEFS,			/* resizefs is in process */
 	SBI_IS_FREEZING,			/* freezefs is in process */
+	MAX_SBI_FLAG,
 };
 
 enum {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
