Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2674CCBA8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Mar 2022 03:20:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPxYG-0003HN-7K; Fri, 04 Mar 2022 02:20:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nPxYD-0003Du-6F
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 02:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xpULDS99dp6LcrhODHXbMl28y8oj7IUMYYBVtn0D7h0=; b=BTLo8m8KbSQ5HSOhzhGgr3wQjr
 teabKhr6lYr4HrkbXR3xpLitg/UWZHjG04+iOtMkvO5rsS4znbjWUaLcdJA8bGsD5zi8xUVjdmeSo
 3pTFrmVUYA46OUWlM+GoWB26zRc/9GyhGka4rxOXkMsGXDMco16ZkRv9pZDw8p8j87nI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xpULDS99dp6LcrhODHXbMl28y8oj7IUMYYBVtn0D7h0=; b=h
 WxCIjEnLb7jl/8WfBXMB1QjdEAmXKt++tGhg3WMTn1DQYI8CXrNNBlkKfhgtM4zsx9vtdxgG+HcfU
 9IQ4EBLeJ7RB3zjBwaqqSnWhJ+vVvzlk/B/gZwwAb7a9MeOD4QPJJj2P6Fh0aioEA4iR1we4nvtce
 8VZrYRT8yVP1lwkg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nPxYA-00077e-VU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 02:20:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF2DAB82671
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Mar 2022 02:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954FBC340E9;
 Fri,  4 Mar 2022 02:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646360398;
 bh=+K4HyZ3cdG7e3Iua5G4TDQLJZxt25ZPQtp0tzpcxw34=;
 h=From:To:Cc:Subject:Date:From;
 b=ANsvXB3CPCBPSnzh6ym2HggLY5upXtRglk60r5GM1bhdL2nTcLmRmAODUJ+jrk8cx
 OQlOjLkJX8mXnq00jMEu4cYAD6jN2dU/Co9mxtNNeZaIo3sd1IwkWueVSWDrJ63Enk
 BHzleBp/r9jXjytCmmYQqcmSZskPHjpsocuXLivOeQiiyelG4mNzdVpMtFU/tsME0W
 7anik83iIst2Js32KYa9ma4xD6qvWwSP9fVf/I+fGEBYTbqilp8OeeJOhzHTqufQtD
 wItuukn3M25ZpO2H49KyaI0zvAhf5Q2Yt0WQsw/zeDrSugXhRXWXIVqxFJmuWHnDs3
 4DQnb/+KXa8Iw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  3 Mar 2022 18:19:54 -0800
Message-Id: <20220304021955.2524246-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If one read IO is always failing,
 we can fall into an infinite
 loop in f2fs_sync_dirty_inodes. This happens during xfstests/generic/475.
 [ 142.803335] Buffer I/O error on dev dm-1, logical block 8388592, async
 page read ... [ 382.887210] submit_bio_noacct+0xdd/0x2a0 [ 382.887213]
 submit_bio+0x80/0x110 [ 382.887223] __submit_bio+0x4d/0x [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nPxYA-00077e-VU
Subject: [f2fs-dev] [PATCH 1/2] f2fs: avoid an infinite loop in
 f2fs_sync_dirty_inodes
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If one read IO is always failing, we can fall into an infinite loop in
f2fs_sync_dirty_inodes. This happens during xfstests/generic/475.

[  142.803335] Buffer I/O error on dev dm-1, logical block 8388592, async page read
...
[  382.887210]  submit_bio_noacct+0xdd/0x2a0
[  382.887213]  submit_bio+0x80/0x110
[  382.887223]  __submit_bio+0x4d/0x300 [f2fs]
[  382.887282]  f2fs_submit_page_bio+0x125/0x200 [f2fs]
[  382.887299]  __get_meta_page+0xc9/0x280 [f2fs]
[  382.887315]  f2fs_get_meta_page+0x13/0x20 [f2fs]
[  382.887331]  f2fs_get_node_info+0x317/0x3c0 [f2fs]
[  382.887350]  f2fs_do_write_data_page+0x327/0x6f0 [f2fs]
[  382.887367]  f2fs_write_single_data_page+0x5b7/0x960 [f2fs]
[  382.887386]  f2fs_write_cache_pages+0x302/0x890 [f2fs]
[  382.887405]  ? preempt_count_add+0x7a/0xc0
[  382.887408]  f2fs_write_data_pages+0xfd/0x320 [f2fs]
[  382.887425]  ? _raw_spin_unlock+0x1a/0x30
[  382.887428]  do_writepages+0xd3/0x1d0
[  382.887432]  filemap_fdatawrite_wbc+0x69/0x90
[  382.887434]  filemap_fdatawrite+0x50/0x70
[  382.887437]  f2fs_sync_dirty_inodes+0xa4/0x270 [f2fs]
[  382.887453]  f2fs_write_checkpoint+0x189/0x1640 [f2fs]
[  382.887469]  ? schedule_timeout+0x114/0x150
[  382.887471]  ? ttwu_do_activate+0x6d/0xb0
[  382.887473]  ? preempt_count_add+0x7a/0xc0
[  382.887476]  kill_f2fs_super+0xca/0x100 [f2fs]
[  382.887491]  deactivate_locked_super+0x35/0xa0
[  382.887494]  deactivate_super+0x40/0x50
[  382.887497]  cleanup_mnt+0x139/0x190
[  382.887499]  __cleanup_mnt+0x12/0x20
[  382.887501]  task_work_run+0x64/0xa0
[  382.887505]  exit_to_user_mode_prepare+0x1b7/0x1c0
[  382.887508]  syscall_exit_to_user_mode+0x27/0x50
[  382.887510]  do_syscall_64+0x48/0xc0
[  382.887513]  entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c | 7 +++++++
 fs/f2fs/f2fs.h       | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 203a1577942d..871eee35a32f 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -98,6 +98,13 @@ static struct page *__get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index,
 	}
 
 	if (unlikely(!PageUptodate(page))) {
+		if (page->index == sbi->metapage_eio_ofs &&
+			sbi->metapage_eio_cnt++ == MAX_RETRY_META_PAGE_EIO) {
+			set_ckpt_flags(sbi, CP_ERROR_FLAG);
+		} else {
+			sbi->metapage_eio_ofs = page->index;
+			sbi->metapage_eio_cnt = 0;
+		}
 		f2fs_put_page(page, 1);
 		return ERR_PTR(-EIO);
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 47bf9e30913f..efc4f1fe2ffd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -577,6 +577,9 @@ enum {
 /* maximum retry quota flush count */
 #define DEFAULT_RETRY_QUOTA_FLUSH_COUNT		8
 
+/* maximum retry of EIO'ed meta page */
+#define MAX_RETRY_META_PAGE_EIO			100
+
 #define F2FS_LINK_MAX	0xffffffff	/* maximum link count per file */
 
 #define MAX_DIR_RA_PAGES	4	/* maximum ra pages of dir */
@@ -1614,6 +1617,8 @@ struct f2fs_sb_info {
 	/* keep migration IO order for LFS mode */
 	struct f2fs_rwsem io_order_lock;
 	mempool_t *write_io_dummy;		/* Dummy pages */
+	pgoff_t metapage_eio_ofs;		/* EIO page offset */
+	int metapage_eio_cnt;			/* EIO count */
 
 	/* for checkpoint */
 	struct f2fs_checkpoint *ckpt;		/* raw checkpoint pointer */
-- 
2.35.1.616.g0bdcbb4464-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
