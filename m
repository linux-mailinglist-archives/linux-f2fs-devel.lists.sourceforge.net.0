Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oa+6A9C8AmrVwAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 07:38:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 963FD51A3B3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 07:38:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/8ajglqh03Qt09z20g5r0kK3UNCnp2ihv/Hnci8WiY=; b=ITXATuVomtaP3yH0NxQ+lh8rDM
	JoCxPG0tsHs0Ny1vYDh8TY0II8TtqmrKd+jq2+NCA7Mnl6pmsqnLZUkHfodyrIO8heUqCrIPZPA93
	mLoAhLTojyUJ5WG+zW4loGko3SBc6X8SCaxdS/zPN1Bo47DFRg4gtPYSPQeYFGd8Ieck=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMfox-000354-8L;
	Tue, 12 May 2026 05:38:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+9f3c1ea353498f61ccd0+8297+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wMfob-000344-41 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 05:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eRHWR+K+rwN4V/M9eakcsPNW+L+2qccDSG2y2mqtyrE=; b=PCpxOG45yjv8f79+EJxSpa8L/p
 b7pCKe3R7maMvpIQ3Kes6hL2TXGZGAzC7n7H1kCQqK5YqZ2Z3g/TJlJIVUCaJ+xt5K4o/DuDg6CRF
 KvrqbclmSvycseI05JUa9zjjtdlp6yTKQzbQAlKq7kendSAIHvm5p3fkKByqoT4GEpIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eRHWR+K+rwN4V/M9eakcsPNW+L+2qccDSG2y2mqtyrE=; b=V5wxDtcRm8/zkNqSK/DnSLLbod
 3pm+fX9X9mjVMkbTreb8RWNGJENgeY5l/JxItgnMUK9UvKdGmIFgO3xD3Zn6Zic7eNuaMrP9WlZU1
 3ytjkg3Yo1HIz/UePAFcc4BSY+1I7cOCwET+kMHFbbqcQMOvYsIiZXiKggiWTmuMOvJM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMfoa-0004rX-G2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 05:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=eRHWR+K+rwN4V/M9eakcsPNW+L+2qccDSG2y2mqtyrE=; b=U3yVR38y20oSPNvU/6cEBkABNB
 wdZkG15EogD5OQ4H+wpPaAyqYsbYjSVEBbzMXdavthfcH44BYKxDetZp1Lul2LwEeaTPGkQNIWAhz
 NBcdFUD8ehpNAhIdSczIhrprRMY3jf02fFJabXW6s/JHKLCHMGKbVvbMxBBFnhWoS9n8rORJ4iRzQ
 +lsR26GKXcZJifHIZ6NvbOeReOe6U8/+9c25F4A2drxqL2IENmV6QvGTi9fd1EeJxfsFO6iHzd7SV
 eBRSw4EY0CkD4sBuF7Z07bLDqQbpHYiIU1Do/2mfGJNgXA7NSS2spLMbPIbCcXddV1mzgteZfAkFy
 zL77KOgw==;
Received: from
 2a02-8389-2341-5b80-decc-1a96-daaa-a2cc.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:decc:1a96:daaa:a2cc] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wMfoL-0000000FfRP-2kNh; Tue, 12 May 2026 05:37:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>
Date: Tue, 12 May 2026 07:35:25 +0200
Message-ID: <20260512053625.2950900-10-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512053625.2950900-1-hch@lst.de>
References: <20260512053625.2950900-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Only the file operation method knows what block device we'll
 swap to. So move down setting sis->bdev and the special blockdev flag into
 ->swap_activate. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 block/fops.c
 | 9 ++++++++- fs/btrfs/inode.c | 7 ++++--- fs/f2fs/data.c | 3 ++-
 fs/iomap/swapfile.c
 | 7 ++----- fs/nfs/file.c | 2 +- fs/smb/client/file [...] 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1wMfoa-0004rX-G2
