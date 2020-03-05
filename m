Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7AD17B03F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Mar 2020 22:04:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j9xfQ-00023p-BN; Thu, 05 Mar 2020 21:04:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1j9xfO-00023i-FY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Mar 2020 21:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j3SC4gl8kjzmOIQi/hpY5HqxNwuh/sSuUs7EtDODFhs=; b=lZIWFBHhiwClU4eH3EO7ZmC1QK
 rLLA9pkipuk3ztbbjAcRKA9Jkzvlw4FkttZWqHKehT1wkeoJIG6BEs2hpdoj3pH/5vhqr14rAZwDI
 vpj+FkTYOBgEgoXSKz8lDCXPWI0mT6wqK3XvT07KEKDDnNP02yPpPQsu3mk/7DFDvxCg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j3SC4gl8kjzmOIQi/hpY5HqxNwuh/sSuUs7EtDODFhs=; b=hqBsDAyNE3B33hE7B8ReqdF8eR
 tVjIknaCzFWswRexl67FiQebyuOpxAmMJss4cuWPPaBybI7c1Vm4pKEmwkJAKhwOaMFcUZclW1fcI
 4Kk8ToCInqY246CPC3qUt4w1GG523i5/Wa2WvP6teOOFyY+OOf/RtikgIP7ZqWGC6O68=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j9xfL-003H3c-H5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Mar 2020 21:04:26 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 016C9ACC6;
 Thu,  5 Mar 2020 21:04:15 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id EFAF41E0FC2; Thu,  5 Mar 2020 22:04:14 +0100 (CET)
Date: Thu, 5 Mar 2020 22:04:14 +0100
From: Jan Kara <jack@suse.cz>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200305210414.GA1678@quack2.suse.cz>
References: <20190518004751.18962-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190518004751.18962-1-jaegeuk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j9xfL-003H3c-H5
Subject: Re: [f2fs-dev] [PATCH] loop: avoid EAGAIN,
 if offset or block_size are changed
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
Cc: Jens Axboe <axboe@kernel.dk>, Bart Van Assche <bvanassche@acm.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri 17-05-19 17:47:51, Jaegeuk Kim wrote:
> This patch tries to avoid EAGAIN due to nrpages!=0 that was originally trying
> to drop stale pages resulting in wrong data access.
> 
> Report: https://bugs.chromium.org/p/chromium/issues/detail?id=938958#c38

...

> ---
>  drivers/block/loop.c | 44 +++++++++++++++++---------------------------
>  1 file changed, 17 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 102d79575895..7c7d2d9c47d0 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -1212,6 +1212,7 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
>  	kuid_t uid = current_uid();
>  	struct block_device *bdev;
>  	bool partscan = false;
> +	bool drop_caches = false;
>  
>  	err = mutex_lock_killable(&loop_ctl_mutex);
>  	if (err)
> @@ -1232,10 +1233,8 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
>  	}
>  
>  	if (lo->lo_offset != info->lo_offset ||
> -	    lo->lo_sizelimit != info->lo_sizelimit) {
> -		sync_blockdev(lo->lo_device);
> -		kill_bdev(lo->lo_device);
> -	}
> +	    lo->lo_sizelimit != info->lo_sizelimit)
> +		drop_caches = true;

I don't think this solution of moving buffer cache invalidation after loop
device is updated is really correct.

If there's any dirty data in the buffer cache, god knows where it ends
up being written after the loop device is reconfigured. Think e.g. of a
file offset being changed. It may not be even possible to write it if say
block size increased and we have now improperly sized buffers in the buffer
cache...

Frankly, I have rather limited sympathy to someone trying to reconfigure a
loop device while it is in use. Is there any sane usecase? I'd be inclined
to just use a similar trick as we did with LOOP_SET_FD and allow these
changes only if the caller has the loop device open exclusively or we are
able to upgrade to exclusive open. As otherwise say mounted filesystem on
top of loop device being reconfigured is very likely to be in serious
trouble (e.g. it's impossible to fully invalidate buffer cache in that
case).

