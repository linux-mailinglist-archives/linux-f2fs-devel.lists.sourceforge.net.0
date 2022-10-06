Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A48175F6A67
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Oct 2022 17:17:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ogSd2-00036F-92;
	Thu, 06 Oct 2022 15:17:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ogSd0-000362-Qc
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 15:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tPHfBPMVKqL9RJasHX5sx62xeQc9qphco+V5g7LrSws=; b=lHRP28Dgv6aY+EPQ6P2i2ERTF9
 ykTuEKMVjcdIig0z/qxblh1Z/Z6L0fY621p26jl4aCjdftGwcJ2IpEOJ1yCVYFZBFmjQSie/qoVoe
 KGhipTszEerCC5bisySmoP1ebILQ1tCshOXxHMu9MGtJ4iQeFuXhkcLoN0Yhc5M24hWk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tPHfBPMVKqL9RJasHX5sx62xeQc9qphco+V5g7LrSws=; b=bI+/2tdTJCP5X0ra27YPeJAo0p
 Lhy9HCoFc4tVz+JmIEWu3lmdsQDGrohh3Lt1RGB8R0NSL3XZ6pn1YVCPKnuSYN6PYsxy1sb3JpdlQ
 S8/IZsImnBZm9hnXvLWwPOlhiBVJ2AePxV0OWqSZ7i5V62wilCrcKKIqJvtYn7mQ2LmI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ogSd0-00EpD3-6f for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 15:17:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8C226189D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Oct 2022 15:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985A3C433D7;
 Thu,  6 Oct 2022 15:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665069452;
 bh=KegCTwo0J1NmVSUHYJsrfkLuZMLue/5Q/BnCKiVzIG4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iv+t+pJV/ZO10pEjAgPvNfl170kGQjrQT6qUOel3yoUri9wZUrzU6VAIg0AW4QLsT
 7Hi9WNBv468mKZQ8QXY4MUhZQi56qtbGCqlJ/JrZ/gM+eq7gzyLl2W69eTmcFzHpD8
 BLWK+SZbQBgsePXxJ7YUMCcCsOBlSPB88OKmBGI7PNRL1V+HxKqq7hD0l2IpNc5gZW
 50DIoCg4HzCQb2705YZ4kKAg0a5nN0vtyFMoLdQcLs6lojUjn5AqoJkU0uMCiHGFdJ
 75PyXhz6ZyzfQoB0x0MCZvXkHBubP+WQjWeddT9bCC4pCna4zVjt9dEBz1zruUWSJx
 u2S3Fk8y2L18w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  6 Oct 2022 23:17:27 +0800
Message-Id: <20221006151727.58380-2-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221006151727.58380-1-chao@kernel.org>
References: <20221006151727.58380-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In auto/preen mode, let's trigger repairing if filesystem
 has inconsistent errors. Signed-off-by: Chao Yu <chao@kernel.org> ---
 fsck/fsck.c | 8 ++++++-- fsck/fsck.h | 1 + fsck/mount.c | 52
 ++++++++++++++++++++++++++++++++++++++++++++++-
 include/f2fs_fs.h | 26 +++++++++++++++++++++++ [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ogSd0-00EpD3-6f
Subject: [f2fs-dev] [PATCH 2/2] fsck.f2fs: trigger repairing if filesystem
 has inconsistent errors
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In auto/preen mode, let's trigger repairing if filesystem has
inconsistent errors.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c       |  8 ++++++--
 fsck/fsck.h       |  1 +
 fsck/mount.c      | 52 ++++++++++++++++++++++++++++++++++++++++++++++-
 include/f2fs_fs.h | 26 +++++++++++++++++++++++-
 4 files changed, 83 insertions(+), 4 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index db14859..036a834 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3368,10 +3368,14 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			write_checkpoints(sbi);
 		}
 
-		if (c.abnormal_stop) {
+		if (c.abnormal_stop)
 			memset(sb->s_stop_reason, 0, MAX_STOP_REASON);
+
+		if (c.fs_errors)
+			memset(sb->s_errors, 0, MAX_F2FS_ERRORS);
+
+		if (c.abnormal_stop || c.fs_errors)
 			update_superblock(sb, SB_MASK_ALL);
-		}
 
 		/* to return FSCK_ERROR_CORRECTED */
 		ret = 0;
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 6f0b019..939450f 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -238,6 +238,7 @@ extern void update_nat_blkaddr(struct f2fs_sb_info *, nid_t, nid_t, block_t);
 
 extern void print_raw_sb_info(struct f2fs_super_block *);
 extern bool is_checkpoint_stop(struct f2fs_super_block *, bool);
+extern bool is_inconsistent_error(struct f2fs_super_block *);
 extern pgoff_t current_nat_addr(struct f2fs_sb_info *, nid_t, int *);
 
 extern u32 get_free_segments(struct f2fs_sb_info *);
diff --git a/fsck/mount.c b/fsck/mount.c
index 6b21625..0597220 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -611,6 +611,42 @@ void print_sb_stop_reason(struct f2fs_super_block *sb)
 	MSG(0, "\n");
 }
 
