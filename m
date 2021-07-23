Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5913D33BB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 06:28:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6mmv-0007Qg-2n; Fri, 23 Jul 2021 04:27:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1m6mmt-0007QZ-Pt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 04:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xDcAUVCzw82O3btn3TMr+/l/TFQ5VodEzkcyj6On2Fw=; b=VFo2P6A163kZuymOfhd9wX0laV
 +6V+hOwCvI/fhBDA3erxogsIJwBAANQXd56k3sTIUuHljppzLMdz27fq/+jYnFQIkjbzBzA0Zm72t
 0VJLe58I6IFqbTnAOYS8dGaHwX7ylyrHxprHO3dYWEOEr7QwvXKASOyxlDi79TS7h8UY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xDcAUVCzw82O3btn3TMr+/l/TFQ5VodEzkcyj6On2Fw=; b=iJ+DSeeTWJ/wYgZ334SjU7XUIk
 CJsAJYgBobiICSvlG09EXfEebac1lYjxs2kw7fYNPI7Edtjq6hT3qHB60NRtDjHrLaJnVkMqf+602
 4jiaE/TATyUe4yinZotjwi4Q6F5+azYUesqehwv+sQphsb2ByuRlYWhQF7L9eu4ZnqQ0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6mmk-00HVK9-CA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 04:27:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05FFF60E8E;
 Fri, 23 Jul 2021 04:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627014452;
 bh=4AJtrL5EuFvtcmtmky/U4ejUKlCr3swf/oxZOxyr6aI=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Q45twTiT/2jXymp9Xj6GP2lrkfi801xtC6RkmiTArDxQ67+Gp9RMoRPbOZQL7C9rd
 TqbYEjczWge6siHnU5wKB9tZCqlY/HLfe4ZObqz4t9OpJWMS9HD+JlU66EQBbO4wZ/
 kIBaE47XiEo9I/ohWHflTsIjQEpMOit43qbcBz2lznkLQPWiRfGjIRDqLe50tv7p5t
 EX3zhbAV601LhsSqkYujoX7ftNErD9srSauXuelFzxFSz9l7CHFZt+wNKHeuGRdkj1
 FdXPkMASfobIPCXNcVLwXTrp4W3CrGd5Vu5wwR+jhIX8Ba96JeXBx8xHJ2xAqVTuV3
 1gNdn+0nzSc3g==
Date: Thu, 22 Jul 2021 21:27:30 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YPpFMh0dDLStNTFH@google.com>
References: <20210722014149.525166-1-jaegeuk@kernel.org>
 <YPmufPvn9FJXfcip@google.com> <YPorDEwJcW3bi4DF@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPorDEwJcW3bi4DF@google.com>
X-Spam-Score: -1.5 (-)
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
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6mmk-00HVK9-CA
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: don't sleep while grabing
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

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v3:
  - fix wrong condition check

 fs/f2fs/node.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 0be9e2d7120e..c945a9730f3c 100644
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
@@ -564,10 +564,19 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 		return 0;
 	}
 
-	memset(&ne, 0, sizeof(struct f2fs_nat_entry));
+	/*
+	 * Check current segment summary by trying to grab journal_rwsem first.
+	 * This sem is on the critical path on the checkpoint requiring the above
+	 * nat_tree_lock. Therefore, we should retry, if we failed to grab here
+	 * while not bothering checkpoint.
+	 */
+	if (!rwsem_is_locked(&sbi->cp_global_sem)) {
+		down_read(&curseg->journal_rwsem);
+	} else if (!down_read_trylock(&curseg->journal_rwsem)) {
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
