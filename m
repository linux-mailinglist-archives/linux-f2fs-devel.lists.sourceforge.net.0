Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDFA4B3599
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Feb 2022 15:20:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nItGc-0000fV-4y; Sat, 12 Feb 2022 14:20:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nItGa-0000fP-Nq
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 12 Feb 2022 14:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HeqdrGnm0ckecvYnB3mnM8a6s+vYyO7cfQve+Jq1/y0=; b=hO3SUAjHplyh3hfK256FvhaWi+
 nTsK5c17/MWSZACPlxAMN9Pu8gFvaBEhPfv8lY6UMLyEoU3YK7arzgM9SfoamJVjB4ZSWhUL4LKN1
 Iyunc7SvMYx5WZIYyObhaFjZNJStahVJpwe5+HLCLd551otR+FXUc5fOCzACs5XgfsHs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HeqdrGnm0ckecvYnB3mnM8a6s+vYyO7cfQve+Jq1/y0=; b=NdejKhaqZDRFJNT8Hgd2jtIK9n
 WiLO8UBwefPuIPWgXthYVaq3lCmEJL2eDaPq4ohPLwKhuFUzKrNn1zpamDgTmkWBiyr9NOaoqsm5V
 FPjpSiHe6qQOkNzdG9tZ2suLsTMEj8cz6P8o6G03I6Q6JjzncNsWGuEeEh30PpvmhNYQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nItGX-0000B0-Ft
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 12 Feb 2022 14:20:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 63C54B80735
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Feb 2022 14:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16247C340E7;
 Sat, 12 Feb 2022 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644675632;
 bh=1dgPwNRkPyDoXtU9nbHyYh+ij4besNeVgyKowSaip78=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LCpjccFTT+CBJzH1APLb+wQzYkHrAgBB7wLSdmsJrEbBqTwh5YDnurH+Ld1zfUIMD
 Qw5+x6OVyyxyuPo3j0PdCS8+Xuux8QD/uMpyEBRUjZ8XIISON1nvfnwDg16raKgFq1
 d1FECOPbknmQMbb6GQHxZVEJn2Mey/99tGV7o1p1Yqnd5rrizmSn+c3nyvlj/NzVnW
 ywEptEeAZnudFleG+Me8BaY9lbcGPAfpaq6nD6ghBfXiclbHDot5PxDwCWofL6SeN6
 J5MlOiexCLHb/kIDDTefbpCC8dVU4uG+Cmo2BJQYbFpeaHWhPkxJANugiReRCT3841
 78iiylRzvtA8Q==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 12 Feb 2022 06:20:23 -0800
Message-Id: <20220212142023.2508247-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
In-Reply-To: <20220212142023.2508247-1-jaegeuk@kernel.org>
References: <20220212142023.2508247-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If one read IO is always failing,
 we can fall into an infinite
 loop in f2fs_sync_dirty_inodes. This happens during xfstests/generic/457.
 [ 142.803335] Buffer I/O error on dev dm-1, logical block 8388592, async
 page read ... [ 382.887210] submit_bio_noacct+0xdd/0x2a0 [ 382.887213]
 submit_bio+0x80/0x110 [ 382.887223] __submit_bio+0x4d/0x [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nItGX-0000B0-Ft
Subject: [f2fs-dev] [PATCH 2/2] f2fs: avoid an infinite loop in
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
f2fs_sync_dirty_inodes. This happens during xfstests/generic/457.

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
 fs/f2fs/checkpoint.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 203a1577942d..756abfdf3628 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1059,13 +1059,13 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type)
 	struct inode *inode;
 	struct f2fs_inode_info *fi;
 	bool is_dir = (type == DIR_INODE);
-	unsigned long ino = 0;
+	unsigned long ino = 0, retry_count = DEFAULT_RETRY_IO_COUNT;
 
 	trace_f2fs_sync_dirty_inodes_enter(sbi->sb, is_dir,
 				get_pages(sbi, is_dir ?
 				F2FS_DIRTY_DENTS : F2FS_DIRTY_DATA));
 retry:
-	if (unlikely(f2fs_cp_error(sbi))) {
+	if (unlikely(f2fs_cp_error(sbi) || !retry_count)) {
 		trace_f2fs_sync_dirty_inodes_exit(sbi->sb, is_dir,
 				get_pages(sbi, is_dir ?
 				F2FS_DIRTY_DENTS : F2FS_DIRTY_DATA));
@@ -1096,10 +1096,12 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type)
 
 		iput(inode);
 		/* We need to give cpu to another writers. */
-		if (ino == cur_ino)
+		if (ino == cur_ino) {
+			retry_count--;
 			cond_resched();
-		else
+		} else {
 			ino = cur_ino;
+		}
 	} else {
 		/*
 		 * We should submit bio, since it exists several
-- 
2.35.1.265.g69c8d7142f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