+static char *errors_str[] = {
+	[ERROR_CORRUPTED_CLUSTER]		= "corrupted_cluster",
+	[ERROR_FAIL_DECOMPRESSION]		= "fail_decompression",
+	[ERROR_INVALID_BLKADDR]			= "invalid_blkaddr",
+	[ERROR_CORRUPTED_DIRENT]		= "corrupted_dirent",
+	[ERROR_CORRUPTED_INODE]			= "corrupted_inode",
+	[ERROR_INCONSISTENT_SUMMARY]		= "inconsistent_summary",
+	[ERROR_INCONSISTENT_FOOTER]		= "inconsistent_footer",
+	[ERROR_INCONSISTENT_SUM_TYPE]		= "inconsistent_sum_type",
+	[ERROR_CORRUPTED_JOURNAL]		= "corrupted_journal",
+	[ERROR_INCONSISTENT_NODE_COUNT]		= "inconsistent_node_count",
+	[ERROR_INCONSISTENT_BLOCK_COUNT]	= "inconsistent_block_count",
+	[ERROR_INVALID_CURSEG]			= "invalid_curseg",
+	[ERROR_INCONSISTENT_SIT]		= "inconsistent_sit",
+	[ERROR_CORRUPTED_VERITY_XATTR]		= "corrupted_verity_xattr",
+	[ERROR_CORRUPTED_XATTR]			= "corrupted_xattr",
+};
+
+void print_sb_errors(struct f2fs_super_block *sb)
+{
+	u8 *errors = sb->s_errors;
+	int i;
+
+	if (!c.fs_errors)
+		return;
+
+	MSG(0, "Info: fs errors: ");
+
+	for (i = 0; i < ERROR_MAX; i++) {
+		if (test_bit_le(i, errors))
+			MSG(0, "%s ",  errors_str[i]);
+	}
+
+	MSG(0, "\n");
+}
+
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
@@ -996,12 +1032,14 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 
 		c.force_stop = is_checkpoint_stop(sbi->raw_super, false);
 		c.abnormal_stop = is_checkpoint_stop(sbi->raw_super, true);
+		c.fs_errors = is_inconsistent_error(sbi->raw_super);
 
 		MSG(0, "Info: MKFS version\n  \"%s\"\n", c.init_version);
 		MSG(0, "Info: FSCK version\n  from \"%s\"\n    to \"%s\"\n",
 					c.sb_version, c.version);
 		print_sb_state(sbi->raw_super);
 		print_sb_stop_reason(sbi->raw_super);
+		print_sb_errors(sbi->raw_super);
 		return 0;
 	}
 
@@ -1247,6 +1285,18 @@ bool is_checkpoint_stop(struct f2fs_super_block *sb, bool abnormal)
 	return false;
 }
 
+bool is_inconsistent_error(struct f2fs_super_block *sb)
+{
+	int i;
+
+	for (i = 0; i < MAX_F2FS_ERRORS; i++) {
+		if (sb->s_errors[i])
+			return true;
+	}
+
+	return false;
+}
+
 /*
  * For a return value of 1, caller should further check for c.fix_on state
  * and take appropriate action.
@@ -1256,7 +1306,7 @@ static int f2fs_should_proceed(struct f2fs_super_block *sb, u32 flag)
 	if (!c.fix_on && (c.auto_fix || c.preen_mode)) {
 		if (flag & CP_FSCK_FLAG ||
 			flag & CP_QUOTA_NEED_FSCK_FLAG ||
-			c.abnormal_stop ||
+			c.abnormal_stop || c.fs_errors ||
 			(exist_qf_ino(sb) && (flag & CP_ERROR_FLAG))) {
 			c.fix_on = 1;
 		} else if (!c.preen_mode) {
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 424eaad..5fa9931 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -510,6 +510,7 @@ struct f2fs_configuration {
 	int bug_on;
 	int force_stop;
 	int abnormal_stop;
+	int fs_errors;
 	int bug_nat_bits;
 	bool quota_fixed;
 	int alloc_failed;
@@ -773,6 +774,28 @@ enum stop_cp_reason {
 
 #define	MAX_STOP_REASON			32
 
+/* detail reason for EFSCORRUPTED */
+enum f2fs_error {
+	ERROR_CORRUPTED_CLUSTER,
+	ERROR_FAIL_DECOMPRESSION,
+	ERROR_INVALID_BLKADDR,
+	ERROR_CORRUPTED_DIRENT,
+	ERROR_CORRUPTED_INODE,
+	ERROR_INCONSISTENT_SUMMARY,
+	ERROR_INCONSISTENT_FOOTER,
+	ERROR_INCONSISTENT_SUM_TYPE,
+	ERROR_CORRUPTED_JOURNAL,
+	ERROR_INCONSISTENT_NODE_COUNT,
+	ERROR_INCONSISTENT_BLOCK_COUNT,
+	ERROR_INVALID_CURSEG,
+	ERROR_INCONSISTENT_SIT,
+	ERROR_CORRUPTED_VERITY_XATTR,
+	ERROR_CORRUPTED_XATTR,
+	ERROR_MAX,
+};
+
+#define MAX_F2FS_ERRORS			16
+
 struct f2fs_super_block {
 	__le32 magic;			/* Magic Number */
 	__le16 major_ver;		/* Major Version */
@@ -818,7 +841,8 @@ struct f2fs_super_block {
 	__le16  s_encoding;		/* Filename charset encoding */
 	__le16  s_encoding_flags;	/* Filename charset encoding flags */
 	__u8 s_stop_reason[MAX_STOP_REASON];	/* stop checkpoint reason */
-	__u8 reserved[274];		/* valid reserved region */
+	__u8 s_errors[MAX_F2FS_ERRORS];		/* reason of image corrupts */
+	__u8 reserved[258];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
 };
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
