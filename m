Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 448D323B215
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Aug 2020 03:04:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k2lNO-0004Cg-Rz; Tue, 04 Aug 2020 01:04:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1k2lNN-0004CZ-Us
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 01:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dlXkavgIh/8dlzlVjxjX+D6SuV0RUIEpavHV1PgbGLQ=; b=IUv4okhnmZg/ub+cgvohOSwZ0H
 4uZWwx80YmvImorK/FpkYTA8OtmaTn25kbRVchpKJ4VVxiEBwIFQGTk/vE5P4PdlYGxapwQBl/69J
 lln5A/Wp+20MHCPZugA8kXlJbkk54pbyssZW12CEHihw1fyyPHf0YCvmuuka8tR6TpBc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dlXkavgIh/8dlzlVjxjX+D6SuV0RUIEpavHV1PgbGLQ=; b=QznyPTJ+ijNjkgNK2yojOK5e5b
 m5rIUu4Uw+eYLfluEdMgITrz6lJG67lOmI9uhr8pUQkWRrY90CbObgUX67CO/gvJslvJ7QS55+QkT
 MUetjPYBkq67Y9nvidMvV2BwJQbzLzAV7c9p1kJhrWoC4mwHtoMxfMbWkN1a+I3++EM4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k2lNM-002241-Kv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 01:04:21 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC6E92073E;
 Tue,  4 Aug 2020 01:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596503053;
 bh=qmi+JueUhqtxSSAhKDVOtsYflLhRFP7QuN1kV0mi6Ww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JCDMcA5cmLaDlupv89ziUjEvTG1gl57Pbq1UH2tlRjSLVitp46r+u11Xj6MKW8Bd/
 xvhIzBdKHmgKjKtxJI93gFcLD6d9GhZj6/a+wA/IxnW4dkrgAQAiv/Z5Bz4WxBk9iW
 z3wh9AAAyxQArz/3ppjXAEOWu9URYtyLM0Ywly3M=
Date: Mon, 3 Aug 2020 18:04:12 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200804010412.GA866340@google.com>
References: <20200803172825.4077289-1-jaegeuk@kernel.org>
 <9638d2c5-cfd0-359f-187a-8e23bc6d822d@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9638d2c5-cfd0-359f-187a-8e23bc6d822d@huawei.com>
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
X-Headers-End: 1k2lNM-002241-Kv
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove a waiter for checkpoint
 completion
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
Cc: Eric Biggers <ebiggers@kernel.org>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/04, Chao Yu wrote:
> On 2020/8/4 1:28, Jaegeuk Kim wrote:
> > It doesn't need to wait for checkpoint being completed triggered by end_io.
> > 
> > [   20.157753] ------------[ cut here ]------------
> > [   20.158393] do not call blocking ops when !TASK_RUNNING; state=2 set at [<0000000096354225>] prepare_to_wait+0xcd/0x430
> > [   20.159858] WARNING: CPU: 1 PID: 1152 at kernel/sched/core.c:7142 __might_sleep+0x149/0x1a0
> > ...
> > [   20.176110]  __submit_merged_write_cond+0x191/0x310
> > [   20.176739]  f2fs_submit_merged_write+0x18/0x20
> > [   20.177323]  f2fs_wait_on_all_pages+0x269/0x2d0
> > [   20.177899]  ? block_operations+0x980/0x980
> > [   20.178441]  ? __kasan_check_read+0x11/0x20
> > [   20.178975]  ? finish_wait+0x260/0x260
> > [   20.179488]  ? percpu_counter_set+0x147/0x230
> > [   20.180049]  do_checkpoint+0x1757/0x2a50
> > [   20.180558]  f2fs_write_checkpoint+0x840/0xaf0
> > [   20.181126]  f2fs_sync_fs+0x287/0x4a0
> > 
> > Reported-by: Eric Biggers <ebiggers@kernel.org>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/checkpoint.c | 6 +-----
> >   fs/f2fs/data.c       | 4 ----
> >   fs/f2fs/f2fs.h       | 1 -
> >   fs/f2fs/super.c      | 1 -
> >   4 files changed, 1 insertion(+), 11 deletions(-)
> > 
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index 99c8061da55b9..2bdddc725e677 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -1255,11 +1255,7 @@ static void unblock_operations(struct f2fs_sb_info *sbi)
> >   void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
> >   {
> > -	DEFINE_WAIT(wait);
> > -
> >   	for (;;) {
> > -		prepare_to_wait(&sbi->cp_wait, &wait, TASK_UNINTERRUPTIBLE);
> 
> Wouldn't that case high cpu usage before io end?

This is a critical path to wait for IO completion in checkpoint, which would be
better to wait for it to avoid long latency to continue filesystem operations.
Moreover, I expect io_schedule_timeout() can mitigate such the CPU overhead and
actually we don't need to make there-in context switches as well.

> 
> > -
> >   		if (!get_pages(sbi, type))
> >   			break;
> > @@ -1271,9 +1267,9 @@ void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
> >   							FS_CP_META_IO);
> >   		else if (type == F2FS_WB_CP_DATA)
> >   			f2fs_submit_merged_write(sbi, DATA);
> > +
> >   		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
> >   	}
> > -	finish_wait(&sbi->cp_wait, &wait);
> >   }
> >   static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index c1b676be67b9a..588d2871bbe69 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -383,10 +383,6 @@ static void f2fs_write_end_io(struct bio *bio)
> >   		clear_cold_data(page);
> >   		end_page_writeback(page);
> >   	}
> > -	if (!get_pages(sbi, F2FS_WB_CP_DATA) &&
> > -				wq_has_sleeper(&sbi->cp_wait))
> > -		wake_up(&sbi->cp_wait);
> > -
> >   	bio_put(bio);
> >   }
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 02811ce15059b..a036539363030 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1437,7 +1437,6 @@ struct f2fs_sb_info {
> >   	struct rw_semaphore cp_rwsem;		/* blocking FS operations */
> >   	struct rw_semaphore node_write;		/* locking node writes */
> >   	struct rw_semaphore node_change;	/* locking node change */
> > -	wait_queue_head_t cp_wait;
> >   	unsigned long last_time[MAX_TIME];	/* to store time in jiffies */
> >   	long interval_time[MAX_TIME];		/* to store thresholds */
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 83bf9a02f83f2..5f4d9abc079d6 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -3540,7 +3540,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> >   	init_rwsem(&sbi->cp_rwsem);
> >   	init_rwsem(&sbi->quota_sem);
> > -	init_waitqueue_head(&sbi->cp_wait);
> >   	init_sb_info(sbi);
> >   	err = init_percpu_info(sbi);
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
