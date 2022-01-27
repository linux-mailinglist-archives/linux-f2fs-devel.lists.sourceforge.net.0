Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D449D83E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jan 2022 03:47:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nCuox-0002Wo-Mn; Thu, 27 Jan 2022 02:47:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nCuow-0002Wg-MS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 02:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jI/D3cF7XEXdB5GQX4lb6Wy9m6GRhCmmHGkuQyOPpFQ=; b=IV/AMLwT5qG9gHuAA6GgPVV6v3
 KDcmkpGeREa/h8XpnuCLUF1rFshsiTuRDzGsxA/QywbxZSNdw34DvIzjso0k4abPhcFPUgh7HbH2R
 5/42CjjykVaqofbIBFl7nwBSHkCGeWwMYDxd1+343rRFVCi6XfCsshl50G1cHH1HvTgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jI/D3cF7XEXdB5GQX4lb6Wy9m6GRhCmmHGkuQyOPpFQ=; b=iqelsuNbkN3EsDXW1VGjIaN51o
 TGMoH3pSMW0XGgUGAp77xepVqAqnjma+Tkwh8XAMEGsZ912Mft9zRr1l/G/YhqdU2voHuDUJdWPdk
 v2sKxj9+SNJ7xNoP4zMJFb6dMu0LTJvF+5cIJXeqqhTabxR9c8yV416IB6BeK6k7kfxU=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1nCuot-0007at-NI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 02:47:33 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5274B1F37C;
 Thu, 27 Jan 2022 02:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643251645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jI/D3cF7XEXdB5GQX4lb6Wy9m6GRhCmmHGkuQyOPpFQ=;
 b=VX2TuVX3kVXj7I3yebeDc8tJhqUeKFahw7htyoPYO3KgwI8voUPLoTgzRNx/JSiLVhU/pI
 PPvM89l8O0cQ8t5Y4EbvjYgRiyI3ZXJtDxQdExlie++bqkCqSIOkOOHkYuKsMFnZN7za32
 IJBB7rIe80iXXaofxAvQKJAQL19xGqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643251645;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jI/D3cF7XEXdB5GQX4lb6Wy9m6GRhCmmHGkuQyOPpFQ=;
 b=5aAhOmFiE7Zr4YHy1hjvEWZl9gGAb4CzbdFGOZ1ijWoIeTfN0EVmBsbDU+SJDeHhSv2Nsh
 D2DZQVwETY1/jVCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5FBA13E46;
 Thu, 27 Jan 2022 02:47:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Khj7ILYH8mG/KwAAMHmgww
 (envelope-from <neilb@suse.de>); Thu, 27 Jan 2022 02:47:18 +0000
From: NeilBrown <neilb@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Jan 2022 13:46:29 +1100
Message-ID: <164325158955.29787.4769373293473421057.stgit@noble.brown>
In-Reply-To: <164325106958.29787.4865219843242892726.stgit@noble.brown>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  These functions are no longer useful as the only bdis that
 report congestion are in ceph, fuse, and nfs. None of those bdis can be the
 target of the calls in drbd, ext2, nilfs2,
 or xfs. Removing the test on bdi_write_contested()
 in current_may_throttle() could cause a small change in behaviour, but only
 when PF_LOCAL_THROTTLE is set. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nCuot-0007at-NI
Subject: [f2fs-dev] [PATCH 2/9] Remove bdi_congested() and wb_congested()
 and related functions
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

These functions are no longer useful as the only bdis that report
congestion are in ceph, fuse, and nfs.  None of those bdis can be the
target of the calls in drbd, ext2, nilfs2, or xfs.

Removing the test on bdi_write_contested() in current_may_throttle()
could cause a small change in behaviour, but only when PF_LOCAL_THROTTLE
is set.

So replace the calls by 'false' and simplify the code - and remove the
functions.

