Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 277E0A7D1F4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Apr 2025 04:08:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u1bu9-00086K-NV;
	Mon, 07 Apr 2025 02:08:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u1bu8-00086C-0U
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Apr 2025 02:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bPVOhcGkq1R7K+9uRsF9ER0nL3fu8MThlFZGwL8vQcE=; b=SGu5jSKJqwbDzTG1KghkU8P7O2
 NyF0DZ8W7v0WcSmcT+bpRb9wktBwtmCAhn3nAN+QIK/un9DrS66UcmIZwBjH+DRSc7NnFQdkHTbAz
 xOCfDMK0M+6VBHaeJgRkpQHxV0AEu6gGitrkmKA5xLhON2GafTZdpvajpuQflXLI+pNQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bPVOhcGkq1R7K+9uRsF9ER0nL3fu8MThlFZGwL8vQcE=; b=E
 MofRtmp4q1fx3zvMaH8fqQkgGwSKD4f95fsyOq1xnz0qx3lzKitoh7qZ6N0LnEWs1W2LYJ8IfK2/H
 bgG9L1a0q4/6WgD33Y/KXGFVoUCBq3jf7KebgVnj8EU1IU0JVbNJ4UTDDRoob0dZc+DnebJaYAtNQ
 /vdd91EfqdTlK3zk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u1bts-0005W8-0e for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Apr 2025 02:08:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9BA9AA44D7D;
 Mon,  7 Apr 2025 02:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B31C4CEE3;
 Mon,  7 Apr 2025 02:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743991657;
 bh=RjWS9bO+bo9xzmpgiaBek+LOOB6krM4EWXK6oHptTqs=;
 h=From:To:Cc:Subject:Date:From;
 b=qRS6hOQYZb1xk2YgZeqFgefztYuEScJsRqS8ZLgV20mQCLKYgIJdmMOAGwwxO1aLT
 uqJ1YRbG8CYTFrNtv1OM4StpcdCSYrip2NqmokGkkNylnoyqGQxSofow2AsASdaWS+
 +AKCFgw1q3yKDSBScjnzJ3Wuw2EFRfVND4DYvL1Q1WXwiX1DqqXNrRtccQGNc+E/6G
 GZGCUtUj+kI5qBFBbliWK8yobSAvERbDiDyUb8MysrfP88P0f369TrXDwBV/vjhi+W
 Nm5JyU/skcS7Yod+wz2KoaClk2aoRHGDERVDf/0xtmKoUVZ0ALOY6SdQII+EurlEjm
 g/p1P9wMVenkw==
To: jaegeuk@kernel.org
Date: Mon,  7 Apr 2025 10:07:27 +0800
Message-ID: <20250407020727.1810288-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Spam-Score: -3.2 (---)
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
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u1bts-0005W8-0e
Subject: [f2fs-dev] [PATCH v2 3/3] fsck.f2fs: support to tune linear lookup
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
v2:
- add description in fsck manual
 fsck/fsck.c       | 26 +++++++++++++++++++++++++-
 fsck/fsck.h       |  1 +
 fsck/main.c       | 10 ++++++++++
 include/f2fs_fs.h |  8 ++++++--
 man/fsck.f2fs.8   |  3 +++
 5 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 8155cbd..059ba61 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2357,6 +2357,30 @@ int fsck_chk_quota_files(struct f2fs_sb_info *sbi)
 	return ret;
 }
 
+void fsck_update_sb_flags(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
+	u16 flags = get_sb(s_encoding_flags);
+
+	if (c.nolinear_lookup) {
+		if (!(flags & F2FS_ENC_NO_COMPAT_FALLBACK_FL)) {
+			flags |= F2FS_ENC_NO_COMPAT_FALLBACK_FL;
+			set_sb(s_encoding_flags, flags);
+			c.fix_on = 1;
+			c.invalid_sb |= SB_ENCODE_FLAG;
+			DBG(0, "Casefold: enable nolinear lookup\n");
+		}
+	} else {
+		if (flags & F2FS_ENC_NO_COMPAT_FALLBACK_FL) {
+			flags &= ~F2FS_ENC_NO_COMPAT_FALLBACK_FL;
+			set_sb(s_encoding_flags, flags);
+			c.fix_on = 1;
+			c.invalid_sb |= SB_ENCODE_FLAG;
+			DBG(0, "Casefold: disable nolinear lookup\n");
+		}
+	}
+}
+
 int fsck_chk_meta(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
@@ -3770,7 +3794,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
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
index 47ba6c9..524dbb1 100644
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
+					c.nolinear_lookup = 0;
+				else
+					c.nolinear_lookup = 1;
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
index f206994..7e3f25b 100644
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
 
@@ -1541,6 +1544,7 @@ struct f2fs_configuration {
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
