Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF060513B04
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Apr 2022 19:34:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nk82V-0005Su-R5; Thu, 28 Apr 2022 17:34:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@infradead.org>) id 1nk82C-0005Sa-OB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 17:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CU5vNoZ2DyJnMSSsv6FKJaOR1+kQZIFv71gVo+f6jqA=; b=C14wwntbbLjgxTTIwf7Wtuc6Kp
 Dw89ail1DvOIEPCjC022O/mig7dwLI0UyWcVqHRdKv1wTZ/TGGiuzpr9sO00hwKPckRthcsqohK2H
 3BGWMBosGCFeDcXMmmOQ+awrG+tx7SjfakXzSmrlMqD4kWmKQEwyYbf6ls2NSEug/lDE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CU5vNoZ2DyJnMSSsv6FKJaOR1+kQZIFv71gVo+f6jqA=; b=iKfsz8+xqVRZTx8e8uKoUzq5T4
 7t7ZCnQxkPDkwSSXTLiNOh8OwD+XieqbL1vfZKfP/6ZAGx+0Ixmc0g6RWtsUtPlu9ezmWE2FFtNGe
 mcB3xr2o+aXIlubmcCOnyvK/77AXAvpVPsUXUFtIjmpcQg9opHOGK7iwBVWc38Kv8yN0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nk82A-0000Bv-0g
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 17:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CU5vNoZ2DyJnMSSsv6FKJaOR1+kQZIFv71gVo+f6jqA=; b=jYC4utzF59Rb/tKOmYemaP/wEU
 wlAwR2UrulKrgeXbx+/XQ0gpzYVB7MUifsOGD3Z+QGWNETWT18yE5kxNH6g2tCGUTKNaxu1V30mKc
 HHjpH4ZhdAywtV6L7pe/Qu39s3KZVt54yTBL6LMkSFs6tLRz0hCHoUOsJXrpicBzyVRiQjcPIeLEC
 AxX8KkaoM3BJvxEU3MgDQpBsZuHWf2imtywFQtsSoT5sbDHlYNiv/lCJP+6BbHnma14GU45TN1sqe
 PMDDVUElH/4aFK31a21gZCcTDUSyuvKpWrTHUE7MO9NPsBNFg7Fn3rbVi7b1zjNlhgIS/VVnNw8fq
 TAus3vPA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nk81u-0083c3-7l; Thu, 28 Apr 2022 17:34:14 +0000
Date: Thu, 28 Apr 2022 10:34:14 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Message-ID: <YmrQFu9EbMmrL2Ys@bombadil.infradead.org>
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160313eucas1p1feecf74ec15c8c3d9250444710fd1676@eucas1p1.samsung.com>
 <20220427160255.300418-17-p.raghav@samsung.com>
 <2ffc46c7-945f-ba26-90db-737fccd74fdf@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ffc46c7-945f-ba26-90db-737fccd74fdf@opensource.wdc.com>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Apr 28, 2022 at 08:42:41AM +0900,
 Damien Le Moal wrote: > On 4/28/22 01:02,
 Pankaj Raghav wrote: > > From: Luis Chamberlain <mcgrof@kernel.org>
 > > > > Today dm-zoned relies on the assumption [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nk82A-0000Bv-0g
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
Cc: jiangbo.365@bytedance.com, linux-nvme@lists.infradead.org, clm@fb.com,
 dm-devel@redhat.com, hch@lst.de, agk@redhat.com, naohiro.aota@wdc.com,
 sagi@grimberg.me, gost.dev@samsung.com, jonathan.derrick@linux.dev,
 Pankaj Raghav <p.raghav@samsung.com>, kch@nvidia.com, snitzer@kernel.org,
 josef@toxicpanda.com, linux-block@vger.kernel.org, dsterba@suse.com,
 kbusch@kernel.org, jaegeuk@kernel.org, matias.bjorling@wdc.com,
 bvanassche@acm.org, axboe@kernel.dk, johannes.thumshirn@wdc.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Apr 28, 2022 at 08:42:41AM +0900, Damien Le Moal wrote:
> On 4/28/22 01:02, Pankaj Raghav wrote:
> > From: Luis Chamberlain <mcgrof@kernel.org>
> > 
> > Today dm-zoned relies on the assumption that you have a zone size
> > with a power of 2. Even though the block layer today enforces this
> > requirement, these devices do exist and so provide a stop-gap measure
> > to ensure these devices cannot be used by mistake
> > 
> > Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> > Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> > ---
> >  drivers/md/dm-zone.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/md/dm-zone.c b/drivers/md/dm-zone.c
> > index 57daa86c19cf..221e0aa0f1a7 100644
> > --- a/drivers/md/dm-zone.c
> > +++ b/drivers/md/dm-zone.c
> > @@ -231,6 +231,18 @@ static int dm_revalidate_zones(struct mapped_device *md, struct dm_table *t)
> >  	struct request_queue *q = md->queue;
> >  	unsigned int noio_flag;
> >  	int ret;
> > +	struct block_device *bdev = md->disk->part0;
> > +	sector_t zone_sectors;
> > +	char bname[BDEVNAME_SIZE];
> > +
> > +	zone_sectors = bdev_zone_sectors(bdev);
> > +
> > +	if (!is_power_of_2(zone_sectors)) {
> > +		DMWARN("%s: %s only power of two zone size supported\n",
> > +		       dm_device_name(md),
> > +		       bdevname(bdev, bname));
> > +		return 1;
> > +	}
> 
> Why ?
> 
> See my previous email about still allowing ZC < ZS for non power of 2 zone
> size drives. dm-zoned can easily support non power of 2 zone size as long
> as ZC == ZS for all zones.

Great, thanks for the heads up.

> The problem with dm-zoned is ZC < ZS *AND* potentially variable ZC per
> zone. That cannot be supported easily (still not impossible, but
> definitely a lot more complex).

I see thanks.

Testing would still be required to ensure this all works well with npo2.
So I'd prefer to do that as a separate effort, even if it is easy. So
for now I think it makes sense to avoid this as this is not yet well
tested.

As with filesystem support, we've even have gotten hints that support
for npo2 should be easy, but without proper testing it would not be
prudent to enable support for users yet.

One step at a time.

  Luis


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
