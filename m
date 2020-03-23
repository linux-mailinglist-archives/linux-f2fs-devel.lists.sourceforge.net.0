Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5664118FEB6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 21:23:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGTbT-00044k-48; Mon, 23 Mar 2020 20:23:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jGTbM-00043j-PL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 20:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bXxQrgQXQShpPRAImqUo+1g9aMfKRLOEa0QksKyDt0Y=; b=nOnp1XTI1KZgp6lsImE/QMUqZ3
 fiQ9mwmIGd4sU+rgNzP6CLw9e+OSjF8EoQQuDkJbZmY78JTcY2vW6l1HNX1erxEvvW54ixdzO14QI
 E/0iv/9wCS5hbqARfLtXaobgzxxsUfWUP97HyJecMgFjx9n1UGky1tN/hfgZKTheYgTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bXxQrgQXQShpPRAImqUo+1g9aMfKRLOEa0QksKyDt0Y=; b=ZgbUGCFtg2DMGrnTc6I1f7Oj9c
 /062wkRN2LaB3xE/IYtT8iB1L6piuT3eGMyjFV96jMuglxn+X51zNUvJDrpPNxiJkM724AyxN7ljI
 Z4FWWc4UrkkCE4CC5R+XmfxHN0EUBkKVWH096VF1hxpHYPvTGvTbvxQ2BqX0MbiFeacU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGTbL-001Hcm-GY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 20:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=bXxQrgQXQShpPRAImqUo+1g9aMfKRLOEa0QksKyDt0Y=; b=oHsH9YdzinUiaUUGgXwK2Kr9GL
 p+PtJJ8EPGRVd2TmXh2RAWU8KcIl6BG8F3K4XiRiRYeZTjWqe7HUI/1F57Z0JOs1jwNBRr7RJUaQR
 icrqQbRpbxYgjFMYJMyVO+8J8b4CzzyA2f4lKLZVx7cX5keBbfDvBsA+Ued6+PaZ3DqhoFmdNT06f
 h1Ym/0f05LHoJBFsqCOM2UTKLISKOw3QzYahUH7/cuuMI8DEW9lQfcw12+02bYbHrQ9o74U1Ygkxv
 xA3yQERj5GatZXGjy8lydEwyH3VD7kesFvedyAc63bUYksONsPU3qjuvG7X1d0kZXFYGOiagDCpRa
 HiVeG79Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jGTbC-0003Vr-3C; Mon, 23 Mar 2020 20:23:02 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 23 Mar 2020 13:22:55 -0700
Message-Id: <20200323202259.13363-22-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200323202259.13363-1-willy@infradead.org>
References: <20200323202259.13363-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGTbL-001Hcm-GY
Subject: [f2fs-dev] [PATCH v10 21/25] ext4: Pass the inode to
 ext4_mpage_readpages
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
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
 Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This function now only uses the mapping argument to look up the inode,
and both callers already have the inode, so just pass the inode instead
of the mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ext4.h     | 2 +-
 fs/ext4/inode.c    | 4 ++--
 fs/ext4/readpage.c | 3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 95b4bb2cc44c..a9c133e6f786 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3298,7 +3298,7 @@ static inline void ext4_set_de_type(struct super_block *sb,
 }
 
 /* readpages.c */
-extern int ext4_mpage_readpages(struct address_space *mapping,
+extern int ext4_mpage_readpages(struct inode *inode,
 		struct readahead_control *rac, struct page *page);
 extern int __init ext4_init_post_read_processing(void);
 extern void ext4_exit_post_read_processing(void);
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index a867835bca2d..27b35a79f99c 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3226,7 +3226,7 @@ static int ext4_readpage(struct file *file, struct page *page)
 		ret = ext4_readpage_inline(inode, page);
 
 	if (ret == -EAGAIN)
-		return ext4_mpage_readpages(page->mapping, NULL, page);
+		return ext4_mpage_readpages(inode, NULL, page);
 
 	return ret;
 }
@@ -3239,7 +3239,7 @@ static void ext4_readahead(struct readahead_control *rac)
 	if (ext4_has_inline_data(inode))
 		return;
 
-	ext4_mpage_readpages(rac->mapping, rac, NULL);
+	ext4_mpage_readpages(inode, rac, NULL);
 }
 
 static void ext4_invalidatepage(struct page *page, unsigned int offset,
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index 66275f25235d..5761e9961682 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -221,13 +221,12 @@ static inline loff_t ext4_readpage_limit(struct inode *inode)
 	return i_size_read(inode);
 }
 
-int ext4_mpage_readpages(struct address_space *mapping,
+int ext4_mpage_readpages(struct inode *inode,
 		struct readahead_control *rac, struct page *page)
 {
 	struct bio *bio = NULL;
 	sector_t last_block_in_bio = 0;
 
-	struct inode *inode = mapping->host;
 	const unsigned blkbits = inode->i_blkbits;
 	const unsigned blocks_per_page = PAGE_SIZE >> blkbits;
 	const unsigned blocksize = 1 << blkbits;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