Signed-off-by: NeilBrown <neilb@suse.de>
---
 drivers/block/drbd/drbd_int.h |    3 ---
 drivers/block/drbd/drbd_req.c |    3 +--
 fs/ext2/ialloc.c              |    2 --
 fs/nilfs2/segbuf.c            |   11 -----------
 fs/xfs/xfs_buf.c              |    3 ---
 include/linux/backing-dev.h   |   26 --------------------------
 mm/vmscan.c                   |    4 +---
 7 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index f27d5b0f9a0b..f804b1bfb3e6 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -638,9 +638,6 @@ enum {
 	STATE_SENT,		/* Do not change state/UUIDs while this is set */
 	CALLBACK_PENDING,	/* Whether we have a call_usermodehelper(, UMH_WAIT_PROC)
 				 * pending, from drbd worker context.
-				 * If set, bdi_write_congested() returns true,
-				 * so shrink_page_list() would not recurse into,
-				 * and potentially deadlock on, this drbd worker.
 				 */
 	DISCONNECT_SENT,
 
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 3235532ae077..2e5fb7e442e3 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -909,8 +909,7 @@ static bool remote_due_to_read_balancing(struct drbd_device *device, sector_t se
 
 	switch (rbm) {
 	case RB_CONGESTED_REMOTE:
-		return bdi_read_congested(
-			device->ldev->backing_bdev->bd_disk->bdi);
+		return 0;
 	case RB_LEAST_PENDING:
 		return atomic_read(&device->local_cnt) >
 			atomic_read(&device->ap_pending_cnt) + atomic_read(&device->rs_pending_cnt);
diff --git a/fs/ext2/ialloc.c b/fs/ext2/ialloc.c
index df14e750e9fe..d632764da240 100644
--- a/fs/ext2/ialloc.c
+++ b/fs/ext2/ialloc.c
@@ -173,8 +173,6 @@ static void ext2_preread_inode(struct inode *inode)
 	struct backing_dev_info *bdi;
 
 	bdi = inode_to_bdi(inode);
-	if (bdi_rw_congested(bdi))
-		return;
 
 	block_group = (inode->i_ino - 1) / EXT2_INODES_PER_GROUP(inode->i_sb);
 	gdp = ext2_get_group_desc(inode->i_sb, block_group, NULL);
diff --git a/fs/nilfs2/segbuf.c b/fs/nilfs2/segbuf.c
index 43287b0d3e9b..d1ebc9da7130 100644
--- a/fs/nilfs2/segbuf.c
+++ b/fs/nilfs2/segbuf.c
@@ -343,17 +343,6 @@ static int nilfs_segbuf_submit_bio(struct nilfs_segment_buffer *segbuf,
 	struct bio *bio = wi->bio;
 	int err;
 
-	if (segbuf->sb_nbio > 0 &&
-	    bdi_write_congested(segbuf->sb_super->s_bdi)) {
-		wait_for_completion(&segbuf->sb_bio_event);
-		segbuf->sb_nbio--;
-		if (unlikely(atomic_read(&segbuf->sb_err))) {
-			bio_put(bio);
-			err = -EIO;
-			goto failed;
-		}
-	}
-
 	bio->bi_end_io = nilfs_end_bio_write;
 	bio->bi_private = segbuf;
 	bio_set_op_attrs(bio, mode, mode_flags);
diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index b45e0d50a405..b7ebcfe6b8d3 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -843,9 +843,6 @@ xfs_buf_readahead_map(
 {
 	struct xfs_buf		*bp;
 
-	if (bdi_read_congested(target->bt_bdev->bd_disk->bdi))
-		return;
-
 	xfs_buf_read_map(target, map, nmaps,
 		     XBF_TRYLOCK | XBF_ASYNC | XBF_READ_AHEAD, &bp, ops,
 		     __this_address);
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index 860b675c2929..2d764566280c 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -135,11 +135,6 @@ static inline bool writeback_in_progress(struct bdi_writeback *wb)
 
 struct backing_dev_info *inode_to_bdi(struct inode *inode);
 
-static inline int wb_congested(struct bdi_writeback *wb, int cong_bits)
-{
-	return wb->congested & cong_bits;
-}
-
 long congestion_wait(int sync, long timeout);
 
 static inline bool mapping_can_writeback(struct address_space *mapping)
@@ -391,27 +386,6 @@ static inline void wb_blkcg_offline(struct blkcg *blkcg)
 
 #endif	/* CONFIG_CGROUP_WRITEBACK */
 
-static inline int bdi_congested(struct backing_dev_info *bdi, int cong_bits)
-{
-	return wb_congested(&bdi->wb, cong_bits);
-}
-
-static inline int bdi_read_congested(struct backing_dev_info *bdi)
-{
-	return bdi_congested(bdi, 1 << WB_sync_congested);
-}
-
-static inline int bdi_write_congested(struct backing_dev_info *bdi)
-{
-	return bdi_congested(bdi, 1 << WB_async_congested);
-}
-
-static inline int bdi_rw_congested(struct backing_dev_info *bdi)
-{
-	return bdi_congested(bdi, (1 << WB_sync_congested) |
-				  (1 << WB_async_congested));
-}
-
 const char *bdi_dev_name(struct backing_dev_info *bdi);
 
 #endif	/* _LINUX_BACKING_DEV_H */
diff --git a/mm/vmscan.c b/mm/vmscan.c
index ce8492939bd3..0b930556c4f2 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2362,9 +2362,7 @@ static unsigned int move_pages_to_lru(struct lruvec *lruvec,
  */
 static int current_may_throttle(void)
 {
-	return !(current->flags & PF_LOCAL_THROTTLE) ||
-		current->backing_dev_info == NULL ||
-		bdi_write_congested(current->backing_dev_info);
+	return !(current->flags & PF_LOCAL_THROTTLE);
 }
 
 /*




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
