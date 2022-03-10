Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B554D4552
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Mar 2022 12:05:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nSGbu-0004Uv-N8; Thu, 10 Mar 2022 11:05:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nSGbt-0004Uh-2Z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 11:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=niyiN3/C3hy0CnD//VSi0vWYP0Ubn5l5HO2QDnNPMxQ=; b=F7CuzXfE6PGCLpSF7gq0tnXNfZ
 BhEOClVdrxIPraiPGLoibD6g0ihD+n62Pq/M29DN9eAYi+IDs+g0ZcInHphm8y3yhTQDOUkFBFodm
 426b2EZR302DqUQOFsXRVG3S42mwDLFsyg8Uwjgrp7qNXWBuJ9kwvl26xQnr+wqCFJik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=niyiN3/C3hy0CnD//VSi0vWYP0Ubn5l5HO2QDnNPMxQ=; b=L
 0ji11w9WCeZGda+izLN3fsxVhZXWvQTv8UxDWleyGN22Bws0rWHYfv6sSBEI9K4T0AgXZzPmQJjbf
 zFwPUIAej5jf9TrXkwHyp4Oei78aPH7Q8vS7mIVbliJcayn5kX1sITjo93uJtXGrRDe144yfphaQZ
 hdz02MXf3iSqyIxA=;
