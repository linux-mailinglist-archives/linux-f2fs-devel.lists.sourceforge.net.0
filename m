Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 543F09C557B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Nov 2024 12:07:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tAojp-0001eM-4i;
	Tue, 12 Nov 2024 11:07:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Xiuhong.Wang@unisoc.com>) id 1tAojn-0001eG-RS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Nov 2024 11:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gd5VgQnJ2/8QVxVixG3t+xOgttG0c6AT7G7mAoOe4pQ=; b=AkwOC3u5FE+A24GEvHqosD46Pu
 px+pzWFC6KaYCDq37LHYUNL0YqwQqhjP6WZFzAaaNdnOsx760cny25apEsOG2gyPy2TNwV9gBRiy4
 8buC+FqERY8iBQygz7/gObgFYo8B0MCF9JpoB9RxY/OlHYs1HW8fm2La0a5uQO+FO1bg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Gd5VgQnJ2/8QVxVixG3t+xOgttG0c6AT7G7mAoOe4pQ=; b=X
 hjII7HsvZGKHRla50s92wug3A0b3LW/9QFFhqnLDIm9YQMrbKfeVU7JnMXGUrzzgQhIkNhVLNHRV2
 iwYPD9JPTVl4Ee5+RMyFA1TaJCbFlCCNQ4VJyIgZf4cb2M50IEtY/NIHkl7jlS5m1g9TotqVQTPY5
 T6cTPLF04AcFcTYQ=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tAoji-0006C9-NG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Nov 2024 11:07:11 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 4ACB6UaU098026;
 Tue, 12 Nov 2024 19:06:30 +0800 (+08)
 (envelope-from Xiuhong.Wang@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Xnk933qr1z2KfPZ3;
 Tue, 12 Nov 2024 19:05:27 +0800 (CST)
Received: from tj10379pcu1.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 12 Nov 2024 19:06:28 +0800
From: Xiuhong Wang <xiuhong.wang@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Date: Tue, 12 Nov 2024 19:06:27 +0800
Message-ID: <20241112110627.1314632-1-xiuhong.wang@unisoc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 4ACB6UaU098026
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We encountered a system hang problem based on the following
 experiment: There are 17 processes, 8 of which do 4k data read, write and
 compare tests, and 8 do 64k read, write and compare tests. Each th [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1tAoji-0006C9-NG
Subject: [f2fs-dev] [PATCH] f2fs: Fix to avoid long time to shrink extent
 cache
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
Cc: ke.wang@unisoc.com, xiuhong.wang.cn@gmail.com, hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We encountered a system hang problem based on the following 
experiment:
There are 17 processes, 8 of which do 4k data read, write and
compare tests, and 8 do 64k read, write and compare tests. Each
thread writes a 256M file, and another thread writes a large file
to 80% of the disk, and then keeps doing read operations, all of
which are direct operations. This will cause the large file to be
filled to 80% of the disk to be severely fragmented. On a 512GB
device, this large file may generate a huge zombie extent tree.

When system shutting down, the init process needs to wait for the
writeback process, and the writeback process may encounter the
situation where the READ_EXTENT_CACHE space is insufficient and
needs to free the zombie extent tree. The extent tree has a large
number of extent nodes, it will a long free time to free, which
triggers system hang.

The stack when the problem occurs is as follows:
crash_arm64> bt 1
PID: 1        TASK: ffffff80801a9200  CPU: 1    COMMAND: "init"
 #0 [ffffffc00806b9a0] __switch_to at ffffffc00810711c
 #1 [ffffffc00806ba00] __schedule at ffffffc0097c1c4c
 #2 [ffffffc00806ba60] schedule at ffffffc0097c2308
 #3 [ffffffc00806bab0] wb_wait_for_completion at ffffffc0086320d4
 #4 [ffffffc00806bb20] writeback_inodes_sb at ffffffc00863719c
 #5 [ffffffc00806bba0] sync_filesystem at ffffffc00863c98c
 #6 [ffffffc00806bbc0] f2fs_quota_off_umount at ffffffc00886fc60
 #7 [ffffffc00806bc20] f2fs_put_super at ffffffc0088715b4
 #8 [ffffffc00806bc60] generic_shutdown_super at ffffffc0085cd61c
 #9 [ffffffc00806bcd0] kill_f2fs_super at ffffffc00886b3dc

crash_arm64> bt 14997
PID: 14997    TASK: ffffff8119d82400  CPU: 3    COMMAND: "kworker/u16:0"
 #0 [ffffffc019f8b760] __detach_extent_node at ffffffc0088d5a58
 #1 [ffffffc019f8b790] __release_extent_node at ffffffc0088d5970
 #2 [ffffffc019f8b810] f2fs_shrink_extent_tree at ffffffc0088d5c7c
 #3 [ffffffc019f8b8a0] f2fs_balance_fs_bg at ffffffc0088c109c
 #4 [ffffffc019f8b910] f2fs_write_node_pages at ffffffc0088bd4d8
 #5 [ffffffc019f8b990] do_writepages at ffffffc0084a0b5c
 #6 [ffffffc019f8b9f0] __writeback_single_inode at ffffffc00862ee28
 #7 [ffffffc019f8bb30] writeback_sb_inodes at ffffffc0086358c0
 #8 [ffffffc019f8bc10] wb_writeback at ffffffc0086362dc
 #9 [ffffffc019f8bcc0] wb_do_writeback at ffffffc008634910

Process 14997 ran for too long and caused the system hang.

At this time, there are still 1086911 extent nodes in this zombie
extent tree that need to be cleaned up.

crash_arm64_sprd_v8.0.3++> extent_tree.node_cnt ffffff80896cc500
  node_cnt = {
    counter = 1086911
  },

The root cause of this problem is that when the f2fs_balance_fs
function is called in the write process, it will determine
whether to call f2fs_balance_fs_bg, but it is difficult to
meet the condition of excess_cached_nats. When the
f2fs_shrink_extent_tree function is called to free during 
f2fs_write_node_pages, there are too many extent nodes on the 
extent tree, which causes a loop and causes a system hang.

To solve this problem, when calling f2fs_balance_fs, check whether
the extent cache is sufficient. If not, release the zombie extent
tree.

Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
Test the problem with the temporary versions:
patch did not reproduce the problem, the patch is as follows:
@@ -415,7 +415,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
                f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_FAULT_INJECT);

        /* balance_fs_bg is able to be pending */
-       if (need && excess_cached_nats(sbi))
+       if (need)
                f2fs_balance_fs_bg(sbi, false);

---
 fs/f2fs/segment.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1766254279d2..390bec177567 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -415,7 +415,9 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_FAULT_INJECT);
 
 	/* balance_fs_bg is able to be pending */
-	if (need && excess_cached_nats(sbi))
+	if (need && (excess_cached_nats(sbi) ||
+			!f2fs_available_free_memory(sbi, READ_EXTENT_CACHE) ||
+			!f2fs_available_free_memory(sbi, AGE_EXTENT_CACHE)))
 		f2fs_balance_fs_bg(sbi, false);
 
 	if (!f2fs_is_checkpoint_ready(sbi))
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
