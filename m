Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C36206DB2CC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Apr 2023 20:32:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkqsd-0000lG-1K;
	Fri, 07 Apr 2023 18:32:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pkqsa-0000l3-TK
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Apr 2023 18:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5R6aTbtRk9Kocpu/SZFZ0cQ64vlufYmNjZ3oQCgXYVk=; b=QIcfTyo6NdXNh6sxILKVxjO6kO
 JJtud1LCyPjiGo4k/1/CN/ixgVyqmv5A9r1KoS7AVPLDPReDvxPnk3avXW3hz5T9qmzcf5XhWHjJg
 4tHfo1mzsW5kscUVleXolQx+DDdQmocA+nx4TIjWsZC+7ecCURKkeO9+hdLvuPeSPhV8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5R6aTbtRk9Kocpu/SZFZ0cQ64vlufYmNjZ3oQCgXYVk=; b=g
 XoOLFyxM5PtQfJzKUEW8Qoz7ZvYz0Xd6PX14OmehfRMLu9Ryuu6XUBQuyieRtzNFuKW6Y+qwxEWY2
 XBz+hfginr9odgtSUBebQIks2j1ffW5gS9jMAkuvzX9iUj0jzh9DSju9yxOwxxO4CcsGnOxlucBcc
 GMjlrAwgfGkx9d50=;
