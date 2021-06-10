Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F433A3814
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jun 2021 01:47:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lrUO3-0004yS-0q; Thu, 10 Jun 2021 23:46:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lrUO1-0004yA-2M
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Jun 2021 23:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i8yL02ElboLrkUWrYiIXJK51tcOgyYY2ZN4MCJ8XnCI=; b=XOxCT7+/fP02yLGrlKQ8rw1aeL
 nBgXHZ561eqRgK0hG7SuyEhArlij0RWXiuzn8egl0vKnwOZsiQhzMgcyTRDGAcvp3AxrYJgJmv4N4
 juhRiRJSa/CGDItrRqrIJxABkgZOWuNUPlVvWaj6zqfOx8P9z/OGhe4XXQQ3mRSeKvmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=i8yL02ElboLrkUWrYiIXJK51tcOgyYY2ZN4MCJ8XnCI=; b=V
 AWGyGQM6zfT8LvVnWS+yLpNChHyZRBymdHMf264T5n+iuAwZwrdmvs6IHkuKzPkuAR7z8jhdpOk2b
 iy93fAchuZUZl3IV5RRBx+JK24dIeb2PAKCb9XNRGtp32kBaXTMG/o8I314alByeX1RpLzT/r0tx4
 QOsFPWPgvL27oTSc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lrUNr-004ClM-HP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Jun 2021 23:46:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10D7B60231;
 Thu, 10 Jun 2021 23:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623368797;
 bh=ZJ0RHYLkh6UegiE0t65eO7zajpctipDunke543nlPuc=;
 h=From:To:Cc:Subject:Date:From;
 b=p5D37oIFouRX//tRsyazUMasAQnjHuwr7MmG/5QEasA6COmSWF9X81oR2NxTDMNO+
 O3S5Xpna46Agu2FhTCmZvTh/dwsG9Hqq1BBIM8YCbXA8XT2CzaKS0JvgHC3LvH3O6Z
 2zMvTY7M1p63xnDdRw0XrSZWL754KyzC+/IBe0DPIfmR7wpCwlbU0AC9224puWcf4m
 oemZZtGT513mdsYrENLXZ/2ufSWrOX2VceC7kTOX76fYu67kvCHB5Jo1wX7GTbJxfK
 7qsPoRckDV0f03Qeml01NcLSE0Tw/DuuKizbJDHfSHGRZgVwgFcDafu3IGGBzHAskX
 qdlD9JlXjpB4A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 11 Jun 2021 07:46:30 +0800
Message-Id: <20210610234630.3046-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: cf_name.name]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lrUNr-004ClM-HP
Subject: [f2fs-dev] [PATCH v3] f2fs: introduce f2fs_casefolded_name slab
 cache
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
Cc: Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

Add a slab cache: "f2fs_casefolded_name" for memory allocation
of casefold name.

Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v3:
- change "f2fs_casefold_name" to "f2fs_casefolded_name" in commit
title and message.
 fs/f2fs/dir.c      | 17 +++++++++++------
 fs/f2fs/recovery.c |  6 +++++-
 fs/f2fs/super.c    | 24 ++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 96dcc4aca639..456651682daf 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -16,6 +16,10 @@
 #include "xattr.h"
 #include <trace/events/f2fs.h>
 
