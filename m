Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B52AE228C68
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 01:01:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jy1GC-0007gf-HW; Tue, 21 Jul 2020 23:01:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jy1GB-0007gW-46
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 23:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FSadQW/F/bTxXKUZClyPNiRPC/AfqeYKG+f9NuleUak=; b=TF5C+ir1iGfZ2AUBspnE1r4r/8
 yZEAU5ruYfHL6DKNTPuoBkVlMEXYusWC1UsmB3Hkp3x5hioBa5gQ6cxcXza9bU4hwyVeo+xsUTVcm
 /4/51N75kd1BZ2OnPaeT6FmJxUdBWLvZne5R/RugJcprqCw8RMtbqHf7/4ZDFFh6Fo8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FSadQW/F/bTxXKUZClyPNiRPC/AfqeYKG+f9NuleUak=; b=PotzS/ZDMFGuICUD7baIiP+Klv
 Jahk8CWbY1N73ZRCsjgNdUZk2rgrTzW5XPvglu58sZY8SbNVHPIMtG+YzXXPc4jR15Y/iDlw9RjPS
 srpzWI/eTjHlo+EsC5Xlbmpm79T4+xBUA90uH1KGdUwid0dExBiFQPUqoF3xuOLc1FMg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jy1GA-00CimD-0D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 23:01:19 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 359C42080D;
 Tue, 21 Jul 2020 23:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595372460;
 bh=bm/93v1WSvC6J93NR1nVeFT9ERB8Qnq16lzUB1BPqPE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yTeekrEWE34bWmgyoc8iAznT5bvWxJDueciA3ij6RH6rLKNuOnEk0MOy7iokq1aFB
 RuBNvzBsxiqhd7gPu+ZphlSWCK0lXcg6Pxg9KqXbYpGT8njiwXoXfX+quheoo8oXmE
 bhMmzYGK06j+1a+jUGVTDO7CMxfvYQHgh4nIFytI=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 21 Jul 2020 15:59:20 -0700
Message-Id: <20200721225920.114347-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200721225920.114347-1-ebiggers@kernel.org>
References: <20200721225920.114347-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jy1GA-00CimD-0D
Subject: [f2fs-dev] [PATCH 5/5] fs-verity: use smp_load_acquire() for
 ->i_verity_info
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Normally smp_store_release() or cmpxchg_release() is paired with
smp_load_acquire().  Sometimes smp_load_acquire() can be replaced with
the more lightweight READ_ONCE().  However, for this to be safe, all the
published memory must only be accessed in a way that involves the
pointer itself.  This may not be the case if allocating the object also
involves initializing a static or global variable, for example.

fsverity_info::tree_params.hash_alg->tfm is a crypto_ahash object that's
internal to and is allocated by the crypto subsystem.  So by using
READ_ONCE() for ->i_verity_info, we're relying on internal
implementation details of the crypto subsystem.

Remove this fragile assumption by using smp_load_acquire() instead.

Also fix the cmpxchg logic to correctly execute an ACQUIRE barrier when
losing the cmpxchg race, since cmpxchg doesn't guarantee a memory
barrier on failure.

(Note: I haven't seen any real-world problems here.  This change is just
fixing the code to be guaranteed correct and less fragile.)

Fixes: fd2d1acfcadf ("fs-verity: add the hook for file ->open()")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/open.c         | 15 ++++++++++++---
 include/linux/fsverity.h |  9 +++++++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/fs/verity/open.c b/fs/verity/open.c
index d007db0c9304..bfe0280c14e4 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -221,11 +221,20 @@ struct fsverity_info *fsverity_create_info(const struct inode *inode,
 void fsverity_set_info(struct inode *inode, struct fsverity_info *vi)
 {
 	/*
-	 * Multiple processes may race to set ->i_verity_info, so use cmpxchg.
-	 * This pairs with the READ_ONCE() in fsverity_get_info().
+	 * Multiple tasks may race to set ->i_verity_info, so use
+	 * cmpxchg_release().  This pairs with the smp_load_acquire() in
+	 * fsverity_get_info().  I.e., here we publish ->i_verity_info with a
+	 * RELEASE barrier so that other tasks can ACQUIRE it.
 	 */
-	if (cmpxchg(&inode->i_verity_info, NULL, vi) != NULL)
+	if (cmpxchg_release(&inode->i_verity_info, NULL, vi) != NULL) {
+		/* Lost the race, so free the fsverity_info we allocated. */
 		fsverity_free_info(vi);
+		/*
+		 * Afterwards, the caller may access ->i_verity_info directly,
+		 * so make sure to ACQUIRE the winning fsverity_info.
+		 */
+		(void)fsverity_get_info(inode);
+	}
 }
 
 void fsverity_free_info(struct fsverity_info *vi)
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 78201a6d35f6..c1144a450392 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -115,8 +115,13 @@ struct fsverity_operations {
 
 static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
 {
-	/* pairs with the cmpxchg() in fsverity_set_info() */
-	return READ_ONCE(inode->i_verity_info);
+	/*
+	 * Pairs with the cmpxchg_release() in fsverity_set_info().
+	 * I.e., another task may publish ->i_verity_info concurrently,
+	 * executing a RELEASE barrier.  We need to use smp_load_acquire() here
+	 * to safely ACQUIRE the memory the other task published.
+	 */
+	return smp_load_acquire(&inode->i_verity_info);
 }
 
 /* enable.c */
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
