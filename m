Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E270D686227
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Feb 2023 09:53:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pN8rx-0003KA-Gl;
	Wed, 01 Feb 2023 08:53:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pN8rn-0003Gu-LF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 08:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ccr7l7oXO3E2e1MsLcgdq3OqEhS3zPibPpVAE2XaTU=; b=bV1wgthnwrF0JS/pZbwL/rDYPg
 uxLk7dlnKIOjVTPfMGjIAwmJlesiTQS3yaa8Jrtu8vWhpy413ok+kOmzRoYLqHZZJl4HlrZ1WPmnl
 7VhfTrHTu8QOTpLuuGvGu1J6SbAdGmrT1685reJqOtbO8Lcdg84DElF8TO1hYXEClotk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7ccr7l7oXO3E2e1MsLcgdq3OqEhS3zPibPpVAE2XaTU=; b=guCKPDCghOC9hXAOpQpKEgovd1
 LzJWhgrgSgPAZNOTnKZEnfjQXa2K4UmTTtdUOUzXF7tTCVV9jgFkVArXfA05QGfp+F+4V0H9XYC6R
 2dChFXXgHa9ePVlQBcvs+1+MKukBXCaf5+U/TO+sWHQ/CHmCItvYllqH6H0Jy7QOQxV0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pN8rh-0003yV-JC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 08:53:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8687B8214A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  1 Feb 2023 08:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86101C433D2;
 Wed,  1 Feb 2023 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675241584;
 bh=bZR5dqM0wjHCquD3EtHxUWoP8ci01PMdB093XjUMwZY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mI+Zpv5YhPDmzM+6/GUSF52juc8yDu/rCM9Ug9XLv37Mfda1xIy3G/JPdlHP0GFDR
 Gf5eeu+uKfPY4WefM01ro+qxHmVh8vUb7Ppvc9w4LPJqHj0p9+ltOoDe/cemTSt517
 Di2YLelPWA4is7EVZ5TPS9ryL8LdKDsGowt+ewcoUALvFAcHbqIULF8UMZjxtEljCX
 y0fAzqYvBJZ1oiMz1kw9odBPj+3RubfnfM3dTyg8QyxVCu3TjprbMrxxnkfPw6OXFW
 rryQMjkM8Efcop14vcfiOhc7eSi5Cw7gWvfGbwdRVs0BrEnTr/HIFGjPiUVS2Qp08Z
 DSnuazG6rqlaw==
Message-ID: <a27b1135-757f-9609-1511-7c6738887472@kernel.org>
Date: Wed, 1 Feb 2023 16:53:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230131144701.34418-1-chao@kernel.org>
 <Y9lkeVCMRA9goN2E@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y9lkeVCMRA9goN2E@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/1 2:56, Jaegeuk Kim wrote: > I wanted to avoid a
 deep if/else statement. So how about this: From
 418b408420367ac5491c97a7c4d26e3d0e68ea57
 Mon Sep 17 00:00:00 2001 From: Chao Yu <chao@kernel.org> Date: Tue, 31 Jan
 2023 22:46:59 +0800 Subject: [PATCH v2] f2fs: clean up __update_extent_tree_ra
 [...] Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pN8rh-0003yV-JC
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: clean up
 __update_extent_tree_range()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/2/1 2:56, Jaegeuk Kim wrote:
> I wanted to avoid a deep if/else statement.

So how about this:

 From 418b408420367ac5491c97a7c4d26e3d0e68ea57 Mon Sep 17 00:00:00 2001
From: Chao Yu <chao@kernel.org>
Date: Tue, 31 Jan 2023 22:46:59 +0800
Subject: [PATCH v2] f2fs: clean up __update_extent_tree_range()

Introduce __update_read_extent_cache() and __update_age_extent_cache()
to clean up __update_extent_tree_range(), no logic change.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2
- introduce __update_read_extent_cache() and __update_age_extent_cache()
to avoid a deep if/else statement in __update_extent_tree_range().
  fs/f2fs/extent_cache.c | 116 +++++++++++++++++++++++++++--------------
  1 file changed, 77 insertions(+), 39 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index d70ad6a44cbf..887b0b2898b9 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -666,6 +666,75 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
  	return en;
  }

