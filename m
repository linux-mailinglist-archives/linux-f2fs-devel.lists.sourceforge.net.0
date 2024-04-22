Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 813958AC425
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Apr 2024 08:24:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ryn6Z-0002pE-5y;
	Mon, 22 Apr 2024 06:24:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ryn6X-0002or-CW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Apr 2024 06:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GqKHo9vj3kW+OejD6Vb7XSRx5gWKjv2wnKG3AT8wi3A=; b=QnW+iXdFv/7lQm83VvQLXwAaor
 SahYj1H9sTPLwav16fI1j9UdT1hSdOQEQxCLTiGpKmlPnDRWY7dlJFB3MM4bvHYm69yNxG8QPdhHH
 m5aCC0yUTUHr/BLD8Y+KEl3pv+dv2z9/Xp+mUDJirtM4z9Gi4e4CixthP+Fm1JpoDKBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GqKHo9vj3kW+OejD6Vb7XSRx5gWKjv2wnKG3AT8wi3A=; b=L45zGpRfUn+qaYowPV1H5UvqI4
 QkqX2Js3ik6oxOb226CCX8sgaNbKH7AndbrggTQyU09458SSqEI3oaETz5yiGzCs4cAodGvDTtwVA
 NOSmkhVF7Q7ttr0woPSGE62lHPZ0CZtMKkaXpmNT9ltlomP7WhUkt8XBrJin+OQjBoFQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ryn6W-0003dy-DB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Apr 2024 06:24:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D0108CE09CF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Apr 2024 06:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20368C116B1;
 Mon, 22 Apr 2024 06:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713767068;
 bh=UXeIomZemy3zpwCifF52rGb5bBATrGJrCt/HKWLMLTw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lj9OYEaMDXoPMSLnwW+EthLhggh6OLYI0H7Wx+wX8nEYzdBr9KeJ//zH5vH7aZ3Sv
 r8xKSNcBAFu6aPb7sPOKhbCAzVcr67SF56r/uslbrgMcofbPdMKKa1kH1Hfbx1kBeo
 zlXX/CiRQ1W7NeLIVV2GnxjLTjKLDM2U3/e3fatrilSSzQ1l8g3MlYwAGfQ+H7HUi2
 +juMOG1PgE+l/u5l7RlOSk95rvEQiTGYV/YxMG8guEmOAMAjbQknADRIAGBpwESKZ4
 +Gs34/HLkyxgifPR5Le4I8w33lOvFTva/+taiDhZw1mEpWElkTszx1mcwYL13rVGhD
 dh1dk/+uaTT6Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 22 Apr 2024 14:24:16 +0800
Message-Id: <20240422062417.2421616-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240422062417.2421616-1-chao@kernel.org>
References: <20240422062417.2421616-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert f2fs_read_inline_data() to use folio and related
 functionality, 
 and also convert its caller to use folio. Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- v2: - no change. fs/f2fs/data.c | 11 +++++------ fs/f2fs/f2fs.h | 4 ++--
 fs/f2fs/inline.c | 34 +++++++++++++++++ 3 files changed, 24 inser [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ryn6W-0003dy-DB
Subject: [f2fs-dev] [PATCH v2 3/4] f2fs: convert f2fs_read_inline_data() to
 use folio
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
v2:
- no change.
 fs/f2fs/data.c   | 11 +++++------
 fs/f2fs/f2fs.h   |  4 ++--
 fs/f2fs/inline.c | 34 +++++++++++++++++-----------------
 3 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index bb6c0e955d7e..24f9a39ffd56 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2457,20 +2457,19 @@ static int f2fs_mpage_readpages(struct inode *inode,
 
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
@@ -3399,7 +3398,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	if (f2fs_has_inline_data(inode)) {
 		if (pos + len <= MAX_INLINE_DATA(inode)) {
-			f2fs_do_read_inline_data(page, ipage);
+			f2fs_do_read_inline_data(page_folio(page), ipage);
 			set_inode_flag(inode, FI_DATA_EXIST);
 			if (inode->i_nlink)
 				set_page_private_inline(ipage);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3f7196122574..a0ae99bcca39 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4154,10 +4154,10 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
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