Subject: [f2fs-dev] [PATCH 09/12] swap: push down setting sis->bdev into
 ->swap_activate
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
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 "Darrick J . Wong " <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, linux-mm@kvack.org,
 Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Trond Myklebust <trondmy@kernel.org>,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 963FD51A3B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-cifs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:trondmy@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,mit.edu,lists.sourceforge.net,samba.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lst.de:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

Only the file operation method knows what block device we'll swap
to.  So move down setting sis->bdev and the special blockdev flag
into ->swap_activate.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/fops.c         |  9 ++++++++-
 fs/btrfs/inode.c     |  7 ++++---
 fs/f2fs/data.c       |  3 ++-
 fs/iomap/swapfile.c  |  7 ++-----
 fs/nfs/file.c        |  2 +-
 fs/smb/client/file.c |  2 +-
 fs/xfs/xfs_file.c    |  6 ------
 include/linux/swap.h |  4 ++--
 mm/page_io.c         |  3 +--
 mm/swapfile.c        | 38 ++++++++++++--------------------------
 10 files changed, 33 insertions(+), 48 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index 067e46299666..da09ce3f072f 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -951,9 +951,16 @@ static int blkdev_mmap_prepare(struct vm_area_desc *desc)
 
 static int blkdev_swap_activate(struct file *file, struct swap_info_struct *sis)
 {
+	struct block_device *bdev = I_BDEV(file->f_mapping->host);
 	loff_t isize = i_size_read(bdev_file_inode(file));
 
-	return add_swap_extent(sis, div_u64(isize, PAGE_SIZE), 0);
+	/*
+	 * The swap code performs arbitrary overwrites, which are not supported
+	 * on zones with sequential write constraints.
+	 */
+	if (bdev_is_zoned(bdev))
+		return -EINVAL;
+	return add_swap_extent(sis, div_u64(isize, PAGE_SIZE), bdev, 0);
 }
 
 const struct file_operations def_blk_fops = {
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index ee0a7947706a..84003c520530 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -10201,6 +10201,7 @@ static void btrfs_free_swapfile_pins(struct inode *inode)
 }
 
 struct btrfs_swap_info {
+	struct btrfs_device *device;
 	u64 start;
 	u64 block_start;
 	u64 block_len;
@@ -10214,7 +10215,8 @@ static int btrfs_add_swap_extent(struct swap_info_struct *sis,
 	first_ppage = PAGE_ALIGN(bsi->block_start) >> PAGE_SHIFT;
 	next_ppage = PAGE_ALIGN_DOWN(bsi->block_start + bsi->block_len) >> PAGE_SHIFT;
 
-	return add_swap_extent(sis, next_ppage - first_ppage, first_ppage);
+	return add_swap_extent(sis, next_ppage - first_ppage, bsi->device->bdev,
+			first_ppage);
 }
 
 void btrfs_swap_deactivate(struct file *file)
@@ -10503,6 +10505,7 @@ int btrfs_swap_activate(struct file *file, struct swap_info_struct *sis)
 			bsi.start = key.offset;
 			bsi.block_start = physical_block_start;
 			bsi.block_len = len;
+			bsi.device = device;
 		}
 
 		if (fatal_signal_pending(current)) {
@@ -10533,8 +10536,6 @@ int btrfs_swap_activate(struct file *file, struct swap_info_struct *sis)
 	up_write(&BTRFS_I(inode)->i_mmap_lock);
 	btrfs_free_backref_share_ctx(backref_ctx);
 	btrfs_free_path(path);
-	if (!ret && device)
-		sis->bdev = device->bdev;
 	return ret;
 }
 #endif
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8bcf630df557..8d116ff517c9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4326,7 +4326,8 @@ static int check_swap_activate(struct swap_info_struct *sis,
 		/*
 		 * We found a PAGE_SIZE-length, PAGE_SIZE-aligned run of blocks
 		 */
-		ret = add_swap_extent(sis, nr_pblocks, pblock);
+		ret = add_swap_extent(sis, nr_pblocks, inode->i_sb->s_bdev,
+				pblock);
 		if (ret < 0)
 			goto out;
 		cur_lblock += nr_pblocks;
diff --git a/fs/iomap/swapfile.c b/fs/iomap/swapfile.c
index a4e0ca462cc4..862b4c02a8bd 100644
--- a/fs/iomap/swapfile.c
+++ b/fs/iomap/swapfile.c
@@ -50,10 +50,6 @@ static int iomap_swapfile_iter(struct iomap_iter *iter, struct file *file,
 	if (iomap->flags & IOMAP_F_SHARED)
 		return iomap_swapfile_fail(file, "has shared extents");
 
-	/* Only one bdev per swap file. */
-	if (iomap->bdev != sis->bdev)
-		return iomap_swapfile_fail(file, "outside the main device");
-
 	/*
 	 * Round the start up and the end down so that the physical extent
 	 * aligns to a page boundary.
@@ -61,7 +57,8 @@ static int iomap_swapfile_iter(struct iomap_iter *iter, struct file *file,
 	first_ppage = ALIGN(iomap->addr, PAGE_SIZE) >> PAGE_SHIFT;
 	next_ppage = ALIGN_DOWN(iomap->addr + iomap->length, PAGE_SIZE) >>
 			PAGE_SHIFT;
-	error = add_swap_extent(sis, next_ppage - first_ppage, first_ppage);
+	error = add_swap_extent(sis, next_ppage - first_ppage, iomap->bdev,
+			first_ppage);
 	if (error)
 		return error;
 	return iomap_iter_advance_full(iter);
diff --git a/fs/nfs/file.c b/fs/nfs/file.c
index 2bc55d9d71e1..10ab2a923835 100644
--- a/fs/nfs/file.c
+++ b/fs/nfs/file.c
@@ -588,7 +588,7 @@ int nfs_swap_activate(struct file *file, struct swap_info_struct *sis)
 	ret = rpc_clnt_swap_activate(clnt);
 	if (ret)
 		return ret;
-	ret = add_swap_extent(sis, sis->max, 0);
+	ret = add_swap_extent(sis, sis->max, NULL, 0);
 	if (ret < 0) {
 		rpc_clnt_swap_deactivate(clnt);
 		return ret;
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index 84459f87907e..e1bbc65ce7f3 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -3327,7 +3327,7 @@ int cifs_swap_activate(struct file *swap_file, struct swap_info_struct *sis)
 	 */
 
 	sis->flags |= SWP_FS_OPS;
-	return add_swap_extent(sis, sis->max, 0);
+	return add_swap_extent(sis, sis->max, NULL, 0);
 }
 
 void cifs_swap_deactivate(struct file *file)
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 41f7e19bd31f..74128ebf7161 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -2116,12 +2116,6 @@ xfs_file_swap_activate(
 	 */
 	xfs_inodegc_flush(ip->i_mount);
 
-	/*
-	 * Direct the swap code to the correct block device when this file
-	 * sits on the RT device.
-	 */
-	sis->bdev = xfs_inode_buftarg(ip)->bt_bdev;
-
 	return iomap_swap_activate(file, sis, &xfs_read_iomap_ops);
 }
 
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 657779485ae4..b1cbb67ddd8e 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -404,7 +404,7 @@ extern void __meminit kswapd_stop(int nid);
 #ifdef CONFIG_SWAP
 
 int add_swap_extent(struct swap_info_struct *sis, unsigned long nr_pages,
-		sector_t start_block);
+		struct block_device *bdev, sector_t start_block);
 int generic_swap_activate(struct file *swap_file, struct swap_info_struct *sis);
 
 static inline unsigned long total_swapcache_pages(void)
