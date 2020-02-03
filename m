Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E34A1500C8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Feb 2020 04:39:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iySZv-0001H1-CT; Mon, 03 Feb 2020 03:39:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1iySZt-0001Gt-7c
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Feb 2020 03:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VjqPzn+7dA/AhZbAs/fy4ycUJnCi/pTarPPUfYx0mRI=; b=QgrZ84zxzCYkOHQoP5rTWvAy2s
 wobNo9DlGeezBP7ENL7WhWmpGBExV437FDlidfGFOWZyYzPrGzsVIhOK8LVYIg+dEwo+4OyQ4tnQ9
 e0UOhfZVLXi/5vZHD3ebcvMnwWr/lZafaKB7SXsO6vdIK4km3AjXbK0z5o+P2kFZ+RdI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VjqPzn+7dA/AhZbAs/fy4ycUJnCi/pTarPPUfYx0mRI=; b=BoRTkWbeIbAc5XWnwpHXZuYSHH
 7VEa7+oA+lumO0zPQH3UcH/4EYIjJD3E6+PifIAlwX9cGe7uOGpwAUoepn3Ga/FGRcGgI9T56zsk7
 rBQVtQsWTtBIvWa8cq7QZe81uKa2td4sxMKTPo0HET6ww2RAqi408x6Vtk1RFjzMl4ys=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iySZr-008jII-7E
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Feb 2020 03:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VjqPzn+7dA/AhZbAs/fy4ycUJnCi/pTarPPUfYx0mRI=; b=Rz31j39TdBc/NVH+JzHDT9UBi
 jvvSe/azXsS7Oom5NmIczyjg3zM8vt61u2AJ9DNVewIV4Fufsul2T8PCVeUxM6ve+mRh2An5yQyVk
 fhdCR70WB020Tgc5krSd2lVryayT31oI1JFLDhZOraL61adwBmZBHlv08lXifHf0DwqLlXlXhpGrZ
 s0Xq1kLpNx7EPDMI6rxvqAFb3Jhiochrw91jIH6kAB0e3+HCz822EMDqd8CkVfJmfDSGgrIwYY1Bl
 //wsIn0sOOJfs55NdhBCMs9D2m8zSAxmZYh5FFC8pNWXE/PiN3s+NoNbrbeA6iCGDi4ml2ubY+G8q
 F3CWaYacw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iySZj-0001q5-8J; Mon, 03 Feb 2020 03:39:03 +0000
Date: Sun, 2 Feb 2020 19:39:03 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Message-ID: <20200203033903.GB8731@bombadil.infradead.org>
References: <20200201150807.17820-1-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200201150807.17820-1-willy@infradead.org>
X-Spam-Score: 1.9 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 2.5 URIBL_DBL_ABUSE_MALW   Contains an abused malware URL listed in the
 Spamhaus DBL blocklist [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iySZr-008jII-7E
Subject: [f2fs-dev] [PATCH v2] f2fs: Make f2fs_readpages readable again
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


Remove the horrendous ifdeffery by slipping an IS_ENABLED into
f2fs_compressed_file().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
v2: Fix compilation by adding more dummy functions

 fs/f2fs/data.c |  6 ------
 fs/f2fs/f2fs.h | 10 +++++++++-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8bd9afa81c54..41156a8f60a7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2203,7 +2203,6 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 				goto next_page;
 		}
 
-#ifdef CONFIG_F2FS_FS_COMPRESSION
 		if (f2fs_compressed_file(inode)) {
 			/* there are remained comressed pages, submit them */
 			if (!f2fs_cluster_can_merge_page(&cc, page->index)) {
@@ -2230,14 +2229,11 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 			goto next_page;
 		}
 read_single_page:
-#endif
 
 		ret = f2fs_read_single_page(inode, page, max_nr_pages, &map,
 					&bio, &last_block_in_bio, is_readahead);
 		if (ret) {
-#ifdef CONFIG_F2FS_FS_COMPRESSION
 set_error_page:
-#endif
 			SetPageError(page);
 			zero_user_segment(page, 0, PAGE_SIZE);
 			unlock_page(page);
@@ -2246,7 +2242,6 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 		if (pages)
 			put_page(page);
 
-#ifdef CONFIG_F2FS_FS_COMPRESSION
 		if (f2fs_compressed_file(inode)) {
 			/* last page */
 			if (nr_pages == 1 && !f2fs_cluster_is_empty(&cc)) {
@@ -2257,7 +2252,6 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 				f2fs_destroy_compress_ctx(&cc);
 			}
 		}
-#endif
 	}
 	BUG_ON(pages && !list_empty(pages));
 	if (bio)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5355be6b6755..e90d2b3f1d2d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2706,7 +2706,8 @@ static inline int f2fs_has_inline_xattr(struct inode *inode)
 
 static inline int f2fs_compressed_file(struct inode *inode)
 {
-	return S_ISREG(inode->i_mode) &&
+	return IS_ENABLED(CONFIG_F2FS_FS_COMPRESSION) &&
+		S_ISREG(inode->i_mode) &&
 		is_inode_flag_set(inode, FI_COMPRESSED_FILE);
 }
 
@@ -3797,6 +3798,13 @@ static inline struct page *f2fs_compress_control_page(struct page *page)
 	WARN_ON_ONCE(1);
 	return ERR_PTR(-EINVAL);
 }
+#define f2fs_cluster_can_merge_page(cc, index)	false
+#define f2fs_read_multi_pages(cc, bio, nr_pages, last, is_ra) 0
+#define f2fs_init_compress_ctx(cc) 0
+#define f2fs_destroy_compress_ctx(cc) (void)0
+#define f2fs_cluster_is_empty(cc) true
+#define f2fs_compress_ctx_add_page(cc, page) (void)0
+#define f2fs_is_compressed_cluster(cc, index) false
 #endif
 
 static inline void set_compress_context(struct inode *inode)
-- 
2.24.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
