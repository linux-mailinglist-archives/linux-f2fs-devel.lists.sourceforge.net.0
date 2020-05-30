Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B86611E8CF4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2020 03:49:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jeqd4-0007pV-AZ; Sat, 30 May 2020 01:49:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jeqd3-0007pO-3i
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 01:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=88jCXc3EuAexCY4iksBBEbK1cBktwp12ShhYzkJhUoU=; b=DTCD2KO662IJmuQTvqZFhy56Zb
 Ff2bvH6bh8MzzIOnO2c9utLU/OwFyMRZCHH7QmzNx7jp3/ogJBFpAdXJoJ9oZqrdYOqMvLueO7Yht
 SQjDDg7k6Cr46ksGnQQfjaPjfLAQlT17UiaMHU+Po2NVbd7i7f/J/xiWzfQUkNQwVulc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=88jCXc3EuAexCY4iksBBEbK1cBktwp12ShhYzkJhUoU=; b=FvBq5LciIoIim35YrKEkvGDcjB
 Pday1gEKd47+wNa1czDCIJ9k3LxXyPtEcM8UjUhblYsqDRXesrtFsUi2hfFh+JnWHl0+UU31P9Mba
 Ge2vTcy4CFMxlqf8yCMXxr+J1PpkEBKqbuFDG4PwE2A5awREq5oiVwt/DM6r+aKl/G6o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jeqcz-000P0Q-I3
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 01:49:41 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34DBE2075A;
 Sat, 30 May 2020 01:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590803367;
 bh=BIqHsLS0l8dGN8SLFgIgF41GvrgmvFj89GJ0W/GH6AY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZgFhjOA2Tg/cDAaLjTfNaZqzCG2tESxAefx1PLDVuEm3NQSd5SWvnA7gwlEPA4J9E
 6u8M83SyAx6okIHexmh9qmllwAUBM37YDlX/Ag5b5b9WHN7vB+equLefOWuCQeYZkr
 76YCSaWzFbP/Oeb7WML8UZHghJnGO5pgS3mb6uGo=
Date: Fri, 29 May 2020 18:49:26 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200530014926.GA39950@google.com>
References: <20200529092947.7890-1-yuchao0@huawei.com>
 <20200529223426.GA249109@google.com>
 <96ba756e-a354-1ee8-689e-211f63c294e6@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96ba756e-a354-1ee8-689e-211f63c294e6@huawei.com>
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
X-Headers-End: 1jeqcz-000P0Q-I3
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: fix quota_sync failure due to
 f2fs_lock_op"
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

On 05/30, Chao Yu wrote:
> On 2020/5/30 6:34, Jaegeuk Kim wrote:
> > On 05/29, Chao Yu wrote:
> >> Under heavy fsstress, we may triggle panic while issuing discard,
> >> because __check_sit_bitmap() detects that discard command may earse
> >> valid data blocks, the root cause is as below race stack described,
> >> since we removed lock when flushing quota data, quota data writeback
> >> may race with write_checkpoint(), so that it causes inconsistency in
> >> between cached discard entry and segment bitmap.
> >>
> >> - f2fs_write_checkpoint
> >>  - block_operations
> >>   - set_sbi_flag(sbi, SBI_QUOTA_SKIP_FLUSH)
> >>  - f2fs_flush_sit_entries
> >>   - add_discard_addrs
> >>    - __set_bit_le(i, (void *)de->discard_map);
> >> 						- f2fs_write_data_pages
> >> 						 - f2fs_write_single_data_page
> >> 						   : inode is quota one, cp_rwsem won't be locked
> >> 						  - f2fs_do_write_data_page
> >> 						   - f2fs_allocate_data_block
> >> 						    - f2fs_wait_discard_bio
> >> 						      : discard entry has not been added yet.
> >> 						    - update_sit_entry
> >>  - f2fs_clear_prefree_segments
> >>   - f2fs_issue_discard
> >>   : add discard entry
> >>
> >> This patch fixes this issue by reverting 435cbab95e39 ("f2fs: fix quota_sync
> >> failure due to f2fs_lock_op").
> >>
> >> Fixes: 435cbab95e39 ("f2fs: fix quota_sync failure due to f2fs_lock_op")
> > 
> > The previous patch fixes quota_sync gets EAGAIN all the time.
> > How about this? It seems this works for fsstress test.
> > 

Then this?

---
 fs/f2fs/segment.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ebbadde6cbced..ed11dcf2d69ed 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3107,6 +3107,14 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		type = CURSEG_COLD_DATA;
 	}
 
+	/*
+	 * We need to wait for node_write to avoid block allocation during
+	 * checkpoint. This can only happen to quota writes which can cause
+	 * the below discard race condition.
+	 */
+	if (IS_DATASEG(type))
+		down_write(&sbi->node_write);
+
 	down_read(&SM_I(sbi)->curseg_lock);
 
 	mutex_lock(&curseg->curseg_mutex);
@@ -3174,6 +3182,9 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 
 	if (put_pin_sem)
 		up_read(&sbi->pin_sem);
+
+	if (IS_DATASEG(type))
+		up_write(&sbi->node_write);
 }
 
 static void update_device_state(struct f2fs_io_info *fio)
-- 
2.27.0.rc0.183.gde8f92d652-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
