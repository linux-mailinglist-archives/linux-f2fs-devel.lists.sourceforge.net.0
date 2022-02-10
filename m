Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D584B0555
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Feb 2022 06:40:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nI2CD-0006mY-ED; Thu, 10 Feb 2022 05:40:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nI2CC-0006mR-Dy
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Feb 2022 05:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9k0SsVBi5QRjY2tRpgnqChbWnvQSjoZJhdb/WspgxzU=; b=EH2hnnDDGpD1gIhMbrTnPuIhCP
 Wq3poEx1KlALsiMFTtM8MtTEgAcuZRFU9cAj26vrO1l/z+Bu3tczHdvpqqY8YfzH1xE+j3bA4p1eh
 1PAcVS8fP8VV7z4Tuz8VRyiQ4tKID/vLh4PxRG+MEa2GSNqvIJl+jgrOCoyipNaoo4YI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9k0SsVBi5QRjY2tRpgnqChbWnvQSjoZJhdb/WspgxzU=; b=MnkC1LopFPQL18pm30IkNET2CB
 N8x9WhTgFhRqixBx+KBh8q7Xdx7b3yEoTWcSr/ITo4dG7uXXz8zDCNbnTaavqW/zWGGMJnU7xgXQl
 xL6ZtGjHFQaXGItIfN701UVDeByhYPw89Tbp6i47QHVkpuRQZsE7mhVv1zchv0yXEDoI=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nI2C9-000709-W7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Feb 2022 05:40:42 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C1113212BF;
 Thu, 10 Feb 2022 05:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644471635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9k0SsVBi5QRjY2tRpgnqChbWnvQSjoZJhdb/WspgxzU=;
 b=Yu5T3oQ4VuYeLO9DPDs3jfXJrNxmMUgbzopf1cNVoy3SV7kPKKVJWSr5QVuBsfWjZhsT/F
 7lHBV1zj4w7ZmfH8+e9OoOGdViZaRInHUF6FSc0EKkh5db0hq6lSHAuSlsXsUXxPhAYRkf
 kIG4OSusUrrjzgs0aDcYoit2ZLXdEKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644471635;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9k0SsVBi5QRjY2tRpgnqChbWnvQSjoZJhdb/WspgxzU=;
 b=Qk19JobDq9MGvjgEG7PbHnu5HR5EccBPnGjg4FLkcetMuh1Upe9CJLl3kCkfWzUSVStBym
 r71qPfjj0bj9e2DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F8CF13519;
 Thu, 10 Feb 2022 05:40:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GpIwO0ulBGJ8OQAAMHmgww
 (envelope-from <neilb@suse.de>); Thu, 10 Feb 2022 05:40:27 +0000
From: NeilBrown <neilb@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>,
 Wu Fengguang <fengguang.wu@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Date: Thu, 10 Feb 2022 16:37:52 +1100
Message-ID: <164447147261.23354.14022902241501698367.stgit@noble.brown>
In-Reply-To: <164447124918.23354.17858831070003318849.stgit@noble.brown>
References: <164447124918.23354.17858831070003318849.stgit@noble.brown>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: inode_congested() reports if the backing-device for the inode
 is congested. No bdi reports congestion any more, so this always returns
 'false'. So remove inode_congested() and related functions, and remove the
 call sites, assuming that inode_congested() always returns 'false'. 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nI2C9-000709-W7
Subject: [f2fs-dev] [PATCH 07/11] Remove inode_congested()
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
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

inode_congested() reports if the backing-device for the inode is
congested.  No bdi reports congestion any more, so this always
returns 'false'.

So remove inode_congested() and related functions, and remove the call
sites, assuming that inode_congested() always returns 'false'.

Signed-off-by: NeilBrown <neilb@suse.de>
---
 fs/fs-writeback.c           |   37 -------------------------------------
 include/linux/backing-dev.h |   22 ----------------------
 mm/fadvise.c                |    5 ++---
 mm/readahead.c              |    6 ------
 mm/vmscan.c                 |   17 +----------------
 5 files changed, 3 insertions(+), 84 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index f8d7fe6db989..42a3dfad40b8 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -893,43 +893,6 @@ void wbc_account_cgroup_owner(struct writeback_control *wbc, struct page *page,
 }
 EXPORT_SYMBOL_GPL(wbc_account_cgroup_owner);
 
