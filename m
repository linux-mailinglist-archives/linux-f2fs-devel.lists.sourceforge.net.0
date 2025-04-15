Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4171A897F0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Apr 2025 11:28:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4caW-0001nn-DO;
	Tue, 15 Apr 2025 09:28:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u4caQ-0001nc-DL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Apr 2025 09:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eFLyGN2CDA0UyOXA0we00MIBY1+pSIdc2Y5D7dwItHc=; b=TU95nKaj4VJxAhtVp8KNn1eeXb
 PYbiEqOrYgXWJ6NnP8bQPbAPJ8nnorJe+7k/3tdrwfbvu8Cql8xTphi56criFRZGWMOhFcfw5mP/q
 Bipu4NMGyVm883vdK23uazXcobkN7qgL1PJ6dVsX7WrCVvn5cZp2c+BNwKitgE4rEafc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eFLyGN2CDA0UyOXA0we00MIBY1+pSIdc2Y5D7dwItHc=; b=h
 B78ppY6eUwMASMjLHnBRdgBdArvKgmZBAl+yaF/qTtIiKJWYrZTSrTxnvNjPqJDePFFeu5JGdzl03
 3z23xwozyMaUSy4mKj+rHqc0Fdv8J17eUtOVtt2HKHGTmRKS+mxrrhGwcTpE56p1z8OGk/4/kmqiN
 wzukRDcSG+KWfldg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u4caA-0004Dp-Fh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Apr 2025 09:28:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E785A4A38B;
 Tue, 15 Apr 2025 09:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF281C4CEDD;
 Tue, 15 Apr 2025 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744709268;
 bh=5nV170JnOuuSF775PkK6gAX3Veu5L3jZc8xTlyApEzE=;
 h=From:To:Cc:Subject:Date:From;
 b=RAcVcz8J1EIprHJWjz/2SGxQHIDgr4FqwFpnvkP5hSnRNK2SLMvkD+AFF+RO+0012
 0/o+mAs7nC6EE15erEvB13hkaEZAxMYLvQWQMzytGWvIqBArfOyMZ+dlOWAAH6PrgT
 mibBfqK4hk3kGnBerUlBPCdWwofA7NxHhMwo26xixo+sNEQEcmTfZ/8PwaYjHTqAM5
 AaVD+3YubaX5AwTKNYAA5Oy2Eumeyfo9C59nENBPum34rfOmbGRTLHlVPOLcbT9Cns
 Uc0arltmNWwwEczyMQAAmn2D6qyY9SiiUYZp3uyede9/QbPsmnLoqAIQqDOwvmA1vK
 p0Z0plNA0wpBA==
To: jaegeuk@kernel.org
Date: Tue, 15 Apr 2025 17:27:40 +0800
Message-ID: <20250415092740.1096360-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Support a new option --nolinear-lookup=X for fsck.f2fs to
 tune linear lookup fallback conditionally, X=1: disable linear lookup, X=0:
 enable linear lookup. This can help to 1) add a regression testcase to check
 kernel whether linear lookup fallback has fixed unicode red heart lookup
 issue, 2) once unicode bug has been fixed, we can use this option to dis [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u4caA-0004Dp-Fh
Subject: [f2fs-dev] [PATCH v3] fsck.f2fs: support to tune linear lookup
 feature
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Support a new option --nolinear-lookup=X for fsck.f2fs to tune
linear lookup fallback conditionally, X=1: disable linear lookup,
X=0: enable linear lookup.

This can help to 1) add a regression testcase to check kernel
whether linear lookup fallback has fixed unicode red heart lookup
issue, 2) once unicode bug has been fixed, we can use this option
to disable linear lookup for performance recovery.

