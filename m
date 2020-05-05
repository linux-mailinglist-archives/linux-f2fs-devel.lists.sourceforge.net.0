Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 760B71C6241
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 May 2020 22:49:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jW4Ur-0005XS-GA; Tue, 05 May 2020 20:48:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jW4Uq-0005XK-NL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 20:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2I1WYjCGCKdXN3P6f35TzPRl0gi9R6hQZR9nci49ZLc=; b=U1iKFwPkoem3RulG6FiDDoXn05
 dXKmBBLgBJMfX9O1fI0iETnZJe7hJ5CKiHPf0odwknpoSKSiboczYSkGn7Tfd5C34ZbF2C+QGbOsD
 UElzi6sONhe35f82prIpBhsfQbWvCeBXqrU/Ms5MRYTQhiphs63WLxGK9J4QO9WIG5Dc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2I1WYjCGCKdXN3P6f35TzPRl0gi9R6hQZR9nci49ZLc=; b=Y
 ViK879e78+vfxjme8LOF/QA65fQLPGs4BFCxGbzmdjzjDxASX0/XojKnSM0ICGK8ZlbpNa3s3NwY0
 s/l2z1VgI1PILjxT5YQ8INSD/KWSPVWLoS2sqmU09xAh3aEAT+WAiRuL20PcSMJEs9cBG0uWIacBT
 DIRzRuLK+8maAbhw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jW4Um-00BoMU-D5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 20:48:56 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9BE4206B8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 May 2020 20:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588711721;
 bh=aHxOENTyvBlM8KstbbPdjrVGwV1MzNw0lHP5MueNGCo=;
 h=From:To:Subject:Date:From;
 b=szErmoi4uLZc9iYIqW/uIH6LbV5zuQWIYDqzlgU7fuX1efKywuocZgDVQV0y2WNGx
 6Bv3Ot+6Jok2StH6Mzo+4nyZVdRCXD0CnYbxcGuzjh9ayUQsaZPSa10+CB7e4ZoObB
 oCyCiYNlCshW+S0khfb4gglgySnoz/zHwfmc6ocE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  5 May 2020 13:48:23 -0700
Message-Id: <20200505204823.211214-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
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
X-Headers-End: 1jW4Um-00BoMU-D5
Subject: [f2fs-dev] [PATCH] f2fs: don't return vmalloc() memory from
 f2fs_kmalloc()
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

From: Eric Biggers <ebiggers@google.com>

kmalloc() returns kmalloc'ed memory, and kvmalloc() returns either
kmalloc'ed or vmalloc'ed memory.  But the f2fs wrappers, f2fs_kmalloc()
and f2fs_kvmalloc(), both return both kinds of memory.

It's redundant to have two functions that do the same thing, and also
breaking the standard naming convention is causing bugs since people
assume it's safe to kfree() memory allocated by f2fs_kmalloc().  See
e.g. the various allocations in fs/f2fs/compress.c.

Fix this by making f2fs_kmalloc() just use kmalloc().  And to avoid
re-introducing the allocation failures that the vmalloc fallback was
intended to fix, convert the largest allocations to use f2fs_kvmalloc().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/checkpoint.c | 4 ++--
 fs/f2fs/f2fs.h       | 8 +-------
 fs/f2fs/node.c       | 8 ++++----
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 97b6378554b406..ac5b47f15f5e77 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -895,8 +895,8 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
 	int i;
 	int err;
 
-	sbi->ckpt = f2fs_kzalloc(sbi, array_size(blk_size, cp_blks),
-				 GFP_KERNEL);
+	sbi->ckpt = f2fs_kvzalloc(sbi, array_size(blk_size, cp_blks),
+				  GFP_KERNEL);
 	if (!sbi->ckpt)
 		return -ENOMEM;
 	/*
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d036a31a97e84e..bc4c5b9b1bf14c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2953,18 +2953,12 @@ static inline bool f2fs_may_extent_tree(struct inode *inode)
 static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
 					size_t size, gfp_t flags)
 {
-	void *ret;
-
 	if (time_to_inject(sbi, FAULT_KMALLOC)) {
 		f2fs_show_injection_info(sbi, FAULT_KMALLOC);
 		return NULL;
 	}
 
-	ret = kmalloc(size, flags);
-	if (ret)
-		return ret;
-
-	return kvmalloc(size, flags);
+	return kmalloc(size, flags);
 }
 
 static inline void *f2fs_kzalloc(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 4da0d8713df5cb..e660af55565c61 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2934,7 +2934,7 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
 		return 0;
 
 	nm_i->nat_bits_blocks = F2FS_BLK_ALIGN((nat_bits_bytes << 1) + 8);
-	nm_i->nat_bits = f2fs_kzalloc(sbi,
+	nm_i->nat_bits = f2fs_kvzalloc(sbi,
 			nm_i->nat_bits_blocks << F2FS_BLKSIZE_BITS, GFP_KERNEL);
 	if (!nm_i->nat_bits)
 		return -ENOMEM;
@@ -3067,9 +3067,9 @@ static int init_free_nid_cache(struct f2fs_sb_info *sbi)
 	int i;
 
 	nm_i->free_nid_bitmap =
-		f2fs_kzalloc(sbi, array_size(sizeof(unsigned char *),
-					     nm_i->nat_blocks),
-			     GFP_KERNEL);
+		f2fs_kvzalloc(sbi, array_size(sizeof(unsigned char *),
+					      nm_i->nat_blocks),
+			      GFP_KERNEL);
 	if (!nm_i->free_nid_bitmap)
 		return -ENOMEM;
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