Received: from mail-eopbgr1300120.outbound.protection.outlook.com
 ([40.107.130.120] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nSGbj-00Aplm-UX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 11:05:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kT6OqBnr2YnEhwCif48aLXgjfalOtOWMHul7LYA35wj7mv6JiNc4JRDw1vK2H9FEn+Y1HxT68AwHObGoTTXwDU3irmujcVrEF/VfgNWbZwBi9NpZ6EB6lU4+LvaVqFjN6zuNDvfhqGTED0RKmpzFMeNQ2KWnx2rZiC4E2zaRWtbqpbdj5nBzXctFXtMiQ1SY5R40NJGuRkJxS3xvxhoc8T2dpthXjhjAEELHnuoJynPopzGyGk1EVsue0VjkCjB3/k3CJy+gNNG9X0aMbMyu6Zl8UnF1/qMi7jhkNHDCoBuvYoJ6ri6jcEhDHUEgsZVKYfG9oNrGOh9EvgbZl8nIjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niyiN3/C3hy0CnD//VSi0vWYP0Ubn5l5HO2QDnNPMxQ=;
 b=aGjzTVLKDTvH/KJDgNfYxK+GnRd6ARKJ0mB8MK2qATDvoonjGhRnZGyPVYprlRM2WIVJLMjpwxOQsIqRTRG9etPikg0rVGbLWO2sk2hMo/dqNSeZp5QesF98r37MdTMMLrOqHZj7X0sBS7ne2V+nik8XwD9C0mG0mhHR6ca+jr2YStVRhNT/UIgf1c5NIhOOICzvdIFns6puu7NiCZ2xsZlRPtejHu+JiggiNlj7QyyYvKrE5It1mohkHg5OaQo5oqeQaq27cyyHF76jJJTfPLobi4SKUCGaaa/mw7ehQHOkCx2vc5gvuOtBeI5C1fH7wHT6ctWQ3WS03j7bj/hOvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niyiN3/C3hy0CnD//VSi0vWYP0Ubn5l5HO2QDnNPMxQ=;
 b=KFEV9v7VThtGIbwyuUj4uTK+m1Vj0HUK/9q/N9P4vp9y87dRRikfEqPBw9K/gH0oD1awF1jxnkaak6fLYU7DpbuityFr7HnPFOONXmvKyaQZottG4dczXM5R+R3h3X+Y6X0rHqLQ/wfcNfnP6DlAy58D0si/8vrIeXiiNx88iv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by HK0PR06MB2803.apcprd06.prod.outlook.com (2603:1096:203:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 11:05:16 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89%7]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 11:05:16 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 10 Mar 2022 19:05:08 +0800
Message-Id: <20220310110508.237864-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:202:16::21) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3c0c237-ede3-42e9-ea54-08da0285db62
X-MS-TrafficTypeDiagnostic: HK0PR06MB2803:EE_
X-Microsoft-Antispam-PRVS: <HK0PR06MB280372D3FEF745FE4D10A320BB0B9@HK0PR06MB2803.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ytM3ZBYu1r/XDRXevsashln4CzFs4VOAAbapzVdLePyW3B/a5QdRxjj/BsZeY3CgmgTCsIcR4bOGmJZlYHJqqWsZhtXKzkY8H4Uzg5TqO/bKCzbFWj2Vr3OerRed26yVJZvcWEtDSe5E+j5YxXNCqBKRHC2sYdJPKBTRBtzaLrlKrux5GsARZ1/84x8B3A99bCiAAJMQNABs8YklcFat/CgUOTBzpNJFUZk8EmfWpDdYBukBGb1LK2K6IXmUfjnthTUbec91XyZ4WPPGosnHJyy0k0or8s8sNyqsM1b9g9NiTpU7iH/OOHgo5DyAiqBq5CQLhdXwCEOEHFimZVvnMfpHkDohFNVt5BgAunKN83zcEJsOjo+Q8Xh+D5HVao8wpXYmVQk43ejMS1hl2+Z21Uv3J0ZWOLIxLP984/mknh2pCbeGnOxYeH0EOptYeUA3EbLkyzKI8pOLuj0RiWJCCFfK7GPnvJNFisp/i076SKRof0OdN5UGZrzayb0bW+Dxaz+AbrmiksO4EdzObkz4gRudHn0G9QzR5p5S+N0lEXP5BChz7ZU03Ohc2Uj6EASSCTxwydvdbAlHYk7STcuWf6qgsTTTR9PrBi0BsCM4R0SG3ykrVbctmI0G9NY/rd9bn5jSXJqPfvwlN8wz8GbM9Y8zNd9i8WVRrvcgsj7EQSzVHrn7/8e5mRAOcv0/wQiBkYg9HIWM3Kf78DhWqTdiaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(8676002)(66476007)(4326008)(508600001)(6506007)(6486002)(6666004)(83380400001)(52116002)(66556008)(66946007)(36756003)(186003)(2906002)(26005)(1076003)(5660300002)(86362001)(2616005)(38100700002)(38350700002)(107886003)(316002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/PPUXz4KAdsD63Gnt67XkRS15+rwXK9aBBHBAspxcEU2KmG8BpWpStpVddda?=
 =?us-ascii?Q?GIXvJ3U9A9lwwgBCSOtTa1s7gJB46Tu+sj/MAFqViGpARVcUKkjGzhzig4yt?=
 =?us-ascii?Q?VjtJ0/45FQ2aITcUBciP5sPeR13/N7fZNCZaD7lxSJQ+87JivLnbnbSRiXvX?=
 =?us-ascii?Q?QHGm9HqnDCNQFll8WaN2QD4gB3UZL1avtz0TPiCc05zNakTf4HCewDrTJtgh?=
 =?us-ascii?Q?9Je0t1bb7oZ1mLxg83iMJwJy/wmmW7RZ2l6T75zphR9gQaA/CULaNM93wNnZ?=
 =?us-ascii?Q?dDdrisgesdUM5Dny/fJ9inFhTTazhLIfs5KWbKYfYRVLttpvK8KQhvJYcqz4?=
 =?us-ascii?Q?K/BPcbSQPgh8Xbub2iu9p8rBcCNj8cvzZW+vB+YYI0lX95LATa4nKwKdm8Ym?=
 =?us-ascii?Q?fTwR8j8VwMhkK4IjfF/w5cCepJFnf1u792R9zjzU/qzd7Ge7+CE8WWxOj2L+?=
 =?us-ascii?Q?z5qRlBggAciVKo8ViKEiM37yhbc9qMEbo9gkmafap+sDcIdVGJNJP/VelE+e?=
 =?us-ascii?Q?JsMCOyTDwVgQ0aQptgVVg2Ldz9dGMi7qkl2YE9zrr6n7dVAml++rtq5V0WTE?=
 =?us-ascii?Q?aepVO7Lo/yfO/p5puCg7lDPhS80cxHHXqM3sFjbiohk5WQIt3gtDPO9QEtzm?=
 =?us-ascii?Q?EP1T5Cs0Bj6MkBQrq5T22Zhc0uOFXPF4kiKpxjrN6x7AdLQ/lBCo44Jvf4OJ?=
 =?us-ascii?Q?jeTL3paH/1AqrVnd4z7EUrY+4TwSZsV3aqQZLseMsSsyomCaJ1W9i/Jny3hr?=
 =?us-ascii?Q?mJVYJPp5e71VBY+rK+fBcU0CFy+ONN2jLn1BuPsy3A+u3zyP/YzsFTcQ+Otg?=
 =?us-ascii?Q?z3Qe4jPpDAO+EB9r+xyJ5AvgiI6BDYe5W31vA1YwAs/JgP/RgIciXoSxU3QT?=
 =?us-ascii?Q?K84+pdkF5XpT7jUP0SIeiEtoUsTErUPhSzxxwSUJkpmPDJ5GPn5Ov8sPMAWb?=
 =?us-ascii?Q?mIxe5E9f/CQmyLyV8OrFLb6Yr5+qf/HTijbs9ObMDS5IsDYaitcOIhXTxOAs?=
 =?us-ascii?Q?rD11E5tCYliNK9aGxey8s+ZnujwniwEReG5gORhAlj08dhkZZUZRWpAOIbjP?=
 =?us-ascii?Q?lFm657X35Kld0aTf4We84kj3Issv6tFjJdZ71AQZrn+spTWJpLsddtkNbCY+?=
 =?us-ascii?Q?JzHNOfOAHsJ8t+KOi167f8l7OnCI3l7eiOQfXsVOpgJEOgyHj2GIrSiwVVFg?=
 =?us-ascii?Q?kg1fW4kGIXRW3in4wBguZuKFPIN1+53qDJIr5O+LGtEXEW1V6joovVnJcnfB?=
 =?us-ascii?Q?Ku2yGk2RQzifjDbvUbbRxXtA532YGAW3hr67EGVqJ/2fJWdtMNefx+tXzBKP?=
 =?us-ascii?Q?Q4fcGRLkIy0tS/JeVCo+8brLN8/4p13+AT6bHlKfCy1f2gaerNEwz/rd6ALf?=
 =?us-ascii?Q?xVxGKRa4Qac4kUnEzWKO2pyjwtIB8141ihmVT448wyVs2IWUEOupmXOZJinm?=
 =?us-ascii?Q?e73WzfzzzAsu+rH+SX+gm+OX+MCrzFUM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c0c237-ede3-42e9-ea54-08da0285db62
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 11:05:16.2195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWjF1jOMLIAeaLn/odUuUDXfkz61/a6wosVdQMggN+GP7XVOzYnScz5ZiuHweKX8oV4R5ufUpFaXPwoK8KjIlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2803
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When compressed file has blocks, f2fs_ioc_start_atomic_write
 will succeed, but compressed flag will be remained in inode. If write partial
 compreseed cluster and commit atomic write will cause data co [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.120 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nSGbj-00Aplm-UX
Subject: [f2fs-dev] [PATCH v3] f2fs: fix compressed file start atomic write
 may cause data corruption
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When compressed file has blocks, f2fs_ioc_start_atomic_write will succeed,
but compressed flag will be remained in inode. If write partial compreseed
cluster and commit atomic write will cause data corruption.

This is the reproduction process:
Step 1:
create a compressed file ,write 64K data , call fsync(), then the blocks
are write as compressed cluster.
Step2:
iotcl(F2FS_IOC_START_ATOMIC_WRITE)  --- this should be fail, but not.
write page 0 and page 3.
iotcl(F2FS_IOC_COMMIT_ATOMIC_WRITE)  -- page 0 and 3 write as normal file,
Step3:
drop cache.
read page 0-4   -- Since page 0 has a valid block address, read as
non-compressed cluster, page 1 and 2 will be filled with compressed data
or zero.

The root cause is, after commit 7eab7a696827 ("f2fs: compress: remove
unneeded read when rewrite whole cluster"), in step 2, f2fs_write_begin()
only set target page dirty, and in f2fs_commit_inmem_pages(), we will write
partial raw pages into compressed cluster, result in corrupting compressed
cluster layout.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Fixes: 7eab7a696827 ("f2fs: compress: remove unneeded read when rewrite whole cluster")
Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c | 2 +-
 fs/f2fs/file.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b09f401f8960..5675af1b6916 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3363,7 +3363,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 
 		*fsdata = NULL;
 
-		if (len == PAGE_SIZE)
+		if (len == PAGE_SIZE && !(f2fs_is_atomic_file(inode)))
 			goto repeat;
 
 		ret = f2fs_prepare_compress_overwrite(inode, pagep,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cfdc41f87f5d..2a07568ee61e 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2009,7 +2009,8 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 
 	inode_lock(inode);
 
-	f2fs_disable_compressed_file(inode);
+	if (!f2fs_disable_compressed_file(inode))
+		return -EINVAL;
 
 	if (f2fs_is_atomic_file(inode)) {
 		if (is_inode_flag_set(inode, FI_ATOMIC_REVOKE_REQUEST))
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