Received: from mail-tyzapc01on2116.outbound.protection.outlook.com
 ([40.107.117.116] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkqsa-000NYv-3y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Apr 2023 18:32:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZTDmqRTIomo6WsxhdjiGPbmmsV4xqT82tq7/vHhF0nKXNq2LC5OTtou2uRuIa62bi6Ueihf7xrY4q1MMFBUQnHaLHv/YwOAfuWjN65o9rTFsYPR1jUIJl7IMitNt32192+u0EFfNxmHFs1ZFgsaPrpQDNn1bTgqmZH/ek9ByohGDFd1QfEq2bmExsCKrzV+CBd6rJCOebJ51E9vCK+15Jmllg+IbiIRBZwUXQOKChOJTWNBCcXF+YtwE55Eig3RaK8X5kMctQfkhPXwlxwPoUI/mBsnjJaXG69VskDYwA4/FCwbjf8UxCWr709EotTgghh80aJIqrzIRgY3aifINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5R6aTbtRk9Kocpu/SZFZ0cQ64vlufYmNjZ3oQCgXYVk=;
 b=YvwIiN/HpLaHlDTruqhVH82WxSchtBd05cwj3xD33zeQO5tqso5mfsKXIgpn8p5+wRbyQn+9ftHQi7UKkEVlecOYhf+MlAKvkBCmu00v6vyiar3Mk8oY7jo3ofOwKHVZEuXf4ZU+IU7qa7ATp/tgdLgvE9zGTBcYweobBS4FmNxuftHPYjbnLbNuumMkfS84K3DB7awKpDpLo2H+AFDzdBroc3Q7F/6qvdIyR4wjIs5IkZoNvSFE2N2CKy3Jz986BHK43UivLmDQrjZ8o0L6rrHfMwL1qWRrmIA/uW+FuzfsdLz4KOwP5HXOwYvrFuj67hyL4gsA0jvmx1HVWbVWgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5R6aTbtRk9Kocpu/SZFZ0cQ64vlufYmNjZ3oQCgXYVk=;
 b=g/y8brdPmArhjDYXa8bDm6bTF55G6+m+9hIozASNuwjwO64Dt0UfsLXhUsQvr5B6Z9GfygN8g50vb7gAU+WiRg45E5bTYKHhLoPBIDtuSfiA/NmT671CsE/szfT6MSPLW9ohAdMk58xa5OOSfaf+l2j3rBAmzAbGHHgzrniHM3uBs+qKkaJcK8J+dFmILfdoQ5TkeIE5+7Y6glgcM8EUpSUN6ENN/HwsOfGTAkLvLy+20e1+1RKrbfKMxiZY8n9DJXcH6R/HwWJwtofSoyDmpf7FsZMmV1ZlKcUJxfpqM1fpTwFuFjWZs0zxoS+MnYNKxNgDiK3N1Y90iGJKSmu01Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5225.apcprd06.prod.outlook.com (2603:1096:400:1fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Fri, 7 Apr
 2023 18:31:58 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 18:31:58 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Nick Terrell <terrelln@fb.com>
Date: Sat,  8 Apr 2023 02:31:47 +0800
Message-Id: <20230407183148.23231-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5225:EE_
X-MS-Office365-Filtering-Correlation-Id: 379769f4-b8fc-47ee-ac64-08db37965ee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6xdphdZIDGtDKoexSQwppmtc3u+dP/MzSuhsLBiMTmvEWFQMF2aGQkR4ppnKQO3gId9ZzctT/2C+CepDn70P9bbSiXveKrjG/JA6HZ3G9L4ri5aO0jeaYqw5nFQChWBMCe+adcH+rrGkpsApehddYdU1ILv2T5drl5whPmBSs0HMZmD8KAoQFOcFaL0nxbnoipBRRoOG0qYUURa5q1AjcHPyCoGEV1XkPnUv3GRkJ9le9KM3Wk3UZC+Ta+5V8utD6XluYiBi6+ER4VEil2f6zvlS7+MhN4OgL+vBHDbd5zXcnkrkjedaqQVZNph59vnYeXtCS6gPqdLf3uDnhjbq+cgYDgn6dssqyj3UCkOXwe3a3cmS3ztbKEkY0LXlZk3L1V+eU5hB16+B129M2VnFOTsD9DM+xm3x0vjxQ+kcdweCbbU+B7RdkpB2Wuqe/tZNgf01+GGnMGhc4gbc3OgwdSGCYVIFfuKagir+hAg4N8+8soGD4smWwzUMqHNybtiK0J4ThHuuMLOI5FsA+DFVmbBuiJi0K1ht5BoKyzRzRPGASUVcT9pUWWpiixUgZMz4uSS8qc5oRzNxJA9EZDMNZH82X50qAuWWOD5TApDVCxI3Zz6EarAri1lv8VDsRUAa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199021)(478600001)(52116002)(6512007)(1076003)(6666004)(6506007)(26005)(36756003)(41300700001)(186003)(110136005)(66556008)(4326008)(66476007)(6486002)(66946007)(316002)(86362001)(8676002)(8936002)(83380400001)(38100700002)(2616005)(38350700002)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RlVuF9Da+txS8lj9dukDV4WwmX4oihhIgI9VkmRogmuYTFv1zSZfekOCG4ir?=
 =?us-ascii?Q?lNU4Wzzun9moGsNl/h9KVV2QbLAVMh0UpXR6Be//Lc4JJb3ewx3MDXOkmyIb?=
 =?us-ascii?Q?IfUzaKJzqCFJIUi02B7P8ZVt3hJTMZiqMQu0QXwJ6kDy9XzUzi6mYZdPsJCX?=
 =?us-ascii?Q?t0qwZ5QSmzp2fYjbOHlzExE/UP7aLbcx1hsPJveDF9H2KoWf9w1ZJiMrKRPB?=
 =?us-ascii?Q?KGegcyJAmdjDx1kc99m8QptPbpUhtCQoP4bE37YuX7DWObfOCstim6djZRXB?=
 =?us-ascii?Q?ye+thZ39+HgFjfNTe9NQaNzS89pCdZ+dX5nG8M+CSeQt8WieIpYgDkFAz19y?=
 =?us-ascii?Q?4vRULkrDQC9x13Wd9oRAaVqVxPC+hX6eUKJNCGgwJkgYoAAcxDNVoJs577xl?=
 =?us-ascii?Q?SYgLnJn/LyRLagT+k+b9NRmrpEHeI/rjGLnJKc8y7TflUCHToRkG4CB0r5Cu?=
 =?us-ascii?Q?tieBlsTPkzwEKRZV5F8Bm2+u54WD4FqexTjYeltYI0B7FjQEBitHCSBCf8ir?=
 =?us-ascii?Q?Hps31nJLKzMUROJP8XJFNN3+pq9fAWhRBe9cR1aEpi2gOhgQsQeaoH2m/ynT?=
 =?us-ascii?Q?B6AV3MYxche7w7itCGXd7lN3XUqDieTf6BkbZ+0Q12ZCaNk1cQSeu/575D/S?=
 =?us-ascii?Q?BltPmVasI19iD81g199mVW5vqpb5KtNjI7siW/CMoI6CoWKGaBo4PkBwTKLE?=
 =?us-ascii?Q?JrLODEarqp65seOp4uL2WTdHu/MBO7sh+/44Ue23pBHnSkeoQ2yQvembTAb8?=
 =?us-ascii?Q?RpYV5Kh1gXEPSG21bJEGg8wHV8nllBEO0c8IwDlLHfW47pusl+w5H3RBALmN?=
 =?us-ascii?Q?rykJa8O846hXjf7uh4VoFMG+BQMlQPm4yESHYVG79Gw3sj+zXZUV91Lp+Jzs?=
 =?us-ascii?Q?qIBISrFLSqztJh2qSuKMrkWVrV3YEBZnzktC5sqv/Lf5OJJ7bjMX0Nu4tsU7?=
 =?us-ascii?Q?MFkacFfuh+P+Op3/EAWtskEweFU2nX+WzVXcyhGqWGSlN3f56844mZATLjfP?=
 =?us-ascii?Q?1qkvpb+nJ3+lBXqdSztOtcHXTSs2aigmF8eJMepvjwLmmdaJay1jP3hzimkH?=
 =?us-ascii?Q?yXKw7aMJOXkQRe0yNgolmaKE8iM09TFfGviYSgnpigPtPVK7tGIonPSpge22?=
 =?us-ascii?Q?YDPwOwHos+2bcqrPcVbLmkZfbnVSL6AdLhgiaDFT1EqVsNNLDSxXeKfFeaVj?=
 =?us-ascii?Q?Pm+7qBHIWfDpNPkwqiqVg80qg8RfAsqciaJFNEDJlkmDhLA6x+AHBaHTiLUA?=
 =?us-ascii?Q?ydKpQPpyFDoYL2OBbfHC7vOa8u7WYrLZmHsYfI/iBfoHNcSNEhweFm8Wo+ky?=
 =?us-ascii?Q?b42azPyEzhaLGoukXzY66RFec30cPjr25m+OiHZ/Vt9PKyyqtXAKs53XTWc6?=
 =?us-ascii?Q?S/OxcGY0lcH9IdAYDNotsCye/WWwb5c2m2UdQJzxfBaSToHaBchHfVmwiVYN?=
 =?us-ascii?Q?J9MZExRmEbrcWnib0GVHCDt/3QPzD0rhnz8e0KE5bLh6rvCBEv2YxhMTE+EZ?=
 =?us-ascii?Q?lAAmX3vBxNk5dJ7OjiPGKH+X8FLplXMTNLJngyIvcrtg1OjpPNGLtwUGwCvy?=
 =?us-ascii?Q?CICCxyepGTxu0t7wfLUC4LWCQxW20/H2VBD3sqUt?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379769f4-b8fc-47ee-ac64-08db37965ee6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 18:31:58.1186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WIn7KQB1yrwM+Zu6HGQCkiAUsKI7dkEJnpcFqTO0vpMVPt6YT2BTZ9E9ylcPsx3W7weX4yU5wwCJYLrRcpcONg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5225
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 3fde13f817e2 ("f2fs: compress: support compress
 level")
 forgot to do basic compress level check, let's add it. Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- fs/f2fs/inode.c | 106
 +++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+), 29 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.116 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.116 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pkqsa-000NYv-3y
Subject: [f2fs-dev] [PATCH v3] f2fs: add sanity compress level check for
 compressed file
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

Commit 3fde13f817e2 ("f2fs: compress: support compress level")
forgot to do basic compress level check, let's add it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/inode.c | 106 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 77 insertions(+), 29 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index bb5b365a195d..c2460f51bf80 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -10,6 +10,8 @@
 #include <linux/buffer_head.h>
 #include <linux/writeback.h>
 #include <linux/sched/mm.h>
+#include <linux/lz4.h>
+#include <linux/zstd.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -202,6 +204,79 @@ void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page)
 	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, page));
 }
 
