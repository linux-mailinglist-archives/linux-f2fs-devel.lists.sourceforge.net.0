Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 796241CB463
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 18:11:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jX5ae-0001Vx-95; Fri, 08 May 2020 16:11:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jX5ad-0001Vp-E0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 16:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2oBFHESUV6LZ4ysh1mnwnoclw8pghTfGbTZvip9FZEw=; b=DN4+hTP5zcka0ASq6HLhs7gA7+
 4G6+aJx4LfAsrYp+L3BBbwM5t1YODvwX+LfWCAOnJiolNRvk1x4DnFIQqFz8KIhrksuaSFPtr/UfR
 +ovE8aTG2jFnwM1nU6Q7p3143n7PN3Lg7uM06oct+6lA/aA7cZ87H8BvsiShaa2G3pzY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2oBFHESUV6LZ4ysh1mnwnoclw8pghTfGbTZvip9FZEw=; b=Lggzv7XYZr1M84dhz82Oy2lGIW
 Dc5/VtOvj/GjNCiPvqTmsY/8RjhzyFCPJdm9/m/GC+KLi/4SGpj5tV7M+Hf03/oYE5X39yIxsQrXK
 0onfuZHFS6fpB0rSLWRlQEexPYntM47qJHf0P7jWoylKuYdmhjsUq0s1md5ulkzWKAxY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jX5ab-00CkEm-IJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 16:11:07 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6A6921473;
 Fri,  8 May 2020 16:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588954252;
 bh=CngiETS7U8ogJRzhIAr/EkeUvISa1C5VP4Jj6loUtak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oStbxdglOMtUlQGeVwfj1nbCiFYPbNAyqYsWAckLKAfCrntEbOxHnepG8AU/EuuQP
 S9Ys7M4l6CEpsTsKd7OZ5UgO6WuMZhMM73CLZu+avs+f4q6nDVoC6LcqkOORyGx2m4
 yir+WIq2rwTMo5QWsw757cHq67kWjTtLeBKTFl58=
Date: Fri, 8 May 2020 09:10:52 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sayali Lokhande <sayalil@codeaurora.org>
Message-ID: <20200508161052.GA49579@google.com>
References: <1588244309-1468-1-git-send-email-sayalil@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588244309-1468-1-git-send-email-sayalil@codeaurora.org>
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
X-Headers-End: 1jX5ab-00CkEm-IJ
Subject: Re: [f2fs-dev] [PATCH V4] f2fs: Avoid double lock for cp_rwsem
 during checkpoint
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Sayali,

In order to address the perf regression, how about this?

From 48418af635884803ffb35972df7958a2e6649322 Mon Sep 17 00:00:00 2001
From: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 8 May 2020 09:08:37 -0700
Subject: [PATCH] f2fs: avoid double lock for cp_rwsem during checkpoint

There could be a scenario where f2fs_sync_node_pages gets
called during checkpoint, which in turn tries to flush
inline data and calls iput(). This results in deadlock as
iput() tries to hold cp_rwsem, which is already held at the
beginning by checkpoint->block_operations().

Call stack :

Thread A		Thread B
f2fs_write_checkpoint()
- block_operations(sbi)
 - f2fs_lock_all(sbi);
  - down_write(&sbi->cp_rwsem);

                        - open()
                         - igrab()
                        - write() write inline data
                        - unlink()
- f2fs_sync_node_pages()
 - if (is_inline_node(page))
  - flush_inline_data()
   - ilookup()
     page = f2fs_pagecache_get_page()
     if (!page)
      goto iput_out;
     iput_out:
			-close()
			-iput()
       iput(inode);
       - f2fs_evict_inode()
        - f2fs_truncate_blocks()
         - f2fs_lock_op()
           - down_read(&sbi->cp_rwsem);

Fixes: 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/node.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 1db8cabf727ef..626d7daca09de 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1870,8 +1870,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 				goto continue_unlock;
 			}
 
-			/* flush inline_data */
-			if (is_inline_node(page)) {
+			/* flush inline_data, if it's not sync path. */
+			if (do_balance && is_inline_node(page)) {
 				clear_inline_node(page);
 				unlock_page(page);
 				flush_inline_data(sbi, ino_of_node(page));
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
