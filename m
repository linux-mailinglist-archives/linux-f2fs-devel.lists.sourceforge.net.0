Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE320518A23
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 May 2022 18:38:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlvXN-00063J-9Z; Tue, 03 May 2022 16:38:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nlvXM-00063D-No
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 16:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lyBgny2owanKpSK297XC+SuygGQevv1e+zn1E24si/Y=; b=VParyVVLS0FvTkUf20FA4aP2eQ
 t7OCk+yRfGBnFig/fbnWydyMvavH+mOUw4SMbiLm6zC2GKwBzG/UMbrhgaMTl9494nfE+1xufu+P1
 K53y7zoJRXg5zEECyFoI8u40VlfQODRWGv6qtUo9CeetBUg7LWhBLlpQgEfA6R5losWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lyBgny2owanKpSK297XC+SuygGQevv1e+zn1E24si/Y=; b=OQWPH4J/8Mj84ZkmwUZ+GjRT6O
 1ZJKbFpbvx32tI2RrU/EamqLx4dOtZO/57qK5DmMZE12LubYV71QP4NTvnEb5xctmX/qm9dSXx8oT
 IY1TImmgCv36jkQLMJsHOX8cnjzd4hLJni6vhpUbxkmu2f2DtkIP7QiVDP4GVdern4uI=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nlvXM-0003K0-El
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 16:38:08 +0000
Received: by mail-pf1-f179.google.com with SMTP id a11so15176407pff.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 May 2022 09:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lyBgny2owanKpSK297XC+SuygGQevv1e+zn1E24si/Y=;
 b=5pnYyJmCWoYsaJPQyWhXuyZ8f9n8FehwJGBj/Lg3aBws/6vGL2JK+eRlXVLB1Rr0PF
 KQbP74aYyDM2ImlNfsRmZQZ4IOhJB8QbngEViA1Z0sl7s6YY6tux8+43Xc0EdGhNi3UQ
 TUrLE9SrsCpMhqzAMWCk3w1nycBwxmnlrDloKG51iVwKSlmpuQVofb8GRHt6xmpPmMei
 owdbsIXQyu2sA/tbW1lVUXzVnZuKOf5v0s2PUIq3IjvgAaknvCU0OF+8pbBt/Fv/K9Xg
 dnVrPaHC/qk7h8ETuwFWa6AU2AetELNFkzM/AkmdkAdCDRd8WmwE19DeIpKS8V6MBSuZ
 LGTg==
X-Gm-Message-State: AOAM53161GVGO5evqNuPd83YVogTlpdcVK6hKxPKae1BWcpmI0E13kL4
 6kCdmr5qY5LONoU8UY2v44k=
X-Google-Smtp-Source: ABdhPJzonovBzoV4fwi9NXoKhV1eYPIxcI7yjfJw6mLDHLxG6LjY81SsAeWrZCq7zhToKZSiSL9kvA==
X-Received: by 2002:a63:5020:0:b0:39e:5d26:4316 with SMTP id
 e32-20020a635020000000b0039e5d264316mr14532146pgb.294.1651595882292; 
 Tue, 03 May 2022 09:38:02 -0700 (PDT)
Received: from [10.10.69.251] ([8.34.116.185])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a170903125100b0015e8d4eb27bsm6564629plh.197.2022.05.03.09.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 09:38:01 -0700 (PDT)
Message-ID: <3a178153-62c0-e298-ccb0-0edfd41b7ee2@acm.org>
Date: Tue, 3 May 2022 09:37:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Pankaj Raghav <p.raghav@samsung.com>, jaegeuk@kernel.org,
 axboe@kernel.dk, snitzer@kernel.org, hch@lst.de, mcgrof@kernel.org,
 naohiro.aota@wdc.com, sagi@grimberg.me, damien.lemoal@opensource.wdc.com,
 dsterba@suse.com, johannes.thumshirn@wdc.com
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160257eucas1p21fb58d0129376a135fdf0b9c2fe88895@eucas1p2.samsung.com>
 <20220427160255.300418-2-p.raghav@samsung.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220427160255.300418-2-p.raghav@samsung.com>
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/27/22 09:02,
 Pankaj Raghav wrote: > Adapt blkdev_nr_zones
 and blk_queue_zone_no function so that it can > also work for non-power-of-2
 zone sizes. > > As the existing deployments of zoned devices [...] 
 Content analysis details:   (-2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.179 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -2.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nlvXM-0003K0-El
Subject: Re: [f2fs-dev] [PATCH 01/16] block: make blkdev_nr_zones and
 blk_queue_zone_no generic for npo2 zsze
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
Cc: jiangbo.365@bytedance.com, kch@nvidia.com, matias.bjorling@wdc.com,
 gost.dev@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, clm@fb.com, dm-devel@redhat.com, agk@redhat.com,
 jonathan.derrick@linux.dev, kbusch@kernel.org, linux-fsdevel@vger.kernel.org,
 josef@toxicpanda.com, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/27/22 09:02, Pankaj Raghav wrote:
> Adapt blkdev_nr_zones and blk_queue_zone_no function so that it can
> also work for non-power-of-2 zone sizes.
> 
> As the existing deployments of zoned devices had power-of-2
> assumption, power-of-2 optimized calculation is kept for those devices.
> 
> There are no direct hot paths modified and the changes just
> introduce one new branch per call.
> 
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>   block/blk-zoned.c      | 8 +++++++-
>   include/linux/blkdev.h | 8 +++++++-
>   2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/block/blk-zoned.c b/block/blk-zoned.c
> index 38cd840d8838..1dff4a8bd51d 100644
> --- a/block/blk-zoned.c
> +++ b/block/blk-zoned.c
> @@ -117,10 +117,16 @@ EXPORT_SYMBOL_GPL(__blk_req_zone_write_unlock);
>   unsigned int blkdev_nr_zones(struct gendisk *disk)
>   {
>   	sector_t zone_sectors = blk_queue_zone_sectors(disk->queue);
> +	sector_t capacity = get_capacity(disk);
>   
>   	if (!blk_queue_is_zoned(disk->queue))
>   		return 0;
> -	return (get_capacity(disk) + zone_sectors - 1) >> ilog2(zone_sectors);
> +
> +	if (is_power_of_2(zone_sectors))
> +		return (capacity + zone_sectors - 1) >>
> +		       ilog2(zone_sectors);
> +
> +	return div64_u64(capacity + zone_sectors - 1, zone_sectors);
>   }
>   EXPORT_SYMBOL_GPL(blkdev_nr_zones);

Does anyone need support for more than 4 billion sectors per zone? If 
not, do_div() should be sufficient.

> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 60d016138997..c4e4c7071b7b 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -665,9 +665,15 @@ static inline unsigned int blk_queue_nr_zones(struct request_queue *q)
>   static inline unsigned int blk_queue_zone_no(struct request_queue *q,
>   					     sector_t sector)
>   {
> +	sector_t zone_sectors = blk_queue_zone_sectors(q);
> +
>   	if (!blk_queue_is_zoned(q))
>   		return 0;
> -	return sector >> ilog2(q->limits.chunk_sectors);
> +
> +	if (is_power_of_2(zone_sectors))
> +		return sector >> ilog2(zone_sectors);
> +
> +	return div64_u64(sector, zone_sectors);
>   }

Same comment here.

Thanks,

Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
