Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F69B8518A3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Feb 2024 17:06:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rZYof-00056p-3p;
	Mon, 12 Feb 2024 16:05:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rZYoe-00056j-Db
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Feb 2024 16:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lLbvBaXmuH8y0UYA8/VHnRL4urXFmONIYwOibg26fGA=; b=b/iJXqQ5NGqTZNIn6Y4qo8rYdo
 ya4uqplgs683XJ+XnvN6qln37iwIjs4BMkahQI2qdb0HSWfEhHkVbjobEYA+GGatiVX3K/4Z8z1MO
 IHOgk/ZPnVTs5lW0iCV45R/CCg534PSjySscDmNUf4DcckeVX9uqFE+yr9116lnbIo6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lLbvBaXmuH8y0UYA8/VHnRL4urXFmONIYwOibg26fGA=; b=Q
 PtW6BtkUOpB3ZT3YUwxX9FViuZSBo9LiTpQI+HwusANwtLR42Wsxp/IgZUmGp3hj/srgqxc23sDEe
 Jse3n29t62Z1IaTI5CPbguNvhY74SqH72OofeNJQcf/21MViR6FktKHUmypTNTY/9TChGg35f42ao
 nvjI6IvID8CqNe/M=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rZYoc-0004sb-KT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Feb 2024 16:05:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EE434CE1322;
 Mon, 12 Feb 2024 16:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBDAC433F1;
 Mon, 12 Feb 2024 16:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707753947;
 bh=PVnetzBOH34x39uT5RM+QQRj/93uXMs1sWHwvNANQ6o=;
 h=From:To:Cc:Subject:Date:From;
 b=H5xdMN8SecoFM2W/G3J7KfIOpJOnULuNUcgoL/oKLg+ZvqYE8eBBWyT7L0b4BgeEA
 r6Mg4hTrtKolVsF88U6R0kRFAYAFOIp8pZTkobZGOnTBdxWy/yVkCDJC3AoJ9g/Q+E
 e4hyC3eaXDryq0JjXntd5Tc4YZjfAUQSP6foWOBRcK/8vj96RXPdlaomFK7fimemr8
 emUcBjiaJeJgLwJs8dteLhJUMMfqO4QHR02erWvns5fg99wVhGblS77HQGgKCG6Z4+
 5KIeItZ6PxyG5kjQUbwpx7kJx3SDjb3tPCATr93wm7q+0j05rJSnibgGlbnsTZtyT9
 VvRpHhLWmYG+g==
