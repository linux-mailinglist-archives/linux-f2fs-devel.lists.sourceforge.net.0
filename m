Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0C1A76EBB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWU-0001Eo-FH;
	Mon, 31 Mar 2025 20:14:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVn-0000qD-PL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O11ysNChqVgQa2vrXzd9Yupuzo7c3ucru7ptZ4/1bCs=; b=Rol7isdZ3Tmne4/rW3HuU8mm/s
 BRcvqDHsd2qfF7gEfELuDsNBrKijJFOyHhMO9+Mb8X8ZsAJzOfG/xqB/iZvlMzQO6EAXMGzdIw23f
 x0ho2AMNbq8S5cRh0EcBpgEllzN4VbgorH8GB9O6XfoaXwJF10UaeYDBy9VIE/LylJt8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O11ysNChqVgQa2vrXzd9Yupuzo7c3ucru7ptZ4/1bCs=; b=eQZto2XUaQsW5GaBNY5i5ElZWz
 c54bXLMk6w91daIAxpz+qWE2ceDv86R2XFnRWmp6muUr+HPbO6D5RdWgIFeEEW8DTXQTjPGyPj3Cr
 zTU1oCD5mrnXn3s09TYYa/z74g/fQRCO9OfwmwC2LhBnNqikGeLpkcyDvBaWypyRpqtg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVn-0003hP-6x for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=O11ysNChqVgQa2vrXzd9Yupuzo7c3ucru7ptZ4/1bCs=; b=kX+oAxpgr9lhQpyWJvWW9a4X/8
 Ch+55pO+OESTY+EMp6M7QXChFpQZDgviny/qiLgB7oEtkbAxr+3KZIniqI5E2qqSgv9BCOaIzUDUo
 9BJU9USDE1fxfttsuf3BGKKArE7rqTVeE+pZfldaedgMWThcPfI18zKDbfR7TNWd8a7mFFOJJKFhe
 r7A7UuPb90AYLhSQVcLb2zlnPeF4wJGt9iajJwJoHiMolQKm2er2iD6QYrvbjeCQDoIi2v1oWQEV+
 TaDdPNUfCAX7xPnlV2zrzUz+qzXAXfi3S42LUXxn1QSWj+d4tMtL2QPgdVWzttHLOPSw6mLiNu7A9
 tAuv4yBg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVb-00000004SZ1-3SPs;
 Mon, 31 Mar 2025 20:13:23 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:33 +0100
Message-ID: <20250331201256.1057782-134-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  All callers now have a folio, so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/dir.c | 2 +-
 fs/f2fs/f2fs.h
 | 4 ++-- fs/f2fs/inline.c | 26 +++++++++++++ fs/f2fs/inode.c | 2 +- 4 files
 changed, 1 [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVn-0003hP-6x
Subject: [f2fs-dev] [PATCH 133/153] f2fs: Pass a folio to inline_data_addr()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All callers now have a folio, so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c    |  2 +-
 fs/f2fs/f2fs.h   |  4 ++--
 fs/f2fs/inline.c | 26 +++++++++++++-------------
 fs/f2fs/inode.c  |  2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 6dfe7f859265..c52609b6ba3a 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -628,7 +628,7 @@ bool f2fs_has_enough_room(struct inode *dir, struct folio *ifolio,
 	unsigned int bit_pos;
 	int slots = GET_DENTRY_SLOTS(fname->disk_name.len);
 
-	make_dentry_ptr_inline(dir, &d, inline_data_addr(dir, &ifolio->page));
+	make_dentry_ptr_inline(dir, &d, inline_data_addr(dir, ifolio));
 
 	bit_pos = f2fs_room_for_filename(d.bitmap, slots, d.max);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 210f0cf0bc22..55fcdd334ea4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3383,9 +3383,9 @@ static inline bool f2fs_is_cow_file(struct inode *inode)
 	return is_inode_flag_set(inode, FI_COW_FILE);
 }
 
-static inline void *inline_data_addr(struct inode *inode, struct page *page)
+static inline void *inline_data_addr(struct inode *inode, struct folio *folio)
 {
-	__le32 *addr = get_dnode_addr(inode, page);
+	__le32 *addr = get_dnode_addr(inode, &folio->page);
 
 	return (void *)(addr + DEF_INLINE_RESERVED_SIZE);
 }
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 2d2dada85e08..b7d160736630 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -91,7 +91,7 @@ void f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio)
 	folio_zero_segment(folio, MAX_INLINE_DATA(inode), folio_size(folio));
 
 	/* Copy the whole inline data block */
