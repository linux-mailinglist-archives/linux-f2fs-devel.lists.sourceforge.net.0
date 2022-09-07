Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 827A25B00D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Sep 2022 11:47:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVreZ-0005GN-Kk;
	Wed, 07 Sep 2022 09:47:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oVreU-0005Fe-JL
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Sep 2022 09:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P2lJknDV5Pyx7S0drpWKi7TBL4jWnWHWzzqwVuRm8Q8=; b=HFRid7E3HeWqlmUahLIvCvU9Ba
 ov+rtErp0IZCkhMRmfsy4JdconkMKPblGbOzQ1kXy9AqrajwVKxGJXstiSlCJoR9h62gcrKFYj/r9
 9ZispoN9FWwXKQLO6MQUGjVkCMZSFKd6ZFzkpSqPphaG6JMasu348RHhuQSWph6lUNZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=P2lJknDV5Pyx7S0drpWKi7TBL4jWnWHWzzqwVuRm8Q8=; b=i
 gK35yB9C+d2uTSZdoYqj4aadA2nidUo7muB/SiuBV6/z8zV9THEyV1o9a5f9vJ4s71pxmKnG/v5ef
 zXKJQLPzXRvebSb9N+w4zADqTV7Ts+PEL9+M5McSl01/bWA4/vqcef/6F+6+zcfQ4maVidC0HuCfq
 60ynWnVk0Cy3Qq2Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVreT-000qXL-Rj for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Sep 2022 09:47:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7DC3B6184B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Sep 2022 09:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA80C433C1;
 Wed,  7 Sep 2022 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662544035;
 bh=wxDlJ0c4hKUVZs9suWhzzgYGQD2Bvgrvh0QGKG1hKb0=;
 h=From:To:Cc:Subject:Date:From;
 b=KzWTPFGlB0P12wKBjBa0PAsUsgQmI+XWbylhGg2ID3BaFeW+8gAMJxPyjMHw/G6M8
 hKWBXYwaVtUWIYMffQlH9KQsCNPVTLmrDUVe4jF5uayxgTvhwWITUrGXEDRTEzLKn2
 PzYybZytft/jRhtY38w3yviwzoCF7ij2E/gqgoH/SaBVQ+culyJ40YOJieRJHEpdmY
 7uEM9me+FXZjju3kW8rjTrqfdUfM1sxQw0BZia9VGkj05eLtekZRnUSEtyPeU1bNMA
 x42tYBDiR+NmJmF9BalC781hveOE0AKOTbBi693J0/Q/wx9NLwmyr9GSi4Z/5srRgQ
 BJkNt/w7e21uA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed,  7 Sep 2022 17:47:08 +0800
