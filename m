Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4BB6F919D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  6 May 2023 13:40:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pvGGg-0004Th-2q;
	Sat, 06 May 2023 11:40:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pvGGd-0004TM-Ou
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 May 2023 11:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZvK1aHZNaaaO9H16uLBWIMIWtfrCjWUZq0GRWdRdX/0=; b=WnFMHzicRQqYupFqW3wlCTxw/8
 t9p7HVly2xbvmeiflKR9wk8R9/yRFtGms6gEWLA4Gz/j9t5Sh3ZUiF6m1+SrMNC63EoY1ajyQOcRM
 tbQOXFkYV+l1h6f+ot2ABoHMxBvVIMmwa3pkmdhvNsx4G0dYKYPZ1hD7zsSHnj+fEwSA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZvK1aHZNaaaO9H16uLBWIMIWtfrCjWUZq0GRWdRdX/0=; b=f
 NV7qyXXY5CaNuc2BuZcPpSgnjzHI8k7yJmfjZXLG/6Fopm7iiPoue2i5auB4vEUebVgUmAr5qt6ME
 kyTWxKzQBHB6YV2hr9qazI5OFoaJpUVeFXvCiX8Bar1ZpgwVVV+Fo3dHbzUtZQ/xNrt+rAv2sGUtp
 rOuzRbFLXSvdzg3g=;