From: Chao Yu <chao@kernel.org>
To: stable@vger.kernel.org
Date: Tue, 13 Feb 2024 00:05:30 +0800
Message-Id: <20240212160530.1017205-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -3.3 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong <shengyong@oppo.com> commit
 c571fbb5b59a3741e48014faa92c2f14bc59fe50
 upstream. This patch adds a helper function to check if compression level
 is valid. 
 Content analysis details:   (-3.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rZYoc-0004sb-KT
Subject: [f2fs-dev] [PATCH 6.1] f2fs: add helper to check compression level
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong@oppo.com>

commit c571fbb5b59a3741e48014faa92c2f14bc59fe50 upstream.

This patch adds a helper function to check if compression level is
valid.

Meanwhile, this patch fixes a reported issue [1]:

The issue is easily reproducible by:

1. dd if=/dev/zero of=test.img count=100 bs=1M
2. mkfs.f2fs -f -O compression,extra_attr ./test.img
3. mount -t f2fs -o compress_algorithm=zstd:6,compress_chksum,atgc,gc_merge,lazytime ./test.img /mnt

resulting in

[   60.789982] F2FS-fs (loop0): invalid zstd compress level: 6

A bugzilla report has been submitted in
https://bugzilla.kernel.org/show_bug.cgi?id=218471

[1] https://lore.kernel.org/lkml/ZcWDOjKEnPDxZ0Or@google.com/T/

The root cause is commit 00e120b5e4b5 ("f2fs: assign default compression
level") tries to check low boundary of compress level w/ zstd_min_clevel(),
however, since commit e0c1b49f5b67 ("lib: zstd: Upgrade to latest upstream
zstd version 1.4.10"), zstd supports negative compress level, it cast type
for negative value returned from zstd_min_clevel() to unsigned int in below
check condition, result in repored issue.

	if (level < zstd_min_clevel() || ...

This patch fixes this issue by casting type for level to int before
comparison.

Fixes: 00e120b5e4b5 ("f2fs: assign default compression level")
Signed-off-by: Sheng Yong <shengyong@oppo.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 27 +++++++++++++++++++++++++++
 fs/f2fs/f2fs.h     |  2 ++
 fs/f2fs/super.c    |  4 ++--
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 4cb58e8d699e..4e83cfa1b073 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -55,6 +55,7 @@ struct f2fs_compress_ops {
 	int (*init_decompress_ctx)(struct decompress_io_ctx *dic);
 	void (*destroy_decompress_ctx)(struct decompress_io_ctx *dic);
 	int (*decompress_pages)(struct decompress_io_ctx *dic);
+	bool (*is_level_valid)(int level);
 };
 
 static unsigned int offset_in_cluster(struct compress_ctx *cc, pgoff_t index)
@@ -322,11 +323,21 @@ static int lz4_decompress_pages(struct decompress_io_ctx *dic)
 	return 0;
 }
 
+static bool lz4_is_level_valid(int lvl)
+{
+#ifdef CONFIG_F2FS_FS_LZ4HC
+	return !lvl || (lvl >= LZ4HC_MIN_CLEVEL && lvl <= LZ4HC_MAX_CLEVEL);
+#else
+	return lvl == 0;
+#endif
+}
+
 static const struct f2fs_compress_ops f2fs_lz4_ops = {
 	.init_compress_ctx	= lz4_init_compress_ctx,
 	.destroy_compress_ctx	= lz4_destroy_compress_ctx,
 	.compress_pages		= lz4_compress_pages,
 	.decompress_pages	= lz4_decompress_pages,
+	.is_level_valid		= lz4_is_level_valid,
 };
 #endif
 
@@ -490,6 +501,11 @@ static int zstd_decompress_pages(struct decompress_io_ctx *dic)
 	return 0;
 }
 
+static bool zstd_is_level_valid(int lvl)
+{
+	return lvl >= zstd_min_clevel() && lvl <= zstd_max_clevel();
+}
+
 static const struct f2fs_compress_ops f2fs_zstd_ops = {
 	.init_compress_ctx	= zstd_init_compress_ctx,
 	.destroy_compress_ctx	= zstd_destroy_compress_ctx,
@@ -497,6 +513,7 @@ static const struct f2fs_compress_ops f2fs_zstd_ops = {
 	.init_decompress_ctx	= zstd_init_decompress_ctx,
 	.destroy_decompress_ctx	= zstd_destroy_decompress_ctx,
 	.decompress_pages	= zstd_decompress_pages,
+	.is_level_valid		= zstd_is_level_valid,
 };
 #endif
 
@@ -555,6 +572,16 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
 	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
 }
 
+bool f2fs_is_compress_level_valid(int alg, int lvl)
+{
+	const struct f2fs_compress_ops *cops = f2fs_cops[alg];
+
+	if (cops->is_level_valid)
+		return cops->is_level_valid(lvl);
+
+	return lvl == 0;
+}
+
 static mempool_t *compress_page_pool;
 static int num_compress_pages = 512;
 module_param(num_compress_pages, uint, 0444);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5c76ba764b71..e5a9498b89c0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4219,6 +4219,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock);
 void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
 bool f2fs_is_compress_backend_ready(struct inode *inode);
+bool f2fs_is_compress_level_valid(int alg, int lvl);
 int f2fs_init_compress_mempool(void);
 void f2fs_destroy_compress_mempool(void);
 void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task);
@@ -4283,6 +4284,7 @@ static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
 	/* not support compression */
 	return false;
 }
+static inline bool f2fs_is_compress_level_valid(int alg, int lvl) { return false; }
 static inline struct page *f2fs_compress_control_page(struct page *page)
 {
 	WARN_ON_ONCE(1);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3805162dcef2..0c0d0671febe 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -628,7 +628,7 @@ static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
 	if (kstrtouint(str + 1, 10, &level))
 		return -EINVAL;
 
-	if (level < LZ4HC_MIN_CLEVEL || level > LZ4HC_MAX_CLEVEL) {
+	if (!f2fs_is_compress_level_valid(COMPRESS_LZ4, level)) {
 		f2fs_info(sbi, "invalid lz4hc compress level: %d", level);
 		return -EINVAL;
 	}
@@ -666,7 +666,7 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
 	if (kstrtouint(str + 1, 10, &level))
 		return -EINVAL;
 
-	if (level < zstd_min_clevel() || level > zstd_max_clevel()) {
+	if (!f2fs_is_compress_level_valid(COMPRESS_ZSTD, level)) {
 		f2fs_info(sbi, "invalid zstd compress level: %d", level);
 		return -EINVAL;
 	}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
