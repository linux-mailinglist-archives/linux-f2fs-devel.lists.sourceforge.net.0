Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D905127AD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Apr 2022 01:43:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njrJG-0002ft-PN; Wed, 27 Apr 2022 23:43:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <prvs=109e08c9c=damien.lemoal@opensource.wdc.com>)
 id 1njrJF-0002fh-EQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 23:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cc4Wlvlr1vTHdrdVcS7HefpaBj/DJ+6JsawpNa7erTI=; b=FHEqW2b+4aqWjR9HWSlc5i3NSY
 BxYHJHxj66+bXxT86QwhVBKuaCopVSo1i67F8hzWeftZxgnUTz7GArvxp+W4mL50UwHb28dDkFVcr
 u6zgzzwUlTSBh6ue/zzzkE4TSXTuEVTNoYnfJoZrUI5nP7evuwYXabsUi+FGdA7aF9WU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cc4Wlvlr1vTHdrdVcS7HefpaBj/DJ+6JsawpNa7erTI=; b=INmzT0jFqv0X8uHujQcRPVZA03
 9wL5iNwJ/1zz+RyAlD1oaD9foyrG8XTO2LkMQr3GSQhFEnJgFjC1LAZdQae5wKWetOHvVtfWcobMK
 FaT4tYnZCo6wcsbYlJsVlmaEP/EnIjIBxzU9q46LDQLTdtYKSZFtkzFJiQF/7oktIWlI=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njrJ9-0000Xd-Rl
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 23:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651102975; x=1682638975;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b4PQ+YojFt/Da7JedNLqXswRcZ1DtIMcbUQc3b82khE=;
 b=XqO7IYLorqwu+rbLV64SNwm/jxDk1EhKifoNuB3aoxMifm+3HU+7dGkt
 zMGwWis2fJMbsyvg38giWx+sV59JEHm5KwEi01i0MWxaISAiHS2yBSNex
 gvC0EKCv+niiTFcvu/FMsDTEpKE24kzoOVF6Qqwwk5Q6bWL802ebHbG8P
 JqXMIk4YzCyyEuU8G4ykqfgj45hcdn80eInC/3Tni1AyLwU4aF73ci7xD
 w0cN0q+bZTJ49L/vrjKoyO8WiuI6gQ9NhYz4AM3avaJFNDQik8ncVAuoH
 sH+35b8kJGBI0oOstx1Ac9/L8oAKRGTlNd78zEjODuZG7K2qd5+yOl7WS g==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="310973467"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:42:49 +0800
IronPort-SDR: CrJKGJ7MAN+bNdmCUGZaactYc40YvvEKKUE8fd6O5tn9s0WjIqA3ayFM25d0OMsPLxY5KO/KOT
 YRAi9vqi0TccxHT3B9xktqu4nHB2Q2rxd2FDuPSoqDCtS0uQZaM8TTln6+3eXJxilVvIvYPD+k
 qStVcVDmn1RWSwvlRXHeuTcuBb9nGrGlLACxrKVgZ2awEAYrbWyEwTdJoD/ikCrVYTBvMgHkp6
 u0aPm1reFeYHI/3qG5UR6VdgOWtFVZIvRZUR+V710VdKvBpa4o0XIeRSdV6ugpf2mK7wuB0WCo
 xoMT8iTG3QkRKilz6BABffWb
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:13:41 -0700
IronPort-SDR: gxtLBR9x7Ba9UowkhBxchEZc4rGmp+Y8UM8KpgG13hF+XAE0B2KcXnUvpYNRFmDATMF5ZjVGU0
 NNO1ZxbphYCkh3xctXW0B1Vrrr+bphqv8EQJSZ7i+O3S+6S3ae61HrkoUD4sde2twUbP8RxiZi
 bUcMqZCrBSAyJ1/kfR5Ag6g1VxPl8efGPIUxbfKxxaT90Q23hmMOu4oq39ENDKIwHfl9gG/tC6
 MWg9nvsvSPIh6QZyO/4X/YZXS0H2NgW5VRzVZpAHL40LQpjBpYnpr+7D+NDvOlwTrs7qK3WXw4
 eFw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:42:50 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kpb091t7Zz1Rvlx
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:42:49 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1651102968; x=1653694969; bh=b4PQ+YojFt/Da7JedNLqXswRcZ1DtIMcbUQ
 c3b82khE=; b=aG9U+mpCYTqXLYVrB1nXg30+hvfUJ189J7XQSSmBmeZkvjsxkwu
 zAaurumWJ7fm9SJv5J2FbjspgmG5JAqDow1JiX6iGFfC9Of0kykaaFX4ZDKBNjn7
 c1vaCSsv8uCxbA0qKU1vQr7sjo2GKuQXZlvDLVoxWtDsD0Z1sjM+p8Nwc0CEll4E
 D6XCio2WwJ24l1FBaPYbvh0rG1180xMBAGWn41A2ZxbXvt8f3tjQGcCajxa+bHT1
 FmppUurtfeoO8TjI45cH5MPXNN7fFivo3PY5cobe5YbA6m03HnTor8+NQEiSRl8I
 0/HpjutNT+lHDztsGZq4Q/AuoqjjlZcpVwA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Cv4xKyLBK1c2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:42:48 -0700 (PDT)
