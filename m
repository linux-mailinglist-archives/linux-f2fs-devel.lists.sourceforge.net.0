Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE935127AF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Apr 2022 01:45:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njrLG-0003Hp-Vp; Wed, 27 Apr 2022 23:45:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <prvs=109e08c9c=damien.lemoal@opensource.wdc.com>)
 id 1njrLF-0003Hi-MB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 23:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3+shuYiOMOTbS7RmKTsh9Rcg33nlKjWDhWGRYehF4pY=; b=BLrQ+oprf0ASnYKlmnDplIsPwq
 5niWC70WFDBK93HT/tTlwdxqHtUhPGpe2uILRfT7f0nafKpmFL99y1Lng6ZYUCLiqYz06cKgJc4bW
 ocgHNZtQSoHTzPcHzc+yl8rnErjKpEerL0G9SNZOByvt9GZ2GDWtxs6tze0I+pv6XYiY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3+shuYiOMOTbS7RmKTsh9Rcg33nlKjWDhWGRYehF4pY=; b=HXIjXFBFFAvX/wCthfJxZaG+9w
 29VnNTkqoJKsutT939gV7DuxFAO6Qu1uwef9Txhg23/1iQsAAqLjmQsq8sf5OylDF1GsJYreUE+pA
 l5fr9nTtCsrWaM5ZjR8Ik4AYv+VpPkLVuaFcw8N90H3aWPqRMJsgCTg8XCcdJwwjdnhk=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njrLC-0000ca-Hh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 23:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651103101; x=1682639101;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yHKaW5zTI9WZN6XlbM6WV522YA4NJP0ufKH9fAehyOY=;
 b=n5MDF1V2/9WMXAtajHJWuzIPI0YShRANJoj9hUReHBbJQtgk/sVXGdUi
 GlIlfQjYYa8nhmNpPlF2LlnGqNPDr+y56abDFtR8pK0asNxpVRNf5jHSj
 qOktQRMJyPebseFXey8vcJJNB0E6SevndvODVWxobs+FJambsXM7RYYGQ
 fyOK6vwpC1n4RIjsgHjBJq9q+FN1JISd6kvsBhE1K/SmVJJphjKe9R2u2
 FJHF1S+yrwH/trUcZM6Frpqttf/xzkWeYe4qGFSf5Magdls9puWyj3kTw
 04cj4dXAIo+9KrwyLm3aXPbw/+KXnkaf48CzWCQnegLqjV0tqO59KGGJH w==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="199002498"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:37:35 +0800
IronPort-SDR: LXLhuo5h+2BUhxcKr9yyDi+B32Q71BH/K04/24GfkUTsxhaG6q+SPU00ekGBS+AZdjqIaPvqx7
 6ar8qsR6BtKXdNftrMnwS08ltztLb9Mzncrf0O7lDCHEx4ryGPBNHwgTvaUwCOEuqKGotqWjsV
 yJP+6I9a7p4ef5j2UU9ZO9jFiOHVBgvVdt5SbSFMQT1kkBwAOhTqJDplzWbFRwmvAwXzr2k23Y
 Xxc+8AMIfG/0+57S1VaOWXb3xMy2VwvqDv+gUVLFnhfKfdcXg+miXZCucVpmOyDOF1aHLS43Ma
 K9XaUMpJBJ0dxWWSdW/mrrC1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:07:45 -0700
IronPort-SDR: HSUGEVpSs6lZ4XaVMjKoG1/eXLZ/txLCutyRzYLMFxubZqzfDbc1uR3EZOBNW4k1Q07dIP7TqO
 PFaGtvxkYtYHF8RotlvtoTC4LXYAooxyn2VlqS9xriuApp1/z22TLuLRqqa6S+62mb/oGFLlkz
 4PQFk3+GexTI8Oe2I4CfONuGtUaB/3L30jnzZVjDuUpVkHVZ0kb3PyGDo7/3daKIY+1pvLh4ct
 EUiyKwylXtemeUIhbWxJH2yW6KK2Q3x/hTCJuBloHLMNngRgvEgNhFd/nStIvyPRjOa9mySNNQ
 bMQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:37:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZt71XyVz1SVp0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:37:35 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1651102654; x=1653694655; bh=yHKaW5zTI9WZN6XlbM6WV522YA4NJP0ufKH
 9fAehyOY=; b=omMAaNcAu4C2yHYQb1NClkSwg2xHp13YAJ2SJFHQcpzAm7KwKtr
 LoyEbaprBAqXCi8vJVE8STd2nWRh72RwP+tsxCLdjrW122FhlORiBAJ8dnK+srl9
 3w1eKFOkpl1sQiG+Jw/wdu7z2ERwVaBSZVfkOkvF99qQqSEXxFfHnln0i40KAU/Z
 Rgsaekp7gheGMuCzGRy7neZeHEpBkYADsxKlKyaPXvPrCEfGYZfBs8AldO5KdA8A
 Widzt5gxXgMgTajwk3U2C0i7oJEtbBMNJ39YP0YWgmM6yf9XrjjBtapx0eQ1JfGG
 dk7Riq4IhGTM4HZ/ocUmEc8dhcniKD7mQgw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id o13aMWjwFfAN
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:37:34 -0700 (PDT)
Received: from [10.225.163.27] (unknown [10.225.163.27])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZt05KG9z1Rvlc;
 Wed, 27 Apr 2022 16:37:28 -0700 (PDT)