@@ -528,7 +528,7 @@ static inline bool folio_free_swap(struct folio *folio)
 
 static inline int add_swap_extent(struct swap_info_struct *sis,
 		unsigned long start_page, unsigned long nr_pages,
-		sector_t start_block)
+		struct block_device *bdev, sector_t start_block)
 {
 	return -EINVAL;
 }
diff --git a/mm/page_io.c b/mm/page_io.c
index 3e1c12649448..2ab8994ed1c2 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -132,7 +132,7 @@ int generic_swap_activate(struct file *swap_file, struct swap_info_struct *sis)
 		/*
 		 * We found a PAGE_SIZE-length, PAGE_SIZE-aligned run of blocks
 		 */
-		ret = add_swap_extent(sis, 1,
+		ret = add_swap_extent(sis, 1, inode->i_sb->s_bdev,
 				first_block >> (PAGE_SHIFT - blkbits));
 		if (ret < 0)
 			return ret;
@@ -141,7 +141,6 @@ int generic_swap_activate(struct file *swap_file, struct swap_info_struct *sis)
 		continue;
 	}
 	return 0;
-
 bad_bmap:
 	pr_err("swapon: swapfile has holes\n");
 	return -EINVAL;
diff --git a/mm/swapfile.c b/mm/swapfile.c
index fbf11c8c5c69..2c9d2af736c4 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2707,7 +2707,7 @@ static void destroy_swap_extents(struct swap_info_struct *sis,
  */
 int
 add_swap_extent(struct swap_info_struct *sis, unsigned long nr_pages,
-		sector_t start_block)
+		struct block_device *bdev, sector_t start_block)
 {
 	struct rb_node **link = &sis->swap_extent_root.rb_node, *parent = NULL;
 	struct swap_extent *se;
@@ -2718,6 +2718,12 @@ add_swap_extent(struct swap_info_struct *sis, unsigned long nr_pages,
 		return 0;
 	nr_pages = min(nr_pages, sis->max - sis->pages);
 
+	/* Only one bdev per swap file for now. */
+	if (!sis->bdev)
+		sis->bdev = bdev;
+	else if (bdev != sis->bdev)
+		return -EINVAL;
+
 	/*
 	 * place the new node at the right most since the
 	 * function is called in ascending page order.
@@ -2793,6 +2799,8 @@ static int setup_swap_extents(struct swap_info_struct *sis,
 	sis->flags |= SWP_ACTIVATED;
 	if (sis->flags & SWP_FS_OPS)
 		error = sio_pool_init();
+	else if (WARN_ON_ONCE(!sis->bdev))
+		error = -EINVAL;
 	if (error)
 		destroy_swap_extents(sis, swap_file);
 	return error;
@@ -3224,26 +3232,6 @@ static struct swap_info_struct *alloc_swap_info(void)
 	return p;
 }
 
-static int claim_swapfile(struct swap_info_struct *si, struct inode *inode)
-{
-	if (S_ISBLK(inode->i_mode)) {
-		si->bdev = I_BDEV(inode);
-		/*
-		 * Zoned block devices contain zones that have a sequential
-		 * write only restriction.  Hence zoned block devices are not
-		 * suitable for swapping.  Disallow them here.
-		 */
-		if (bdev_is_zoned(si->bdev))
-			return -EINVAL;
-		si->flags |= SWP_BLKDEV;
-	} else if (S_ISREG(inode->i_mode)) {
-		si->bdev = inode->i_sb->s_bdev;
-	}
-
-	return 0;
-}
-
-
 /*
  * Find out how many pages are allowed for a single swap device. There
  * are two limiting factors:
@@ -3500,16 +3488,14 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	dentry = swap_file->f_path.dentry;
 	inode = mapping->host;
 
-	error = claim_swapfile(si, inode);
-	if (unlikely(error))
-		goto bad_swap;
-
 	inode_lock(inode);
 	if (d_unlinked(dentry) || cant_mount(dentry)) {
 		error = -ENOENT;
 		goto bad_swap_unlock_inode;
 	}
-	if (!S_ISBLK(inode->i_mode) && !S_ISREG(inode->i_mode)) {
+	if (S_ISBLK(inode->i_mode)) {
+		si->flags |= SWP_BLKDEV;
+	} else if (!S_ISREG(inode->i_mode)) {
 		error = -EINVAL;
 		goto bad_swap_unlock_inode;
 	}
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
