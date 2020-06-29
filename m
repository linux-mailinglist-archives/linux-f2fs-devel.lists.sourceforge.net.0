Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7649920CF53
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2020 17:03:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpvJv-0003ue-KN; Mon, 29 Jun 2020 15:03:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jpvJr-0003u8-47
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 15:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q8x+bY+4f4UHnuB7a7UE3tDKiuJhI3mXD5Qiix8UB/s=; b=aY6xNLL1YGkHiZg3YBroHS9XrV
 nAMaFXiCqL3C4vk92xWvIShJr/jP7hYiGWlnkhLtf690m2BL0o1Q5tqGqRHr3YosxaQz698Q0Ymic
 PxrFgQ+21mRk6KNBqaIXDrCR78mnmDuZnRbJpm9NtiL5GILnbAnOzqnfqNJrzTrw5T9Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q8x+bY+4f4UHnuB7a7UE3tDKiuJhI3mXD5Qiix8UB/s=; b=j6OfOVOIgr0I+2kMQ+qV6U4BAw
 VHfee5Pa2p7c0xMUWHKdnmNTnOLbmxMzbO0WXD3Z+lcSbpQSLn3CEzVmaSohsEvcTdOvAhwZ7ZeUY
 pAflVycwQMllC0aDo9UQLIYm3FpFEW4ebTb+f9WnsGbsHoLw6nEnix7J1+TZc0Z0UTwc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpvJm-0029hw-HZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 15:03:38 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0108C23E53;
 Mon, 29 Jun 2020 15:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593443004;
 bh=raL4d33RBba0Q+Amt7jmBy+/u73rlt5v3RwFSVQIRYY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=qYycy74u4p+VrNz3wJU8piFLUBVQZrNd8YIJ2V5+OiyNijLS+DIk3Tysqkxk+ETl4
 Imz+y6ajfoESV+TsNjb06OCNnyFWo/z8TBbUKFh6pk0xAgy28AyOY5XR0uoNod8Oki
 oeTLGo81shimoB2dCesRITTW2XNk8GK8q1B0rTzY=
Date: Mon, 29 Jun 2020 08:03:23 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Message-ID: <20200629150323.GA3293033@google.com>
References: <20200624012148.180050-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624012148.180050-1-jaegeuk@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jpvJm-0029hw-HZ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid readahead race condition
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

If two readahead threads having same offset enter in readpages, every read
IOs are split and issued to the disk which giving lower bandwidth.

This patch tries to avoid redundant readahead calls.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
v2:
 - add missing code to bypass read

 fs/f2fs/data.c  | 18 +++++++++++++++++-
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/super.c |  2 ++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d6094b9f3916..9b69a159cc6c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2403,6 +2403,7 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 #endif
 	unsigned max_nr_pages = nr_pages;
 	int ret = 0;
+	bool drop_ra = false;
 
 	map.m_pblk = 0;
 	map.m_lblk = 0;
@@ -2413,13 +2414,25 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 	map.m_seg_type = NO_CHECK_TYPE;
 	map.m_may_create = false;
 
+	/*
+	 * Two readahead threads for same address range can cause race condition
+	 * which fragments sequential read IOs. So let's avoid each other.
+	 */
+	if (pages && is_readahead) {
+		page = list_last_entry(pages, struct page, lru);
+		if (F2FS_I(inode)->ra_offset == page_index(page))
+			drop_ra = true;
+		else
+			F2FS_I(inode)->ra_offset = page_index(page);
+	}
+
 	for (; nr_pages; nr_pages--) {
 		if (pages) {
 			page = list_last_entry(pages, struct page, lru);
 
 			prefetchw(&page->flags);
 			list_del(&page->lru);
-			if (add_to_page_cache_lru(page, mapping,
+			if (drop_ra || add_to_page_cache_lru(page, mapping,
 						  page_index(page),
 						  readahead_gfp_mask(mapping)))
 				goto next_page;
@@ -2484,6 +2497,9 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 	BUG_ON(pages && !list_empty(pages));
 	if (bio)
 		__f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
+
+	if (pages && is_readahead && !drop_ra)
+		F2FS_I(inode)->ra_offset = -1;
 	return pages ? 0 : ret;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 35afa13124b8..a95f84d72a55 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -806,6 +806,7 @@ struct f2fs_inode_info {
 	struct list_head inmem_pages;	/* inmemory pages managed by f2fs */
 	struct task_struct *inmem_task;	/* store inmemory task */
 	struct mutex inmem_lock;	/* lock for inmemory pages */
+	pgoff_t ra_offset;		/* ongoing readahead offset */
 	struct extent_tree *extent_tree;	/* cached extent_tree entry */
 
 	/* avoid racing between foreground op and gc */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0e860186a9c5..6fd2ad43d9e4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1011,6 +1011,8 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 	/* Will be used by directory only */
 	fi->i_dir_level = F2FS_SB(sb)->dir_level;
 
+	fi->ra_offset = -1;
+
 	return &fi->vfs_inode;
 }
 
-- 
2.27.0.111.gc72c7da667-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
