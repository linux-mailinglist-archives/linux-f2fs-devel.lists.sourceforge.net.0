Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 484DD7250C4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 01:25:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6g2t-0002h8-Iy;
	Tue, 06 Jun 2023 23:25:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phil@philpotter.co.uk>) id 1q6g2s-0002h2-MQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 23:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4AyxSeVCWLu668XQQXcZmNRbTvqm+XfWnbYRI3bfM+o=; b=kTQ0WK5xftYSHBq9pLDbiJ7tCA
 szTKCTkfdaiBIwxHV/8E7G+YsZELx2ZNlsvJHnJcnKokX8d3u7PxuP8nil5QOR86u4cWamRSKQp31
 wD77ixO3MopJtEF3trDR1Z36YQiAQXCxP2TOw7QjmN4ZL6s6yVsPGU5o/JCeniocsc+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4AyxSeVCWLu668XQQXcZmNRbTvqm+XfWnbYRI3bfM+o=; b=jGBRa2MKdGoaesRkY3S/ExKXZR
 P32hKQp5/tK4ITg1o2+t7Yg4nkVSvdj20wZmPNodkNsQ4k+NdtbNkbhDaLaZv3zOAIrS9/qPQBNtd
 zVYS3pe3R6WesVvzySHA56TswTM8uKwHP3TbI8DcZS3ORdn1zwxSQ9qvh5rlJPHc0ilQ=;
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6g2o-00031r-Ds for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 23:24:59 +0000
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-978345f3798so319411166b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Jun 2023 16:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philpotter-co-uk.20221208.gappssmtp.com; s=20221208; t=1686093888;
 x=1688685888; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4AyxSeVCWLu668XQQXcZmNRbTvqm+XfWnbYRI3bfM+o=;
 b=1QDwzjVlWScvxoO3nAE/9jbBh3tBejZV794B7f3Aihm9yy4bbw49lXetk3azRepBXe
 360Ehi9HznSGTkp3Elp3m0xxNy/P8bBR6rXvST73EYfSg5KD2rK9OR0aoa5DCB30pmnx
 rjsEq5zqeNvfPlASBJDa98R3d9c3GHJQ7ly13QCibQILHnSIyqXeu7Do/sy2RQrMBL/G
 J8SD3PIouHIxvJMVRwamBgMk4h0aw0OPiNDSb5iKRXXrTq6V5Z/gkbBDlUFvdPTyn/+L
 FH55zp8PtoYM2cb4fs/Q52Fq8VMI+f8vEGfIfOEWKBYc1ZthnGzfO+K5O7pHVzR/U5XB
 ozgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686093888; x=1688685888;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4AyxSeVCWLu668XQQXcZmNRbTvqm+XfWnbYRI3bfM+o=;
 b=J+hP2uxzdWoRVjucrRiBzIVFJ4v+Cio3EltGhcA5yO8n2mK4lzouGXMNXt3Li6bkWM
 +hMC1Y7B7EAin3hzqEClupoMjp3kLWuneq2qfZu9FlEZ1aJ5e4XXg7OkmungVuT8FPv+
 CC81xjlRMgixXUTfkOlqJYPs4+VmrRFR+UjvNPT7yp+WKN6QTobWoPLAHMHOyuRQMQId
 9YsKnZM7AUhLbmd8qWvXXwyhYBlPnxgfdyEhMGu3SamBPa+qILlU/xz0NiIXtqsaZViv
 /ORsTQOqmtRbE1W2LPyGYtgLrEmrk/rsN+kE7wm2J/QO8qgHoyGKneTS4eVE2m3my3zB
 bAzg==
X-Gm-Message-State: AC+VfDxp3nFaBprRk+JAhA6jcjYsYzo24X46IsAgWQ76a2UxweSgZ1Y7
 Bb9TGlEn7osR2SJIyRiykaMbQj+Ox5XZhBQYgqvxTZDd
