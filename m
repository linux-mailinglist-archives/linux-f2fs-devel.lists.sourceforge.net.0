Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43745B14848
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Jul 2025 08:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gH1ieRY/z647SgmNLjcGSe2rf8Wg1YacjtxFlMH8338=; b=llMvCYYuUSKpQjdNAdUXu+0IHY
	bygNLTl0qAuq6MWrOUv3sORr/P/CEO+8oIq/SXlMVncq8QV65b3BE6MkcffWcNkMzmlpsu7Xf/27D
	y2W8dFTe+7GL0TsJuAfAXKZILT4aEIUW5XNrf+M877aaorpoCG8StfmXYWntxXyIAHVs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugduE-0000fg-11;
	Tue, 29 Jul 2025 06:33:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ugduC-0000fZ-LT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 06:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4D4yjX2jbPiQVfxERiORXxWbskvfNeymngDoMZa/Y+w=; b=i9jWRVghQCMqsIanty2ToedSX7
 7pNrEfPqtonts63YRW1wUmFXRgex1DOdn3WCr+M/TWakvaRatNOI1gGAT1NdG+U2LAiDNAyFAh+bP
 wzpxE1xWP5x6uYCid2HglI9Q+4SS21594tqEx/pucmE6QvunmCePXl2uuW47hl6dGuU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4D4yjX2jbPiQVfxERiORXxWbskvfNeymngDoMZa/Y+w=; b=P
 xT4kRB9Bvq/396dkx7kKXBK6D2tRzQgtTvj46d+6nHc7vsJbrfqtYYo+nRqmkg4mdmlzZglINBKOc
 qQ6VJV2BSiTUyYjL2EkMCt6+d5EiHRUnRr2wRMyBSYMm9TkoK3Go3vaXfg7I8uBPBCXN9ZazHedF+
 wY1gFnQNkDJEg/0k=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugduC-0007RY-5M for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 06:33:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C764F40BD9;
 Tue, 29 Jul 2025 06:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D81C4CEEF;
 Tue, 29 Jul 2025 06:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753770813;
 bh=CAt7BzvgHdL05a36U0ED1tXU0zxEy6nbl6IWT8d6sFw=;
 h=From:To:Cc:Subject:Date:From;
 b=h6s1Ikuyvu0PTURNbv04+uOa9+pe221MQud4cDKAOGduAwtQUnyRHgffZCFPPNs9U
 DuP94Qo9QJlHMxhJFGG+/MQgoOQvvDZz6aXKiZX04t0nvwWpJ4HJ38SjuHp9xN/YQh
 ALf6QNAiPCUa6ufpOeWMwx/bDZz6uqmUqYMSGMOqKGoDoon9pFbWX+sgKnulZxJEj6
 3XEa+/v4nlC9EA6yDa9VJh/wcbDwwg/eBriiIkUbMNL0InjXqrG+eDhuRL0RQpwG2Y
 nOPqKYOBHGIjA3GhWznNYA4vDEWUopo1902WMI7vI7HQAGqUBqEUlY/25gDlkWbQtD
 gSEXLdXrPwjhg==
To: jaegeuk@kernel.org
Date: Tue, 29 Jul 2025 14:33:25 +0800
Message-ID: <20250729063326.435167-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  generic/299 w/ mode=lfs will cause long time latency, let's
 dump more information once we hit case. CP merge: - Queued : 0 - Issued :
 1 - Total : 1 - Cur time : 7565(ms) - Peak time : 7565(ms) F2FS-fs (vdc):
 checkpoint was blocked for 7565 ms, affecting 1 tasks CPU: 8 UID: 0 PID:
 1614 Comm: f2fs_ckpt-253:3 Tainted: G O 6.16.0-rc3+ #406 PREEMPT(voluntary)
 Tainted: [O]=OOT_MODULE Call Trace: [...] 
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
X-Headers-End: 1ugduC-0007RY-5M
Subject: [f2fs-dev] [PATCH] f2fs: dump more information when checkpoint was
 blocked for long time
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

generic/299 w/ mode=lfs will cause long time latency, let's dump more
information once we hit case.

CP merge:
  - Queued :    0
  - Issued :    1
  - Total :    1
  - Cur time : 7565(ms)
  - Peak time : 7565(ms)

F2FS-fs (vdc): checkpoint was blocked for 7565 ms, affecting 1 tasks
CPU: 8 UID: 0 PID: 1614 Comm: f2fs_ckpt-253:3 Tainted: G           O        6.16.0-rc3+ #406 PREEMPT(voluntary)
Tainted: [O]=OOT_MODULE
Call Trace:
 dump_stack_lvl+0x6e/0xa0
 __checkpoint_and_complete_reqs+0x1a6/0x1d0
 issue_checkpoint_thread+0x4b/0x140
 kthread+0x10d/0x250
 ret_from_fork+0x164/0x190
 ret_from_fork_asm+0x1a/0x30

Cc: Jan Prusakowski <jprusakowski@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 9 ++++++++-
 fs/f2fs/f2fs.h       | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index db3831f7f2f5..b0dcaa8dc40d 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1788,8 +1788,15 @@ static void __checkpoint_and_complete_reqs(struct f2fs_sb_info *sbi)
 
 	spin_lock(&cprc->stat_lock);
 	cprc->cur_time = (unsigned int)div64_u64(sum_diff, count);
-	if (cprc->peak_time < cprc->cur_time)
+	if (cprc->peak_time < cprc->cur_time) {
 		cprc->peak_time = cprc->cur_time;
+
+		if (unlikely(cprc->peak_time >= CP_LONG_LATENCY_THRESHOLD)) {
+			f2fs_warn_ratelimited(sbi, "checkpoint was blocked for %u ms, affecting %llu tasks",
+					cprc->peak_time, count);
+			dump_stack();
+		}
+	}
 	spin_unlock(&cprc->stat_lock);
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 46d23c2c086c..3130ca6a4770 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -350,6 +350,9 @@ struct ckpt_req_control {
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