+static bool sanity_check_compress_inode(struct inode *inode,
+			struct f2fs_inode *ri)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned char compress_level;
+
+	if (ri->i_compress_algorithm >= COMPRESS_MAX) {
+		f2fs_warn(sbi,
+			"%s: inode (ino=%lx) has unsupported compress algorithm: %u, run fsck to fix",
+			__func__, inode->i_ino, ri->i_compress_algorithm);
+		goto err;
+	}
+	if (le64_to_cpu(ri->i_compr_blocks) >
+			SECTOR_TO_BLOCK(inode->i_blocks)) {
+		f2fs_warn(sbi,
+			"%s: inode (ino=%lx) has inconsistent i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
+			__func__, inode->i_ino, le64_to_cpu(ri->i_compr_blocks),
+			SECTOR_TO_BLOCK(inode->i_blocks));
+		goto err;
+	}
+	if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
+		ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
+		f2fs_warn(sbi,
+			"%s: inode (ino=%lx) has unsupported log cluster size: %u, run fsck to fix",
+			__func__, inode->i_ino, ri->i_log_cluster_size);
+		goto err;
+	}
+
+	compress_level = le16_to_cpu(ri->i_compress_flag) >>
+				COMPRESS_LEVEL_OFFSET;
+	switch (ri->i_compress_algorithm) {
+	case COMPRESS_LZO:
+#ifdef CONFIG_F2FS_FS_LZO
+		if (compress_level)
+			goto err_level;
+#endif
+		break;
+	case COMPRESS_LZORLE:
+#ifdef CONFIG_F2FS_FS_LZORLE
+		if (compress_level)
+			goto err_level;
+#endif
+		break;
+	case COMPRESS_LZ4:
+#ifdef CONFIG_F2FS_FS_LZ4
+#ifdef CONFIG_F2FS_FS_LZ4HC
+		if ((compress_level && compress_level < LZ4HC_MIN_CLEVEL) ||
+				compress_level > LZ4HC_MAX_CLEVEL)
+#else
+		if (compress_level)
+#endif
+			goto err_level;
+#endif
+		break;
+	case COMPRESS_ZSTD:
+#ifdef CONFIG_F2FS_FS_ZSTD
+		if (!compress_level || compress_level > zstd_max_clevel())
+			goto err_level;
+#endif
+		break;
+	default:
+		goto err_level;
+	}
+
+	return true;
+err_level:
+	f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported compress level: %u, run fsck to fix",
+		  __func__, inode->i_ino, compress_level);
+err:
+	set_sbi_flag(sbi, SBI_NEED_FSCK);
+	return false;
+}
+
 static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -286,35 +361,8 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
 			fi->i_flags & F2FS_COMPR_FL &&
 			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
-						i_log_cluster_size)) {
-		if (ri->i_compress_algorithm >= COMPRESS_MAX) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
-				"compress algorithm: %u, run fsck to fix",
-				  __func__, inode->i_ino,
-				  ri->i_compress_algorithm);
-			return false;
-		}
-		if (le64_to_cpu(ri->i_compr_blocks) >
-				SECTOR_TO_BLOCK(inode->i_blocks)) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_warn(sbi, "%s: inode (ino=%lx) has inconsistent "
-				"i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
-				  __func__, inode->i_ino,
-				  le64_to_cpu(ri->i_compr_blocks),
-				  SECTOR_TO_BLOCK(inode->i_blocks));
-			return false;
-		}
-		if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
-			ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
-				"log cluster size: %u, run fsck to fix",
-				  __func__, inode->i_ino,
-				  ri->i_log_cluster_size);
-			return false;
-		}
-	}
+						i_log_cluster_size))
+		return sanity_check_compress_inode(inode, ri);
 
 	return true;
 }
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
