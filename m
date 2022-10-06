Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7E05F6A68
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Oct 2022 17:17:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ogSd9-0006Vd-0g;
	Thu, 06 Oct 2022 15:17:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ogSd7-0006VQ-Ck
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 15:17:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fu9eyV9uxRMoMBKndf/riaFbbiljexM1egrR54tPUVY=; b=jwlkLy7q0NgdK8pFYeiDH2/Jm4
 nXVoOj6B9Fuk7BIRRNwi6hQhY5xbHio8HQoQIxhCQ9P6ast97pP2y35V3naeyfYdSlWTcy91XlU7A
 EOmcEnV06umbWO6+0TA0FhrrJEN5Ucn0f8ddW6z0WGsvxJ9ouLQsFZH2GxOoXjUpbTi0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fu9eyV9uxRMoMBKndf/riaFbbiljexM1egrR54tPUVY=; b=I
 gSinvGXJc2D781S7QC/jOiyF8LX1FgOY40hKtXTSuB6owkLvC0m9NmFWia9TdYMHKmDKKcrUWfz+c
 yANvzGAd4M4JixoTS5HV7A/9jSnLL+bvxFL0ZApmWpwzKt7LBIRdVvZ8ucQJocI7msn165ToFrVzi
 DPUnDxPU1rqTp134=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ogSd5-000745-Vr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 15:17:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C61C8619E9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Oct 2022 15:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C56C433D6;
 Thu,  6 Oct 2022 15:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665069451;
 bh=i6epQICpOrdTLGsgLMdSz1/e5iTs2NPuz01NjLUiFqo=;
 h=From:To:Cc:Subject:Date:From;
 b=cA7cYgELHMUVFUgM5Mzlnb2PRfspN40WK8rIiOkbDstqz8hrAqD6h4hL9NUsqy+sB
 ISCybdAegm4C4EXtI19hGh8UAxUUMGlTsBMmMpU+hlgd6lHFk2m3JGEL9dr55o5/P3
 5ggYINGUr5XUjFYUCvV0BwmrNb7sbU8gDEBpsws0mGTQtXCnFpaqHDZTzDS+FtwgDO
 nzvRmjH5V/k53DyT5XQvVUSSQTZbSQKnHodPD1H0+EqZf8xwBV6/+kEOHv++KaeMTs
 iZfwhtTG/z9PLgWnHlNJ39dpdwkoVB7YsaWMhPMR4+V8q85n41utBvHxo/2ZRMZu1T
 7EQTuYyVkSNOA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  6 Oct 2022 23:17:26 +0800
Message-Id: <20221006151727.58380-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In auto/preen mode, let's trigger repairing if filesystem
 was forced to stop. Signed-off-by: Chao Yu <chao@kernel.org> --- fsck/fsck.c
 | 7 +++++++ fsck/fsck.h | 1 + fsck/mount.c | 47
 +++++++++++++++++++++++++++++++++++++++++++++++
 include/f2fs_fs.h | 19 ++++++++++++++++++- 4 fi [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ogSd5-000745-Vr
Subject: [f2fs-dev] [PATCH 1/2] fsck.f2fs: trigger repairing if filesystem
 was forced to stop
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

In auto/preen mode, let's trigger repairing if filesystem was forced
to stop.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c       |  7 +++++++
 fsck/fsck.h       |  1 +
 fsck/mount.c      | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 include/f2fs_fs.h | 19 ++++++++++++++++++-
 4 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 2f6cc72..db14859 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3351,6 +3351,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	/* fix global metadata */
 	if (force || (c.fix_on && f2fs_dev_is_writable())) {
 		struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
+		struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 
 		if (force || c.bug_on || c.bug_nat_bits || c.quota_fixed) {
 			/* flush nats to write_nit_bits below */
@@ -3366,6 +3367,12 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			is_set_ckpt_flags(cp, CP_QUOTA_NEED_FSCK_FLAG)) {
 			write_checkpoints(sbi);
 		}
+
+		if (c.abnormal_stop) {
+			memset(sb->s_stop_reason, 0, MAX_STOP_REASON);
+			update_superblock(sb, SB_MASK_ALL);
+		}
+
 		/* to return FSCK_ERROR_CORRECTED */
 		ret = 0;
 	}
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 8234986..6f0b019 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -237,6 +237,7 @@ extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t);
 extern void update_nat_blkaddr(struct f2fs_sb_info *, nid_t, nid_t, block_t);
 
 extern void print_raw_sb_info(struct f2fs_super_block *);
+extern bool is_checkpoint_stop(struct f2fs_super_block *, bool);
 extern pgoff_t current_nat_addr(struct f2fs_sb_info *, nid_t, int *);
 
 extern u32 get_free_segments(struct f2fs_sb_info *);
