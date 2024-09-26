Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C723C98755A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Sep 2024 16:21:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1stpMx-0005ht-Oo;
	Thu, 26 Sep 2024 14:21:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kernel@pankajraghav.com>) id 1stpMp-0005hj-Lx
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Sep 2024 14:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w3yVqcJ29OEQ9vfqFMLDk33CQ5+GhguYzGm7fkCs0Fo=; b=Uv+aGfvValWaGkT4fm1jyqz4bB
 C4+Ic0gTN+XsVRJYzA9EcEhDslFb06WcpuWtsrF/4PWgpWSIujzNnvzKs2qZHQ27Ez7NmhGMuRlYK
 4VnMdYoECb4zu7e2P2eDa1qBCH4L9ULHlAjcChAdC+VaA95ogJ68l9qQscNKYZ7KxzUA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=w3yVqcJ29OEQ9vfqFMLDk33CQ5+GhguYzGm7fkCs0Fo=; b=O
 wMfw8DfiLd/21pM7zbB7uT1R5kF2CSiAJj5BtMyylnKE6Y8nJaQAap5kZs9AOoJiB5cZc3APwi6ml
 WWd4CNE0YkW9HbeUTrB11jbEv3s8jSEjtWwtfATYezAZSXb9CJO/zJ7OISgT8aP+ByAVCDdmZPzjX
 0SDvpWvCr9QFFQb4=;
