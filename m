Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D668A64FF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Apr 2024 09:23:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rwdAN-0007nH-2u;
	Tue, 16 Apr 2024 07:23:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rwdAL-0007nA-4d
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 07:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=33+4iiPPZsOOcA97zzLRcNS6M+UPYJty+HKnMtAaHhA=; b=AatZliBpwQvJ1XVF04sCHBnZzn
 yLruVuKgyOZhZV1QkIpijKRP36JYGciMhejcaKNaVuXNADW+s9ACMptjzXF/X4v7ugmlm65qatoWC
 Vhb9WOjclHIH0nc7fWPQmhZGY+uocgoglwCtbMUITSG5sIEA6/5s2XJ2AAbK4P7vylhg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=33+4iiPPZsOOcA97zzLRcNS6M+UPYJty+HKnMtAaHhA=; b=gBZdRWgCx46Q8NMD7loR/v7Ddz
 mSr13KYt1SwTweb0Ye6mk8OOXQ7uFX1fSJPPHdmrmO9+vPWM+DRGA3gkajT7emftih5144LU8HMWH
 OgoFkvtNQeUIwtULdy4pIchJ36GF6IB9NDlrAF0iujCrkaN4rE2HRi+u6DPiIGFGr714=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rwdAK-0002xi-PY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 07:23:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 48B5F6109E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Apr 2024 07:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B632AC32781;
 Tue, 16 Apr 2024 07:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713252215;
 bh=gnYDk6OX4XE3h8kNjiuhBPTQmlA/CYDOhV8fZAtl/TE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iKr/BaH/HhEmeD863rF3i7syD3sDhrr/9HjkgyFmT7PK4IRCWvQwzvceTrBshObS3
 g0uD4prp+Q/18p80UXodqWcbJCq3HKHsfNmNiCdUcBLs2YFiKYCh4x6wtG7x8BbE2Z
 n/n2M7WcqfizbXZKpoQCBfnL+SPKudjKo5roM5dfZvUq+66TkQfPFaweQUT1t/fKoH
 Ff4+i63bJlrkCxHPTWwxdJg3+dNJ6kYz/fX+bkY7DtehKuPoEI5mcUGget4S/+nRig
 huv+2Sti2U9KKYlICEZupnrDRKHdmpwrYvjbP2WzXItYqhwiabcU4ROsuWncx3I94F
 Li46IaVrVVzvA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 16 Apr 2024 15:23:17 +0800
