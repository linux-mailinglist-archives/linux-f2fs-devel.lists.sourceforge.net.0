Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AEF379EFD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 07:07:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgKcT-0008UC-V4; Tue, 11 May 2021 05:07:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lgKcS-0008U0-4v
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 05:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XXgY7+tMohqI6o+/N9qtYRhSX5FQdd1w5e5eqyW75xo=; b=eb1NPIRfukK8MrhPjsZYGKcBIT
 ZwDMceP8U+Ho+58kwlvRLXY4fPHMfPRAoPtqe6Zgmr+Gxj0PngbKAWGU7c1hnPoXtoW3ZFUfheItT
 Eekz45gmS0An9NJrNDXXYe6swgrPHTxlkdDJailBoeEGQwL9QjqTD8eweq8vneIcAric=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XXgY7+tMohqI6o+/N9qtYRhSX5FQdd1w5e5eqyW75xo=; b=jD5L8hiClHNNCh3OiFIOitEfak
 7FkKyy9jVWXMqW7BgiDG+qshn9aIFD2ninvnXAqs9ib3IlkmiGJowQVJO2NvLC5FtH0r8mM4j2m+m
 nfkIMNy0F3mxvZilNnKBZ2FT34zyaL4YG2q4P+vfz8NKzHuh0oKp8FE6XCbaPxV5DgZc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgKcK-00045l-6R
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 05:07:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CA3D6187E;
 Tue, 11 May 2021 05:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620709644;
 bh=4c0rBQ+cD5bPSkpsXMcoo5k4pBv7+UXNxE9GGH+21ng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CinG+sArvseTBVOprnEIloPi/Nj2J4HiKbUh4f0a10srYbeAV9NuZ8XZFOU/nfJyk
 HAbgwecj8i9iao7lHbwE7WctBk16geRajB37wLCoMxYbbfWugSdzU9AIrgm2wqLTtZ
 wi0jjVWEhi36fxepX5c1C8KTzXzri3UjWPlwGDyvgkAutCR6WG9KWAO8MkCjaubRDr
 kFNItNLuh74GVno1cNRar5FKJAGkm0wiiZ9np74UpMO+LxMQ7kJgQ3SIh2qp7fR9KO
 cK7W5qOWFgcmgSOovTb2Nwv5zS7DhrlloCxyjDUlfS7pNc5R6STZ4XW19lZ68YHgel
 ut9RoDtAm11BA==
Date: Mon, 10 May 2021 22:07:23 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YJoRCwwRDgEH49/P@google.com>
References: <20210510142804.511265-1-jaegeuk@kernel.org>
 <9df7d088-3580-122b-60a3-799ea665cfeb@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9df7d088-3580-122b-60a3-799ea665cfeb@huawei.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lgKcK-00045l-6R
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid null pointer access when
 handling IPU error
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

On 05/11, Chao Yu wrote:
> On 2021/5/10 22:28, Jaegeuk Kim wrote:
> >   Unable to handle kernel NULL pointer dereference at virtual address 000000000000001a
> >   pc : f2fs_inplace_write_data+0x144/0x208
> >   lr : f2fs_inplace_write_data+0x134/0x208
> >   Call trace:
> >    f2fs_inplace_write_data+0x144/0x208
> >    f2fs_do_write_data_page+0x270/0x770
> >    f2fs_write_single_data_page+0x47c/0x830
> >    __f2fs_write_data_pages+0x444/0x98c
> >    f2fs_write_data_pages.llvm.16514453770497736882+0x2c/0x38
> >    do_writepages+0x58/0x118
> >    __writeback_single_inode+0x44/0x300
> >    writeback_sb_inodes+0x4b8/0x9c8
> >    wb_writeback+0x148/0x42c
> >    wb_do_writeback+0xc8/0x390
> >    wb_workfn+0xb0/0x2f4
> >    process_one_work+0x1fc/0x444
> >    worker_thread+0x268/0x4b4
> >    kthread+0x13c/0x158
> >    ret_from_fork+0x10/0x18
> > 
> > Fixes: 955772787667 ("f2fs: drop inplace IO if fs status is abnormal")
> 
> My bad, thanks for fixing this.
> 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/segment.c | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index c605415840b5..ae875557d693 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -3577,9 +3577,11 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
> >   	if (fio->bio) {
> >   		struct bio *bio = *(fio->bio);
> > -		bio->bi_status = BLK_STS_IOERR;
> > -		bio_endio(bio);
> > -		fio->bio = NULL;
> > +		if (bio) {
> > +			bio->bi_status = BLK_STS_IOERR;
> > +			bio_endio(bio);
> > +			fio->bio = NULL;
> 
> fio->bio points a bio assigned in writepages(), so it should reset
> that bio to NULL by *(fio->bio) = NULL.

Good timing. I hit other kernel panic, and it seems this is the root cause.
Let me give it a try. :)

--- v2 ---

 Unable to handle kernel NULL pointer dereference at virtual address 000000000000001a
 pc : f2fs_inplace_write_data+0x144/0x208
 lr : f2fs_inplace_write_data+0x134/0x208
 Call trace:
  f2fs_inplace_write_data+0x144/0x208
  f2fs_do_write_data_page+0x270/0x770
  f2fs_write_single_data_page+0x47c/0x830
  __f2fs_write_data_pages+0x444/0x98c
  f2fs_write_data_pages.llvm.16514453770497736882+0x2c/0x38
  do_writepages+0x58/0x118
  __writeback_single_inode+0x44/0x300
  writeback_sb_inodes+0x4b8/0x9c8
  wb_writeback+0x148/0x42c
  wb_do_writeback+0xc8/0x390
  wb_workfn+0xb0/0x2f4
  process_one_work+0x1fc/0x444
  worker_thread+0x268/0x4b4
  kthread+0x13c/0x158
  ret_from_fork+0x10/0x18

Fixes: 955772787667 ("f2fs: drop inplace IO if fs status is abnormal")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c605415840b5..51dc79fad4fe 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3574,12 +3574,12 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 
 	return err;
 drop_bio:
-	if (fio->bio) {
+	if (fio->bio && *(fio->bio)) {
 		struct bio *bio = *(fio->bio);
 
 		bio->bi_status = BLK_STS_IOERR;
 		bio_endio(bio);
-		fio->bio = NULL;
+		*(fio->bio) = NULL;
 	}
 	return err;
 }
-- 
2.31.1.607.g51e8a6a459-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