+static inline bool __update_read_extent_cache(struct inode *inode,
+					struct extent_info *tei,
+					struct extent_info *ei,
+					struct extent_info *dei,
+					struct extent_info *prev,
+					unsigned int fofs, unsigned int len,
+					struct extent_node *prev_en,
+					struct extent_node *next_en,
+					struct rb_node **insert_p,
+					struct rb_node *insert_parent,
+					bool leftmost)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
+
+	if (!tei->blk)
+		return false;
+
+	__set_extent_info(ei, fofs, len, tei->blk, false,
+			  0, 0, EX_READ);
+	if (!__try_merge_extent_node(sbi, et, ei,
+					prev_en, next_en))
+		__insert_extent_tree(sbi, et, ei,
+			insert_p, insert_parent, leftmost);
+
+	/* give up read extent cache, if split and small updates happen */
+	if (dei->len >= 1 &&
+			prev->len < F2FS_MIN_EXTENT_LEN &&
+			et->largest.len < F2FS_MIN_EXTENT_LEN) {
+		et->largest.len = 0;
+		et->largest_updated = true;
+		set_inode_flag(inode, FI_NO_EXTENT);
+	}
+
+	if (is_inode_flag_set(inode, FI_NO_EXTENT))
+		__free_extent_tree(sbi, et);
+
+	if (et->largest_updated) {
+		et->largest_updated = false;
+		return true;
+	}
+
+	return false;
+}
+
+static inline void __update_age_extent_cache(struct inode *inode,
+					struct extent_info *tei,
+					struct extent_info *ei,
+					unsigned int fofs, unsigned int len,
+					struct extent_node *prev_en,
+					struct extent_node *next_en,
+					struct rb_node **insert_p,
+					struct rb_node *insert_parent,
+					bool leftmost)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_BLOCK_AGE];
+
+	if (!tei->last_blocks)
+		return;
+
+	__set_extent_info(ei, fofs, len, 0, false,
+		tei->age, tei->last_blocks, EX_BLOCK_AGE);
+	if (!__try_merge_extent_node(sbi, et, ei,
+					prev_en, next_en))
+		__insert_extent_tree(sbi, et, ei,
+			insert_p, insert_parent, leftmost);
+}
+
  static void __update_extent_tree_range(struct inode *inode,
  			struct extent_info *tei, enum extent_type type)
  {
@@ -782,47 +851,16 @@ static void __update_extent_tree_range(struct inode *inode,
  		en = next_en;
  	}

-	if (type == EX_BLOCK_AGE)
-		goto update_age_extent_cache;
-
-	/* 3. update extent in read extent cache */
-	BUG_ON(type != EX_READ);
-
-	if (tei->blk) {
-		__set_extent_info(&ei, fofs, len, tei->blk, false,
-				  0, 0, EX_READ);
-		if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
-			__insert_extent_tree(sbi, et, &ei,
+	/* 3. update extent in extent cache */
+	if (type == EX_READ)
+		updated = __update_read_extent_cache(inode, tei, &ei, &dei,
+					&prev, fofs, len, prev_en, next_en,
  					insert_p, insert_parent, leftmost);
-
-		/* give up extent_cache, if split and small updates happen */
-		if (dei.len >= 1 &&
-				prev.len < F2FS_MIN_EXTENT_LEN &&
-				et->largest.len < F2FS_MIN_EXTENT_LEN) {
-			et->largest.len = 0;
-			et->largest_updated = true;
-			set_inode_flag(inode, FI_NO_EXTENT);
-		}
-	}
-
-	if (is_inode_flag_set(inode, FI_NO_EXTENT))
-		__free_extent_tree(sbi, et);
-
-	if (et->largest_updated) {
-		et->largest_updated = false;
-		updated = true;
-	}
-	goto out_read_extent_cache;
-update_age_extent_cache:
-	if (!tei->last_blocks)
-		goto out_read_extent_cache;
-
-	__set_extent_info(&ei, fofs, len, 0, false,
-			tei->age, tei->last_blocks, EX_BLOCK_AGE);
-	if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
-		__insert_extent_tree(sbi, et, &ei,
+	else if (type == EX_BLOCK_AGE)
+		__update_age_extent_cache(inode, tei, &ei,
+					fofs, len, prev_en, next_en,
  					insert_p, insert_parent, leftmost);
-out_read_extent_cache:
+
  	write_unlock(&et->lock);

  	if (updated)
-- 
2.25.1

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
