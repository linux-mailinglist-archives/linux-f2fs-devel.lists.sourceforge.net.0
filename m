Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC0059A891
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 00:34:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPAZj-00032l-6V;
	Fri, 19 Aug 2022 22:34:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oPAZh-00032e-EO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 22:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q7ZO3+CGDjYRuNjXFGa4bQULM1TeWQcld1s6A3yTKOU=; b=DUzblcbjOqbOI8tSepJi5ZM+fw
 kcRAaZ7eFx7iP0ZiInxIej78h8VhbFFPJ4sRoMC17SJt+DK9VgROT/oayBQtdtou7ulWzAKUQv3Oa
 mOg2fPXSUyE1KQJOqJUT6b6V1HMfOttB+4L+VsYy7OSFE11BxbjWVjnzHB6xW5OfSUOE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q7ZO3+CGDjYRuNjXFGa4bQULM1TeWQcld1s6A3yTKOU=; b=A
 6mxkNxwKjiYoGIOp2whxoaSJMssOh7fmrsN8R4L4yp2sWqBLr2laK5JMugC974l2n5mcsGxg9r+tM
 JAIrbnl34YPp4IpShYnHIrkLjxqzbhw6XTHPLmnRUzhE38HphxbhURl24oYZAS4SvAx/EHBDMUFPy
 XXEygvi0kFPEOfUU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPAZN-0008FX-Vl for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 22:34:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DFEF5B82922;
 Fri, 19 Aug 2022 22:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EFDC433C1;
 Fri, 19 Aug 2022 22:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660948453;
 bh=9Jq3sz2Ydj4Z5XHUsMfrEyIV1Huah4b/zVHLCatoY1Y=;
 h=From:To:Cc:Subject:Date:From;
 b=ACdBuLxUIXjgNh0HV/SvAATF+/CZ0juRfx9dlgk9UcyBsqGxTRdsHc1qkPiVcy1DT
 dMeakeRdn1Dz1Fi7Vte5cCyPMxeyW1l9Mzd4ncoHQt7jHKRJ+9VxpUlcVyywJiuIle
 sq4x0PunK0PdzKEFhiLVsBWB5musWCJSenyIGUTP6VEUWWzjBfynDJAnJVoulm8LUG
 lY0YzOpvF1NrVCUWhiZvSv6WSya24GcKXLYVbQfOZ3HLISmwgkJXa3vHnPy2BRH7s0
 NzsmiMwl4Unoi74chWUn8FaX0TQfUcDHYlcnOU2Fq/JZfe4wuiHE7oPpiRDwj/GIG1
 a/dmUD1IFxFeg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 19 Aug 2022 15:33:00 -0700
Message-Id: <20220819223300.9128-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> This is simpler,
 and as a side effect it replaces several uses of kmap_atomic() with its
 recommended
 replacement kmap_local_page(). Signed-off-by: Eric Biggers
 <ebiggers@google.com> --- 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oPAZN-0008FX-Vl
Subject: [f2fs-dev] [PATCH v2] f2fs: use memcpy_{to,
 from}_page() where possible
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 "Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

This is simpler, and as a side effect it replaces several uses of
kmap_atomic() with its recommended replacement kmap_local_page().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

v2: remove unneeded calls to flush_dcache_page(),
    and convert the kmap_atomic() in f2fs_write_inline_data().

 fs/f2fs/inline.c | 15 ++++-----------
 fs/f2fs/super.c  | 11 ++---------
 fs/f2fs/verity.c | 10 ++--------
 3 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index bf46a7dfbea2fc..73da9331803696 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -64,7 +64,6 @@ bool f2fs_may_inline_dentry(struct inode *inode)
 void f2fs_do_read_inline_data(struct page *page, struct page *ipage)
 {
 	struct inode *inode = page->mapping->host;
-	void *src_addr, *dst_addr;
 
 	if (PageUptodate(page))
 		return;
@@ -74,11 +73,8 @@ void f2fs_do_read_inline_data(struct page *page, struct page *ipage)
 	zero_user_segment(page, MAX_INLINE_DATA(inode), PAGE_SIZE);
 
 	/* Copy the whole inline data block */
-	src_addr = inline_data_addr(inode, ipage);
-	dst_addr = kmap_atomic(page);
-	memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
-	flush_dcache_page(page);
-	kunmap_atomic(dst_addr);
+	memcpy_to_page(page, 0, inline_data_addr(inode, ipage),
+		       MAX_INLINE_DATA(inode));
 	if (!PageUptodate(page))
 		SetPageUptodate(page);
 }
