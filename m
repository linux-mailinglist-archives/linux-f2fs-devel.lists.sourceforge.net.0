Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A851B4A95C7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Feb 2022 10:10:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nFubo-0000zN-Lp; Fri, 04 Feb 2022 09:10:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nFubm-0000zG-D9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Feb 2022 09:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2r7rBA6cLE/LOayn17wccFuuRsJss8BPtmJcgffPGEQ=; b=CoF9QfvuL3V1Im6Hr1V7+mBYfX
 DaNNI0PuRKoSFKcAn+lOBEEj0V5WO4PZGSGJ+dvAjG7rcMul6VL/xRVRky9BjLXRTauFU0Zoi6jwK
 zzNQBDqgjiqQZ6agRYL6nZteNRFO3J+I9OPRHh4qSrojvpsYL1L8PjVIg+jUUlatdJ0c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2r7rBA6cLE/LOayn17wccFuuRsJss8BPtmJcgffPGEQ=; b=g
 vn8UZlO9G7qEXaeR45+bA93aDPK9hWRPXrS0B8EyKcc3AGEo/ZoisGAS5R4cpmSqi7KGwk4k3ZNRh
 R0e6ES+RrHce3vRQ+msBldKAF3c+4tTZyyBzp8nDshp+d40DrboqHWnchAW2BID2dNmDKMz3Id0Ip
 4KvLlOLrdxsWwhI0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFubj-00GnAn-Iw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Feb 2022 09:10:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 06A4A614DB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Feb 2022 09:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C49EC004E1;
 Fri,  4 Feb 2022 09:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643965810;
 bh=rb2wJPVBUi7SSDcM4ZjaKH33BmO66QdukLi4kREAYQI=;
 h=From:To:Cc:Subject:Date:From;
 b=QLs72LqEdqR3krZ4rfFl6N0Y022GIXBLQT7CASXshBCbmJR4eaoUkFW6Bj/mpwIjl
 5U46GAG2PSww5Jyz8GiHrOf0cmNSYo8msB2NER2o7+QovY+lcJx/MelOPIJQL70Twf
 lI+gwvnEpF3H/WKFWdfAa72VrDRIht98zwml5r7Zjx6e2RQSVnUwrObKr+BPEAsLJb
 TCf6IwNM8wQt9GRjmQC9qmfH9Kf9WKEO7nLAMcgljS+rzFG2ZU0jEV/8sDymrC9svm
 Y6Vvas16EHjhzOQyuV04K03E2YqB/OzoZo4dnME0nhDFqMe4tPMBSguChEZ9DYkBT8
 8jBeaCxPEqh/w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri,  4 Feb 2022 17:10:05 +0800
Message-Id: <20220204091005.49407-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There is potential hangtask happened during swapfile's
 writeback:
 - loop_kthread_worker_fn - do_checkpoint - kthread_worker_fn - loop_queue_work
 - lo_rw_aio - f2fs_file_write_iter - f2fs_preallocate_blocks - f2fs_map_blocks
 - down_write - down_read - rwsem_down_read [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1nFubj-00GnAn-Iw
Subject: [f2fs-dev] [PATCH v2] f2fs: skip f2fs_preallocate_blocks() for
 overwrite case
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There is potential hangtask happened during swapfile's writeback:

- loop_kthread_worker_fn		- do_checkpoint
  - kthread_worker_fn
   - loop_queue_work
    - lo_rw_aio
     - f2fs_file_write_iter
      - f2fs_preallocate_blocks
       - f2fs_map_blocks
					 - down_write
        - down_read
         - rwsem_down_read_slowpath
          - schedule

One cause is f2fs_preallocate_blocks() will always be called no matter
the physical block addresses are allocated or not.

This patch tries to check whether block addresses are all allocated with
i_size and i_blocks of inode, it's rough because blocks can be allocated
beyond i_size, however, we can afford skipping block preallocation in this
condition since it's not necessary to do preallocation all the time.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- check overwrite case with i_size and i_blocks roughly.
 fs/f2fs/file.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cfdc41f87f5d..09565d10611d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4390,6 +4390,16 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 	int flag;
 	int ret;
 
+	/*
+	 * It tries to check whether block addresses are all allocated,
+	 * it's rough because blocks can be allocated beyond i_size,
+	 * however, we can afford skipping block preallocation since
+	 * it's not necessary all the time.
+	 */
+	if (F2FS_BLK_ALIGN(i_size_read(inode)) ==
+			SECTOR_TO_BLOCK(inode->i_blocks))
+		return 0;
+
 	/* If it will be an out-of-place direct write, don't bother. */
 	if (dio && f2fs_lfs_mode(sbi))
 		return 0;
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