Message-Id: <20240416072318.6486-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240416072318.6486-1-chao@kernel.org>
References: <20240416072318.6486-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert f2fs_read_inline_data() to use folio and related
 functionality, 
 and also convert its caller to use folio. Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/data.c | 11 +++++------ fs/f2fs/f2fs.h | 4 ++-- fs/f2fs/inline.c
 | 34 +++++++++++++++++ 3 files changed, 24 insertions(+), 25 dele [...] 
 Content analysis details:   (-2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rwdAK-0002xi-PY
Subject: [f2fs-dev] [PATCH 3/4] f2fs: convert f2fs_read_inline_data() to use
 folio
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

Convert f2fs_read_inline_data() to use folio and related
functionality, and also convert its caller to use folio.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c   | 11 +++++------
 fs/f2fs/f2fs.h   |  4 ++--
 fs/f2fs/inline.c | 34 +++++++++++++++++-----------------
 3 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c35107657c97..3eb90b9b0f8b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2487,20 +2487,19 @@ static int f2fs_mpage_readpages(struct inode *inode,
 
 static int f2fs_read_data_folio(struct file *file, struct folio *folio)
 {
-	struct page *page = &folio->page;
-	struct inode *inode = page_file_mapping(page)->host;
+	struct inode *inode = folio_file_mapping(folio)->host;
 	int ret = -EAGAIN;
 
-	trace_f2fs_readpage(page, DATA);
+	trace_f2fs_readpage(&folio->page, DATA);
 
 	if (!f2fs_is_compress_backend_ready(inode)) {
-		unlock_page(page);
+		folio_unlock(folio);
 		return -EOPNOTSUPP;
 	}
 
 	/* If the file has inline data, try to read it directly */
 	if (f2fs_has_inline_data(inode))
-		ret = f2fs_read_inline_data(inode, page);
+		ret = f2fs_read_inline_data(inode, folio);
 	if (ret == -EAGAIN)
 		ret = f2fs_mpage_readpages(inode, NULL, folio);
 	return ret;
@@ -3429,7 +3428,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	if (f2fs_has_inline_data(inode)) {
 		if (pos + len <= MAX_INLINE_DATA(inode)) {
-			f2fs_do_read_inline_data(page, ipage);
+			f2fs_do_read_inline_data(page_folio(page), ipage);
 			set_inode_flag(inode, FI_DATA_EXIST);
 			if (inode->i_nlink)
 				set_page_private_inline(ipage);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 34acd791c198..13dee521fbe8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4153,10 +4153,10 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
 bool f2fs_may_inline_data(struct inode *inode);
 bool f2fs_sanity_check_inline_data(struct inode *inode);
 bool f2fs_may_inline_dentry(struct inode *inode);
-void f2fs_do_read_inline_data(struct page *page, struct page *ipage);
+void f2fs_do_read_inline_data(struct folio *folio, struct page *ipage);
 void f2fs_truncate_inline_inode(struct inode *inode,
 						struct page *ipage, u64 from);
-int f2fs_read_inline_data(struct inode *inode, struct page *page);
+int f2fs_read_inline_data(struct inode *inode, struct folio *folio);
 int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page);
 int f2fs_convert_inline_inode(struct inode *inode);
 int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 3d3218a4b29d..7638d0d7b7ee 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -61,22 +61,22 @@ bool f2fs_may_inline_dentry(struct inode *inode)
 	return true;
 }
 
-void f2fs_do_read_inline_data(struct page *page, struct page *ipage)
+void f2fs_do_read_inline_data(struct folio *folio, struct page *ipage)
 {
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = folio_file_mapping(folio)->host;
 
-	if (PageUptodate(page))
+	if (folio_test_uptodate(folio))
 		return;
 
-	f2fs_bug_on(F2FS_P_SB(page), page->index);
+	f2fs_bug_on(F2FS_I_SB(inode), folio_index(folio));
 
-	zero_user_segment(page, MAX_INLINE_DATA(inode), PAGE_SIZE);
+	folio_zero_segment(folio, MAX_INLINE_DATA(inode), folio_size(folio));
 
 	/* Copy the whole inline data block */
-	memcpy_to_page(page, 0, inline_data_addr(inode, ipage),
+	memcpy_to_folio(folio, 0, inline_data_addr(inode, ipage),
 		       MAX_INLINE_DATA(inode));
-	if (!PageUptodate(page))
-		SetPageUptodate(page);
+	if (!folio_test_uptodate(folio))
+		folio_mark_uptodate(folio);
 }
 
 void f2fs_truncate_inline_inode(struct inode *inode,
@@ -97,13 +97,13 @@ void f2fs_truncate_inline_inode(struct inode *inode,
 		clear_inode_flag(inode, FI_DATA_EXIST);
 }
 
-int f2fs_read_inline_data(struct inode *inode, struct page *page)
+int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 {
 	struct page *ipage;
 
 	ipage = f2fs_get_node_page(F2FS_I_SB(inode), inode->i_ino);
 	if (IS_ERR(ipage)) {
-		unlock_page(page);
+		folio_unlock(folio);
 		return PTR_ERR(ipage);
 	}
 
@@ -112,15 +112,15 @@ int f2fs_read_inline_data(struct inode *inode, struct page *page)
 		return -EAGAIN;
 	}
 
-	if (page->index)
-		zero_user_segment(page, 0, PAGE_SIZE);
+	if (folio_index(folio))
+		folio_zero_segment(folio, 0, folio_size(folio));
 	else
-		f2fs_do_read_inline_data(page, ipage);
+		f2fs_do_read_inline_data(folio, ipage);
 
-	if (!PageUptodate(page))
-		SetPageUptodate(page);
+	if (!folio_test_uptodate(folio))
+		folio_mark_uptodate(folio);
 	f2fs_put_page(ipage, 1);
-	unlock_page(page);
+	folio_unlock(folio);
 	return 0;
 }
 
@@ -166,7 +166,7 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 
 	f2fs_bug_on(F2FS_P_SB(page), folio_test_writeback(page_folio(page)));
 
-	f2fs_do_read_inline_data(page, dn->inode_page);
+	f2fs_do_read_inline_data(page_folio(page), dn->inode_page);
 	set_page_dirty(page);
 
 	/* clear dirty state */
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
