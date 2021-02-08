Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80289314263
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Feb 2021 22:56:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l9EWT-0001as-LE; Mon, 08 Feb 2021 21:56:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1l9EWR-0001aZ-CU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Feb 2021 21:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gQsQNVkCnur2XhhMdHIxIq5byaAYfXg6gGF4jF4cPbw=; b=mje7HuIFfMfznZk3f6kJ6lmxUR
 qDj8ipqkU10NThHSB6rIpROyyhBT+JJZD21dAZb7GKw9Jhu49q95w0El8fn5vnLlgy+WZSx/4C3uh
 BLChdF6W+PADT/cz5Xuic1auplwKGRdchH9NR9Hs22PmMCAdJWncRVe+JPZYMD+jv0Qc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gQsQNVkCnur2XhhMdHIxIq5byaAYfXg6gGF4jF4cPbw=; b=I
 j5lrJnIOdhWQxUstEDNmkCGf/ftjGlmjR6fcHnJ9f7ij6UUbYEsL+jzt/Dj6NqaMfHPw9isbmANj1
 MWKsQyddmNSfqA3y+a6Ps6AwSmbr7n2PIoVKG0czAvsKPiJv2QkurZNpBESGEWt+30EwB+lgA7nFD
 4cUTHpPYGW2BSJN4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l9EWH-0000I3-8I
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Feb 2021 21:56:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A62A64E6E;
 Mon,  8 Feb 2021 21:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612821387;
 bh=wvU6F8HGbdOxGv1rqDFb603k8QhQouYpvvt3l81tbCY=;
 h=From:To:Cc:Subject:Date:From;
 b=Ix0lsBVuwu0OUTwUz71OxPjn/ALiOBKLO9N9uXNCV7HsvmIkeOlW4tu93T+rUsucN
 qot8Fb5uNY+xcOUaKAczqJQO1dV2YmCJJVhS9AAWYWWWrhLGpK5+zjUVPf+uoV78kx
 ZQW5yEfPvedHz+T7KGIDc9wW1yDOf6QI4Nln7T/Xee/AeiMimIaAMitrDRqZQx52Kn
 HcgVdD6l4RYckB0fMchJkF04U0wnyoGPCFDRK/miewb1Cxhrv4eQkoKEXAhOwS33kp
 aRLxNFYE1vBX8gySpaMH61nRCF6hWGppHe6VMlneom0Lo9LFb5UIjJzCvfr+htGRyy
 h0E4t1Z2xIoJg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  8 Feb 2021 13:56:16 -0800
Message-Id: <20210208215616.1606535-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l9EWH-0000I3-8I
Subject: [f2fs-dev] [PATCH] f2fs: don't grab superblock freeze for
 flush/ckpt thread
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

There are controlled by f2fs_freeze().

This fixes xfstests/generic/068 which is stuck at

 task:f2fs_ckpt-252:3 state:D stack:    0 pid: 5761 ppid:     2 flags:0x00004000
 Call Trace:
  __schedule+0x44c/0x8a0
  schedule+0x4f/0xc0
  percpu_rwsem_wait+0xd8/0x140
  ? percpu_down_write+0xf0/0xf0
  __percpu_down_read+0x56/0x70
  issue_checkpoint_thread+0x12c/0x160 [f2fs]
  ? wait_woken+0x80/0x80
  kthread+0x114/0x150
  ? __checkpoint_and_complete_reqs+0x110/0x110 [f2fs]
  ? kthread_park+0x90/0x90
  ret_from_fork+0x22/0x30

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c | 4 ----
 fs/f2fs/segment.c    | 4 ----
 fs/f2fs/super.c      | 4 ++++
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 579b9c3603cc..174a0819ad96 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1763,13 +1763,9 @@ static int issue_checkpoint_thread(void *data)
 	if (kthread_should_stop())
 		return 0;
 
-	sb_start_intwrite(sbi->sb);
-
 	if (!llist_empty(&cprc->issue_list))
 		__checkpoint_and_complete_reqs(sbi);
 
-	sb_end_intwrite(sbi->sb);
-
 	wait_event_interruptible(*q,
 		kthread_should_stop() || !llist_empty(&cprc->issue_list));
 	goto repeat;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7d34f1cacdee..440634dfaa56 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -607,8 +607,6 @@ static int issue_flush_thread(void *data)
 	if (kthread_should_stop())
 		return 0;
 
-	sb_start_intwrite(sbi->sb);
-
 	if (!llist_empty(&fcc->issue_list)) {
 		struct flush_cmd *cmd, *next;
 		int ret;
@@ -629,8 +627,6 @@ static int issue_flush_thread(void *data)
 		fcc->dispatch_list = NULL;
 	}
 
-	sb_end_intwrite(sbi->sb);
-
 	wait_event_interruptible(*q,
 		kthread_should_stop() || !llist_empty(&fcc->issue_list));
 	goto repeat;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1000d21120ca..4aa533cb4340 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1472,6 +1472,10 @@ static int f2fs_freeze(struct super_block *sb)
 	/* must be clean, since sync_filesystem() was already called */
 	if (is_sbi_flag_set(F2FS_SB(sb), SBI_IS_DIRTY))
 		return -EINVAL;
+
+	/* ensure no checkpoint required */
+	if (!llist_empty(&F2FS_SB(sb)->cprc_info.issue_list))
+		return -EINVAL;
 	return 0;
 }
 
-- 
2.30.0.478.g8a0d178c01-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
