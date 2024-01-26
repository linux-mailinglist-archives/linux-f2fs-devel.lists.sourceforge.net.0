Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AE283E640
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jan 2024 00:08:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTVJF-00007I-59;
	Fri, 26 Jan 2024 23:08:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rTVJE-00007B-M0
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 23:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cDgvlw2+zZg4+vBGbt35PcUSP+w9v5YJ81LThm3Va5I=; b=HhtsO1eXu5swznguKK7hWM9A2i
 3oGYvKh+GYK8wiIIBjBqZx/YOaEDYlyGbNEja16hvF0+pbOK5HL4pcHpCb3D8qSiNq3FpQd1UreNG
 OC764KP4xkssAB1S1l7VgAq4q/3cj41P3VPlgIsK4UkHKzWtF5pkzLNez4fgZsuMLnMs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cDgvlw2+zZg4+vBGbt35PcUSP+w9v5YJ81LThm3Va5I=; b=SSaLBW9KhrPCBN9TOFKD0l/YnP
 5vTUcGc/ZnbUGUsBeqX2zTKF36/TZN5VKmZrxSYNnRdNQkX4lCfH9g7l1rYx95uzp7EB8hECrKYTX
 ImfhHm8cLkBdtqNlhpXd42jXsw9o0g6mhGc0BMRkCtIEl6LenpDtUQSR1YY+V5VGGaeY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rTVJ9-0003JB-5C for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 23:08:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 10114CE3526;
 Fri, 26 Jan 2024 23:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE71C433F1;
 Fri, 26 Jan 2024 23:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706310496;
 bh=gtDQI+hKL0TQ2S0fIwbLd2/StC1wd1X9UG/XGhPc+u0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OXelBLKMoeU91iMzptcxcM+mQaJSEpgO+jrwD6fwJBA2GkYx+erSHvnEqaEecJ7ys
 L9UR+moDECJyZTNAQStBJ1gqSu5Jo3jJb361fwbSboiVHV/p0YUsN9tkSs+y6gLuMd
 RM4TB7dkNB+Sq2ezTxik+577gPYickgUpAX0Pl2B1ezh1CV1XENFR1r4dA2nhp9qJ/
 0haeFt1yoLgoBcVaL0dkDQoPqPRIihKVZA//P8H+bBkf0INz8Fq1lEqopVaqZRfjpy
 Hz6QN8dXokICkd7xEjTGsy5qLKgFWycDOoof+b/7THMJ43wRjTyrsiamf/DlywMiWR
 YFNnxDfWK+faA==
