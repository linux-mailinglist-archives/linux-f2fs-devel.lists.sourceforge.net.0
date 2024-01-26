Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE583DD4C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jan 2024 16:20:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTO08-000222-DL;
	Fri, 26 Jan 2024 15:20:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rTO07-00021v-B6
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 15:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gZNnaYeb2QBQHDo58Z+6GPLT5wKjZWT2SM1mW3zsIN8=; b=m2p+Z4x0QVCNbyvt6kHM0i8AI7
 BXsOI4c644TtF+fAzfnqzMz6O2qPdfbss/zIE5eEvpNwqivy54TM8Cw/8Zyo71+zar+VsideDBQRP
 6olGpotZbL/TAy8RbtWOqgRQuwbWI9BkrkB8UShPAL/V7oirz8Xy7xQwp7/CBq7lnRrQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gZNnaYeb2QBQHDo58Z+6GPLT5wKjZWT2SM1mW3zsIN8=; b=g
 cvjN1Yy0v58I5+e4uuc+/qT/2fCDgmE2XJats+8btwoCOWU6vPaIEfG4Pn3BqAYXKvRzZWrBQ2BIN
 Z402Kd8a7O+9Kn7QFR9zd9sdSPem4skvjy7F8vmXee7oaohAdmxN5C0f5IEpVmCA5HsPiudUEwofl
 o3FUbddt2YSnDrtw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rTO01-0000pu-AB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 15:20:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B8FACCE350E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jan 2024 15:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEF1C433F1;
 Fri, 26 Jan 2024 15:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706282391;
 bh=v0r271/Aca9Iq1+M0kEV3V6R+A1O5TG7PLpWMF87qP4=;
 h=From:To:Cc:Subject:Date:From;
 b=OwxCyu1zXtBHeh+Zx/nQmVm+DeEqXQlRCUFIuFxWE9JStsF8nXy1w5feEVw7HEgFk
 u2wJSLDUAz4qEtTZukcTSRbSg26My6xMExKZXNlq4MnI6+MWW8HOmT33q0PGY4iVXE
 AbMRRHf11AFxSCHYBw/1KMbstvLWsnnFJRYHqY1y9nUI1Yqqti3i7IFGNKyl/+9JPi
 By7RWDTDCCuWGAY5xOlSUKbx8beWHYIJ/Lw/n+bZibqG6jFy3FaZBth25N3HzsOx9u
 0X1X+H01ERW7EREdVBrIuVwMyU8H8W7EbF2xo6FOKZcWnpXrGp4adms9DndokVwANM
 kN8nYDdJ5PzmQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 26 Jan 2024 23:19:16 +0800