Received: from [10.225.163.27] (unknown [10.225.163.27])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kpb025hPwz1Rvlc;
 Wed, 27 Apr 2022 16:42:42 -0700 (PDT)
Message-ID: <2ffc46c7-945f-ba26-90db-737fccd74fdf@opensource.wdc.com>
Date: Thu, 28 Apr 2022 08:42:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Pankaj Raghav <p.raghav@samsung.com>, jaegeuk@kernel.org,
 axboe@kernel.dk, snitzer@kernel.org, hch@lst.de, mcgrof@kernel.org,
 naohiro.aota@wdc.com, sagi@grimberg.me, dsterba@suse.com,
 johannes.thumshirn@wdc.com
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160313eucas1p1feecf74ec15c8c3d9250444710fd1676@eucas1p1.samsung.com>
 <20220427160255.300418-17-p.raghav@samsung.com>
Organization: Western Digital Research
In-Reply-To: <20220427160255.300418-17-p.raghav@samsung.com>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/28/22 01:02,
 Pankaj Raghav wrote: > From: Luis Chamberlain
 <mcgrof@kernel.org> > > Today dm-zoned relies on the assumption that you
 have a zone size > with a power of 2. Even though the block lay [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.141.245 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1njrJ9-0000Xd-Rl
Subject: Re: [f2fs-dev] [PATCH 16/16] dm-zoned: ensure only power of 2 zone
 sizes are allowed
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
> From: Luis Chamberlain <mcgrof@kernel.org>
> 
> Today dm-zoned relies on the assumption that you have a zone size
> with a power of 2. Even though the block layer today enforces this
> requirement, these devices do exist and so provide a stop-gap measure
> to ensure these devices cannot be used by mistake
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>  drivers/md/dm-zone.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/md/dm-zone.c b/drivers/md/dm-zone.c
> index 57daa86c19cf..221e0aa0f1a7 100644
> --- a/drivers/md/dm-zone.c
> +++ b/drivers/md/dm-zone.c
> @@ -231,6 +231,18 @@ static int dm_revalidate_zones(struct mapped_device *md, struct dm_table *t)
>  	struct request_queue *q = md->queue;
>  	unsigned int noio_flag;
>  	int ret;
> +	struct block_device *bdev = md->disk->part0;
> +	sector_t zone_sectors;
> +	char bname[BDEVNAME_SIZE];
> +
> +	zone_sectors = bdev_zone_sectors(bdev);
> +
> +	if (!is_power_of_2(zone_sectors)) {
> +		DMWARN("%s: %s only power of two zone size supported\n",
> +		       dm_device_name(md),
> +		       bdevname(bdev, bname));
> +		return 1;
> +	}

Why ?

See my previous email about still allowing ZC < ZS for non power of 2 zone
size drives. dm-zoned can easily support non power of 2 zone size as long
as ZC == ZS for all zones.

The problem with dm-zoned is ZC < ZS *AND* potentially variable ZC per
zone. That cannot be supported easily (still not impossible, but
definitely a lot more complex).

>  
>  	/*
>  	 * Check if something changed. If yes, cleanup the current resources


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
