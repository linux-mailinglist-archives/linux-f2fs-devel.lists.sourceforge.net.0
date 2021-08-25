Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9E83F7DC3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Aug 2021 23:33:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mJ0WD-0001jj-GT; Wed, 25 Aug 2021 21:33:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1mJ0WB-0001jb-W2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Aug 2021 21:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C8zdNtpSKCfWxr4aM6MQ/di+Mtx1sYZxFIdLNmpoYps=; b=NOi0qAtM2E8voy8aXtPZdJZrEc
 i+tZ7YR7n60yJ2Tf2QJNiGgMceSIL/yB5394uJeHHuU26bNMrnRNOfuLHpAKlihOoRw5wkIH2Ob03
 vE7xZbzdSlU106ieXMiIIWm5EC7J52TF1g5sqSuiPq59CVYdV7B6n43+nh1R4YYbmZ0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C8zdNtpSKCfWxr4aM6MQ/di+Mtx1sYZxFIdLNmpoYps=; b=iyX9tCWW1EGg57wKw0sYAP/I58
 Jcbn2/HZGKSBWDL6Y4GxFTfyMgMZx4KeJb3IjGX7rBcfBDAjdfRY8+MPaFZl9Z8TjKLSYpUbXXSUV
 2/b3nMLYvwSqvhDzX9pFbxZ75dW5AqP9Fp3gCNZygyiU2YvR1f1wQDTnwQ5Fh7MWb+hc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mJ0WB-0011F8-FI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Aug 2021 21:33:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAAD8610C7;
 Wed, 25 Aug 2021 21:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629927182;
 bh=D8iK6G3Bb7hdOrp7isR46w/hrxdUS2CD53SAelcnhxg=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=lTb1ngu/UMRiIKK9CndtSGS0JuGl2Utt1PvlqBUqRaGtv4NTbljUD0dd22Alw1iWA
 Lwd9gBG1eXLOx8o3WH1Oc0p6r7BHQkIiLedPBYuCSdZVZ5qrpxSuRvlyNBKNg0owdd
 dXe5RVPPQ+JRSBYzrcJ4K9K7zBOpav6t/trCWSThnPaoeLHLtDsEq3WfxOvIRtJeFJ
 3ohCG6dRrz1LryyfdcaEAAOCtoE0MhUBZ0l6FWQCAeYf1ga7YIfr7ZW6idm80Q96eY
 lN5LUCFWhK1FKj8hSB5v629I3vdiGftJ4sGzBO6GAWdaF9e0VPfFl2pYhN20SC+0+x
 +PpGdYGWvA6lA==
Date: Wed, 25 Aug 2021 14:33:00 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YSa3DPBIFZ5P17vt@google.com>
References: <20210823170151.1434772-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210823170151.1434772-1-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  We must flush all the dirty data when enabling checkpoint
 back. Let's guarantee that first. In order to mitigate any failure, let's
 flush data in fsync as well during checkpoint=disable. Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- v2 from v1: - handle sync_inodes_sb() failure
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mJ0WB-0011F8-FI
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't ignore writing pages on fsync
 during checkpoint=disable
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

We must flush all the dirty data when enabling checkpoint back. Let's guarantee
that first. In order to mitigate any failure, let's flush data in fsync as well
during checkpoint=disable.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
v2 from v1:
 - handle sync_inodes_sb() failure

 fs/f2fs/file.c  |  5 ++---
 fs/f2fs/super.c | 11 ++++++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cc2080866c54..3330efb41f22 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -263,8 +263,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	};
 	unsigned int seq_id = 0;
 
-	if (unlikely(f2fs_readonly(inode->i_sb) ||
-				is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
+	if (unlikely(f2fs_readonly(inode->i_sb)))
 		return 0;
 
 	trace_f2fs_sync_file_enter(inode);
@@ -278,7 +277,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	ret = file_write_and_wait_range(file, start, end);
 	clear_inode_flag(inode, FI_NEED_IPU);
 
-	if (ret) {
+	if (ret || is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
 		trace_f2fs_sync_file_exit(inode, cp_reason, datasync, ret);
 		return ret;
 	}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 49e153fd8183..d2f97dfb17af 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2088,8 +2088,17 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 
 static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 {
+	int retry = DEFAULT_RETRY_IO_COUNT;
+
 	/* we should flush all the data to keep data consistency */
-	sync_inodes_sb(sbi->sb);
+	do {
+		sync_inodes_sb(sbi->sb);
+		cond_resched();
+		congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+	} while (get_pages(sbi, F2FS_DIRTY_DATA) && retry--);
+
+	if (unlikely(!retry))
+		f2fs_warn(sbi, "checkpoint=enable has some unwritten data.");
 
 	down_write(&sbi->gc_lock);
 	f2fs_dirty_to_prefree(sbi);
-- 
2.33.0.rc2.250.ged5fa647cd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