-	memcpy_to_folio(folio, 0, inline_data_addr(inode, &ifolio->page),
+	memcpy_to_folio(folio, 0, inline_data_addr(inode, ifolio),
 		       MAX_INLINE_DATA(inode));
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
@@ -105,7 +105,7 @@ void f2fs_truncate_inline_inode(struct inode *inode, struct folio *ifolio,
 	if (from >= MAX_INLINE_DATA(inode))
 		return;
 
-	addr = inline_data_addr(inode, &ifolio->page);
+	addr = inline_data_addr(inode, ifolio);
 
 	f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 	memset(addr + from, 0, MAX_INLINE_DATA(inode) - from);
@@ -277,7 +277,7 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 	f2fs_bug_on(F2FS_I_SB(inode), folio->index);
 
 	f2fs_folio_wait_writeback(ifolio, NODE, true, true);
-	memcpy_from_folio(inline_data_addr(inode, &ifolio->page),
+	memcpy_from_folio(inline_data_addr(inode, ifolio),
 			 folio, 0, MAX_INLINE_DATA(inode));
 	folio_mark_dirty(ifolio);
 
@@ -318,8 +318,8 @@ int f2fs_recover_inline_data(struct inode *inode, struct folio *nfolio)
 
 		f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 
-		src_addr = inline_data_addr(inode, &nfolio->page);
-		dst_addr = inline_data_addr(inode, &ifolio->page);
+		src_addr = inline_data_addr(inode, nfolio);
+		dst_addr = inline_data_addr(inode, ifolio);
 		memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
 
 		set_inode_flag(inode, FI_INLINE_DATA);
@@ -367,7 +367,7 @@ struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 		return NULL;
 	}
 
-	inline_dentry = inline_data_addr(dir, &ifolio->page);
+	inline_dentry = inline_data_addr(dir, ifolio);
 
 	make_dentry_ptr_inline(dir, &d, inline_dentry);
 	de = f2fs_find_target_dentry(&d, fname, NULL, use_hash);
@@ -390,7 +390,7 @@ int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
 	struct f2fs_dentry_ptr d;
 	void *inline_dentry;
 
-	inline_dentry = inline_data_addr(inode, &ifolio->page);
+	inline_dentry = inline_data_addr(inode, ifolio);
 
 	make_dentry_ptr_inline(inode, &d, inline_dentry);
 	f2fs_do_make_empty_dir(inode, parent, &d);
@@ -620,7 +620,7 @@ int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
 		goto out_fname;
 	}
 
-	inline_dentry = inline_data_addr(dir, &ifolio->page);
+	inline_dentry = inline_data_addr(dir, ifolio);
 
 	err = do_convert_inline_dir(dir, ifolio, inline_dentry);
 	if (!err)
@@ -648,7 +648,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 	if (IS_ERR(ifolio))
 		return PTR_ERR(ifolio);
 
-	inline_dentry = inline_data_addr(dir, &ifolio->page);
+	inline_dentry = inline_data_addr(dir, ifolio);
 	make_dentry_ptr_inline(dir, &d, inline_dentry);
 
 	bit_pos = f2fs_room_for_filename(d.bitmap, slots, d.max);
@@ -709,7 +709,7 @@ void f2fs_delete_inline_entry(struct f2fs_dir_entry *dentry,
 	folio_lock(folio);
 	f2fs_folio_wait_writeback(folio, NODE, true, true);
 
-	inline_dentry = inline_data_addr(dir, &folio->page);
+	inline_dentry = inline_data_addr(dir, folio);
 	make_dentry_ptr_inline(dir, &d, inline_dentry);
 
 	bit_pos = dentry - d.dentry;
@@ -738,7 +738,7 @@ bool f2fs_empty_inline_dir(struct inode *dir)
 	if (IS_ERR(ifolio))
 		return false;
 
-	inline_dentry = inline_data_addr(dir, &ifolio->page);
+	inline_dentry = inline_data_addr(dir, ifolio);
 	make_dentry_ptr_inline(dir, &d, inline_dentry);
 
 	bit_pos = find_next_bit_le(d.bitmap, d.max, bit_pos);
@@ -775,7 +775,7 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
 	 */
 	folio_unlock(ifolio);
 
-	inline_dentry = inline_data_addr(inode, &ifolio->page);
+	inline_dentry = inline_data_addr(inode, ifolio);
 
 	make_dentry_ptr_inline(inode, &d, inline_dentry);
 
@@ -824,7 +824,7 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 		goto out;
 
 	byteaddr = (__u64)ni.blk_addr << inode->i_sb->s_blocksize_bits;
-	byteaddr += (char *)inline_data_addr(inode, &ifolio->page) -
+	byteaddr += (char *)inline_data_addr(inode, ifolio) -
 					(char *)F2FS_INODE(&ifolio->page);
 	err = fiemap_fill_next_extent(fieinfo, start, byteaddr, ilen, flags);
 	trace_f2fs_fiemap(inode, start, byteaddr, ilen, flags, err);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index eda71c432cca..add82902826f 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -97,7 +97,7 @@ static void __set_inode_rdev(struct inode *inode, struct page *node_page)
 
 static void __recover_inline_status(struct inode *inode, struct folio *ifolio)
 {
-	void *inline_data = inline_data_addr(inode, &ifolio->page);
+	void *inline_data = inline_data_addr(inode, ifolio);
 	__le32 *start = inline_data;
 	__le32 *end = start + MAX_INLINE_DATA(inode) / sizeof(__le32);
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
