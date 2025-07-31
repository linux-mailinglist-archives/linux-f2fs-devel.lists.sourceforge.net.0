Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ABFB16B91
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Jul 2025 07:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FrpcwwPtw/PYaAm+z7M/0476Gk43B1hsTodbp0ygNvU=; b=JfvOQQO+FlXvBCwPdBU/hRFjkG
	/c6WLEuWoFW+vJ5YNTHCZch5+Nh398KLgfFIC7GFZ4udCPr5CF/f4E8xaIYX6Tq9sgpKoTrzQ4jsi
	pD5FisjX7YDgYUOZfRXA8MFnMaGwzYpIqLK8fkw/DzD8oCqDwjwjX69lj8MzQE1ByLfU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhLvt-0001gd-5f;
	Thu, 31 Jul 2025 05:34:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uhLvr-0001gU-M7
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 05:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vtSndmotFhp3hKsJOwUIUualxn7h8UlFCVDMF0NIWg0=; b=D7+z15Dvv/QvLaX2YYIZ1tgeXB
 gXR8QJRWZyI6TvitvO7VKgUXDF5GjYmwm1oRrJYZbZavmJydbO+nPvEsUMVrVIDd7PLoqRXXa2a2s
 kAaviIAJccvGz7Okrck1R0UTwDawn8Xa+3NTAy2JNNPYzjrwB4YYDaX6IIZIkqj/+4jI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vtSndmotFhp3hKsJOwUIUualxn7h8UlFCVDMF0NIWg0=; b=A
 85CpYVsYC8rN7X2yZ49PLTOG8m///XAmzfyRSRaSoEKXVw3iwFdNKTlr1VT8TXzGFSXHkxoXpMVP3
 nBlyVniqBWfIcY3pfGh4UuyPmGgveChGkecN7IfKN+zYvw13fCpH7gHgtlMIU7JNxV9qgoY994Olk
 LO21T3Q/J0T3OB+4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhLvr-0007YY-7m for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 05:34:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CC4C045EB1;
 Thu, 31 Jul 2025 05:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0E9C4CEEF;
 Thu, 31 Jul 2025 05:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753940052;
 bh=8z0/TBMD8fWuIra7ndYVRz3me/9CIVnmVPKQkLavtJM=;
 h=From:To:Cc:Subject:Date:From;
 b=rXN9TUYZiDZyvM25EnRczrjD2kVSUBwl2yIwtm4spxoyRjzRRO7fjIAWB8Ks/HBiu
 MQUIgOabigE7VDZa0NQd9gFI7Lvm2UeS9Cvb95gzKY+bf32efIwjwt1a+UnO8oTQsm
 51VfjE2zKdMZ0v2hVIxaOnxemIqMnaEYgm36Ptkjq1nOehnn2fy8TCuBg7/YHykUYG
 H4OMf0HJy1qv7OIOR5qwgtyJyUukBon0pXjTGqcXvWZW4LnbhIiIqSK3WIx2u/32+7
 BYHluDbbhXKcHVAS9aR04ENDBI6kzq1vV66mAoUToHbGEBGJhM2cp84jIjRuP3wy8g
 L394YL/T4FRFw==
To: jaegeuk@kernel.org
Date: Thu, 31 Jul 2025 13:34:04 +0800
Message-ID: <20250731053405.1127197-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: generic/299 w/ mode=lfs will cause long time latency of
 checkpoint, 
 let's dump more information once we hit case. CP merge: - Queued : 0 - Issued
 : 1 - Total : 1 - Cur time : 9765(ms) - Peak time : 9765(ms) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uhLvr-0007YY-7m
Subject: [f2fs-dev] [PATCH 1/2] f2fs: dump more information when checkpoint
 was blocked for long time
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

generic/299 w/ mode=lfs will cause long time latency of checkpoint,
let's dump more information once we hit case.

CP merge:
  - Queued :    0
  - Issued :    1
  - Total :    1
  - Cur time : 9765(ms)
  - Peak time : 9765(ms)

F2FS-fs (vdc): blocked on checkpoint for 9765 ms
CPU: 11 UID: 0 PID: 237 Comm: kworker/u128:29 Tainted: G           O        6.16.0-rc3+ #409 PREEMPT(voluntary)
Tainted: [O]=OOT_MODULE
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: writeback wb_workfn (flush-253:32)
Call Trace:
 <TASK>
 dump_stack_lvl+0x6e/0xa0
 f2fs_issue_checkpoint+0x268/0x280
 f2fs_write_node_pages+0x6a/0x2c0
 do_writepages+0xd0/0x170
 __writeback_single_inode+0x56/0x4c0
 writeback_sb_inodes+0x22a/0x550
 __writeback_inodes_wb+0x4c/0xf0
 wb_writeback+0x300/0x400
 wb_workfn+0x3de/0x500
 process_one_work+0x230/0x5c0
 worker_thread+0x1da/0x3d0
 kthread+0x10d/0x250
 ret_from_fork+0x164/0x190
 ret_from_fork_asm+0x1a/0x30

Cc: Jan Prusakowski <jprusakowski@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 7 +++++++
 fs/f2fs/f2fs.h       | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index db3831f7f2f5..02806e2edce4 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1778,6 +1778,7 @@ static void __checkpoint_and_complete_reqs(struct f2fs_sb_info *sbi)
 	llist_for_each_entry_safe(req, next, dispatch_list, llnode) {
 		diff = (u64)ktime_ms_delta(ktime_get(), req->queue_time);
 		req->ret = ret;
+		req->delta_time = diff;
 		complete(&req->wait);
 
 		sum_diff += diff;
@@ -1873,6 +1874,12 @@ int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi)
 	else
 		flush_remained_ckpt_reqs(sbi, &req);
 
+	if (unlikely(req.delta_time >= CP_LONG_LATENCY_THRESHOLD)) {
+		f2fs_warn_ratelimited(sbi,
+			"blocked on checkpoint for %u ms", cprc->peak_time);
+		dump_stack();
+	}
+
 	return req.ret;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b9058518b54e..c036af1a885a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -334,7 +334,10 @@ struct ckpt_req {
 	struct completion wait;		/* completion for checkpoint done */
 	struct llist_node llnode;	/* llist_node to be linked in wait queue */
 	int ret;			/* return code of checkpoint */
-	ktime_t queue_time;		/* request queued time */
+	union {
+		ktime_t queue_time;	/* request queued time */
+		ktime_t delta_time;	/* time in queue */
+	};
 };
 
 struct ckpt_req_control {
@@ -350,6 +353,9 @@ struct ckpt_req_control {
 	unsigned int peak_time;		/* peak wait time in msec until now */
 };
 
+/* a time threshold that checkpoint was blocked for, unit: ms */
+#define CP_LONG_LATENCY_THRESHOLD	5000
+
 /* for the bitmap indicate blocks to be discarded */
 struct discard_entry {
 	struct list_head list;	/* list head */
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