Received: from mail-psaapc01on2135.outbound.protection.outlook.com
 ([40.107.255.135] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pvGGY-00GF3v-22 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 May 2023 11:40:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIcaWmt3sjR+1jqTSM0C7dFvgMiFyFrjPz4BeFlCXjjJQdKbDPyL0xF42asQcLenb2RwOGqLNeRwxUKwVjttW3y1hYPZlHWTdhJiEIYTcBqJN6xVg0+mMHx5bRHWMIdfzLuSc2Vl/Ih4sFe0me6OiYQunZxTBHsojIL13QGEnxEs7mPrSogZcZ1E+F60CXc0yGfWBGollNHsjGDhvM9tsY5cVhZjNPqVvolIefYDr51NigywOwPPKPFM34hDEnK0Mlzw/rc6BEts8jWhsMOzFgDln3TbZ46FJz0HqCWnHMZletpSfZ79wjbZhWIXEtKgAxt5RpEsjp45HfbcxjAZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvK1aHZNaaaO9H16uLBWIMIWtfrCjWUZq0GRWdRdX/0=;
 b=YY16dfG/gAatZ6lQHVdrcXhl7XbSyvN8uHAJN90aUL3xr0oPNA2PUchhPR1RnwylhNcnXbNmrr5LVZg3OzDVviqnwVuwZoWS6imnJWJy06G9ycMQugC368hiSYVaMjDhmx8RFHDrWM6FiQCjK32cgkkjHwwEIRE21323e9jjlZ/Awsd+D3TRNDE1r+ZpNXRH8jhEAzBD1zOkHe+rdxbbwOn3bKNfOSh/S7kJtI+P7baqeLawAPLu7jLdfLJ3i5yJ0d9109Mn7sV9swvHNlS8UFnEuNbvy/xON4HIjY/um8eiVdZKlUc1c9wjnqQuUeaMApmcT0FqlzXrZ1qcrF+few==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvK1aHZNaaaO9H16uLBWIMIWtfrCjWUZq0GRWdRdX/0=;
 b=JfCKDEToaabJUPimpHgJcs8WWMtfD7xKvFy2ruuzhJAj2TfcN9vrZgpkZoYV7lIIsR1xwduR90iKtsQZAFSpm4u9tLuAH96of8sDF/XkEcJ4e2XHdEzpW63AaYQuP4wCjgHYsV4bUo7i+rhFEUL+UOMw8Uv857zvcTlJDXHMhRXV3seEACqLSaRJkYBrBM7agRxfBqamjMMILH3YyA4GRdDQ+25uRNG/q3/2xqLfNLFpcQo4erPnnPujEpkIf/oX0dOxWPjM0XUhLOR1i5dOWItCzc3vYA2qmYqcRDFf28MlqMrYqzR8j+9gB/F0oUM64DhCRzclom+L50xjSvn1Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4267.apcprd06.prod.outlook.com (2603:1096:4:15e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Sat, 6 May
 2023 11:39:41 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6363.029; Sat, 6 May 2023
 11:39:40 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sat,  6 May 2023 19:39:14 +0800
Message-Id: <20230506113914.23419-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4267:EE_
X-MS-Office365-Filtering-Correlation-Id: ccbf2e5b-6f21-41dd-1d98-08db4e2693cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DlAUOEZKz3SqsrZkYylc05OArb3CyftySeQX1tfD6yd16RhTQzGOjCMDhPUsw6u7iW/2Bwzh6DgxRex2NDdZAahsKZYWa1ohX8tpz0rHLVHfbKoF5V3PIbdGX7W7UeNwfzRU2GbwNhkjO6d0ZYuIaJyU3rhnTEaCt9EaThBSWLN4fFaeGgrMksxAhcWj1oHWBrqAHAQtMeC1NChhq0Z5FYNx6nu0Dcol+8dRC7iUY1qaPoRCBh6Q1Q2HG4H85GxH9G3v3BIhYo8TUSqz7Fn3FNmGeNI1Eu1MxtxdeIwc2YlqY0PrLFF1kK9tmdDIohpbLMrAJcxeLy7PWcCDE9fDnXYWmbO1JMpjLFC6EPSNRnXLmv/X5osdHHp3/1TStjigtVFqcRPnsiojcbQ8/FXr5tCTLII1I86ZnMVd9PviKZ+ezpEM07wdq6L8arEsX7ZSNFxWZomiEEja3D8p1flfdBLxJ0BhMD1x8dCYF4ViNCpB8tYhhQVAfzxOGaiwmEYWB+RXnJgaZp92hGFAK9c4vESEMpl1YF96i0K3sF6smDfYQrMtfKhM+Pe4onbro4kqXzjgL32kq91XxKcSORyJr3NNV3wdryM2gwMXIzlw5r5KoE+U2/bw2dKED9uhKrFc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(86362001)(8676002)(8936002)(6486002)(52116002)(66946007)(66476007)(66556008)(4326008)(5660300002)(36756003)(38100700002)(38350700002)(478600001)(83380400001)(110136005)(2616005)(26005)(41300700001)(2906002)(186003)(316002)(6512007)(6506007)(1076003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YIFOUjaqWaDji8kICHwLtiCrIfKMPgwkAi9g+HN3vwqvVWpK6d31K2ChuaT2?=
 =?us-ascii?Q?zD52UyvapBT7DKjZYzyAWVfcafbqPEDx1wyfQ3eVLuWd+V/daLpGu85AYzeD?=
 =?us-ascii?Q?qhFr+uO/RXOR57trCezKrA5Tom776w/vXFJo6KAVWyZLNYiMs/7fWA89zYXt?=
 =?us-ascii?Q?B2iTqFXH6l6jE7RT7viGPdyN7zkFs1GbD2AAfNOFpD81rFUFRirPX7iE4lvb?=
 =?us-ascii?Q?WkFfLZRhY9XGVB2B5O7p9SO2jB860lAga4lIbvkkP+ZH1Ctiln1FsBoIPE0t?=
 =?us-ascii?Q?gWslvRuCW4tcxl+V03UrfNsdclIFx0YbonIfLS8j1AVJVFoWOmlkhJGu2TWl?=
 =?us-ascii?Q?GqdQmi7maMhiqNUdG7U65R9GSp4L2vsjwEkAWGHbOxIZg3xo4uw+IGg1PQsq?=
 =?us-ascii?Q?kopdTnNr5qtEnmJEz1y+cUsqSydAdd3DW/hevf4ezXGK9B1FLV1XEiYB7qda?=
 =?us-ascii?Q?ByMUj4xAAVLWLe5yod2+mkNzyKXoGomKGMs7YpQUiXhbIhtXDkMsQtRyuAhA?=
 =?us-ascii?Q?+46Pdwxp84Yr8eG+EeQp5xkpYczOxpkz7pMV6VX2qvSYr7Uqftli2SBVYGOq?=
 =?us-ascii?Q?FHSCdggrtJGsQ24ygBl7pEKTJEP1dVyOA0lByEBefFA2hYv+D9gzvvnO92BP?=
 =?us-ascii?Q?rZ8BMWHXTjrP5qIWuTdAGUGvSdyY4eX7CqfttYK2bdQIl3ODW3gGR6FoB90k?=
 =?us-ascii?Q?TaWqKvorncHazcVJrPGAuWP/OllSUFWM/X2bHas6/u9Ccm1tKzGMZiEf4rHM?=
 =?us-ascii?Q?CdROjU86Q1qh1PSf4mNkcLtNy17JlI+jdfsU47ovY5Cjk+uIWMcUJLT9I6ki?=
 =?us-ascii?Q?13a+X1qLdl51BV1jeJmtx6RnWi1gvqiaNT2lQNCe+lL3WhFI7+ITwLWCyBwG?=
 =?us-ascii?Q?XLt0tV9t+vTsqjEw6haQbV9W7H4SVoLI5b4ANwaAX96cZnXPxLMtAf4gbb4J?=
 =?us-ascii?Q?w4e7awaEhmBDel+4Vny64qQ+nKUndO3PfPDo5o9VIiOywM19zS9CtWe6jyVj?=
 =?us-ascii?Q?Uiq1/4WoFtJ079eldTR59v/cxklRYf0kIGY9Ht20dc9kSiWZuN0J9yU0VQ07?=
 =?us-ascii?Q?wpNP3quEqMAOwx19oOwGL6tSCA+6QMgGZtoTW9IgxnZgK/VEP5190P23AP/0?=
 =?us-ascii?Q?AZ3N+spFfP825XzDgfABmCCsmNvelAyVaq/TUM4VADPDQYhyvf9mKI0goBk0?=
 =?us-ascii?Q?Lmml6/3kYV0IVIMNJm1qCRreQInqISTOHn+lY3K7LhAwn4zL9/86Cr0ptTLm?=
 =?us-ascii?Q?TaJGqsuwD/7RfMz/BtrDmSaL1BbvyxFwM9qEVvE3RKrWJLuM4ibMZe26/b7Q?=
 =?us-ascii?Q?FdN9nMiF5fQZhk0sg7DryaFCaml04TvbKo2K2hLAGh0NJpZjmrFRvifGHbMo?=
 =?us-ascii?Q?GcP9jJSVxfiYrP7Z4i3vTbfriQ1DkymNk+z0bwtAZcDe/CxsHMBvhTS2tIOo?=
 =?us-ascii?Q?mv5SdmttUaOOYz8Kqx87p8Nj855i6ubTwmZn4MB+lyhRxuMIZmFmYi005cTY?=
 =?us-ascii?Q?yR4CzC41ywNujJl7G/G4u4pVtMIUTz/vcT0ie5DXhe1QU0KVnhY3eG6oGuUi?=
 =?us-ascii?Q?HYxqyNCEiC5juiDRxxkc7mX6VqIrT0rJR3isp3Nf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbf2e5b-6f21-41dd-1d98-08db4e2693cd
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2023 11:39:40.3248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UNTw9ksArxb6hFcqmlsYBk4PQKpv09WRYwz29RJkHoRAcmXf8/eJ2UJAGa0AtW5r9VNVj8hPLOrpIqSQwrI4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4267
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For judging the inode flag state,
 the inode lock must be held.
 BTW, add compressd file check and to avoid 'if' nesting. Fixes: 4dd6f977fc77
 ("f2fs: support an ioctl to move a range of data blocks") Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/file.c | 14 ++++++++------ 1 file
 changed, 8 insertions(+), 6 de [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.135 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.135 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pvGGY-00GF3v-22
Subject: [f2fs-dev] [PATCH 1/2] f2fs: move the conditional statement after
 holding the inode lock in f2fs_move_file_range()
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For judging the inode flag state, the inode lock must be held.
BTW, add compressd file check and to avoid 'if' nesting.

Fixes: 4dd6f977fc77 ("f2fs: support an ioctl to move a range of data blocks")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 78aa8cff4b41..850e745ecf88 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2790,9 +2790,6 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	if (!S_ISREG(src->i_mode) || !S_ISREG(dst->i_mode))
 		return -EINVAL;
 
-	if (IS_ENCRYPTED(src) || IS_ENCRYPTED(dst))
-		return -EOPNOTSUPP;
-
 	if (pos_out < 0 || pos_in < 0)
 		return -EINVAL;
 
@@ -2804,12 +2801,17 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	}
 
 	inode_lock(src);
-	if (src != dst) {
+	if (src != dst && !inode_trylock(dst)) {
 		ret = -EBUSY;
-		if (!inode_trylock(dst))
-			goto out;
+		goto out;
 	}
 
+	if (IS_ENCRYPTED(src) || IS_ENCRYPTED(dst))
+		return -EOPNOTSUPP;
+
+	if (f2fs_compressed_file(src) || f2fs_compressed_file(dst))
+		return -EOPNOTSUPP;
+
 	ret = -EINVAL;
 	if (pos_in + len > src->i_size || pos_in + len < pos_in)
 		goto out_unlock;
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