-/**
- * inode_congested - test whether an inode is congested
- * @inode: inode to test for congestion (may be NULL)
- * @cong_bits: mask of WB_[a]sync_congested bits to test
- *
- * Tests whether @inode is congested.  @cong_bits is the mask of congestion
- * bits to test and the return value is the mask of set bits.
- *
- * If cgroup writeback is enabled for @inode, the congestion state is
- * determined by whether the cgwb (cgroup bdi_writeback) for the blkcg
- * associated with @inode is congested; otherwise, the root wb's congestion
- * state is used.
- *
- * @inode is allowed to be NULL as this function is often called on
- * mapping->host which is NULL for the swapper space.
- */
-int inode_congested(struct inode *inode, int cong_bits)
-{
-	/*
-	 * Once set, ->i_wb never becomes NULL while the inode is alive.
-	 * Start transaction iff ->i_wb is visible.
-	 */
-	if (inode && inode_to_wb_is_valid(inode)) {
-		struct bdi_writeback *wb;
-		struct wb_lock_cookie lock_cookie = {};
-		bool congested;
-
-		wb = unlocked_inode_to_wb_begin(inode, &lock_cookie);
-		congested = wb_congested(wb, cong_bits);
-		unlocked_inode_to_wb_end(inode, &lock_cookie);
-		return congested;
-	}
-
-	return wb_congested(&inode_to_bdi(inode)->wb, cong_bits);
-}
-EXPORT_SYMBOL_GPL(inode_congested);
-
 /**
  * wb_split_bdi_pages - split nr_pages to write according to bandwidth
  * @wb: target bdi_writeback to split @nr_pages to
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index 483979c1b9f4..860b675c2929 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -162,7 +162,6 @@ struct bdi_writeback *wb_get_create(struct backing_dev_info *bdi,
 				    gfp_t gfp);
 void wb_memcg_offline(struct mem_cgroup *memcg);
 void wb_blkcg_offline(struct blkcg *blkcg);
-int inode_congested(struct inode *inode, int cong_bits);
 
 /**
  * inode_cgwb_enabled - test whether cgroup writeback is enabled on an inode
@@ -390,29 +389,8 @@ static inline void wb_blkcg_offline(struct blkcg *blkcg)
 {
 }
 
-static inline int inode_congested(struct inode *inode, int cong_bits)
-{
-	return wb_congested(&inode_to_bdi(inode)->wb, cong_bits);
-}
-
 #endif	/* CONFIG_CGROUP_WRITEBACK */
 
-static inline int inode_read_congested(struct inode *inode)
-{
-	return inode_congested(inode, 1 << WB_sync_congested);
-}
-
-static inline int inode_write_congested(struct inode *inode)
-{
-	return inode_congested(inode, 1 << WB_async_congested);
-}
-
-static inline int inode_rw_congested(struct inode *inode)
-{
-	return inode_congested(inode, (1 << WB_sync_congested) |
-				      (1 << WB_async_congested));
-}
-
 static inline int bdi_congested(struct backing_dev_info *bdi, int cong_bits)
 {
 	return wb_congested(&bdi->wb, cong_bits);
diff --git a/mm/fadvise.c b/mm/fadvise.c
index d6baa4f451c5..338f16022012 100644
--- a/mm/fadvise.c
+++ b/mm/fadvise.c
@@ -109,9 +109,8 @@ int generic_fadvise(struct file *file, loff_t offset, loff_t len, int advice)
 	case POSIX_FADV_NOREUSE:
 		break;
 	case POSIX_FADV_DONTNEED:
-		if (!inode_write_congested(mapping->host))
-			__filemap_fdatawrite_range(mapping, offset, endbyte,
-						   WB_SYNC_NONE);
+		__filemap_fdatawrite_range(mapping, offset, endbyte,
+					   WB_SYNC_NONE);
 
 		/*
 		 * First and last FULL page! Partial pages are deliberately
diff --git a/mm/readahead.c b/mm/readahead.c
index 35a7ebfcb504..31127d5f909f 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -709,12 +709,6 @@ void page_cache_async_ra(struct readahead_control *ractl,
 
 	folio_clear_readahead(folio);
 
-	/*
-	 * Defer asynchronous read-ahead on IO congestion.
-	 */
-	if (inode_read_congested(ractl->mapping->host))
-		return;
-
 	if (blk_cgroup_congested())
 		return;
 
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 090bfb605ecf..ce8492939bd3 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -989,17 +989,6 @@ static inline int is_page_cache_freeable(struct page *page)
 	return page_count(page) - page_has_private(page) == 1 + page_cache_pins;
 }
 
-static int may_write_to_inode(struct inode *inode)
-{
-	if (current->flags & PF_SWAPWRITE)
-		return 1;
-	if (!inode_write_congested(inode))
-		return 1;
-	if (inode_to_bdi(inode) == current->backing_dev_info)
-		return 1;
-	return 0;
-}
-
 /*
  * We detected a synchronous write error writing a page out.  Probably
  * -ENOSPC.  We need to propagate that into the address_space for a subsequent
@@ -1199,8 +1188,6 @@ static pageout_t pageout(struct page *page, struct address_space *mapping)
 	}
 	if (mapping->a_ops->writepage == NULL)
 		return PAGE_ACTIVATE;
-	if (!may_write_to_inode(mapping->host))
-		return PAGE_KEEP;
 
 	if (clear_page_dirty_for_io(page)) {
 		int res;
@@ -1576,9 +1563,7 @@ static unsigned int shrink_page_list(struct list_head *page_list,
 		 * end of the LRU a second time.
 		 */
 		mapping = page_mapping(page);
-		if (((dirty || writeback) && mapping &&
-		     inode_write_congested(mapping->host)) ||
-		    (writeback && PageReclaim(page)))
+		if (writeback && PageReclaim(page))
 			stat->nr_congested++;
 
 		/*




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