diff --git a/fsck/mount.c b/fsck/mount.c
index aebe363..6b21625 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -583,6 +583,34 @@ void print_sb_state(struct f2fs_super_block *sb)
 	MSG(0, "\n");
 }
 
+static char *stop_reason_str[] = {
+	[STOP_CP_REASON_SHUTDOWN]		= "shutdown",
+	[STOP_CP_REASON_FAULT_INJECT]		= "fault_inject",
+	[STOP_CP_REASON_META_PAGE]		= "meta_page",
+	[STOP_CP_REASON_WRITE_FAIL]		= "write_fail",
+	[STOP_CP_REASON_CORRUPTED_SUMMARY]	= "corrupted_summary",
+	[STOP_CP_REASON_UPDATE_INODE]		= "update_inode",
+	[STOP_CP_REASON_FLUSH_FAIL]		= "flush_fail",
+};
+
+void print_sb_stop_reason(struct f2fs_super_block *sb)
+{
+	u8 *reason = sb->s_stop_reason;
+	int i;
+
+	if (!c.force_stop)
+		return;
+
+	MSG(0, "Info: checkpoint stop reason: ");
+
+	for (i = 0; i < STOP_CP_REASON_MAX; i++) {
+		if (reason[i])
+			MSG(0, "%s(%d) ", stop_reason_str[i], reason[i]);
+	}
+
+	MSG(0, "\n");
+}
+
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
@@ -966,10 +994,14 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 				VERSION_NAME_LEN);
 		get_kernel_version(c.init_version);
 
+		c.force_stop = is_checkpoint_stop(sbi->raw_super, false);
+		c.abnormal_stop = is_checkpoint_stop(sbi->raw_super, true);
+
 		MSG(0, "Info: MKFS version\n  \"%s\"\n", c.init_version);
 		MSG(0, "Info: FSCK version\n  from \"%s\"\n    to \"%s\"\n",
 					c.sb_version, c.version);
 		print_sb_state(sbi->raw_super);
+		print_sb_stop_reason(sbi->raw_super);
 		return 0;
 	}
 
@@ -1201,6 +1233,20 @@ fail_no_cp:
 	return -EINVAL;
 }
 
+bool is_checkpoint_stop(struct f2fs_super_block *sb, bool abnormal)
+{
+	int i;
+
+	for (i = 0; i < STOP_CP_REASON_MAX; i++) {
+		if (abnormal && i == STOP_CP_REASON_SHUTDOWN)
+			continue;
+		if (sb->s_stop_reason[i])
+			return true;
+	}
+
+	return false;
+}
+
 /*
  * For a return value of 1, caller should further check for c.fix_on state
  * and take appropriate action.
@@ -1210,6 +1256,7 @@ static int f2fs_should_proceed(struct f2fs_super_block *sb, u32 flag)
 	if (!c.fix_on && (c.auto_fix || c.preen_mode)) {
 		if (flag & CP_FSCK_FLAG ||
 			flag & CP_QUOTA_NEED_FSCK_FLAG ||
+			c.abnormal_stop ||
 			(exist_qf_ino(sb) && (flag & CP_ERROR_FLAG))) {
 			c.fix_on = 1;
 		} else if (!c.preen_mode) {
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index c36c623..424eaad 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -508,6 +508,8 @@ struct f2fs_configuration {
 	int force;
 	int defset;
 	int bug_on;
+	int force_stop;
+	int abnormal_stop;
 	int bug_nat_bits;
 	bool quota_fixed;
 	int alloc_failed;
@@ -757,6 +759,20 @@ struct f2fs_device {
 
 static_assert(sizeof(struct f2fs_device) == 68, "");
 
+/* reason of stop_checkpoint */
+enum stop_cp_reason {
+	STOP_CP_REASON_SHUTDOWN,
+	STOP_CP_REASON_FAULT_INJECT,
+	STOP_CP_REASON_META_PAGE,
+	STOP_CP_REASON_WRITE_FAIL,
+	STOP_CP_REASON_CORRUPTED_SUMMARY,
+	STOP_CP_REASON_UPDATE_INODE,
+	STOP_CP_REASON_FLUSH_FAIL,
+	STOP_CP_REASON_MAX,
+};
+
+#define	MAX_STOP_REASON			32
+
 struct f2fs_super_block {
 	__le32 magic;			/* Magic Number */
 	__le16 major_ver;		/* Major Version */
@@ -801,7 +817,8 @@ struct f2fs_super_block {
 	__u8 hot_ext_count;		/* # of hot file extension */
 	__le16  s_encoding;		/* Filename charset encoding */
 	__le16  s_encoding_flags;	/* Filename charset encoding flags */
-	__u8 reserved[306];		/* valid reserved region */
+	__u8 s_stop_reason[MAX_STOP_REASON];	/* stop checkpoint reason */
+	__u8 reserved[274];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
 };
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
