Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 430F590E3EC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jun 2024 09:01:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sJpJa-0006tD-PK;
	Wed, 19 Jun 2024 07:01:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sJpJZ-0006t7-Bw
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jun 2024 07:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BJGdUIC9/g62g2ukAUduLfh4QQ6rap6k7pHoKoQe3o0=; b=D2Tj6HYufFDp9WR6p8MXAPUj0d
 DvGIzkbyo8hh4RSZljClG8rzZhr5wOLfwv4vNqhrQy3UB60sVIB+0A4W0z55hBViwsR33370a17R4
 mpnJD72mm4gWZQS5ORQKvQw/TRXYbUZQXBl+93QDUW1ZWrowbKPfT4SDRFhBIDn8TNBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BJGdUIC9/g62g2ukAUduLfh4QQ6rap6k7pHoKoQe3o0=; b=C
 VFeEUFOHq6d5yD1d86tYsXvi+HsZ2uz2geSNTXJ6kJ/8tZLfxRuA2apJyFnfcyB99LTJzU9mM5v0a
 JyMlug8U74fXclK7onEPgQvdsm8iB79yyIkED0egTbYc2uAYCz7rTjo+IuUmoTb3V/z8aHDCizFvp
 OMEsisEkQhN7FkPM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sJpJX-0003Ic-OV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jun 2024 07:01:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 20B8CCE1D25;
 Wed, 19 Jun 2024 07:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF6AC2BBFC;
 Wed, 19 Jun 2024 07:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718780450;
 bh=wPbUog/DATDmQJOPIEg/tT8i2uUOLhSWvxoc0kvyq7k=;
 h=From:To:Cc:Subject:Date:From;
 b=saljTd/sUGkjW86DOOXAHaPKZb2M/Fo4U8E8YKkYZ15LJFZfX6xHollfquVXYZfnd
 UPpp3vDvdfwxpmcunISjHVffIs5BcCNmql22gpAYx8J00cUkec4xnM84/yV8lzhvQ8
 dZEItioKmeow+3aGOpiUwlYLunsTu/VWnouiTp5vtSkwCabxoI0wYC/b0i18AybJkR
 C4BMK8nw9HCzesx5/SDtlwH6Uemax2LzIDS4I5e7P8JYtMWxcuKz+6JdwXGh0wPZWY
 wTuuyMosQVDvVnV8k1dq80yUk/1K30fNSOfILNsFI6Ctdaco2l3xjExl02Pf/WW3Kx
 3jn0hS3K5N5tQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 19 Jun 2024 15:00:42 +0800
Message-Id: <20240619070042.1197204-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Case #1: SQLite App GC Thread Kworker Shrinker -
 f2fs_ioc_start_atomic_write
 - f2fs_ioc_commit_atomic_write - f2fs_commit_atomic_write -
 filemap_write_and_wait_range
 : write atomic_file's data to cow_inode echo 3 > drop_caches to drop
 atomic_file's cache. - f2fs_gc - gc_data_s [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJpJX-0003Ic-OV
Subject: [f2fs-dev] [PATCH] f2fs: atomic: fix to avoid racing w/ GC
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Case #1:
SQLite App		GC Thread		Kworker		Shrinker
- f2fs_ioc_start_atomic_write

- f2fs_ioc_commit_atomic_write
 - f2fs_commit_atomic_write
  - filemap_write_and_wait_range
  : write atomic_file's data to cow_inode
								echo 3 > drop_caches
								to drop atomic_file's
								cache.
			- f2fs_gc
			 - gc_data_segment
			  - move_data_page
			   - set_page_dirty

						- writepages
						 - f2fs_do_write_data_page
						 : overwrite atomic_file's data
						   to cow_inode
  - f2fs_down_write(&fi->i_gc_rwsem[WRITE])
  - __f2fs_commit_atomic_write
  - f2fs_up_write(&fi->i_gc_rwsem[WRITE])

Case #2:
SQLite App		GC Thread		Kworker
- f2fs_ioc_start_atomic_write

						- __writeback_single_inode
						 - do_writepages
						  - f2fs_write_cache_pages
						   - f2fs_write_single_data_page
						    - f2fs_do_write_data_page
						    : write atomic_file's data to cow_inode
			- f2fs_gc
			 - gc_data_segment
			  - move_data_page
			   - set_page_dirty

						- writepages
						 - f2fs_do_write_data_page
						 : overwrite atomic_file's data to cow_inode