But that's probably somewhat tangential to the problem you have. For your
case I don't really see a race-free way to invalidate buffer cache and
update loop configuration - the best I can see is to flush & invalidate
the cache, freeze the bdev so that new data cannot be read into the
buffer cache, check the cache is still empty - if yes, go ahead. If not,
unfreeze and try again...

								Honza

>  	/* I/O need to be drained during transfer transition */
>  	blk_mq_freeze_queue(lo->lo_queue);
> @@ -1265,14 +1264,6 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
>  
>  	if (lo->lo_offset != info->lo_offset ||
>  	    lo->lo_sizelimit != info->lo_sizelimit) {
> -		/* kill_bdev should have truncated all the pages */
> -		if (lo->lo_device->bd_inode->i_mapping->nrpages) {
> -			err = -EAGAIN;
> -			pr_warn("%s: loop%d (%s) has still dirty pages (nrpages=%lu)\n",
> -				__func__, lo->lo_number, lo->lo_file_name,
> -				lo->lo_device->bd_inode->i_mapping->nrpages);
> -			goto out_unfreeze;
> -		}
>  		if (figure_loop_size(lo, info->lo_offset, info->lo_sizelimit)) {
>  			err = -EFBIG;
>  			goto out_unfreeze;
> @@ -1317,6 +1308,12 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
>  		bdev = lo->lo_device;
>  		partscan = true;
>  	}
> +
> +	/* truncate stale pages cached by previous operations */
> +	if (!err && drop_caches) {
> +		sync_blockdev(lo->lo_device);
> +		kill_bdev(lo->lo_device);
> +	}
>  out_unlock:
>  	mutex_unlock(&loop_ctl_mutex);
>  	if (partscan)
> @@ -1498,6 +1495,7 @@ static int loop_set_dio(struct loop_device *lo, unsigned long arg)
>  
>  static int loop_set_block_size(struct loop_device *lo, unsigned long arg)
>  {
> +	bool drop_caches = false;
>  	int err = 0;
>  
>  	if (lo->lo_state != Lo_bound)
> @@ -1506,23 +1504,10 @@ static int loop_set_block_size(struct loop_device *lo, unsigned long arg)
>  	if (arg < 512 || arg > PAGE_SIZE || !is_power_of_2(arg))
>  		return -EINVAL;
>  
> -	if (lo->lo_queue->limits.logical_block_size != arg) {
> -		sync_blockdev(lo->lo_device);
> -		kill_bdev(lo->lo_device);
> -	}
> +	if (lo->lo_queue->limits.logical_block_size != arg)
> +		drop_caches = true;
>  
>  	blk_mq_freeze_queue(lo->lo_queue);
> -
> -	/* kill_bdev should have truncated all the pages */
> -	if (lo->lo_queue->limits.logical_block_size != arg &&
> -			lo->lo_device->bd_inode->i_mapping->nrpages) {
> -		err = -EAGAIN;
> -		pr_warn("%s: loop%d (%s) has still dirty pages (nrpages=%lu)\n",
> -			__func__, lo->lo_number, lo->lo_file_name,
> -			lo->lo_device->bd_inode->i_mapping->nrpages);
> -		goto out_unfreeze;
> -	}
> -
>  	blk_queue_logical_block_size(lo->lo_queue, arg);
>  	blk_queue_physical_block_size(lo->lo_queue, arg);
>  	blk_queue_io_min(lo->lo_queue, arg);
> @@ -1530,6 +1515,11 @@ static int loop_set_block_size(struct loop_device *lo, unsigned long arg)
>  out_unfreeze:
>  	blk_mq_unfreeze_queue(lo->lo_queue);
>  
> +	/* truncate stale pages cached by previous operations */
> +	if (drop_caches) {
> +		sync_blockdev(lo->lo_device);
> +		kill_bdev(lo->lo_device);
> +	}
>  	return err;
>  }
>  
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