@@ -246,7 +242,6 @@ int f2fs_convert_inline_inode(struct inode *inode)
 
 int f2fs_write_inline_data(struct inode *inode, struct page *page)
 {
-	void *src_addr, *dst_addr;
 	struct dnode_of_data dn;
 	int err;
 
@@ -263,10 +258,8 @@ int f2fs_write_inline_data(struct inode *inode, struct page *page)
 	f2fs_bug_on(F2FS_I_SB(inode), page->index);
 
 	f2fs_wait_on_page_writeback(dn.inode_page, NODE, true, true);
-	src_addr = kmap_atomic(page);
-	dst_addr = inline_data_addr(inode, dn.inode_page);
-	memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
-	kunmap_atomic(src_addr);
+	memcpy_from_page(inline_data_addr(inode, dn.inode_page),
+			 page, 0, MAX_INLINE_DATA(inode));
 	set_page_dirty(dn.inode_page);
 
 	f2fs_clear_page_cache_dirty_tag(page);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2451623c05a7a8..3e5743b2538240 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2465,7 +2465,6 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
 	size_t toread;
 	loff_t i_size = i_size_read(inode);
 	struct page *page;
-	char *kaddr;
 
 	if (off > i_size)
 		return 0;
@@ -2498,9 +2497,7 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
 			return -EIO;
 		}
 
-		kaddr = kmap_atomic(page);
-		memcpy(data, kaddr + offset, tocopy);
-		kunmap_atomic(kaddr);
+		memcpy_from_page(data, page, offset, tocopy);
 		f2fs_put_page(page, 1);
 
 		offset = 0;
@@ -2522,7 +2519,6 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 	size_t towrite = len;
 	struct page *page;
 	void *fsdata = NULL;
-	char *kaddr;
 	int err = 0;
 	int tocopy;
 
@@ -2541,10 +2537,7 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 			break;
 		}
 
-		kaddr = kmap_atomic(page);
-		memcpy(kaddr + offset, data, tocopy);
-		kunmap_atomic(kaddr);
-		flush_dcache_page(page);
+		memcpy_to_page(page, offset, data, tocopy);
 
 		a_ops->write_end(NULL, mapping, off, tocopy, tocopy,
 						page, fsdata);
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 7b8f2b41c29b12..97ec60f39d6960 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -47,16 +47,13 @@ static int pagecache_read(struct inode *inode, void *buf, size_t count,
 		size_t n = min_t(size_t, count,
 				 PAGE_SIZE - offset_in_page(pos));
 		struct page *page;
-		void *addr;
 
 		page = read_mapping_page(inode->i_mapping, pos >> PAGE_SHIFT,
 					 NULL);
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
-		addr = kmap_atomic(page);
-		memcpy(buf, addr + offset_in_page(pos), n);
-		kunmap_atomic(addr);
+		memcpy_from_page(buf, page, offset_in_page(pos), n);
 
 		put_page(page);
 
@@ -85,16 +82,13 @@ static int pagecache_write(struct inode *inode, const void *buf, size_t count,
 				 PAGE_SIZE - offset_in_page(pos));
 		struct page *page;
 		void *fsdata;
-		void *addr;
 		int res;
 
 		res = aops->write_begin(NULL, mapping, pos, n, &page, &fsdata);
 		if (res)
 			return res;
 
-		addr = kmap_atomic(page);
-		memcpy(addr + offset_in_page(pos), buf, n);
-		kunmap_atomic(addr);
+		memcpy_to_page(page, offset_in_page(pos), buf, n);
 
 		res = aops->write_end(NULL, mapping, pos, n, n, page, fsdata);
 		if (res < 0)

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.37.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
