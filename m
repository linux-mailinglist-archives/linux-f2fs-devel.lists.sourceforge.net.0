Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3805F9B602C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2024 11:32:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t65zv-00085q-6h;
	Wed, 30 Oct 2024 10:32:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1t65zr-00085X-OB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Oct 2024 10:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xzITosxmx6kMCfyCQt/IxBYd+ITgoPCs6oZNNpv3CcM=; b=N6Op7DqFWaTGInGAqtUx8J4k7g
 uiyT2LnaLQiigZuOu3kc2zTyLqg4O4Fo4oZnDHTh3OmscUjMOAOp3YsGwkczGqZfr8j4ks22liuJM
 cm1CGiIa8XGWTV/DkIGZyOmVPi7wJBy8pUwmnDLxgzRQBjSQuY9DchkRk73A6eL4099U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xzITosxmx6kMCfyCQt/IxBYd+ITgoPCs6oZNNpv3CcM=; b=hhXXpZhcKwxp2FnCp+MSgc4lLl
 1DdL+UMkk4rciJEYZIC0BQsFfCOZRy1Q0NZGG4N2znRq1qJhiAuW1WUlcZ63ViwICcs2KH6sCtNdt
 t/hEtNcOP6RdPKxlprHPuzH3EqI9M949vb+KafFNb6Z1GOxyEOff07+2QHO/HYsDIo20=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t65zq-0002E1-PN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Oct 2024 10:32:15 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 49UAVfg6026716;
 Wed, 30 Oct 2024 18:31:41 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Xdk1M63kyz2KSK4X;
 Wed, 30 Oct 2024 18:31:03 +0800 (CST)
Received: from tj10379pcu1.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 30 Oct 2024 18:31:39 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Wed, 30 Oct 2024 18:31:32 +0800
Message-ID: <20241030103136.2874140-2-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030103136.2874140-1-yi.sun@unisoc.com>
References: <20241030103136.2874140-1-yi.sun@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 49UAVfg6026716
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When using update_sit_entry() to release consecutive blocks, 
 ensure that the consecutive blocks belong to the same segment. Because after
 update_sit_entry_for_realese(), @segno is still in use in upda [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1t65zq-0002E1-PN
Subject: [f2fs-dev] [PATCH v2 1/5] f2fs: blocks need to belong to the same
 segment when using update_sit_entry()
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com, yi.sun@unisoc.com,
 hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When using update_sit_entry() to release consecutive blocks,
ensure that the consecutive blocks belong to the same segment.
Because after update_sit_entry_for_realese(), @segno is still
in use in update_sit_entry().

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
---
 fs/f2fs/segment.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index bb2fd98331cd..a5bd101c63a1 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2424,6 +2424,10 @@ static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr,
 		SIT_I(sbi)->max_mtime = ctime;
 }
 
+/*
+ * NOTE: when updating multiple blocks at the same time, please ensure
+ * that the consecutive input blocks belong to the same segment.
+ */
 static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_entry *se,
 				block_t blkaddr, unsigned int offset, int del)
 {
@@ -2434,6 +2438,8 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
 	int i;
 	int del_count = -del;
 
+	f2fs_bug_on(sbi, GET_SEGNO(sbi, blkaddr) != GET_SEGNO(sbi, blkaddr + del_count - 1));
+
 	for (i = 0; i < del_count; i++) {
 		exist = f2fs_test_and_clear_bit(offset + i, se->cur_valid_map);
 #ifdef CONFIG_F2FS_CHECK_FS
@@ -2476,6 +2482,11 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
 	return del;
 }
 
+/*
+ * If releasing blocks, this function supports updating multiple consecutive blocks
+ * at one time, but please note that these consecutive blocks need to belong to the
+ * same segment.
+ */
 static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 {
 	struct seg_entry *se;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