Message-ID: <eeb86052-399c-a79b-32ab-1ed1b2d05e07@opensource.wdc.com>
Date: Thu, 28 Apr 2022 08:37:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Pankaj Raghav <p.raghav@samsung.com>, jaegeuk@kernel.org,
 axboe@kernel.dk, snitzer@kernel.org, hch@lst.de, mcgrof@kernel.org,
 naohiro.aota@wdc.com, sagi@grimberg.me, dsterba@suse.com,
 johannes.thumshirn@wdc.com
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160300eucas1p1470fe30535849de6204bb78d7083cb3a@eucas1p1.samsung.com>
 <20220427160255.300418-5-p.raghav@samsung.com>
Organization: Western Digital Research
In-Reply-To: <20220427160255.300418-5-p.raghav@samsung.com>
X-Spam-Score: -4.4 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/28/22 01:02,
 Pankaj Raghav wrote: > Convert the calculations
 on zone size to be generic instead of relying on > power_of_2 based logic
 in the block layer using the helpers wherever > possible. > [...] 
 Content analysis details:   (-4.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.153.144 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1njrLC-0000ca-Hh
Subject: Re: [f2fs-dev] [PATCH 04/16] block: allow blk-zoned devices to have
 non-power-of-2 zone size
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
From: Damien Le Moal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: jiangbo.365@bytedance.com, kch@nvidia.com, bvanassche@acm.org,
 matias.bjorling@wdc.com, gost.dev@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, clm@fb.com, dm-devel@redhat.com, agk@redhat.com,
 jonathan.derrick@linux.dev, kbusch@kernel.org, linux-fsdevel@vger.kernel.org,
 josef@toxicpanda.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/28/22 01:02, Pankaj Raghav wrote:
> Convert the calculations on zone size to be generic instead of relying on
> power_of_2 based logic in the block layer using the helpers wherever
> possible.
> 
> The only hot path affected by this change for power_of_2 zoned devices
> is in blk_check_zone_append() but the effects should be negligible as the
> helper blk_queue_zone_aligned() optimizes the calculation for those
> devices. Note that the append path cannot be accessed by direct raw access
> to the block device but only through a filesystem abstraction.
> 
> Finally, remove the check for power_of_2 zone size requirement in
> blk-zoned.c
> 
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>  block/blk-core.c  |  3 +--
>  block/blk-zoned.c | 12 ++++++------
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 937bb6b86331..850caf311064 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -634,8 +634,7 @@ static inline blk_status_t blk_check_zone_append(struct request_queue *q,
>  		return BLK_STS_NOTSUPP;
>  
>  	/* The bio sector must point to the start of a sequential zone */
> -	if (pos & (blk_queue_zone_sectors(q) - 1) ||
> -	    !blk_queue_zone_is_seq(q, pos))
> +	if (!blk_queue_zone_aligned(q, pos) || !blk_queue_zone_is_seq(q, pos))

blk_queue_zone_aligned() is a little confusing since "aligned" is also
used for write-pointer aligned. I would rename this helper

blk_queue_is_zone_start()

or something like that.


>  		return BLK_STS_IOERR;
>  
>  	/*
> diff --git a/block/blk-zoned.c b/block/blk-zoned.c
> index 1dff4a8bd51d..f7c7c3bd148d 100644
> --- a/block/blk-zoned.c
> +++ b/block/blk-zoned.c
> @@ -288,10 +288,10 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
>  		return -EINVAL;
>  
>  	/* Check alignment (handle eventual smaller last zone) */
> -	if (sector & (zone_sectors - 1))
> +	if (!blk_queue_zone_aligned(q, sector))
>  		return -EINVAL;
>  
> -	if ((nr_sectors & (zone_sectors - 1)) && end_sector != capacity)
> +	if (!blk_queue_zone_aligned(q, nr_sectors) && end_sector != capacity)
>  		return -EINVAL;
>  
>  	/*
> @@ -489,14 +489,14 @@ static int blk_revalidate_zone_cb(struct blk_zone *zone, unsigned int idx,
>  	 * smaller last zone.
>  	 */
>  	if (zone->start == 0) {
> -		if (zone->len == 0 || !is_power_of_2(zone->len)) {
> -			pr_warn("%s: Invalid zoned device with non power of two zone size (%llu)\n",
> -				disk->disk_name, zone->len);
> +		if (zone->len == 0) {
> +			pr_warn("%s: Invalid zoned device size",
> +				disk->disk_name);

The message is weird now. Please change it to "Invalid zone size".

Also, the entire premise of this patch series is that it is hard for
people to support the unusable sectors between zone capacity and zone end
for drives with a zone capacity smaller than the zone size.

Yet, here you do not check that zone capacity == zone size for drives that
do not have a zone size equal to a power of 2 number of sectors. This
means that we can still have drives with ZC < ZS AND ZS not equal to a
power of 2. So from the point of view of your arguments, no gains at all.
Any thoughts on this ?

>  			return -ENODEV;
>  		}
>  
>  		args->zone_sectors = zone->len;
> -		args->nr_zones = (capacity + zone->len - 1) >> ilog2(zone->len);
> +		args->nr_zones = div64_u64(capacity + zone->len - 1, zone->len);
>  	} else if (zone->start + args->zone_sectors < capacity) {
>  		if (zone->len != args->zone_sectors) {
>  			pr_warn("%s: Invalid zoned device with non constant zone size\n",


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