Message-Id: <20220907094708.3679424-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Wenqing Liu reported in bugzilla:
 https://bugzilla.kernel.org/show_bug.cgi?id=216456
 loop5: detected capacity change from 0 to 131072 F2FS-fs (loop5):
 recover_inode:
 ino = 6, name = hln, inline = 1 F2FS-fs (loop5): recover_data: ino = 6 (i_size:
 recover) err = 0 F2FS-fs (loop5): recov [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oVreT-000qXL-Rj
Subject: [f2fs-dev] [PATCH] f2fs: fix to do sanity on destination blkaddr
 during recovery
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Wenqing Liu reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=216456

loop5: detected capacity change from 0 to 131072
F2FS-fs (loop5): recover_inode: ino = 6, name = hln, inline = 1
F2FS-fs (loop5): recover_data: ino = 6 (i_size: recover) err = 0
F2FS-fs (loop5): recover_inode: ino = 6, name = hln, inline = 1
F2FS-fs (loop5): recover_data: ino = 6 (i_size: recover) err = 0
F2FS-fs (loop5): recover_inode: ino = 6, name = hln, inline = 1
F2FS-fs (loop5): recover_data: ino = 6 (i_size: recover) err = 0
F2FS-fs (loop5): Bitmap was wrongly set, blk:5634
------------[ cut here ]------------
WARNING: CPU: 3 PID: 1013 at fs/f2fs/segment.c:2198
RIP: 0010:update_sit_entry+0xa55/0x10b0 [f2fs]
Call Trace:
 <TASK>
 f2fs_do_replace_block+0xa98/0x1890 [f2fs]
 f2fs_replace_block+0xeb/0x180 [f2fs]
 recover_data+0x1a69/0x6ae0 [f2fs]
 f2fs_recover_fsync_data+0x120d/0x1fc0 [f2fs]
 f2fs_fill_super+0x4665/0x61e0 [f2fs]
 mount_bdev+0x2cf/0x3b0
 legacy_get_tree+0xed/0x1d0
 vfs_get_tree+0x81/0x2b0
 path_mount+0x47e/0x19d0
 do_mount+0xce/0xf0
 __x64_sys_mount+0x12c/0x1a0
 do_syscall_64+0x38/0x90
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

If we enable CONFIG_F2FS_CHECK_FS config, it will trigger a kernel panic
instead of warning.

The root cause is: in fuzzed image, SIT table is inconsistent with inode
mapping table, result in triggering such warning during SIT table update.

This patch introduces a new flag DATA_GENERIC_ENHANCE_UPDATE, w/ this
flag, data block recovery flow can check destination blkaddr's validation
in SIT table, and skip f2fs_replace_block() to avoid inconsistent status.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 10 +++++++++-
 fs/f2fs/f2fs.h       |  4 ++++
 fs/f2fs/recovery.c   |  8 ++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 7bf1feb5ac78..dd7c7e7f2f4a 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -140,7 +140,7 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
 	unsigned int segno, offset;
 	bool exist;
 
-	if (type != DATA_GENERIC_ENHANCE && type != DATA_GENERIC_ENHANCE_READ)
+	if (type == DATA_GENERIC)
 		return true;
 
 	segno = GET_SEGNO(sbi, blkaddr);
@@ -148,6 +148,13 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
 	se = get_seg_entry(sbi, segno);
 
 	exist = f2fs_test_bit(offset, se->cur_valid_map);
+	if (exist && type == DATA_GENERIC_ENHANCE_UPDATE) {
+		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
+			 blkaddr, exist);
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		return exist;
+	}
+
 	if (!exist && type == DATA_GENERIC_ENHANCE) {
 		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
 			 blkaddr, exist);
@@ -185,6 +192,7 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 	case DATA_GENERIC:
 	case DATA_GENERIC_ENHANCE:
 	case DATA_GENERIC_ENHANCE_READ:
+	case DATA_GENERIC_ENHANCE_UPDATE:
 		if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
 				blkaddr < MAIN_BLKADDR(sbi))) {
 			f2fs_warn(sbi, "access invalid blkaddr:%u",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 35f9e1a6a1bf..baf621ca2fe7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -266,6 +266,10 @@ enum {
 					 * condition of read on truncated area
 					 * by extent_cache
 					 */
+	DATA_GENERIC_ENHANCE_UPDATE,	/*
+					 * strong check on range and segment
+					 * bitmap for update case
+					 */
 	META_GENERIC,
 };
 
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index dcd0a1e35095..8326003e6918 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -698,6 +698,14 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 				goto err;
 			}
 
+			if (f2fs_is_valid_blkaddr(sbi, dest,
+					DATA_GENERIC_ENHANCE_UPDATE)) {
+				f2fs_err(sbi, "Inconsistent dest blkaddr:%u, ino:%lu, ofs:%u",
+					dest, inode->i_ino, dn.ofs_in_node);
+				err = -EFSCORRUPTED;
+				goto err;
+			}
+
 			/* write dummy data page */
 			f2fs_replace_block(sbi, &dn, src, dest,
 						ni.version, false, false);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
