Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 927451CC3E1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 May 2020 21:04:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jXUlT-0008Mu-1K; Sat, 09 May 2020 19:03:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jXUlR-0008Mg-KY
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 May 2020 19:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/0UwBeJLtFp8x8MzqU+5El1MI18/UzR9qLaInf5N9KU=; b=B/18gqSQdmmNti/d9vkXR006X4
 ZiZqe81l/ULXFcKhQtb5tgxqaKMyhjirM479Ts8bBQFtdldSN7tnBihZfX5w0jrQbReHqkWiJTk+H
 MbB++YMttx8RMeIjj6dLcrA+p1Kt5JO0mwvW4H7Rozh1VLJdFKjey9BviZ0zARHuD/yo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/0UwBeJLtFp8x8MzqU+5El1MI18/UzR9qLaInf5N9KU=; b=mguN+26yh9vltb3X8lqfRnL5CD
 94LNuAC3R3OE5WfYnMfQETDL2b1OLIUDWujv4wXm641fQ5PsfNJR68cewqoyus6KjGhKeQE/vxOrF
 JaKW197otmmr1iaFyD94WeVhXGZn6fLT4hJFOIJiAdWRDFHV2x/1T9+Ed3JRS/PGRyU0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jXUlP-005W4V-L9
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 May 2020 19:03:57 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC1CE206B9;
 Sat,  9 May 2020 19:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589051022;
 bh=lODxQLx7dBie1ZnMhupf2FdHGusr1dQe5rGiRUF3Jo0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LTjMTwNBOj/mfAdp1oULKrXa5F6uVH+VTd9N383SHsYike6cDsqCcW4YzqSI8KzII
 3Wuc41WLdW8xahlJNdN9WAUML9Me44/zhOy9Jddo7QgPUlZ26b7mvhiZwqf3+l/wDu
 NGpd+SuvMsIZ7kXkPfwLyBehqvML72jly2TMeM+o=
Date: Sat, 9 May 2020 12:03:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200509190342.GA11239@google.com>
References: <1588244309-1468-1-git-send-email-sayalil@codeaurora.org>
 <20200508161052.GA49579@google.com>
 <0902037e-998d-812e-53e7-90ea7b9957eb@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0902037e-998d-812e-53e7-90ea7b9957eb@huawei.com>
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
X-Headers-End: 1jXUlP-005W4V-L9
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

