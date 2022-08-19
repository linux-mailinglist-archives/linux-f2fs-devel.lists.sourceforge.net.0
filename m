Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCD059A916
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 01:15:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPBDB-0003c3-Et;
	Fri, 19 Aug 2022 23:15:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oPBD2-0003bq-08
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 23:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XhSiQiIUqASqEojqBeOeOWDhZzSayGUedaZ3A3cGQQ8=; b=Mu8JkGA7e2L+Rt7bjj2Qib/K0N
 v3QaTkOxjkfKxzaDNg2h9zTOsNHNpj8GC01mitD1owczv5P5OWcFmHnZ3qRuGRZE+c1EH3fCXJWSq
 XO5L6XfpYI+SwPt8zxKJMuXQy4xECqH1MQDnc9g2ecnHI8uRnp/usqR5QhF42DF+4aXE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XhSiQiIUqASqEojqBeOeOWDhZzSayGUedaZ3A3cGQQ8=; b=j
 muOWBqOSfCWhKMkpka6yY7a6yCu02EqjCxKu0KpcxvwXz76DXD5UxQEhTkWt5EK/y63W/+FP8zbY+
 aHrjJ11t3ZlljpbCoyimmEyl/YAwt1RtB7hurbiH026vA7JGshBpbezARWEqHxpPupHAprlBpVcXB
 tzDmhZ7Yc/L2dJdA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPBD1-0005vs-9z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 23:15:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBFC96185D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 19 Aug 2022 23:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA119C433C1;
 Fri, 19 Aug 2022 23:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660950917;
 bh=xfanyvshwE1RaGKDX1ptGODAoLpIUb8GI1syiWM0c4U=;
 h=From:To:Cc:Subject:Date:From;
 b=aMDxQNH9Y7ngPtlVngBTudaEvxLIRPP+CMTFFzFK+2aY/rDW0sZ2dYigfUU5VxvxN
 CjZD53qHKm/h9bxG3Jg6hF42Ce89hJHDvH2Xhy0fvV6jXzgugc1yCzca8KYFZb0BI7
 hofEvc491FN7lGKD0r/Olrd7kijirMWK1280KF7yP2eNuSBanJ6n9NrE2wtx4uJ7jS
 +yQz2wVKXqULJ0hlo3itVgA77ioJW7r+4RsbjY+n4lbQh9KSYgeB0EnZwlMKLRn1qJ
 2deN+l1IBw8WYvHUcOy0zmjR1eaSr9J64syK4mvO5cUc0urxFTsy8wpRgZ6VKVnXaz
 +CV1xwkugftmQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 19 Aug 2022 16:15:13 -0700
Message-Id: <20220819231514.3609958-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This avoids -EINVAL when trying to freeze f2fs.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/checkpoint.c | 27
 +++++++++++++++++++++------
 fs/f2fs/f2fs.h | 1 + fs/f2fs/super.c | 5 ++--- 3 files changed,
 24 insertions(+), 9 deletions( [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oPBD1-0005vs-9z
Subject: [f2fs-dev] [PATCH 1/2] f2fs: flush pending checkpoints when
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This avoids -EINVAL when trying to freeze f2fs.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c | 27 +++++++++++++++++++++------
 fs/f2fs/f2fs.h       |  1 +
 fs/f2fs/super.c      |  5 ++---
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 8259e0fa97e1..37f7a9ea4746 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1892,15 +1892,30 @@ int f2fs_start_ckpt_thread(struct f2fs_sb_info *sbi)
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
+	if (!cprc->f2fs_issue_ckpt)
+		return;
+
+	flush_remained_ckpt_reqs(sbi, NULL);
+
+	/* Let's wait for the previous dispatched checkpoint. */
+	while (atomic_read(&cprc->queued_ckpt))
+		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 }
 
 void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3c7cdb70fe2e..2a83fc34b372 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3707,6 +3707,7 @@ static inline bool f2fs_need_rand_seg(struct f2fs_sb_info *sbi)
  * checkpoint.c
  */
 void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io);
+void f2fs_flush_ckpt_thread(struct f2fs_sb_info *sbi);
 struct page *f2fs_grab_meta_page(struct f2fs_sb_info *sbi, pgoff_t index);
 struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index);
 struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 212ec2b4926b..48ac3de4a533 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1670,9 +1670,8 @@ static int f2fs_freeze(struct super_block *sb)
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
