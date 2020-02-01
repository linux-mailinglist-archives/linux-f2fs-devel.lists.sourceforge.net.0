Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA33114F830
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Feb 2020 16:09:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ixuOP-0001S3-Sn; Sat, 01 Feb 2020 15:09:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1ixuOM-0001RI-9F
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Feb 2020 15:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Oin9omXum+K1vH3lIpfU4JhSOHeXHB2IvOy+kBmeirY=; b=fF2t/DVR3SYnNAgT5UqXLSHmx/
 hthVAHkCzeZ6tCPSSy9/jCKM+GbX/8br1vDVImR5LUDnrt1eF/6ueXT8MqxKwrd53346tucoldiRy
 yOQrUGmcqYKjdfzSOApIlZrGN9thdiabC22HsDD1JXzTd2Omb4kTYH9te8enWJ0gTid0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Oin9omXum+K1vH3lIpfU4JhSOHeXHB2IvOy+kBmeirY=; b=T
 hEZ97cSVCtUZRMgOxN+fx3zbYi5bwjLxYVdouRqljl/BGN02vknQ8P4OfDNxsITWPuXYs6IOCzq2J
 W0+JJAlbGofkB7xYRuyWAJfDS+b9+c8bQdM/A6lK1jEjfDPHwBZo3pB3MEnYR11+WbVnXeP8zdL/H
 wfWzgMQDBkHuJNQ8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ixuOI-007HiS-Ao
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Feb 2020 15:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Oin9omXum+K1vH3lIpfU4JhSOHeXHB2IvOy+kBmeirY=; b=PpI0y0aBsE6Y602fQ4rH5EZff
 iaqvLOaNDrb0ZLJFmk6+Hr0Qn04JlYzFLXKwGa2kuizi92mOUR/DmJ1+ss0rC2nu9OcHz0GseFKve
 EuvAeX418NwSs4ncInCjGkocnIZQsjHPInqkRdDCIq6Fe1mZ4THnf+YfJ36RIxT/JGMC2driUPaF2
 coau+YuI1FCzeCCyWk3pj/d+pZrx8llnXof2UfSYyyJNwSgrxYWWEK6BFCDhDHDLvZ2cifPT77FX/
 VeuIo8B7GLPFha2ji58aWIwAMzbBUwzeWKjcKWtNqq7HMqQEHw7apEmLHpHv7f4dI6xTOdiMZD/DS
 TS9Jn8spw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ixuNa-0004fn-Ja; Sat, 01 Feb 2020 15:08:14 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Sat,  1 Feb 2020 07:08:07 -0800
Message-Id: <20200201150807.17820-1-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 2.5 URIBL_DBL_ABUSE_MALW   Contains an abused malware URL listed in the
 Spamhaus DBL blocklist [URIs: infradead.org]
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
 -0.9 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ixuOI-007HiS-Ao
Subject: [f2fs-dev] [PATCH] f2fs: Make f2fs_readpages readable again
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Remove the horrendous ifdeffery by slipping an IS_ENABLED into
f2fs_compressed_file().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 6 ------
 fs/f2fs/f2fs.h | 3 ++-
 2 files changed, 2 insertions(+), 7 deletions(-)

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
index 5355be6b6755..398d5a1f2867 100644
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
 
-- 
2.24.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
