Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8573D30F0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 02:39:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6jDl-000536-6c; Fri, 23 Jul 2021 00:39:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m6jDk-00052v-7O
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 00:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U42Bfn8YbMnv0Q6fcrQdXLSWJlV3du1+/2468fvjrDs=; b=PXSIeWkcbM1Kfok8E4hCMtxuUJ
 Vo66ir0U1nT2JzGe9lJ7kgJVUO1gWfYoJz18vg472e9HEfQX1smrO5Ggk+JPqGlkbVhVVBj++dar2
 C0l22eifN1mO7vmyVPsvuowRCNU9wAXU0YoIJOr+i0SLl7n+yQcgwdyYO8tN+be890VE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U42Bfn8YbMnv0Q6fcrQdXLSWJlV3du1+/2468fvjrDs=; b=SqUAIwOiY9c2BY1Hc2swTYTGf+
 88Af0s92hhtbhHpOjAL8lqm4Bb1+grJn/cLdTCmy5pkzO9CfQS0XPtPRqTG8fKyN3eboH72MshM7n
 Tnz7XFRAKA1EN1Ox55zcO1kNLimIdZZvFJOCOak6+kaSpiTQpGpG6XNZd1d+iReNfQbM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6jDe-00HLpQ-0V
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 00:39:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F4DF60EB0;
 Fri, 23 Jul 2021 00:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627000743;
 bh=w6d0ememMNzqQ4orGdbf+c+bf4YvhmCQiSDhVd0wOPE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=QWMyIIVxshyVup1WnAZgZ+tsIDbD9ynjCil6HSJLnp5sXmjLV/W1GLbr+L0jJOyd5
 NHoHRGdW3skI+hVTQVAt0KqeeMOkjhtFnkUNx4HoEYwgI6//6l/DEeV/0YAWAiVYR9
 A9VG8/q5Jf/F4M+XVr5q3a+UoLFwrkmbeKA8KVwNGfNbettttcTOKgchm3JJDBLafP
 ys4B+8TYNWpgl4+m9K7dJ0kC8rDe35UnK/clOBk9qoBkqViXj6M29Ekw1hrOg8Yau3
 3pwAGAea7v4K9i8HaEP8HxkLQKHB9ZTkmuT4Jb7xakyCYKk8PEpRMWr4I23plB0rD1
 PGFDGQb0l4NEw==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210722014149.525166-1-jaegeuk@kernel.org>
 <YPmufPvn9FJXfcip@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <ff0e3bdf-d5e4-8709-6d6b-c8d36b57b828@kernel.org>
Date: Fri, 23 Jul 2021 08:39:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YPmufPvn9FJXfcip@google.com>
Content-Language: en-US
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
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6jDe-00HLpQ-0V
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/23 1:44, Jaegeuk Kim wrote:
> This tries to fix priority inversion in the below condition resulting in
> long checkpoint delay.
> 
> f2fs_get_node_info()
>   - nat_tree_lock
>    -> sleep to grab journal_rwsem by contention
> 
>                                       checkpoint
>                                       - waiting for nat_tree_lock
> 
> In order to let checkpoint go, let's release nat_tree_lock, if there's a
> journal_rwsem contention.

Write lock of nat_tree_lock is held from many places, how about just
retrying unlock/lock only if checkpoint() is flushing nat blocks?

---
  fs/f2fs/f2fs.h | 1 +
  fs/f2fs/node.c | 8 ++++++--
  2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ad8f99d7235f..05f41a15fda4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -877,6 +877,7 @@ struct f2fs_nm_info {
  	spinlock_t nat_list_lock;	/* protect clean nat entry list */
  	unsigned int nat_cnt[MAX_NAT_STATE]; /* the # of cached nat entries */
  	unsigned int nat_blocks;	/* # of nat blocks */
+	bool flushing_nat;		/* indicate checkpoint() is flushing nat blocks */

  	/* free node ids management */
  	struct radix_tree_root free_nid_root;/* root of the free_nid cache */
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index c60ba4179bb2..2caa171a68f8 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -569,7 +569,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
  	 * This sem is on the critical path on the checkpoint requiring the above
  	 * nat_tree_lock. Therefore, we should retry, if we failed to grab here.
  	 */
-	if (!down_read_trylock(&curseg->journal_rwsem)) {
+	if (!down_read_trylock(&curseg->journal_rwsem) && nm_i->flushing_nat) {
  		up_read(&nm_i->nat_tree_lock);
  		goto retry;
  	}
@@ -2981,6 +2981,8 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
  	LIST_HEAD(sets);
  	int err = 0;

+	nm_i->flushing_nat = true;
+
  	/*
  	 * during unmount, let's flush nat_bits before checking
  	 * nat_cnt[DIRTY_NAT].
@@ -2992,7 +2994,7 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
  	}

  	if (!nm_i->nat_cnt[DIRTY_NAT])
-		return 0;
+		goto out;

  	down_write(&nm_i->nat_tree_lock);

@@ -3026,6 +3028,8 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
  	up_write(&nm_i->nat_tree_lock);
  	/* Allow dirty nats by node block allocation in write_begin */

+out:
+	nm_i->flushing_nat = false;
  	return err;
  }

-- 
2.22.1




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
