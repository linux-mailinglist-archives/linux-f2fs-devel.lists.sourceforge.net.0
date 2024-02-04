Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4030848A4B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Feb 2024 02:48:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rWRc1-0004U2-Sp;
	Sun, 04 Feb 2024 01:48:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rWRc0-0004To-Ai
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 01:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=za2oZIOBhnEjyr1j5cd0A7SuP18Utk6x31eh+JVCkzg=; b=bDCqjaOT4Atz7pRKndvdOec3Uj
 U4UNXuulVBnGJ5nvxBA+Y5HabvdFN6sUHhFRpBGP1CunHKGkCwiMnBNy3KbgwltAmuS5zeyekZZ45
 aFlru+iGeSWtnlilkR2edc5ilmYIW6w84eDuPscC8/P51AKRmlIzcqUtc0AcFwU/c11o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=za2oZIOBhnEjyr1j5cd0A7SuP18Utk6x31eh+JVCkzg=; b=KPYVY0EfxdinU75Ze7nAx/QFfd
 c/+1+LUArmZrxhjYBBCHHs03nypcvfqzf1djfXdxHCTDXG25NdHYQH2OJOqi+ec5X9MfphvZQK8T5
 qKM2aIDXIc9MQ0+xFeLzb7SAOh38aySAGlLcWXjMI1mQtVb3NYpEYA4fC727+8n91BBc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rWRby-0002hI-W0 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 01:48:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3591560C6E;
 Sun,  4 Feb 2024 01:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50390C433C7;
 Sun,  4 Feb 2024 01:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707011273;
 bh=2AQnPmoKsbbhPHWUPAdwATTf/lebIxhhjhdFZEHTX+o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gzsBCThkcBb2Mjc90NH8US4+wnXWJVvpFsmZG0tEJ2ytPqPw8/RqZ+dDR502goRB+
 xucxJS/a7ZEeh8J1fFXtjOqeFBOByBGifO2JXxcbivmKU0P0yeaOjfarL/BoLidJKD
 mJy3DIfkssHOrrAg8eK8j/JRr7fTxWN+kkVsYf4DoIy1o8xZezHRgNOpDOqA3iva45
 ajrC1OuY8v6JQZ5bgBiTYCo6JWI7Q6V6u3unvoNmiGPv34a+rogpZkAai1FOf34ker
 jZy8wIWeYv85fZjIzYSz/+bFrFBrbu58LmKIFrL+hRrgXProgXdoGj0oZfj/IsUKhE
 0W5LRIC1X0fFg==
Message-ID: <8eaf59a4-1aaa-460e-a3cc-b798ed5e0f63@kernel.org>
Date: Sun, 4 Feb 2024 09:47:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org,
 yangyongpeng1@oppo.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
References: <20240203152436.1352-1-qwjhust@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240203152436.1352-1-qwjhust@gmail.com>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/3 23:24, Wenjie Qi wrote: > If the max open zones
 of zoned devices are less than > the active logs of F2FS, the device may
 error due to > insufficient zone resources when multiple active log [...] 
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rWRby-0002hI-W0
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix zoned block device information
 initialization
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
Cc: hustqwj@hust.edu.cn
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/3 23:24, Wenjie Qi wrote:
> If the max open zones of zoned devices are less than
> the active logs of F2FS, the device may error due to
> insufficient zone resources when multiple active logs are
> being written at the same time. If this value is 0,
> there is no limit.
> 
> Signed-off-by: Wenjie Qi <qwjhust@gmail.com>
> ---
>   fs/f2fs/f2fs.h  |  1 +
>   fs/f2fs/super.c | 21 +++++++++++++++++++++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 543898482f8b..161107f2d3bd 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1558,6 +1558,7 @@ struct f2fs_sb_info {
>   
>   #ifdef CONFIG_BLK_DEV_ZONED
>   	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
> +	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
>   #endif
>   
>   	/* for node-related operations */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 1b718bebfaa1..45e82d6016fc 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2388,6 +2388,16 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   	if (err)
>   		goto restore_opts;
>   
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	if (sbi->max_open_zones && sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
> +		f2fs_err(sbi,
> +			"zoned: max open zones %u is too small, need at least %u open zones",
> +				 sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
> +		err = -EINVAL;
> +		goto restore_opts;
> +	}
> +#endif
> +
>   	/* flush outstanding errors before changing fs state */
>   	flush_work(&sbi->s_error_work);
>   
> @@ -3930,11 +3940,22 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>   	sector_t nr_sectors = bdev_nr_sectors(bdev);
>   	struct f2fs_report_zones_args rep_zone_arg;
>   	u64 zone_sectors;
> +	unsigned int max_open_zones;
>   	int ret;
>   
>   	if (!f2fs_sb_has_blkzoned(sbi))
>   		return 0;
>   
> +	max_open_zones = bdev_max_open_zones(bdev);

Wenjie,

max_open_zones can always be zero? then sbi->max_open_zones will be zero,
is this a valid case?

Thanks,

> +	if (max_open_zones && (max_open_zones < sbi->max_open_zones || !sbi->max_open_zones))
> +		sbi->max_open_zones = max_open_zones;
> +	if (sbi->max_open_zones && sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
> +		f2fs_err(sbi,
> +			"zoned: max open zones %u is too small, need at least %u open zones",
> +				 sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
> +		return -EINVAL;
> +	}
> +
>   	zone_sectors = bdev_zone_sectors(bdev);
>   	if (!is_power_of_2(zone_sectors)) {
>   		f2fs_err(sbi, "F2FS does not support non power of 2 zone sizes\n");


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