- f2fs_ioc_commit_atomic_write

In above cases racing in between atomic_write and GC, previous
data in atomic_file may be overwrited to cow_file, result in
data corruption.

This patch introduces PAGE_PRIVATE_ATOMIC_WRITE bit flag in page.private,
and use it to indicate that there is last dirty data in atomic file,
and the data should be writebacked into cow_file, if the flag is not
tagged in page, we should never write data across files.

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 10 +++++++++-
 fs/f2fs/f2fs.h |  8 +++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0b4f563f2361..22031b9b507c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2647,10 +2647,13 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	struct dnode_of_data dn;
 	struct node_info ni;
 	bool ipu_force = false;
+	bool atomic_commit;
 	int err = 0;
 
 	/* Use COW inode to make dnode_of_data for atomic write */
-	if (f2fs_is_atomic_file(inode))
+	atomic_commit = f2fs_is_atomic_file(inode) &&
+				page_private_atomic(fio->page);
+	if (atomic_commit)
 		set_new_dnode(&dn, F2FS_I(inode)->cow_inode, NULL, NULL, 0);
 	else
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
@@ -2749,6 +2752,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	f2fs_outplace_write_data(&dn, fio);
 	trace_f2fs_do_write_data_page(page_folio(page), OPU);
 	set_inode_flag(inode, FI_APPEND_WRITE);
+	if (atomic_commit)
+		clear_page_private_atomic(page);
 out_writepage:
 	f2fs_put_dnode(&dn);
 out:
@@ -3718,6 +3723,9 @@ static int f2fs_write_end(struct file *file,
 
 	set_page_dirty(page);
 
+	if (f2fs_is_atomic_file(inode))
+		set_page_private_atomic(page);
+
 	if (pos + copied > i_size_read(inode) &&
 	    !f2fs_verity_in_progress(inode)) {
 		f2fs_i_size_write(inode, pos + copied);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 777497919c62..35dd2d45b0ed 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1413,7 +1413,8 @@ static inline void f2fs_clear_bit(unsigned int nr, char *addr);
  * bit 1	PAGE_PRIVATE_ONGOING_MIGRATION
  * bit 2	PAGE_PRIVATE_INLINE_INODE
  * bit 3	PAGE_PRIVATE_REF_RESOURCE
- * bit 4-	f2fs private data
+ * bit 4	PAGE_PRIVATE_ATOMIC_WRITE
+ * bit 5-	f2fs private data
  *
  * Layout B: lowest bit should be 0
  * page.private is a wrapped pointer.
@@ -1423,6 +1424,7 @@ enum {
 	PAGE_PRIVATE_ONGOING_MIGRATION,		/* data page which is on-going migrating */
 	PAGE_PRIVATE_INLINE_INODE,		/* inode page contains inline data */
 	PAGE_PRIVATE_REF_RESOURCE,		/* dirty page has referenced resources */
+	PAGE_PRIVATE_ATOMIC_WRITE,		/* data page from atomic write path */
 	PAGE_PRIVATE_MAX
 };
 
@@ -2401,14 +2403,17 @@ static inline void clear_page_private_##name(struct page *page) \
 PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
 PAGE_PRIVATE_GET_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_GET_FUNC(gcing, ONGOING_MIGRATION);
+PAGE_PRIVATE_GET_FUNC(atomic, ATOMIC_WRITE);
 
 PAGE_PRIVATE_SET_FUNC(reference, REF_RESOURCE);
 PAGE_PRIVATE_SET_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_SET_FUNC(gcing, ONGOING_MIGRATION);
+PAGE_PRIVATE_SET_FUNC(atomic, ATOMIC_WRITE);
 
 PAGE_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);
 PAGE_PRIVATE_CLEAR_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
+PAGE_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
 
 static inline unsigned long get_page_private_data(struct page *page)
 {
@@ -2440,6 +2445,7 @@ static inline void clear_page_private_all(struct page *page)
 	clear_page_private_reference(page);
 	clear_page_private_gcing(page);
 	clear_page_private_inline(page);
+	clear_page_private_atomic(page);
 
 	f2fs_bug_on(F2FS_P_SB(page), page_private(page));
 }
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