Date: Fri, 26 Jan 2024 15:08:14 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Wenjie <qwjhust@gmail.com>
Message-ID: <ZbQ7XmFpAMSXslkU@google.com>
References: <20240109035804.642-1-qwjhust@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240109035804.642-1-qwjhust@gmail.com>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/09, Wenjie wrote: > From: Wenjie Qi <qwjhust@gmail.com>
 > > 1. If the max active zones of zoned devices are less than > the active
 logs of F2FS, the device may error due to > insufficient zone r [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rTVJ9-0003JB-5C
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix max open zone constraints
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
Cc: linux-kernel@vger.kernel.org, hustqwj@hust.edu.cn,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/09, Wenjie wrote:
> From: Wenjie Qi <qwjhust@gmail.com>
> 
> 1. If the max active zones of zoned devices are less than
> the active logs of F2FS, the device may error due to
> insufficient zone resources when multiple active logs are
> being written at the same time.
> 
> 2. We can get the number of remaining available zone
> resources by subtracting the number of active logs from
> the number of max active zones of zoned devices.  We can
> use these available zone resources to reduce the number
> of pending bio when switching zones.
> 
> 3. The original code for determining zone end was
> after "out":, which would have missed some fio's
> where is_end_zone_blkaddr(sbi, fio->new_blkaddr)
> was true. I've moved this code before "skip:" to
> make sure it's done for each fio.

Could you please keep #3 as a separate patch?

> 
> Signed-off-by: Wenjie Qi <qwjhust@gmail.com>
> ---
>  fs/f2fs/data.c  | 38 ++++++++++++++++++++++++++++----------
>  fs/f2fs/f2fs.h  |  2 ++
>  fs/f2fs/super.c |  9 +++++++++
>  3 files changed, 39 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index dce8defdf4c7..6b11364e94b8 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -392,6 +392,19 @@ static void f2fs_zone_write_end_io(struct bio *bio)
>  	complete(&io->zone_wait);
>  	f2fs_write_end_io(bio);
>  }
> +
> +static void f2fs_zone_write_end_io_nowait(struct bio *bio)
> +{
> +#ifdef CONFIG_F2FS_IOSTAT
> +	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
> +	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
> +#else
> +	struct f2fs_sb_info *sbi = (struct f2fs_sb_info *)bio->bi_private;
> +#endif
> +
> +	atomic_inc(&sbi->available_active_zones);
> +	f2fs_write_end_io(bio);
> +}
>  #endif
>  
>  struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
> @@ -1080,22 +1093,27 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  	io->last_block_in_bio = fio->new_blkaddr;
>  
>  	trace_f2fs_submit_page_write(fio->page, fio);
> -skip:
> -	if (fio->in_list)
> -		goto next;
> -out:
>  #ifdef CONFIG_BLK_DEV_ZONED
>  	if (f2fs_sb_has_blkzoned(sbi) && btype < META &&
>  			is_end_zone_blkaddr(sbi, fio->new_blkaddr)) {
> -		bio_get(io->bio);
> -		reinit_completion(&io->zone_wait);
> -		io->bi_private = io->bio->bi_private;
> -		io->bio->bi_private = io;
> -		io->bio->bi_end_io = f2fs_zone_write_end_io;
> -		io->zone_pending_bio = io->bio;
> +		if (!atomic_add_negative(-1, &sbi->available_active_zones)) {
> +			io->bio->bi_end_io = f2fs_zone_write_end_io_nowait;
> +		} else {
> +			atomic_inc(&sbi->available_active_zones);
> +			bio_get(io->bio);
> +			reinit_completion(&io->zone_wait);
> +			io->bi_private = io->bio->bi_private;
> +			io->bio->bi_private = io;
> +			io->bio->bi_end_io = f2fs_zone_write_end_io;
> +			io->zone_pending_bio = io->bio;
> +		}
>  		__submit_merged_bio(io);
>  	}
>  #endif
> +skip:
> +	if (fio->in_list)
> +		goto next;
> +out:
>  	if (is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN) ||
>  				!f2fs_is_checkpoint_ready(sbi))
>  		__submit_merged_bio(io);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 65294e3b0bef..1b1833e1d10e 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1551,6 +1551,8 @@ struct f2fs_sb_info {
>  
>  #ifdef CONFIG_BLK_DEV_ZONED
>  	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
> +	unsigned int max_active_zones;		/* max zone resources of the zoned device */
> +	atomic_t available_active_zones;		/* remaining zone resources */
>  #endif
>  
>  	/* for node-related operations */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 206d03c82d96..c79919425d63 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3932,6 +3932,15 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>  	if (!f2fs_sb_has_blkzoned(sbi))
>  		return 0;
>  
> +	sbi->max_active_zones = bdev_max_active_zones(bdev);
> +	if (sbi->max_active_zones && (sbi->max_active_zones < F2FS_OPTION(sbi).active_logs)) {
> +		f2fs_err(sbi,
> +			"zoned: max active zones %u is too small, need at least %u active zones",
> +				 sbi->max_active_zones, F2FS_OPTION(sbi).active_logs);
> +		return -EINVAL;
> +	}
> +	atomic_set(&sbi->available_active_zones, sbi->max_active_zones - F2FS_OPTION(sbi).active_logs);
> +
>  	zone_sectors = bdev_zone_sectors(bdev);
>  	if (!is_power_of_2(zone_sectors)) {
>  		f2fs_err(sbi, "F2FS does not support non power of 2 zone sizes\n");
> -- 
> 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
