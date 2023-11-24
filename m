Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 564777F6A0A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Nov 2023 02:10:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r6Khc-0001jv-02;
	Fri, 24 Nov 2023 01:09:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1r6Kha-0001jp-8X
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Nov 2023 01:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i+8SzhtrIW+qrRU4GxkBZJ0ehnst9ifSAaO16PUtH58=; b=e14GM+LeAZp1GZb53pxQWA09ki
 vrfSbo4emAYsyL5CsnP/OCE4Rxf0dVy9v33B5sXI3thwwAx//aoFb8qAofuRDXkGxtMe3MNEdFAt0
 vGdGUo3ETUg589eykSrWWo9uBlXLe5Hlg8IBpTMlS9S2SMYblqCr30Op4Ri+9c7XQgBU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=i+8SzhtrIW+qrRU4GxkBZJ0ehnst9ifSAaO16PUtH58=; b=c
 wVcyxadI4Um8x2wc3Km4GfGVlKrur2dxg2cGT1N0qAkjaeu3H4fhHexrJckNGADQDhNYd4x15hu/O
 DDM47i8+GVeobw1rP9mYAOdI4FKZbypbfyUAvNsTzBk6iBa+q2vjLYXPGeDPU8zgLRY/RSmdIkTmR
 EGjdYeZnaN32FY8E=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r6KhZ-00Dvs7-42 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Nov 2023 01:09:50 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 3AO199em043798;
 Fri, 24 Nov 2023 09:09:09 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4SbxZ81N8sz2K5kLN;
 Fri, 24 Nov 2023 09:03:44 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Fri, 24 Nov 2023 09:09:06 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 24 Nov 2023 09:08:48 +0800
Message-ID: <1700788128-29002-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 3AO199em043798
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The current pending_discard attr just only shows the
 discard_cmd_cnt
 information, which is not very meaningful. More discard information can be
 shown so that we can check them through sysfs when neede [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r6KhZ-00Dvs7-42
Subject: [f2fs-dev] [PATCH] f2fs: show more discard stat by sysfs
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
Cc: hongyu.jin@unisoc.com, zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The current pending_discard attr just only shows the discard_cmd_cnt
information, which is not very meaningful. More discard information
can be shown so that we can check them through sysfs when needed.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/sysfs.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 417fae96..f98e680 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -134,13 +134,22 @@ static ssize_t cp_status_show(struct f2fs_attr *a,
 	return sysfs_emit(buf, "%x\n", le32_to_cpu(F2FS_CKPT(sbi)->ckpt_flags));
 }
 
-static ssize_t pending_discard_show(struct f2fs_attr *a,
+static ssize_t discard_stat_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	if (!SM_I(sbi)->dcc_info)
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+
+	if (!dcc)
 		return -EINVAL;
-	return sysfs_emit(buf, "%llu\n", (unsigned long long)atomic_read(
-				&SM_I(sbi)->dcc_info->discard_cmd_cnt));
+
+	return sysfs_emit(buf, "%llu, %llu, %llu, %u\n",
+			(unsigned long long)atomic_read(
+				&dcc->discard_cmd_cnt),
+			(unsigned long long)atomic_read(
+				&dcc->issued_discard),
+			(unsigned long long)atomic_read(
+				&dcc->queued_discard),
+			dcc->undiscard_blks);
 }
 
 static ssize_t gc_mode_show(struct f2fs_attr *a,
@@ -1016,7 +1025,7 @@ static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
 F2FS_GENERAL_RO_ATTR(encoding);
 F2FS_GENERAL_RO_ATTR(mounted_time_sec);
 F2FS_GENERAL_RO_ATTR(main_blkaddr);
-F2FS_GENERAL_RO_ATTR(pending_discard);
+F2FS_GENERAL_RO_ATTR(discard_stat);
 F2FS_GENERAL_RO_ATTR(gc_mode);
 #ifdef CONFIG_F2FS_STAT_FS
 F2FS_GENERAL_RO_ATTR(moved_blocks_background);
@@ -1074,7 +1083,7 @@ static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
 	ATTR_LIST(discard_urgent_util),
 	ATTR_LIST(discard_granularity),
 	ATTR_LIST(max_ordered_discard),
-	ATTR_LIST(pending_discard),
+	ATTR_LIST(discard_stat),
 	ATTR_LIST(gc_mode),
 	ATTR_LIST(ipu_policy),
 	ATTR_LIST(min_ipu_util),
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
