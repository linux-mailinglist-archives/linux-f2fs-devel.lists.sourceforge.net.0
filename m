Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC718169F9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Dec 2023 10:37:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFA3s-0006gs-Fj;
	Mon, 18 Dec 2023 09:37:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1rFA3q-0006gl-Nl
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 09:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zGpWflZPC+kOO1DejABnas9k1cB4w9wgboVXofKBFGg=; b=Hs1HWN3SHQbrgVB3WBqljVhARR
 c2vDHoVqmAQfBBA0VgO21FlLLu9N3Sel3xNr1/fuJj3xcB+HhvLAAI+XBd0B8DCby4DoeOARAlBBk
 o2/bSlzjsuJGGqU5OR4KovHViqVzmeHPNeT7Y1JEzfP5af/J5v0ESar2UUYwo9ResVak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zGpWflZPC+kOO1DejABnas9k1cB4w9wgboVXofKBFGg=; b=Zx5qeLamqgreZC7e8jm17vgP1x
 OHV+xR5CkJ9NoJnriJZl5WFApwIGSyqNAiZCAm/FBHJq6+1KYxnKnqGvAewq0eV9Ux6PY23hXpNRw
 L5TOIFa8bSeRq7zGxyKP8rheNYDQ0Y2rIh7srQGr5j1dn66uEtRl06Rork0dlZmqwKp8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFA3q-00043X-2n for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 09:37:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7AF8CCE0FD1;
 Mon, 18 Dec 2023 09:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD6FC433C7;
 Mon, 18 Dec 2023 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702892225;
 bh=Z4ThilXJPF52KkpFFtkk2UUa9/0Ai3GpLVjPXlR17A8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pQzvQS+KVHfkHlgbEBnhnpy0T/9Bx/Bzsk4DHPZNtT8gZuB8FzsYEzMa4y/M8HFTh
 a/79UdFFQ4wb8X6ArgNHaCrumfzFl4c4nvRTtEs7R84rgH0ukIlh69/Oq7/aCEJ/xJ
 Bp3oSPIeQEpmphihrSKDpgMu/OjpJ1ELUAiLMeRS079UF3wuSSNtgAUWYTP27D0N4e
 IJvEkMcvnJbegCaHWkoh9e0ZLdb2D9VCH4mabPM+NXvDIRMbuCqMZ425d5qEpsLhcC
 lQUcyoWmALOQNLsuwJ3tUeuhPUkPompc6LZj0O/RZdmA9kA/XaLDAtGiq6fcQDpfEM
 DUFigcnPsQiWQ==
Message-ID: <bad7e62c-f4c6-4db9-a1ae-c14d56378072@kernel.org>
Date: Mon, 18 Dec 2023 18:37:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20231217165359.604246-1-hch@lst.de>
 <20231217165359.604246-3-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20231217165359.604246-3-hch@lst.de>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/18 1:53,
 Christoph Hellwig wrote: > virtblk_revalidate_zones
 is called unconditionally from > virtblk_config_changed_work from the virtio
 config_changed callback. > > virtblk_revalidate_zon [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFA3q-00043X-2n
Subject: Re: [f2fs-dev] [PATCH 2/5] virtio_blk: remove the broken zone
 revalidation support
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
Cc: dm-devel@lists.linux.dev, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 virtualization@lists.linux.dev, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/12/18 1:53, Christoph Hellwig wrote:
> virtblk_revalidate_zones is called unconditionally from
> virtblk_config_changed_work from the virtio config_changed callback.
> 
> virtblk_revalidate_zones is a bit odd in that it re-clears the zoned
> state for host aware or non-zoned devices, which isn't needed unless the
> zoned mode changed - but a zone mode change to a host managed model isn't
> handled at all, and virtio_blk also doesn't handle any other config
> change except for a capacity change is handled (and even if it was
> the upper layers above virtio_blk wouldn't handle it very well).
> 
> But even the useful case of a size change that would add or remove
> zones isn't handled properly as blk_revalidate_disk_zones expects the
> device capacity to cover all zones, but the capacity is only updated
> after virtblk_revalidate_zones.
> 
> As this code appears to be entirely untested and is getting in the way
> remove it for now, but it can be readded in a fixed version with
> proper test coverage if needed.
> 
> Fixes: 95bfec41bd3d ("virtio-blk: add support for zoned block devices")
> Fixes: f1ba4e674feb ("virtio-blk: fix to match virtio spec")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Not ideal... But I think this is OK for now given that as you say, the upper
layer will not be able to handle zone changes anyway.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> ---
>  drivers/block/virtio_blk.c | 26 --------------------------
>  1 file changed, 26 deletions(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index aeead732a24dc9..a28f1687066bb4 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -722,27 +722,6 @@ static int virtblk_report_zones(struct gendisk *disk, sector_t sector,
>  	return ret;
>  }
>  
> -static void virtblk_revalidate_zones(struct virtio_blk *vblk)
> -{
> -	u8 model;
> -
> -	virtio_cread(vblk->vdev, struct virtio_blk_config,
> -		     zoned.model, &model);
> -	switch (model) {
> -	default:
> -		dev_err(&vblk->vdev->dev, "unknown zone model %d\n", model);
> -		fallthrough;
> -	case VIRTIO_BLK_Z_NONE:
> -	case VIRTIO_BLK_Z_HA:
> -		disk_set_zoned(vblk->disk, BLK_ZONED_NONE);
> -		return;
> -	case VIRTIO_BLK_Z_HM:
> -		WARN_ON_ONCE(!vblk->zone_sectors);
> -		if (!blk_revalidate_disk_zones(vblk->disk, NULL))
> -			set_capacity_and_notify(vblk->disk, 0);
> -	}
> -}
> -
>  static int virtblk_probe_zoned_device(struct virtio_device *vdev,
>  				       struct virtio_blk *vblk,
>  				       struct request_queue *q)
> @@ -823,10 +802,6 @@ static int virtblk_probe_zoned_device(struct virtio_device *vdev,
>   */
>  #define virtblk_report_zones       NULL
>  
> -static inline void virtblk_revalidate_zones(struct virtio_blk *vblk)
> -{
> -}
> -
>  static inline int virtblk_probe_zoned_device(struct virtio_device *vdev,
>  			struct virtio_blk *vblk, struct request_queue *q)
>  {
> @@ -982,7 +957,6 @@ static void virtblk_config_changed_work(struct work_struct *work)
>  	struct virtio_blk *vblk =
>  		container_of(work, struct virtio_blk, config_work);
>  
> -	virtblk_revalidate_zones(vblk);
>  	virtblk_update_capacity(vblk, true);
>  }
>  

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