Received: from mout-p-202.mailbox.org ([80.241.56.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1stpMp-0008Rm-08 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Sep 2024 14:21:16 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4XDwHx69cbz9v1R;
 Thu, 26 Sep 2024 16:01:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pankajraghav.com;
 s=MBO0001; t=1727359293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=w3yVqcJ29OEQ9vfqFMLDk33CQ5+GhguYzGm7fkCs0Fo=;
 b=B/hzg0lEblt0XlID897/ZRjsqDcP0jLjdHy9khrBa2XGuPS4avvtELj0OpJGDbeioi61t7
 IeK7Uva9eqJjQJNAQtFL/osMaWw++FQkcMI5eaZcWmv8r1oYWl6Cd3MhhXzqO33Vy6lzR4
 U9/k9KdJ1kENR8gfdRKxiBTsRxkcE0LFTdySUBPmIeExlE00t/iw/169IF3eYxskcdFDe5
 ymmTPoKPSUEmOGSWxpnolvT7Ngwdty5KQb5HzdShLfad2IeycqmAo5Scf8CpSBiM+TPSeF
 4JNbWZqKFOT0cFl1qDt6C2Q/TSYsVSFRun1ld1P+Hl7fJ+YcXxaDFpk3T79qCA==
To: Theodore Ts'o <tytso@mit.edu>, Chao Yu <chao@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, willy@infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Darrick J . Wong" <djwong@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Tejun Heo <tj@kernel.org>, akpm@linux-foundation.org,
 Christian Brauner <brauner@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jan Kara <jack@suse.cz>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>
Date: Thu, 26 Sep 2024 16:01:21 +0200
Message-ID: <20240926140121.203821-1-kernel@pankajraghav.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4XDwHx69cbz9v1R
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Pankaj Raghav <p.raghav@samsung.com> Most of the
 callers
 of wbc_account_cgroup_owner() are converting a folio to page before calling
 the function. wbc_account_cgroup_owner() is converting the page back to a
 folio to call mem_cgroup_css_f [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1stpMp-0008Rm-08
Subject: [f2fs-dev] [PATCH] fs/writeback: convert wbc_account_cgroup_owner
 to take a folio
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
From: "Pankaj Raghav \(Samsung\) via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Pankaj Raghav \(Samsung\)" <kernel@pankajraghav.com>
Cc: Pankaj Raghav <p.raghav@samsung.com>, linux-doc@vger.kernel.org,
 gost.dev@samsung.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 kernel@pankajraghav.com, mcgrof@kernel.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Pankaj Raghav <p.raghav@samsung.com>

Most of the callers of wbc_account_cgroup_owner() are converting a folio
to page before calling the function. wbc_account_cgroup_owner() is
converting the page back to a folio to call mem_cgroup_css_from_folio().

Convert wbc_account_cgroup_owner() to take a folio instead of a page,
and convert all callers to pass a folio directly except f2fs.

Convert the page to folio for all the callers from f2fs as they were the
only callers calling wbc_account_cgroup_owner() with a page. As f2fs is
already in the process of converting to folios, these call sites might
also soon be calling wbc_account_cgroup_owner() with a folio directly in
the future.

No functional changes. Only compile tested.

Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 2 +-
 fs/btrfs/extent_io.c                    | 7 +++----
 fs/btrfs/inode.c                        | 2 +-
 fs/buffer.c                             | 4 ++--
 fs/ext4/page-io.c                       | 2 +-
 fs/f2fs/data.c                          | 9 ++++++---
 fs/fs-writeback.c                       | 8 +++-----
 fs/iomap/buffered-io.c                  | 2 +-
 fs/mpage.c                              | 2 +-
 include/linux/writeback.h               | 4 ++--
 10 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 69af2173555fb..064012ea6f366 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2945,7 +2945,7 @@ following two functions.
 	a queue (device) has been associated with the bio and
 	before submission.
 
-  wbc_account_cgroup_owner(@wbc, @page, @bytes)
+  wbc_account_cgroup_owner(@wbc, @folio, @bytes)
 	Should be called for each data segment being written out.
 	While this function doesn't care exactly when it's called
 	during the writeback session, it's the easiest and most
diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 39c9677c47d5a..4667d1e034e0e 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -785,7 +785,7 @@ static void submit_extent_folio(struct btrfs_bio_ctrl *bio_ctrl,
 		}
 
 		if (bio_ctrl->wbc)
-			wbc_account_cgroup_owner(bio_ctrl->wbc, &folio->page,
+			wbc_account_cgroup_owner(bio_ctrl->wbc, folio,
 						 len);
 
 		size -= len;
@@ -1707,7 +1707,7 @@ static noinline_for_stack void write_one_eb(struct extent_buffer *eb,
 		ret = bio_add_folio(&bbio->bio, folio, eb->len,
 				    eb->start - folio_pos(folio));
 		ASSERT(ret);
-		wbc_account_cgroup_owner(wbc, folio_page(folio, 0), eb->len);
+		wbc_account_cgroup_owner(wbc, folio, eb->len);
 		folio_unlock(folio);
 	} else {
 		int num_folios = num_extent_folios(eb);
@@ -1721,8 +1721,7 @@ static noinline_for_stack void write_one_eb(struct extent_buffer *eb,
 			folio_start_writeback(folio);
 			ret = bio_add_folio(&bbio->bio, folio, eb->folio_size, 0);
 			ASSERT(ret);
-			wbc_account_cgroup_owner(wbc, folio_page(folio, 0),
-						 eb->folio_size);
+			wbc_account_cgroup_owner(wbc, folio, eb->folio_size);
 			wbc->nr_to_write -= folio_nr_pages(folio);
 			folio_unlock(folio);
 		}
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index edac499fd83d2..eb64f04755c23 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -1729,7 +1729,7 @@ static bool run_delalloc_compressed(struct btrfs_inode *inode,
 			 * need full accuracy.  Just account the whole thing
 			 * against the first page.
 			 */
-			wbc_account_cgroup_owner(wbc, &locked_folio->page,
+			wbc_account_cgroup_owner(wbc, locked_folio,
 						 cur_end - start);
 			async_chunk[i].locked_folio = locked_folio;
 			locked_folio = NULL;
diff --git a/fs/buffer.c b/fs/buffer.c
index 1fc9a50def0b5..32bd0f4c42236 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2803,7 +2803,7 @@ static void submit_bh_wbc(blk_opf_t opf, struct buffer_head *bh,
 	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
 	bio->bi_write_hint = write_hint;
 
-	__bio_add_page(bio, bh->b_page, bh->b_size, bh_offset(bh));
+	bio_add_folio_nofail(bio, bh->b_folio, bh->b_size, bh_offset(bh));
 
 	bio->bi_end_io = end_bio_bh_io_sync;
 	bio->bi_private = bh;
@@ -2813,7 +2813,7 @@ static void submit_bh_wbc(blk_opf_t opf, struct buffer_head *bh,
 
 	if (wbc) {
 		wbc_init_bio(wbc, bio);
-		wbc_account_cgroup_owner(wbc, bh->b_page, bh->b_size);
+		wbc_account_cgroup_owner(wbc, bh->b_folio, bh->b_size);
 	}
 
 	submit_bio(bio);
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index ad5543866d215..b7b9261fec3b5 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -421,7 +421,7 @@ static void io_submit_add_bh(struct ext4_io_submit *io,
 		io_submit_init_bio(io, bh);
 	if (!bio_add_folio(io->io_bio, io_folio, bh->b_size, bh_offset(bh)))
 		goto submit_and_retry;
-	wbc_account_cgroup_owner(io->io_wbc, &folio->page, bh->b_size);
+	wbc_account_cgroup_owner(io->io_wbc, folio, bh->b_size);
 	io->io_next_block++;
 }
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 94f7b084f6016..e3ce763cce18f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -711,7 +711,8 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	}
 
 	if (fio->io_wbc && !is_read_io(fio->op))
-		wbc_account_cgroup_owner(fio->io_wbc, fio->page, PAGE_SIZE);
+		wbc_account_cgroup_owner(fio->io_wbc, page_folio(fio->page),
+					 PAGE_SIZE);
 
 	inc_page_count(fio->sbi, is_read_io(fio->op) ?
 			__read_io_type(page) : WB_DATA_TYPE(fio->page, false));
@@ -911,7 +912,8 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	}
 
 	if (fio->io_wbc)
-		wbc_account_cgroup_owner(fio->io_wbc, fio->page, PAGE_SIZE);
+		wbc_account_cgroup_owner(fio->io_wbc, page_folio(fio->page),
+					 PAGE_SIZE);
 
 	inc_page_count(fio->sbi, WB_DATA_TYPE(page, false));
 
@@ -1011,7 +1013,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	}
 
 	if (fio->io_wbc)
-		wbc_account_cgroup_owner(fio->io_wbc, fio->page, PAGE_SIZE);
+		wbc_account_cgroup_owner(fio->io_wbc, page_folio(fio->page),
+					 PAGE_SIZE);
 
 	io->last_block_in_bio = fio->new_blkaddr;
 
diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index d8bec3c1bb1fa..2391b09f4cede 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -890,17 +890,16 @@ EXPORT_SYMBOL_GPL(wbc_detach_inode);
 /**
  * wbc_account_cgroup_owner - account writeback to update inode cgroup ownership
  * @wbc: writeback_control of the writeback in progress
- * @page: page being written out
+ * @folio: folio being written out
  * @bytes: number of bytes being written out
  *
- * @bytes from @page are about to written out during the writeback
+ * @bytes from @folio are about to written out during the writeback
  * controlled by @wbc.  Keep the book for foreign inode detection.  See
  * wbc_detach_inode().
  */
-void wbc_account_cgroup_owner(struct writeback_control *wbc, struct page *page,
+void wbc_account_cgroup_owner(struct writeback_control *wbc, struct folio *folio,
 			      size_t bytes)
 {
-	struct folio *folio;
 	struct cgroup_subsys_state *css;
 	int id;
 
@@ -913,7 +912,6 @@ void wbc_account_cgroup_owner(struct writeback_control *wbc, struct page *page,
 	if (!wbc->wb || wbc->no_cgroup_owner)
 		return;
 
-	folio = page_folio(page);
 	css = mem_cgroup_css_from_folio(folio);
 	/* dead cgroups shouldn't contribute to inode ownership arbitration */
 	if (!(css->flags & CSS_ONLINE))
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 11ea747228aee..3d1fae7d3a64e 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1833,7 +1833,7 @@ static int iomap_add_to_ioend(struct iomap_writepage_ctx *wpc,
 	if (ifs)
 		atomic_add(len, &ifs->write_bytes_pending);
 	wpc->ioend->io_size += len;
-	wbc_account_cgroup_owner(wbc, &folio->page, len);
+	wbc_account_cgroup_owner(wbc, folio, len);
 	return 0;
 }
 
diff --git a/fs/mpage.c b/fs/mpage.c
index b5b5ddf9d513d..82aecf3727437 100644
--- a/fs/mpage.c
+++ b/fs/mpage.c
@@ -606,7 +606,7 @@ static int __mpage_writepage(struct folio *folio, struct writeback_control *wbc,
 	 * the confused fail path above (OOM) will be very confused when
 	 * it finds all bh marked clean (i.e. it will not write anything)
 	 */
-	wbc_account_cgroup_owner(wbc, &folio->page, folio_size(folio));
+	wbc_account_cgroup_owner(wbc, folio, folio_size(folio));
 	length = first_unmapped << blkbits;
 	if (!bio_add_folio(bio, folio, length, 0)) {
 		bio = mpage_bio_submit_write(bio);
diff --git a/include/linux/writeback.h b/include/linux/writeback.h
index d6db822e4bb30..641a057e04132 100644
--- a/include/linux/writeback.h
+++ b/include/linux/writeback.h
@@ -217,7 +217,7 @@ void wbc_attach_and_unlock_inode(struct writeback_control *wbc,
 				 struct inode *inode)
 	__releases(&inode->i_lock);
 void wbc_detach_inode(struct writeback_control *wbc);
-void wbc_account_cgroup_owner(struct writeback_control *wbc, struct page *page,
+void wbc_account_cgroup_owner(struct writeback_control *wbc, struct folio *folio,
 			      size_t bytes);
 int cgroup_writeback_by_id(u64 bdi_id, int memcg_id,
 			   enum wb_reason reason, struct wb_completion *done);
@@ -324,7 +324,7 @@ static inline void wbc_init_bio(struct writeback_control *wbc, struct bio *bio)
 }
 
 static inline void wbc_account_cgroup_owner(struct writeback_control *wbc,
-					    struct page *page, size_t bytes)
+					    struct folio *folio, size_t bytes)
 {
 }
 

base-commit: 92fc9636d1471b7f68bfee70c776f7f77e747b97
-- 
2.44.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