+#ifdef CONFIG_UNICODE
+extern struct kmem_cache *f2fs_cf_name_slab;
+#endif
+
 static unsigned long dir_blocks(struct inode *inode)
 {
 	return ((unsigned long long) (i_size_read(inode) + PAGE_SIZE - 1))
@@ -77,11 +81,10 @@ int f2fs_init_casefolded_name(const struct inode *dir,
 {
 #ifdef CONFIG_UNICODE
 	struct super_block *sb = dir->i_sb;
-	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 
 	if (IS_CASEFOLDED(dir)) {
-		fname->cf_name.name = f2fs_kmalloc(sbi, F2FS_NAME_LEN,
-						   GFP_NOFS);
+		fname->cf_name.name = kmem_cache_alloc(f2fs_cf_name_slab,
+								GFP_NOFS);
 		if (!fname->cf_name.name)
 			return -ENOMEM;
 		fname->cf_name.len = utf8_casefold(sb->s_encoding,
@@ -89,7 +92,7 @@ int f2fs_init_casefolded_name(const struct inode *dir,
 						   fname->cf_name.name,
 						   F2FS_NAME_LEN);
 		if ((int)fname->cf_name.len <= 0) {
-			kfree(fname->cf_name.name);
+			kmem_cache_free(f2fs_cf_name_slab, fname->cf_name.name);
 			fname->cf_name.name = NULL;
 			if (sb_has_strict_encoding(sb))
 				return -EINVAL;
@@ -172,8 +175,10 @@ void f2fs_free_filename(struct f2fs_filename *fname)
 	fname->crypto_buf.name = NULL;
 #endif
 #ifdef CONFIG_UNICODE
-	kfree(fname->cf_name.name);
-	fname->cf_name.name = NULL;
+	if (fname->cf_name.name) {
+		kmem_cache_free(f2fs_cf_name_slab, fname->cf_name.name);
+		fname->cf_name.name = NULL;
+	}
 #endif
 }
 
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 4cfe36fa41be..76e62771433c 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -45,6 +45,10 @@
 
 static struct kmem_cache *fsync_entry_slab;
 
+#ifdef CONFIG_UNICODE
+extern struct kmem_cache *f2fs_cf_name_slab;
+#endif
+
 bool f2fs_space_for_roll_forward(struct f2fs_sb_info *sbi)
 {
 	s64 nalloc = percpu_counter_sum_positive(&sbi->alloc_valid_block_count);
@@ -145,7 +149,7 @@ static int init_recovered_filename(const struct inode *dir,
 		f2fs_hash_filename(dir, fname);
 #ifdef CONFIG_UNICODE
 		/* Case-sensitive match is fine for recovery */
-		kfree(fname->cf_name.name);
+		kmem_cache_free(f2fs_cf_name_slab, fname->cf_name.name);
 		fname->cf_name.name = NULL;
 #endif
 	} else {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9089303f7f8c..999fbe3a8d8f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -277,6 +277,24 @@ static int f2fs_sb_read_encoding(const struct f2fs_super_block *sb,
 
 	return 0;
 }
+
+struct kmem_cache *f2fs_cf_name_slab;
+static int __init f2fs_create_casefold_cache(void)
+{
+	f2fs_cf_name_slab = f2fs_kmem_cache_create("f2fs_casefolded_name",
+							F2FS_NAME_LEN);
+	if (!f2fs_cf_name_slab)
+		return -ENOMEM;
+	return 0;
+}
+
+static void f2fs_destroy_casefold_cache(void)
+{
+	kmem_cache_destroy(f2fs_cf_name_slab);
+}
+#else
+static int __init f2fs_create_casefold_cache(void) { return 0; }
+static void f2fs_destroy_casefold_cache(void) { }
 #endif
 
 static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
@@ -4316,7 +4334,12 @@ static int __init init_f2fs_fs(void)
 	err = f2fs_init_compress_cache();
 	if (err)
 		goto free_compress_mempool;
+	err = f2fs_create_casefold_cache();
+	if (err)
+		goto free_compress_cache;
 	return 0;
+free_compress_cache:
+	f2fs_destroy_compress_cache();
 free_compress_mempool:
 	f2fs_destroy_compress_mempool();
 free_bioset:
@@ -4352,6 +4375,7 @@ static int __init init_f2fs_fs(void)
 
 static void __exit exit_f2fs_fs(void)
 {
+	f2fs_destroy_casefold_cache();
 	f2fs_destroy_compress_cache();
 	f2fs_destroy_compress_mempool();
 	f2fs_destroy_bioset();
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
