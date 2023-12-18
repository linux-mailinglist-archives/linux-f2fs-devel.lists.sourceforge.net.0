Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A810E8169EE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Dec 2023 10:35:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFA2O-0001oA-60;
	Mon, 18 Dec 2023 09:35:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1rFA2M-0001o3-JK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 09:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c6XpL24hSrj1sj6Sfz5IRJdlg5cgqfE7ChjM/+TQ3ms=; b=ZGECbQJrkcsEXz0GC1Hi3G70KI
 Jq1pViQH85DfChZoxLYLigg4SU/0abK9vmPbwly4iQ7UtndIyQsP2DxVi4dlGrmqXcL6OzJg/Qf5m
 aixVbPPFon3I1Q3xICAEujhfC0Ugo9V8HLyLVxPCjtBp+Tuc9ah3lH4wLO9GVlaN8igs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c6XpL24hSrj1sj6Sfz5IRJdlg5cgqfE7ChjM/+TQ3ms=; b=GMpt6YGz7KdhSaftSIBVKkVFtU
 F9m6zVRXecSOpJKpDKIVuMK8e4gWjzZT4pxF5M/5NH2fhCSaAoL2AmKaaVHwOeyGoyKFqPhpK02m2
 +T7pVlYcdSxlN9SgSZHm2Oy+ZbRPdW9uOezulGtaPFS0B8LKkxmqXlNs9mxmoafbfidU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFA2M-0003wZ-5D for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 09:35:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8E384CE0FD6;
 Mon, 18 Dec 2023 09:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3ACC433C7;
 Mon, 18 Dec 2023 09:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702892133;
 bh=PdHvoka0eRTRzrIhBD8Y+azqZmjNt6H86o7Q4PS3jto=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ixzIFM8AXAn2cja/sTESRTfJoPsg4QgxKJKyvmiQM1CWZvFLAr5MOkpcMN5Ys5906
 T8lUM+06OuvSGYR1vOezMXxxqsQquG8879ZlIu4jDA+oxOiue63P+nt0QAXJLhWxjj
 3bwrmS3JwSRWLln1vScF91Vne6aa858bo9b3C3EZBPaGmRIS91eu5THp6C1F1xCrAa
 kClzMKYkkxYj2vY6CDTStAonyBqcFheLWMSCSp+Zwqk7HBKDH0ghgzyyugA2cOtdny
 xgjGGTAbU9lsmnyRKUvlHqbIU27gfNYWiNkdsKdroDVxWtstQUzQM1ztQt6soO5+pJ
 4u5RYHjamVwZw==
Message-ID: <7d3c7ab1-490a-498c-9e15-a33a36788b61@kernel.org>
Date: Mon, 18 Dec 2023 18:35:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20231217165359.604246-1-hch@lst.de>
 <20231217165359.604246-2-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20231217165359.604246-2-hch@lst.de>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/18 1:53, Christoph Hellwig wrote: > Move reading
 and checking the zoned model from virtblk_probe_zoned_device > into the caller,
 leaving only the code to perform the actual setup for > host [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFA2M-0003wZ-5D
Subject: Re: [f2fs-dev] [PATCH 1/5] virtio_blk: cleanup zoned device probing
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
> Move reading and checking the zoned model from virtblk_probe_zoned_device
> into the caller, leaving only the code to perform the actual setup for
> host managed zoned devices in virtblk_probe_zoned_device.
> 
> This allows to share the model reading and sharing between builds with
> and without CONFIG_BLK_DEV_ZONED, and improve it for the
> !CONFIG_BLK_DEV_ZONED case.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good.
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> ---
>  drivers/block/virtio_blk.c | 50 +++++++++++++++++---------------------
>  1 file changed, 22 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index d53d6aa8ee69a4..aeead732a24dc9 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -748,22 +748,6 @@ static int virtblk_probe_zoned_device(struct virtio_device *vdev,
>  				       struct request_queue *q)
>  {
>  	u32 v, wg;
> -	u8 model;
> -
> -	virtio_cread(vdev, struct virtio_blk_config,
> -		     zoned.model, &model);
> -
> -	switch (model) {
> -	case VIRTIO_BLK_Z_NONE:
> -	case VIRTIO_BLK_Z_HA:
> -		/* Present the host-aware device as non-zoned */
> -		return 0;
> -	case VIRTIO_BLK_Z_HM:
> -		break;
> -	default:
> -		dev_err(&vdev->dev, "unsupported zone model %d\n", model);
> -		return -EINVAL;
> -	}
>  
>  	dev_dbg(&vdev->dev, "probing host-managed zoned device\n");
>  
> @@ -846,16 +830,9 @@ static inline void virtblk_revalidate_zones(struct virtio_blk *vblk)
>  static inline int virtblk_probe_zoned_device(struct virtio_device *vdev,
>  			struct virtio_blk *vblk, struct request_queue *q)
>  {
> -	u8 model;
> -
> -	virtio_cread(vdev, struct virtio_blk_config, zoned.model, &model);
> -	if (model == VIRTIO_BLK_Z_HM) {
> -		dev_err(&vdev->dev,
> -			"virtio_blk: zoned devices are not supported");
> -		return -EOPNOTSUPP;
> -	}
> -
> -	return 0;
> +	dev_err(&vdev->dev,
> +		"virtio_blk: zoned devices are not supported");
> +	return -EOPNOTSUPP;
>  }
>  #endif /* CONFIG_BLK_DEV_ZONED */
>  
> @@ -1570,9 +1547,26 @@ static int virtblk_probe(struct virtio_device *vdev)
>  	 * placed after the virtio_device_ready() call above.
>  	 */
>  	if (virtio_has_feature(vdev, VIRTIO_BLK_F_ZONED)) {
> -		err = virtblk_probe_zoned_device(vdev, vblk, q);
> -		if (err)
> +		u8 model;
> +
> +		virtio_cread(vdev, struct virtio_blk_config, zoned.model,
> +				&model);
> +		switch (model) {
> +		case VIRTIO_BLK_Z_NONE:
> +		case VIRTIO_BLK_Z_HA:
> +			/* Present the host-aware device as non-zoned */
> +			break;
> +		case VIRTIO_BLK_Z_HM:
> +			err = virtblk_probe_zoned_device(vdev, vblk, q);
> +			if (err)
> +				goto out_cleanup_disk;
> +			break;
> +		default:
> +			dev_err(&vdev->dev, "unsupported zone model %d\n",
> +				model);
> +			err = -EINVAL;
>  			goto out_cleanup_disk;
> +		}
>  	}
>  
>  	err = device_add_disk(&vdev->dev, vblk->disk, virtblk_attr_groups);

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
