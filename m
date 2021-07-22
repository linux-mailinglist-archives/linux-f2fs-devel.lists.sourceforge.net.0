Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 744B53D2B56
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 19:44:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6ckU-0001LV-C6; Thu, 22 Jul 2021 17:44:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1m6ckT-0001LO-Ad
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 17:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KSOzutUeRqPDwj7532S0t+cTZriEo1IZe7gia5sDwBo=; b=iZVtwczATJMPrUvmRJJgkmlG8O
 jkYmpoBzF6AEfcer35YhbdfNXiYj/h4Q+9/lmdZcHuhk57mtyZ9uToqDHsgR97tYQ9p4qXuM/zbhf
 wEmTa6UsOba5tWYDnPMz9JLU8qg9Mo1vboI2ELoox+rC8jyQLcH8S32OH/SZerVfLxbQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KSOzutUeRqPDwj7532S0t+cTZriEo1IZe7gia5sDwBo=; b=IKJYCWzZxXAM0fNnZYQu6zSaYv
 RRqKcwGDe6WJvaurrtpTG7IGoeDorgxsmMvLyYiSvA8XxYDbHqCzrmlOVlNirrcGbR9HRtr7TYrPS
 V7eEtPBbdkHIdEfhgnhkvPUpKZIBthqa0ZVm3DtCIO+RzFYlrQCe3o29GI9/xgNEHlcs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6ckN-0004QJ-5V
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 17:44:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEB5061001;
 Thu, 22 Jul 2021 17:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626975869;
 bh=+1VtaWnpu+/vg0Zu7lXitOvQJPQ5sE29/Tcbn/mDaJw=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=u9loRPsvhcfjzmctIAYBGzicMdiPmZqpfANrWNV1BIb+tJZ1mV4+NfLphNTnNOjFw
 0fYVzaBKoTyQQdm1nepJPpgg1xgGlAEim3ygYRtMdpm4LC47XBlBlKHkpWkurwviqD
 iWfDT6PVBKnQz5kIaf5V0fuLFxoV9JQl15oyGAMA0VtnzCoBsjsZWVFqoS/dYDERT7
 cE0XlVtO7R9hpOf7hNdIddYQsD9t1tsA/djWeL7ANoy0SEnSlbyvBpWhuB/AwiRPjW
 Zfe5RBXrWFHJ0ngUsedMe0z6+sQS7Q5shV+pn1bs2Vwc+s0N37xXeNfg68L3eb6imB
 eTNrgs0SpkPUw==
Date: Thu, 22 Jul 2021 10:44:28 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YPmufPvn9FJXfcip@google.com>
References: <20210722014149.525166-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722014149.525166-1-jaegeuk@kernel.org>
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6ckN-0004QJ-5V
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't sleep while grabing
 nat_tree_lock
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

This tries to fix priority inversion in the below condition resulting in
long checkpoint delay.

f2fs_get_node_info()
 - nat_tree_lock
  -> sleep to grab journal_rwsem by contention

                                     checkpoint
                                     - waiting for nat_tree_lock

In order to let checkpoint go, let's release nat_tree_lock, if there's a
journal_rwsem contention.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Change log from v1:
  - drop rwlock but take retry logic to reduce lock-holding time

 fs/f2fs/node.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 0be9e2d7120e..c60ba4179bb2 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -552,7 +552,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	int i;
 
 	ni->nid = nid;
-
+retry:
 	/* Check nat cache */
 	down_read(&nm_i->nat_tree_lock);
 	e = __lookup_nat_cache(nm_i, nid);
@@ -564,10 +564,16 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 		return 0;
 	}
 
-	memset(&ne, 0, sizeof(struct f2fs_nat_entry));
+	/*
+	 * Check current segment summary by trying to grab journal_rwsem first.
+	 * This sem is on the critical path on the checkpoint requiring the above
+	 * nat_tree_lock. Therefore, we should retry, if we failed to grab here.
+	 */
+	if (!down_read_trylock(&curseg->journal_rwsem)) {
+		up_read(&nm_i->nat_tree_lock);
+		goto retry;
+	}
 
-	/* Check current segment summary */
-	down_read(&curseg->journal_rwsem);
 	i = f2fs_lookup_journal_in_cursum(journal, NAT_JOURNAL, nid, 0);
 	if (i >= 0) {
 		ne = nat_in_journal(journal, i);
-- 
2.32.0.432.gabb21c7263-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