X-Google-Smtp-Source: ACHHUZ5ZvgvojXp46B2yfDhTglh07h4ImH+yrfGSyDnf68I9NldGnBlDJsUdFl1IxgkatnTdfmUXtg==
X-Received: by 2002:a1c:4c0d:0:b0:3f5:6e6:9d83 with SMTP id
 z13-20020a1c4c0d000000b003f506e69d83mr2830681wmf.23.1686092459976; 
 Tue, 06 Jun 2023 16:00:59 -0700 (PDT)
Received: from equinox
 (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:dfde:e1a0::2]) by smtp.gmail.com with ESMTPSA id
 u25-20020a7bcb19000000b003f73a101f88sm201447wmj.16.2023.06.06.16.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 16:00:59 -0700 (PDT)
Date: Wed, 7 Jun 2023 00:00:57 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ZH+6qd1W75G49P7p@equinox>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-7-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-7-hch@lst.de>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 06, 2023 at 09:39:25AM +0200, Christoph Hellwig
 wrote: > Signed-off-by: Christoph Hellwig <hch@lst.de> > --- >
 drivers/cdrom/cdrom.c
 | 2 +- > drivers/cdrom/gdrom.c | 2 +- > drivers/scsi/sr [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.51 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.51 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1q6g2o-00031r-Ds
Subject: Re: [f2fs-dev] [PATCH 06/31] cdrom: remove the unused mode argument
 to cdrom_release
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 06, 2023 at 09:39:25AM +0200, Christoph Hellwig wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/cdrom/cdrom.c | 2 +-
>  drivers/cdrom/gdrom.c | 2 +-
>  drivers/scsi/sr.c     | 2 +-
>  include/linux/cdrom.h | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index adebac1bd210d9..998b03fe976e22 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -1250,7 +1250,7 @@ static int check_for_audio_disc(struct cdrom_device_info *cdi,
>  	return 0;
>  }
>  
> -void cdrom_release(struct cdrom_device_info *cdi, fmode_t mode)
> +void cdrom_release(struct cdrom_device_info *cdi)
>  {
>  	const struct cdrom_device_ops *cdo = cdi->ops;
>  
> diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
> index 14922403983e9e..a401dc4218a998 100644
> --- a/drivers/cdrom/gdrom.c
> +++ b/drivers/cdrom/gdrom.c
> @@ -481,7 +481,7 @@ static int gdrom_bdops_open(struct block_device *bdev, fmode_t mode)
>  	bdev_check_media_change(bdev);
>  
>  	mutex_lock(&gdrom_mutex);
> -	ret = cdrom_open(gd.cd_info, mode);
> +	ret = cdrom_open(gd.cd_info);
>  	mutex_unlock(&gdrom_mutex);
>  	return ret;
>  }
> diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
> index 444c7efc14cba7..6d33120ee5ba85 100644
> --- a/drivers/scsi/sr.c
> +++ b/drivers/scsi/sr.c
> @@ -512,7 +512,7 @@ static void sr_block_release(struct gendisk *disk, fmode_t mode)
>  	struct scsi_cd *cd = scsi_cd(disk);
>  
>  	mutex_lock(&cd->lock);
> -	cdrom_release(&cd->cdi, mode);
> +	cdrom_release(&cd->cdi);
>  	mutex_unlock(&cd->lock);
>  
>  	scsi_device_put(cd->device);
> diff --git a/include/linux/cdrom.h b/include/linux/cdrom.h
> index 385e94732b2cf1..3f23d5239de254 100644
> --- a/include/linux/cdrom.h
> +++ b/include/linux/cdrom.h
> @@ -102,7 +102,7 @@ int cdrom_read_tocentry(struct cdrom_device_info *cdi,
>  
>  /* the general block_device operations structure: */
>  int cdrom_open(struct cdrom_device_info *cdi, fmode_t mode);
> -extern void cdrom_release(struct cdrom_device_info *cdi, fmode_t mode);
> +void cdrom_release(struct cdrom_device_info *cdi);
>  int cdrom_ioctl(struct cdrom_device_info *cdi, struct block_device *bdev,
>  		unsigned int cmd, unsigned long arg);
>  extern unsigned int cdrom_check_events(struct cdrom_device_info *cdi,
> -- 
> 2.39.2
> 

Looks good, thanks.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
