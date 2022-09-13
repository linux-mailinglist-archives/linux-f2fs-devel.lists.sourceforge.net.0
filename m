Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2A95B6CD6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 14:10:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oY4kO-0000gY-RJ;
	Tue, 13 Sep 2022 12:10:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oY4kN-0000gK-Cp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 12:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uApcRS7VmgHdQRj5ZpUUW2bxS0zAnR9oBlDOrQ+sA0M=; b=XPD+800Gpsph38eExWXYa+g4h1
 HNpt4dWwCuEf4mklUb55ZVhspfLBxenfoWNe5NF2vgdLvq+OPN+sIp1uPeoa4lqSn6c9cFnaIidt9
 3lpO4disetD9fV7oxTeekZZkfc3PvSlG31om1zIrTxGEVNX5/UwkjQF2wevST/xGKzPY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uApcRS7VmgHdQRj5ZpUUW2bxS0zAnR9oBlDOrQ+sA0M=; b=b
 jcTgaX8bpTA+huVlLxS8qIwIKA9mwS2cbuztfEP1jqCxWtBigH5fuO66t3NwEdLCJaYrbInR03bKk
 KPju0iNYIQ02ogAyFcXiRLCDSXwDW0Dw/RsolrfFrLWlhw7WOPGp1gxEEZ1egzTX3dnzajdBC4mLU
 4k8HXIUhamOhi590=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oY4kK-006sSH-Qf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 12:10:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8952DB80E07
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Sep 2022 12:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1856C433C1;
 Tue, 13 Sep 2022 12:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663071017;
 bh=lUXTbzsYAvwyCD0dj6BBjjENOOHKM/L/iDGBcLQnHK8=;
 h=From:To:Cc:Subject:Date:From;
 b=C/LVvayC2S+B0QT5NE9QNjThqh3t1Bxfr12IsSefVMSpzrIQBioFgwy09LY+UzYFM
 fRbhVh8UCf9lTDEBwSdqCXXNX4qn6OrFTv8lJnid7oluYpHVGA7aNWyobvdHwT0uFP
 7+MHkn+IER5ldvsvXbfYe9NE+LzGrSTIxceiEX6+V2r5wNgeuPhDzx+DO8Y76COpYa
 zEOxQ1Amiab5J2a5OdlzoGSyFz5q7eZADf26js+zdOqoeC9N9mdydPEyrgu3YOuoFY
 QjJJv8DpeRjUEbudwOCjM3Kpr3cL43s2VXtLPurtRkb5/tELP1Vh28Pt25cRl3Hh8h
 bop2KSEphs8cQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 13 Sep 2022 20:09:37 +0800
Message-Id: <20220913120937.2407940-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Once CP_ERROR_FLAG is set, checkpoint is disallowed to be
 triggered to persist CP_FSCK_FLAG, fsck won't repair the image due to lack
 of CP_FSCK_FLAG. This patch proposes to persist newly introduced SB_NEED_FSCK
 flag into super block if CP_ERROR_FLAG and SBI_NEED_FSCK is set, later, once
 fsck detect this flag, it can check and repair corrupted image [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oY4kK-006sSH-Qf
Subject: [f2fs-dev] [RFC PATCH] f2fs: record need_fsck in super_block
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

Once CP_ERROR_FLAG is set, checkpoint is disallowed to be triggered to
persist CP_FSCK_FLAG, fsck won't repair the image due to lack of
CP_FSCK_FLAG.

This patch proposes to persist newly introduced SB_NEED_FSCK flag into
super block if CP_ERROR_FLAG and SBI_NEED_FSCK is set, later, once fsck
detect this flag, it can check and repair corrupted image in time.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c    |  6 +++++-
 fs/f2fs/f2fs.h          |  1 +
 fs/f2fs/inode.c         |  2 ++
 fs/f2fs/super.c         | 26 ++++++++++++++++++++++++++
 include/linux/f2fs_fs.h |  5 ++++-
 5 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index c3119e4c890c..0836fce40394 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -30,8 +30,12 @@ void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io)
 {
 	f2fs_build_fault_attr(sbi, 0, 0);
 	set_ckpt_flags(sbi, CP_ERROR_FLAG);
-	if (!end_io)
+	if (!end_io) {
 		f2fs_flush_merged_writes(sbi);
+
+		if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
+			f2fs_update_sb_flags(sbi, SB_NEED_FSCK);
+	}
 }
 
 /*
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index dee7b67a17a6..1960a98c7555 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3556,6 +3556,7 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
 int f2fs_quota_sync(struct super_block *sb, int type);
 loff_t max_file_blocks(struct inode *inode);
 void f2fs_quota_off_umount(struct super_block *sb);
+void f2fs_update_sb_flags(struct f2fs_sb_info *sbi, unsigned int flag);
 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
 int f2fs_sync_fs(struct super_block *sb, int sync);
 int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 1baac6056733..0e38787bf35b 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -706,6 +706,8 @@ void f2fs_update_inode_page(struct inode *inode)
 	struct page *node_page;
 retry:
 	node_page = f2fs_get_node_page(sbi, inode->i_ino);
+	f2fs_put_page(node_page, 1);
+	node_page = ERR_PTR(-EFSCORRUPTED);
 	if (IS_ERR(node_page)) {
 		int err = PTR_ERR(node_page);
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b8e5fe244596..c99ba840593d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3846,6 +3846,32 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
 	return err;
 }
 
+void f2fs_update_sb_flags(struct f2fs_sb_info *sbi, unsigned int flag)
+{
+	unsigned short s_flags;
+	int err;
+
+	if (le16_to_cpu(F2FS_RAW_SUPER(sbi)->s_flags) & SB_NEED_FSCK)
+		return;
+
+	f2fs_down_write(&sbi->sb_lock);
+
+	s_flags = le16_to_cpu(F2FS_RAW_SUPER(sbi)->s_flags);
+
+	if (s_flags & SB_NEED_FSCK)
+		goto out_unlock;
+
+	F2FS_RAW_SUPER(sbi)->s_flags = cpu_to_le16(s_flags | SB_NEED_FSCK);
+
+	err = f2fs_commit_super(sbi, false);
+	if (err) {
+		f2fs_warn(sbi, "f2fs_commit_super fails to persist flag: %u, err:%d", flag, err);
+		F2FS_RAW_SUPER(sbi)->s_flags = s_flags;
+	}
+out_unlock:
+	f2fs_up_write(&sbi->sb_lock);
+}
+
 static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index d445150c5350..124176e2a42c 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -73,6 +73,8 @@ struct f2fs_device {
 	__le32 total_segments;
 } __packed;
 
+#define SB_NEED_FSCK			0x00000001	/* need fsck */
+
 struct f2fs_super_block {
 	__le32 magic;			/* Magic Number */
 	__le16 major_ver;		/* Major Version */
@@ -116,7 +118,8 @@ struct f2fs_super_block {
 	__u8 hot_ext_count;		/* # of hot file extension */
 	__le16  s_encoding;		/* Filename charset encoding */
 	__le16  s_encoding_flags;	/* Filename charset encoding flags */
-	__u8 reserved[306];		/* valid reserved region */
+	__le16 s_flags;			/* super block flags */
+	__u8 reserved[304];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
 } __packed;
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
