Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 396915A026C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Aug 2022 22:03:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQwaz-0005EZ-3S;
	Wed, 24 Aug 2022 20:03:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oQwaj-0005EI-EJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 20:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KvsrWK/INcPyJdFw1C6q5UetnHBTsKHhImi07vLpiPo=; b=eDC9rbqN7NbjgLLvEATfbuy26G
 qxhHpREACzoVM2j2yf0ghbZhPH8Y9lVQKk32e3IZjycsZVvIJ8NjIACnK3LjPdPFWjDw2bXJz0SHT
 21mij2ZmvlN86JJMNnYDhBqjs2L1r9ptkBSY/CuHl0wuYtTrCimGONHQBKyBda1DraOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KvsrWK/INcPyJdFw1C6q5UetnHBTsKHhImi07vLpiPo=; b=nLszwwmuJyK/m1ibQhzdibba/3
 nGyk5ZYxiyhWfutUPIzQS5AB1vxp1Cx9sEJ7TDuglgX3lvQbUDZ8NYTSKol7PKicKcHb1XH47H+Dw
 k6uAhfIBQafLQszjHaispbQnFP3ZWqWNgVYTEm2gaQ6kAioeSUto/5ti7pN+wm4e+4KQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oQwah-0006ZZ-5i for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 20:03:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C2AE96181B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Aug 2022 20:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92128C433C1;
 Wed, 24 Aug 2022 20:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661371376;
 bh=unxW9Qi6JH0z2onbNULdSwd+TxNQ1BVAlQ1Duh4IOWs=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=HgiJBW6GKNHD5d08CRjJ349ggpAY8WPUFTeIXQ6qNaH1Gr3Agc+CVX/L9AXWiwtF2
 OPjevjrvmjoDpYyhmyqZAAPKj6q/Sl553GUHwsfR5CfYDnD1f1T78cIBs7I62UPE8v
 CRvWqKnojLzIZy9PT+89ErltIvfwmZAnabF/zHg8DgfjBlx6g9ZaLWsKRaysDrzBjG
 HK3ZWhE/LkNfdCa+vrTsu3VXoF7t72RC2AYzlshvs5aUHdXn4z+hYG8aamI/w65cFf
 CoCbm4wCr8xsN8dwjlmWk3EdgDnvGS/BvEo/rd1SHCJaXfz/zPxOHFsDF2xav0vTMj
 1lokFcnkEp90w==
Date: Wed, 24 Aug 2022 13:02:54 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YwaD7mJpMLhEm5wd@google.com>
References: <20220819231514.3609958-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220819231514.3609958-1-jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This avoids -EINVAL when trying to freeze f2fs.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- Change log from v1: - do not check
 cprc->f2fs_issue_ckpt in f2fs_flush_ckpt_thread 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oQwah-0006ZZ-5i
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: flush pending checkpoints when
 freezing super
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

This avoids -EINVAL when trying to freeze f2fs.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - do not check cprc->f2fs_issue_ckpt in f2fs_flush_ckpt_thread

 fs/f2fs/checkpoint.c | 24 ++++++++++++++++++------
 fs/f2fs/f2fs.h       |  1 +
 fs/f2fs/super.c      |  5 ++---
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 7de48e791920..7bf1feb5ac78 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1893,15 +1893,27 @@ int f2fs_start_ckpt_thread(struct f2fs_sb_info *sbi)
 void f2fs_stop_ckpt_thread(struct f2fs_sb_info *sbi)
 {
 	struct ckpt_req_control *cprc = &sbi->cprc_info;
+	struct task_struct *ckpt_task;
 
-	if (cprc->f2fs_issue_ckpt) {
-		struct task_struct *ckpt_task = cprc->f2fs_issue_ckpt;
+	if (!cprc->f2fs_issue_ckpt)
+		return;
 
-		cprc->f2fs_issue_ckpt = NULL;
-		kthread_stop(ckpt_task);
+	ckpt_task = cprc->f2fs_issue_ckpt;
+	cprc->f2fs_issue_ckpt = NULL;
+	kthread_stop(ckpt_task);
 
-		flush_remained_ckpt_reqs(sbi, NULL);
-	}
+	f2fs_flush_ckpt_thread(sbi);
+}
+
+void f2fs_flush_ckpt_thread(struct f2fs_sb_info *sbi)
+{
+	struct ckpt_req_control *cprc = &sbi->cprc_info;
+
+	flush_remained_ckpt_reqs(sbi, NULL);
+
+	/* Let's wait for the previous dispatched checkpoint. */
+	while (atomic_read(&cprc->queued_ckpt))
+		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 }
 
 void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6770210aae70..088c3d1574b8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3711,6 +3711,7 @@ static inline bool f2fs_need_rand_seg(struct f2fs_sb_info *sbi)
  * checkpoint.c
  */
 void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io);
+void f2fs_flush_ckpt_thread(struct f2fs_sb_info *sbi);
 struct page *f2fs_grab_meta_page(struct f2fs_sb_info *sbi, pgoff_t index);
 struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index);
 struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e910f0e39d76..4f2ff50b247c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1671,9 +1671,8 @@ static int f2fs_freeze(struct super_block *sb)
 	if (is_sbi_flag_set(F2FS_SB(sb), SBI_IS_DIRTY))
 		return -EINVAL;
 
-	/* ensure no checkpoint required */
-	if (!llist_empty(&F2FS_SB(sb)->cprc_info.issue_list))
-		return -EINVAL;
+	/* Let's flush checkpoints and stop the thread. */
+	f2fs_flush_ckpt_thread(F2FS_SB(sb));
 
 	/* to avoid deadlock on f2fs_evict_inode->SB_FREEZE_FS */
 	set_sbi_flag(F2FS_SB(sb), SBI_IS_FREEZING);
-- 
2.37.1.595.g718a3a8f04-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