Cc: Daniel Lee <chullee@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- since c.nolinear_lookup is zero by default, even we do not specify
--nolinear-lookup=X option, it will try to enable linear_lookup during
fsck. Let's add enum to indicate status of c.nolinear_lookup option,
by default set c.nolinear_lookup to LINEAR_LOOKUP_DEFAULT.
LINEAR_LOOKUP_DEFAULT:	not to tune linear_lookup feature
LINEAR_LOOKUP_ENABLE:	enable linear_lookup feature
LINEAR_LOOKUP_DISABLE:	disable linear_lookup feature
 fsck/fsck.c       | 30 +++++++++++++++++++++++++++++-
 fsck/fsck.h       |  1 +
 fsck/main.c       | 10 ++++++++++
 include/f2fs_fs.h | 15 +++++++++++++--
 man/fsck.f2fs.8   |  3 +++
 5 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 8155cbd..73fcf07 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2357,6 +2357,34 @@ int fsck_chk_quota_files(struct f2fs_sb_info *sbi)
 	return ret;
 }
 
+void fsck_update_sb_flags(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
+	u16 flags = get_sb(s_encoding_flags);
+
+	if (c.nolinear_lookup == LINEAR_LOOKUP_DISABLE) {
+		if (!(flags & F2FS_ENC_NO_COMPAT_FALLBACK_FL)) {
+			flags |= F2FS_ENC_NO_COMPAT_FALLBACK_FL;
+			set_sb(s_encoding_flags, flags);
+			c.fix_on = 1;
+			c.invalid_sb |= SB_ENCODE_FLAG;
+			INFO_MSG("Casefold: disable linear lookup\n");
+		}
+	} else if (c.nolinear_lookup == LINEAR_LOOKUP_ENABLE) {
+		if (flags & F2FS_ENC_NO_COMPAT_FALLBACK_FL) {
+			flags &= ~F2FS_ENC_NO_COMPAT_FALLBACK_FL;
+			set_sb(s_encoding_flags, flags);
+			c.fix_on = 1;
+			c.invalid_sb |= SB_ENCODE_FLAG;
+			INFO_MSG("Casefold: enable linear lookup\n");
+		}
+	} else {
+		INFO_MSG("Casefold: linear_lookup [%s]\n",
+			get_sb(s_encoding_flags) & F2FS_ENC_NO_COMPAT_FALLBACK_FL ?
+			"disable" : "enable");
+	}
+}
+
 int fsck_chk_meta(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
@@ -3770,7 +3798,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		if (c.invalid_sb & SB_FS_ERRORS)
 			memset(sb->s_errors, 0, MAX_F2FS_ERRORS);
 
-		if (c.invalid_sb & SB_NEED_FIX)
+		if (c.invalid_sb & (SB_NEED_FIX | SB_ENCODE_FLAG))
 			update_superblock(sb, SB_MASK_ALL);
 
 		/* to return FSCK_ERROR_CORRECTED */
diff --git a/fsck/fsck.h b/fsck/fsck.h
index b581d3e..40cb6d9 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -188,6 +188,7 @@ extern int fsck_chk_dentry_blk(struct f2fs_sb_info *, int,
 int fsck_chk_inline_dentries(struct f2fs_sb_info *, struct f2fs_node *,
 		struct child_info *);
 void fsck_chk_checkpoint(struct f2fs_sb_info *sbi);
+void fsck_update_sb_flags(struct f2fs_sb_info *sbi);
 int fsck_chk_meta(struct f2fs_sb_info *sbi);
 void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *);
 int fsck_chk_curseg_info(struct f2fs_sb_info *);
diff --git a/fsck/main.c b/fsck/main.c
index 47ba6c9..b33ff26 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -91,6 +91,7 @@ void fsck_usage()
 	MSG(0, "  --no-kernel-check skips detecting kernel change\n");
 	MSG(0, "  --kernel-check checks kernel change\n");
 	MSG(0, "  --debug-cache to debug cache when -c is used\n");
+	MSG(0, "  --nolinear-lookup=X X=1: disable linear lookup, X=0: enable linear lookup\n");
 	exit(1);
 }
 
@@ -263,6 +264,7 @@ void f2fs_parse_options(int argc, char *argv[])
 			{"no-kernel-check", no_argument, 0, 2},
 			{"kernel-check", no_argument, 0, 3},
 			{"debug-cache", no_argument, 0, 4},
+			{"nolinear-lookup", required_argument, 0, 5},
 			{0, 0, 0, 0}
 		};
 