Message-Id: <20240126151917.837565-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch supports using printk_ratelimited() in
 f2fs_printk(), 
 and wrap ratelimited f2fs_printk() into f2fs_{err,warn,info}_ratelimited(),
 then,
 use these new helps to clean up codes. Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/compress.c | 10 +++++----- fs/f2fs/dir.c | 5 ++--- fs/f2fs/f2fs.h
 | 40 +++++++++++++++++++++++ fs/f2fs/super.c | 11 ++++++++--- 4 [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rTO01-0000pu-AB
Subject: [f2fs-dev] [PATCH 1/2] f2fs: support printk_ratelimited() in
 f2fs_printk()
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

This patch supports using printk_ratelimited() in f2fs_printk(), and
wrap ratelimited f2fs_printk() into f2fs_{err,warn,info}_ratelimited(),
then, use these new helps to clean up codes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 10 +++++-----
 fs/f2fs/dir.c      |  5 ++---
 fs/f2fs/f2fs.h     | 40 +++++++++++++++++++++++-----------------
 fs/f2fs/super.c    | 11 ++++++++---
 4 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index ff26b49c0d71..0fd839358c15 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -512,8 +512,8 @@ static int lzorle_compress_pages(struct compress_ctx *cc)
 	ret = lzorle1x_1_compress(cc->rbuf, cc->rlen, cc->cbuf->cdata,
 					&cc->clen, cc->private);
 	if (ret != LZO_E_OK) {
-		printk_ratelimited("%sF2FS-fs (%s): lzo-rle compress failed, ret:%d\n",
-				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id, ret);
+		f2fs_err_ratelimited(F2FS_I_SB(cc->inode),
+				"lzo-rle compress failed, ret:%d", ret);
 		return -EIO;
 	}
 	return 0;
@@ -780,9 +780,9 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
 		if (provided != calculated) {
 			if (!is_inode_flag_set(dic->inode, FI_COMPRESS_CORRUPT)) {
 				set_inode_flag(dic->inode, FI_COMPRESS_CORRUPT);
-				printk_ratelimited(
-					"%sF2FS-fs (%s): checksum invalid, nid = %lu, %x vs %x",
-					KERN_INFO, sbi->sb->s_id, dic->inode->i_ino,
+				f2fs_info_ratelimited(sbi,
+					"checksum invalid, nid = %lu, %x vs %x",
+					dic->inode->i_ino,
 					provided, calculated);
 			}
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 042593aed1ec..3f20d94e12f9 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -995,9 +995,8 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 		de = &d->dentry[bit_pos];
 		if (de->name_len == 0) {
 			if (found_valid_dirent || !bit_pos) {
-				printk_ratelimited(
-					"%sF2FS-fs (%s): invalid namelen(0), ino:%u, run fsck to fix.",
-					KERN_WARNING, sbi->sb->s_id,
+				f2fs_warn_ratelimited(sbi,
+					"invalid namelen(0), ino:%u, run fsck to fix.",
 					le32_to_cpu(de->ino));
 				set_sbi_flag(sbi, SBI_NEED_FSCK);
 			}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2c2916421d52..c5e7460d1a0a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1819,6 +1819,27 @@ struct f2fs_sb_info {
 #endif
 };
 
+__printf(3, 4)
+void f2fs_printk(struct f2fs_sb_info *sbi, bool limit_rate, const char *fmt, ...);
+
+#define f2fs_err(sbi, fmt, ...)						\
+	f2fs_printk(sbi, false, KERN_ERR fmt, ##__VA_ARGS__)
+#define f2fs_warn(sbi, fmt, ...)					\
+	f2fs_printk(sbi, false, KERN_WARNING fmt, ##__VA_ARGS__)
+#define f2fs_notice(sbi, fmt, ...)					\
+	f2fs_printk(sbi, false, KERN_NOTICE fmt, ##__VA_ARGS__)
+#define f2fs_info(sbi, fmt, ...)					\
+	f2fs_printk(sbi, false, KERN_INFO fmt, ##__VA_ARGS__)
+#define f2fs_debug(sbi, fmt, ...)					\
+	f2fs_printk(sbi, false, KERN_DEBUG fmt, ##__VA_ARGS__)
+
+#define f2fs_err_ratelimited(sbi, fmt, ...)				\
+	f2fs_printk(sbi, true, KERN_ERR fmt, ##__VA_ARGS__)
+#define f2fs_warn_ratelimited(sbi, fmt, ...)				\
+	f2fs_printk(sbi, true, KERN_WARNING fmt, ##__VA_ARGS__)
+#define f2fs_info_ratelimited(sbi, fmt, ...)				\
+	f2fs_printk(sbi, true, KERN_INFO fmt, ##__VA_ARGS__)
+
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 #define time_to_inject(sbi, type) __time_to_inject(sbi, type, __func__,	\
 									__builtin_return_address(0))
@@ -1836,9 +1857,8 @@ static inline bool __time_to_inject(struct f2fs_sb_info *sbi, int type,
 	atomic_inc(&ffi->inject_ops);
 	if (atomic_read(&ffi->inject_ops) >= ffi->inject_rate) {
 		atomic_set(&ffi->inject_ops, 0);
-		printk_ratelimited("%sF2FS-fs (%s) : inject %s in %s of %pS\n",
-			KERN_INFO, sbi->sb->s_id, f2fs_fault_name[type],
-			func, parent_func);
+		f2fs_info_ratelimited(sbi, "inject %s in %s of %pS",
+				f2fs_fault_name[type], func, parent_func);
 		return true;
 	}
 	return false;
@@ -2343,20 +2363,6 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 	return -ENOSPC;
 }
 
-__printf(2, 3)
-void f2fs_printk(struct f2fs_sb_info *sbi, const char *fmt, ...);
-
-#define f2fs_err(sbi, fmt, ...)						\
-	f2fs_printk(sbi, KERN_ERR fmt, ##__VA_ARGS__)
-#define f2fs_warn(sbi, fmt, ...)					\
-	f2fs_printk(sbi, KERN_WARNING fmt, ##__VA_ARGS__)
-#define f2fs_notice(sbi, fmt, ...)					\
-	f2fs_printk(sbi, KERN_NOTICE fmt, ##__VA_ARGS__)
-#define f2fs_info(sbi, fmt, ...)					\
-	f2fs_printk(sbi, KERN_INFO fmt, ##__VA_ARGS__)
-#define f2fs_debug(sbi, fmt, ...)					\
-	f2fs_printk(sbi, KERN_DEBUG fmt, ##__VA_ARGS__)
-
 #define PAGE_PRIVATE_GET_FUNC(name, flagname) \
 static inline bool page_private_##name(struct page *page) \
 { \
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5c672a11ca6e..4ca390363131 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -264,7 +264,8 @@ static match_table_t f2fs_tokens = {
 	{Opt_err, NULL},
 };
 
-void f2fs_printk(struct f2fs_sb_info *sbi, const char *fmt, ...)
+void f2fs_printk(struct f2fs_sb_info *sbi, bool limit_rate,
+						const char *fmt, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -275,8 +276,12 @@ void f2fs_printk(struct f2fs_sb_info *sbi, const char *fmt, ...)
 	level = printk_get_level(fmt);
 	vaf.fmt = printk_skip_level(fmt);
 	vaf.va = &args;
-	printk("%c%cF2FS-fs (%s): %pV\n",
-	       KERN_SOH_ASCII, level, sbi->sb->s_id, &vaf);
+	if (limit_rate)
+		printk_ratelimited("%c%cF2FS-fs (%s): %pV\n",
+			KERN_SOH_ASCII, level, sbi->sb->s_id, &vaf);
+	else
+		printk("%c%cF2FS-fs (%s): %pV\n",
+			KERN_SOH_ASCII, level, sbi->sb->s_id, &vaf);
 
 	va_end(args);
 }
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
