Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98652A76E42
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVi-0003rn-Iy;
	Mon, 31 Mar 2025 20:13:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVb-0003mq-E9
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7K3Tj3u7UoqwJyjqg5vv6dZVZDGz6120wQQJDEZISu4=; b=nBoRK+ViB/qZxZket9cDftlN1r
 G1pubrcApCLylrRurKeLKztzHbZ0PeONP1LMi/FTmvoHnS8duxWO27Sdx1cotcS5Qoha5gGvVdPH6
 /0Fxi2rWwQF3Naf7VX8qbNDk62F8ujysKOtwjQ4a8YfDqlUmdnXSUfLS6nYdjMMtl1tE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7K3Tj3u7UoqwJyjqg5vv6dZVZDGz6120wQQJDEZISu4=; b=iH9JQLGNFl9BmJIkUJEB9E9R84
 jeKVErfp1Hic5irnuS3Md8h2m4u1404snsDSF1F5TPfBpY/L/JPyR4zOdb/ib4f3d+niwYxa1Uc8S
 xUdfN2ccyqKLAaJ+uVG6oeviWyRWrYqnAXOKEYJ0LssHrfDEWZSi8hbgo4btcSfY+xiM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVa-0003bd-PA for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7K3Tj3u7UoqwJyjqg5vv6dZVZDGz6120wQQJDEZISu4=; b=eJwFUBaoGDsbcdl6jHa9v1iYgJ
 ZZCKJtxjMWsk6bgOIncHaj7lIwREImVh8kevUrysUhIBvW6c+houg7RGOkDojyOyo1Q/FFOmevJp/
 ab7TjxTqEiAX3Xu3Qc4hjjAw/L4vYylLPsbaklONFlPn6CkuncGgm5nT542355sU1MJvNXREZYR6P
 Gg24HJLM7ZRdZnM2av7tX2R1+iXsnFSqreZiWbXU4sS55n5Napq9wfLwhfL/nfO7TUVDPjjkqol4W
 4Awz8wzYb9SsGVlR0qdgniBaBBc+sfecs7HWbibx5IWsoJE3V6JF1kLH44Wl/mYBGXdYnpkaZfwJP
 krRBhUjA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVP-00000004RsG-1Qmd;
 Mon, 31 Mar 2025 20:13:11 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:27 +0100
Message-ID: <20250331201256.1057782-68-willy@infradead.org>
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
 Content preview:  Both callers now have a folio, so pass it in. Removes three
 calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/f2fs.h | 2 +- fs/f2fs/inode.c | 16 ++++++++-------- fs/f2fs/node.c
 | 4 ++-- 3 files changed, 11 insertions(+), 11 deletions(-) 
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
X-Headers-End: 1tzLVa-0003bd-PA
Subject: [f2fs-dev] [PATCH 067/153] f2fs: Pass a folio to
 f2fs_inode_chksum_verify()
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

Both callers now have a folio, so pass it in.  Removes three calls
to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h  |  2 +-
 fs/f2fs/inode.c | 16 ++++++++--------
 fs/f2fs/node.c  |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 11e63c5f524a..d975d7f7d269 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3597,7 +3597,7 @@ int f2fs_pin_file_control(struct inode *inode, bool inc);
  * inode.c
  */
 void f2fs_set_inode_flags(struct inode *inode);
-bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page);
+bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct folio *folio);
 void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page);
 struct inode *f2fs_iget(struct super_block *sb, unsigned long ino);
 struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 83f862578fc8..38512f2d4b28 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -154,7 +154,7 @@ static __u32 f2fs_inode_chksum(struct f2fs_sb_info *sbi, struct page *page)
 	return chksum;
 }
 
-bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page)
+bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct folio *folio)
 {
 	struct f2fs_inode *ri;
 	__u32 provided, calculated;
@@ -163,21 +163,21 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page)
 		return true;
 
 #ifdef CONFIG_F2FS_CHECK_FS
-	if (!f2fs_enable_inode_chksum(sbi, page))
+	if (!f2fs_enable_inode_chksum(sbi, &folio->page))
 #else
-	if (!f2fs_enable_inode_chksum(sbi, page) ||
-			PageDirty(page) ||
-			folio_test_writeback(page_folio(page)))
+	if (!f2fs_enable_inode_chksum(sbi, &folio->page) ||
+			folio_test_dirty(folio) ||
+			folio_test_writeback(folio))
 #endif
 		return true;
 
-	ri = &F2FS_NODE(page)->i;
+	ri = &F2FS_NODE(&folio->page)->i;
 	provided = le32_to_cpu(ri->i_inode_checksum);
-	calculated = f2fs_inode_chksum(sbi, page);
+	calculated = f2fs_inode_chksum(sbi, &folio->page);
 
 	if (provided != calculated)
 		f2fs_warn(sbi, "checksum invalid, nid = %lu, ino_of_node = %x, %x vs. %x",
-			  page_folio(page)->index, ino_of_node(page),
+			  folio->index, ino_of_node(&folio->page),
 			  provided, calculated);
 
 	return provided == calculated;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index f1f0d5159f2d..e63bfdd807b3 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1403,7 +1403,7 @@ static int read_node_folio(struct folio *folio, blk_opf_t op_flags)
 	int err;
 
 	if (folio_test_uptodate(folio)) {
-		if (!f2fs_inode_chksum_verify(sbi, &folio->page)) {
+		if (!f2fs_inode_chksum_verify(sbi, folio)) {
 			folio_clear_uptodate(folio);
 			return -EFSBADCRC;
 		}
@@ -1517,7 +1517,7 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 		goto out_err;
 	}
 
-	if (!f2fs_inode_chksum_verify(sbi, &folio->page)) {
+	if (!f2fs_inode_chksum_verify(sbi, folio)) {
 		err = -EFSBADCRC;
 		goto out_err;
 	}
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