@@ -287,6 +289,12 @@ void f2fs_parse_options(int argc, char *argv[])
 			case 4:
 				c.cache_config.dbg_en = true;
 				break;
+			case 5:
+				if (!optarg || !strcmp(optarg, "0"))
+					c.nolinear_lookup = LINEAR_LOOKUP_ENABLE;
+				else
+					c.nolinear_lookup = LINEAR_LOOKUP_DISABLE;
+				break;
 			case 'a':
 				c.auto_fix = 1;
 				MSG(0, "Info: Automatic fix mode enabled.\n");
@@ -990,6 +998,8 @@ static int do_fsck(struct f2fs_sb_info *sbi)
 			F2FS_FT_DIR, TYPE_INODE, &blk_cnt, &cbc, &child);
 	fsck_chk_quota_files(sbi);
 
+	fsck_update_sb_flags(sbi);
+
 	ret = fsck_verify(sbi);
 	fsck_free(sbi);
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index f206994..b4114a5 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -682,7 +682,8 @@ enum {
 #define IS_DEVICE_ALIASING(fi)	((fi)->i_flags & cpu_to_le32(F2FS_DEVICE_ALIAS_FL))
 
 #define F2FS_ENC_UTF8_12_1	1
-#define F2FS_ENC_STRICT_MODE_FL	(1 << 0)
+#define F2FS_ENC_STRICT_MODE_FL		(1 << 0)
+#define F2FS_ENC_NO_COMPAT_FALLBACK_FL	(1 << 1)
 
 /* This flag is used by node and meta inodes, and by recovery */
 #define GFP_F2FS_ZERO	(GFP_NOFS | __GFP_ZERO)
@@ -1467,7 +1468,9 @@ enum {
 #define SB_ABNORMAL_STOP	0x2	/* s_stop_reason is set except shutdown */
 #define SB_FS_ERRORS		0x4	/* s_erros is set */
 #define SB_INVALID		0x8	/* sb is invalid */
-#define SB_NEED_FIX (SB_ABNORMAL_STOP | SB_FS_ERRORS | SB_INVALID)
+#define SB_ENCODE_FLAG		0x16	/* encode_flag */
+#define SB_NEED_FIX		(SB_ABNORMAL_STOP | SB_FS_ERRORS |	\
+				SB_INVALID | SB_ENCODE_FLAG)
 
 #define MAX_CACHE_SUMS			8
 
@@ -1476,6 +1479,13 @@ enum {
 	F2FS_FEATURE_NAT_BITS = 0x0001,
 };
 
+/* nolinear lookup tune */
+enum {
+	LINEAR_LOOKUP_DEFAULT = 0,
+	LINEAR_LOOKUP_ENABLE,
+	LINEAR_LOOKUP_DISABLE,
+};
+
 struct f2fs_configuration {
 	uint32_t conf_reserved_sections;
 	uint32_t reserved_segments;
@@ -1541,6 +1551,7 @@ struct f2fs_configuration {
 	int preserve_limits;		/* preserve quota limits */
 	int large_nat_bitmap;
 	int fix_chksum;			/* fix old cp.chksum position */
+	int nolinear_lookup;		/* disable linear lookup */
 	unsigned int feature;			/* defined features */
 	unsigned int disabled_feature;	/* disabled feature, used for Android only */
 	unsigned int quota_bits;	/* quota bits */
diff --git a/man/fsck.f2fs.8 b/man/fsck.f2fs.8
index e39a846..606e288 100644
--- a/man/fsck.f2fs.8
+++ b/man/fsck.f2fs.8
@@ -67,6 +67,9 @@ Enable to show every directory entries in the partition.
 Specify the level of debugging options.
 The default number is 0, which shows basic debugging messages.
 .TP
+.BI \--nolinear-lookup
+Tune linear lookup fallback, must specify an argument, 0: enable linear lookup, 1: disable linear lookup.
+.TP
 .SH AUTHOR
 Initial checking code was written by Byoung Geun Kim <bgbg.kim@samsung.com>.
 Jaegeuk Kim <jaegeuk@kernel.org> reworked most parts of the codes to support
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