On 05/09, Chao Yu wrote:
> On 2020/5/9 0:10, Jaegeuk Kim wrote:
> > Hi Sayali,
> > 
> > In order to address the perf regression, how about this?
> > 
> >>From 48418af635884803ffb35972df7958a2e6649322 Mon Sep 17 00:00:00 2001
> > From: Jaegeuk Kim <jaegeuk@kernel.org>
> > Date: Fri, 8 May 2020 09:08:37 -0700
> > Subject: [PATCH] f2fs: avoid double lock for cp_rwsem during checkpoint
> > 
> > There could be a scenario where f2fs_sync_node_pages gets
> > called during checkpoint, which in turn tries to flush
> > inline data and calls iput(). This results in deadlock as
> > iput() tries to hold cp_rwsem, which is already held at the
> > beginning by checkpoint->block_operations().
> > 
> > Call stack :
> > 
> > Thread A		Thread B
> > f2fs_write_checkpoint()
> > - block_operations(sbi)
> >  - f2fs_lock_all(sbi);
> >   - down_write(&sbi->cp_rwsem);
> > 
> >                         - open()
> >                          - igrab()
> >                         - write() write inline data
> >                         - unlink()
> > - f2fs_sync_node_pages()
> >  - if (is_inline_node(page))
> >   - flush_inline_data()
> >    - ilookup()
> >      page = f2fs_pagecache_get_page()
> >      if (!page)
> >       goto iput_out;
> >      iput_out:
> > 			-close()
> > 			-iput()
> >        iput(inode);
> >        - f2fs_evict_inode()
> >         - f2fs_truncate_blocks()
> >          - f2fs_lock_op()
> >            - down_read(&sbi->cp_rwsem);
> > 
> > Fixes: 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
> > Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/node.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index 1db8cabf727ef..626d7daca09de 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -1870,8 +1870,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
> >  				goto continue_unlock;
> >  			}
> >  
> > -			/* flush inline_data */
> > -			if (is_inline_node(page)) {
> > +			/* flush inline_data, if it's not sync path. */
> > +			if (do_balance && is_inline_node(page)) {
> 
> IIRC, this flow was designed to avoid running out of free space issue
> during checkpoint:
> 
> 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
> 
> The sceanrio is:
> 1. create fully node blocks
> 2. flush node blocks
> 3. write inline_data for all the node blocks again
> 4. flush node blocks redundantly
> 
> I guess this may cause failing one case of fstest.

Yeah, actually I was hitting 204 failure, and thus, revised like this.
Now, I don't see any regression in fstest.

From 8f1882acfb0a5fc43e5a2bbd576a8f3c681a7d2c Mon Sep 17 00:00:00 2001
From: Sayali Lokhande <sayalil@codeaurora.org>
Date: Thu, 30 Apr 2020 16:28:29 +0530
Subject: [PATCH] f2fs: Avoid double lock for cp_rwsem during checkpoint

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
 fs/f2fs/checkpoint.c |  9 ++++++++-
 fs/f2fs/f2fs.h       |  4 ++--
 fs/f2fs/node.c       | 10 +++++-----
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index d49f7a01d8a26..928aea4ff663d 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1168,6 +1168,12 @@ static int block_operations(struct f2fs_sb_info *sbi)
 	};
 	int err = 0, cnt = 0;
 
+	/*
+	 * Let's flush node pages first to flush inline_data.
+	 * We'll actually guarantee everything below under f2fs_lock_all.
+	 */
+	f2fs_sync_node_pages(sbi, &wbc, false, false, FS_CP_NODE_IO);
+
 retry_flush_quotas:
 	f2fs_lock_all(sbi);
 	if (__need_flush_quota(sbi)) {
@@ -1222,7 +1228,8 @@ static int block_operations(struct f2fs_sb_info *sbi)
 	if (get_pages(sbi, F2FS_DIRTY_NODES)) {
 		up_write(&sbi->node_write);
 		atomic_inc(&sbi->wb_sync_req[NODE]);
-		err = f2fs_sync_node_pages(sbi, &wbc, false, FS_CP_NODE_IO);
+		err = f2fs_sync_node_pages(sbi, &wbc, false,
+					true, FS_CP_NODE_IO);
 		atomic_dec(&sbi->wb_sync_req[NODE]);
 		if (err) {
 			up_write(&sbi->node_change);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d916540f12813..ac6ae42b9dd4e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3286,8 +3286,8 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			struct writeback_control *wbc, bool atomic,
 			unsigned int *seq_id);
 int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
-			struct writeback_control *wbc,
-			bool do_balance, enum iostat_type io_type);
+		struct writeback_control *wbc,
+		bool do_balance, bool sync, enum iostat_type io_type);
 int f2fs_build_free_nids(struct f2fs_sb_info *sbi, bool sync, bool mount);
 bool f2fs_alloc_nid(struct f2fs_sb_info *sbi, nid_t *nid);
 void f2fs_alloc_nid_done(struct f2fs_sb_info *sbi, nid_t nid);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 1db8cabf727ef..fd00a8c119088 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1808,8 +1808,8 @@ static bool flush_dirty_inode(struct page *page)
 }
 
 int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
-				struct writeback_control *wbc,
-				bool do_balance, enum iostat_type io_type)
+			struct writeback_control *wbc,
+			bool do_balance, bool sync, enum iostat_type io_type)
 {
 	pgoff_t index;
 	struct pagevec pvec;
@@ -1870,8 +1870,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 				goto continue_unlock;
 			}
 
-			/* flush inline_data */
-			if (is_inline_node(page)) {
+			/* flush inline_data, if it's async context. */
+			if (!sync && is_inline_node(page)) {
 				clear_inline_node(page);
 				unlock_page(page);
 				flush_inline_data(sbi, ino_of_node(page));
@@ -1999,7 +1999,7 @@ static int f2fs_write_node_pages(struct address_space *mapping,
 
 	diff = nr_pages_to_write(sbi, NODE, wbc);
 	blk_start_plug(&plug);
-	f2fs_sync_node_pages(sbi, wbc, true, FS_NODE_IO);
+	f2fs_sync_node_pages(sbi, wbc, true, false, FS_NODE_IO);
 	blk_finish_plug(&plug);
 	wbc->nr_to_write = max((long)0, wbc->nr_to_write - diff);
 
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
