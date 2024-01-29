Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D7D8416BB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jan 2024 00:26:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUb1M-0005t2-DX;
	Mon, 29 Jan 2024 23:26:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1rUb1K-0005su-BL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 23:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=So/8nH5GRmhiwdX5iD5VRBEC1iFxILOIoK7mcMdivhs=; b=PQX6tgscdJHWlID+ufawXXD6VU
 juseOJfrAvhFdj1H4wRCdvDtz8WaAsnWweSRJzPogvxhXqq2BErrehQSIbbdTLb6JSvnXobZ8aTl2
 PIVUNKbZroxcfo8juNULJ2BzZzcGVZH9YlYZb1oohV3UtnkPFBqT1nlAVKbq4EwBvxWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=So/8nH5GRmhiwdX5iD5VRBEC1iFxILOIoK7mcMdivhs=; b=Dv+r6ICn32vqGg6GaZurJqWwVs
 XYi56dIEQ5pgjF1qGwEPG6ADUzPrY1mI0c3IynT/ONFiel9U2MDFuKtvk3g3a4t3eTiT/JnQ3es67
 Fzc0vdOGt4t2JtDphtfqm97pM3t7hqUfozsv0IS8J4BKaos9NpEpDM+yMRQAoncTIdAA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUb1K-0007Uv-0y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 23:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 463C0625B9;
 Mon, 29 Jan 2024 23:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEE9C433F1;
 Mon, 29 Jan 2024 23:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706570779;
 bh=d/aQihyhdrtQJBuM7w+mKzeJ7H7OziElkA0HqJ7h9Ns=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cYbOj+lj440jTo5PgwKnZXAFXNbloJYcUptUFrmP/kHDVvR5Z1i2RPWI4PU6Yxkym
 Kg+OIUk9HDHgMKXZTE81B0sSLP2CSr5ZdS2J6eOdc+GiZqL350GMAvwUwofcabo2rn
 pdAV3WTDvgkHzQH/AuUmbL1/MN6crGnAmcHZVMqy4YdEGfyg7DSfLdFL1Qk+BWwFw8
 icjJpIuLa4aSSs+9DERd0+aaZ5zqBiYROxRuNxljVdlSRdlBfeNEElbCisc9dyRumd
 WQQhGjtgaDkAecCk/hjPseTUUSpTW9yFJaXQDr6D2CdIkQeQUhI4T5hAM+EvQYomCT
 df9fqY/vlV2qw==
Message-ID: <e2f8b1d7-78ab-4ef5-bb4f-088d60f7d7fc@kernel.org>
Date: Tue, 30 Jan 2024 08:26:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
References: <20240128-zonefs_nofs-v3-0-ae3b7c8def61@wdc.com>
 <20240128-zonefs_nofs-v3-2-ae3b7c8def61@wdc.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240128-zonefs_nofs-v3-2-ae3b7c8def61@wdc.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/29/24 16:52, Johannes Thumshirn wrote: > Guard the calls
 to blkdev_zone_mgmt() with a memalloc_noio scope. > This helps us getting
 rid of the GFP_NOIO argument to blkdev_zone_mgmt(); > > Signed-o [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUb1K-0007Uv-0y
Subject: Re: [f2fs-dev] [PATCH v3 2/5] dm: dm-zoned: guard blkdev_zone_mgmt
 with noio scope
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
Cc: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/29/24 16:52, Johannes Thumshirn wrote:
> Guard the calls to blkdev_zone_mgmt() with a memalloc_noio scope.
> This helps us getting rid of the GFP_NOIO argument to blkdev_zone_mgmt();
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> ---
>  drivers/md/dm-zoned-metadata.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index fdfe30f7b697..165996cc966c 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1655,10 +1655,13 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  
>  	if (!dmz_is_empty(zone) || dmz_seq_write_err(zone)) {
>  		struct dmz_dev *dev = zone->dev;
> +		unsigned int noio_flag;
>  
> +		noio_flag = memalloc_noio_save();
>  		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
>  				       dmz_start_sect(zmd, zone),
> -				       zmd->zone_nr_sectors, GFP_NOIO);
> +				       zmd->zone_nr_sectors, GFP_KERNEL);
> +		memalloc_noio_restore(noio_flag);
>  		if (ret) {
>  			dmz_dev_err(dev, "Reset zone %u failed %d",
>  				    zone->id, ret);
> 

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
