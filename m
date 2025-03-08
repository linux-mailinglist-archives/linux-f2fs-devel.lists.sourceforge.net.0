Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D756A57998
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Mar 2025 10:47:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqqmL-0001n2-0W;
	Sat, 08 Mar 2025 09:47:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tqqmH-0001mw-3d
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Mar 2025 09:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xyjKPUgtQSV2h6jehlPR29w6v1aFT23klYfb9wTWwzI=; b=RKE4ZAFKsiPRpXF+iLHP7MM0mi
 zinoN3wLMUqnewW7UxghYc4+ehKGgguvxQ9SLjVV3jwrlfS1FYxE8OjDJFKZbKJnX2TTi60QUEPSO
 hc6efMSqt41ZTo1W3Dh+2jWKKL8gUIovYb3eEJOiUf2VbVrGC66pJbTiVQ90TvIUI1+g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xyjKPUgtQSV2h6jehlPR29w6v1aFT23klYfb9wTWwzI=; b=O
 hLTLuY4aJnBh4NN0mTOVZaSEOEbdb39ABrhxwy4YnJ7/If31pWjIpoa0Qip/M/Uqk5vFv1hLkX2JQ
 iwVaptbDAKuw5L728Bkj+FafWIIXXb1DNDk/5ImczOEg7RMsQFi38GZEOIZ5IKMMEUYveXmEITz3B
 Hm2BZCOkdgvnt22Y=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tqqmF-0007tW-LO for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Mar 2025 09:47:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7D433A451A0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  8 Mar 2025 09:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4708C4CEE0;
 Sat,  8 Mar 2025 09:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741427236;
 bh=kBJ5fzJuS4XS6xPkBmPOVlmWnL2oKehn+/7J73khbt8=;
 h=From:To:Cc:Subject:Date:From;
 b=cNiaNpnEMytoWcZRiVn759snA9q4Vv811bus0J+0flM/TQzHm4yG9XN2YpJoDWs9i
 Mc5kdV+Lc8FAGCnkflRYTrQejjclh9FVHiEguI51FMGHEBCmQOa4XD/qeVgu6cA/Lw
 s/lGDBluIWE//2aJhP6jNE35ayiZfmYad8XZSI7vvoE968VSBbkGb8tVRiuuBxvaP9
 j2Q+pIlPQYzt3+qHbNKm6oF9GlHI/4sQVAjqzI9B0sfQBww3pRIiiLc7va5IuvvO/p
 EVwTWQHlRQd3LrA22x+1zZimB43kErVsO8K2lYdgWtVTaTqHgCV17cDKqLmMTQZ0Uq
 aaZQ44y6dWD5w==
To: jaegeuk@kernel.org
Date: Sat,  8 Mar 2025 13:18:46 +0800
Message-Id: <20250308051846.29079-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Introduce a new mount option "nat_bits" to control nat_bits
 feature, by default nat_bits feature is disabled. Signed-off-by: Chao Yu
 <chao@kernel.org> --- Documentation/filesystems/f2fs.rst | 2 ++ fs/f2fs/f2fs.h
 | 1 + fs/f2fs/node.c | 3 +++ fs/f2fs/super.c | 15 +++++++++++++++ 4 files
 changed, 21 insertions(+ [...] 
 Content analysis details:   (-1.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 1.1 DATE_IN_PAST_03_06     Date: is 3 to 6 hours before Received: date
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tqqmF-0007tW-LO
Subject: [f2fs-dev] [PATCH] f2fs: control nat_bits feature via mount option
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduce a new mount option "nat_bits" to control nat_bits feature,
by default nat_bits feature is disabled.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/filesystems/f2fs.rst |  2 ++
 fs/f2fs/f2fs.h                     |  1 +
 fs/f2fs/node.c                     |  3 +++
 fs/f2fs/super.c                    | 15 +++++++++++++++
 4 files changed, 21 insertions(+)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 42f28dbf2410..e15c4275862a 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -366,6 +366,8 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
 			 pending node write	drop		keep		N/A
 			 pending meta write	keep		keep		N/A
 			 ====================== =============== =============== ========
+nat_bits		 Enable nat_bits feature to enhance full/empty nat blocks access,
+			 by default it's disabled.
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8d8917b92b5d..99ded6512d8b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -115,6 +115,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define	F2FS_MOUNT_GC_MERGE		0x02000000
 #define F2FS_MOUNT_COMPRESS_CACHE	0x04000000
 #define F2FS_MOUNT_AGE_EXTENT_CACHE	0x08000000
+#define F2FS_MOUNT_NAT_BITS		0x10000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 24085fa8493b..579955c6e03c 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -3278,6 +3278,9 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
 	if (!nm_i->nat_bitmap)
 		return -ENOMEM;
 
+	if (!test_opt(sbi, NAT_BITS))
+		disable_nat_bits(sbi, true);
+
 	err = __get_nat_bitmaps(sbi);
 	if (err)
 		return err;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 079c5d4b60b6..1b8ca7d63afe 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -191,6 +191,7 @@ enum {
 	Opt_memory_mode,
 	Opt_age_extent_cache,
 	Opt_errors,
+	Opt_nat_bits,
 	Opt_err,
 };
 
@@ -270,6 +271,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_memory_mode, "memory=%s"},
 	{Opt_age_extent_cache, "age_extent_cache"},
 	{Opt_errors, "errors=%s"},
+	{Opt_nat_bits, "nat_bits"},
 	{Opt_err, NULL},
 };
 
@@ -1323,6 +1325,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			}
 			kfree(name);
 			break;
+		case Opt_nat_bits:
+			set_opt(sbi, NAT_BITS);
+			break;
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
 				 p);
@@ -2135,6 +2140,9 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	else if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_PANIC)
 		seq_printf(seq, ",errors=%s", "panic");
 
+	if (test_opt(sbi, NAT_BITS))
+		seq_puts(seq, ",nat_bits");
+
 	return 0;
 }
 
@@ -2325,6 +2333,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	bool no_discard = !test_opt(sbi, DISCARD);
 	bool no_compress_cache = !test_opt(sbi, COMPRESS_CACHE);
 	bool block_unit_discard = f2fs_block_unit_discard(sbi);
+	bool no_nat_bits = !test_opt(sbi, NAT_BITS);
 #ifdef CONFIG_QUOTA
 	int i, j;
 #endif
@@ -2453,6 +2462,12 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		goto restore_opts;
 	}
 
+	if (no_nat_bits == !!test_opt(sbi, NAT_BITS)) {
+		err = -EINVAL;
+		f2fs_warn(sbi, "switch nat_bits option is not allowed");
+		goto restore_opts;
+	}
+
 	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
 		err = -EINVAL;
 		f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
