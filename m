Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B10173F400
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jun 2023 07:41:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qE1S5-0005EV-Q4;
	Tue, 27 Jun 2023 05:41:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <groeck7@gmail.com>) id 1qE1S3-0005EP-EB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jun 2023 05:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eUHv1b8aqLsb4R7LditAal7kNTag6lxKqXAOQ2qujCU=; b=a2L5Gy241V3Opev7/ehfRq2esJ
 9de0r83NDKlBk4I8w8h4U7GUWQaR8t5Mjt7ine4fJwooOD8xYzLNcJs/b7xZavc0MmBxDJfOWYWAq
 pHUv93nQJ/koTIv5yX7pqRXPh2tIJuH+b13qyBvufK3353k1YJw9T+1xr0CPvvjQGt2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eUHv1b8aqLsb4R7LditAal7kNTag6lxKqXAOQ2qujCU=; b=jgOibqXHwPiNLe8JqR0nWI0Xjf
 MRKDnvpYFc5Lk+9F7fAFdrQntINMfoE/Xo1m7S8R25ILoAGVTSQ0/jInVewyWSgkLWcO9T6Ysoo1O
 qJdOZqwWjRNbIacO2Z1P978laCceEaokGdcrUQwnd7QFqTELH/409j4WQ0HEgI8avE8k=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qE1Rz-0007UN-De for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jun 2023 05:41:19 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1b8062c1ee1so15041135ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Jun 2023 22:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687844470; x=1690436470;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=eUHv1b8aqLsb4R7LditAal7kNTag6lxKqXAOQ2qujCU=;
 b=fG/WGax37UoauKBSyv6kej64LdcGJrv6k66h8NGOsMv9uaUsNclSu7DiDyHvg7N0+H
 TpLbLvnFmTkLJuRzyFn0V5R9/xG3MBNfmS6gpoZxFQmbIvFJa8XU1iIC6Fyl95ACCFHi
 Ys+3TEnr35uP041kETcaQnaFL3Zzmuv0Ara4RUBuuI4A1DlyY37o026XtSt1PCG00d7o
 R82xvUrMlfJH4JujFDKNZYqLCuYZs3onB7GlXFtQZdgcqNFnR06TCpWzVOviTJnvGG64
 v3WIIO+Pf3siD1OxDgXeCgfd8ad+rtq0TuDOYOoPNLLpd/YOKy903+fL59/xrY4ynCa9
 WP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687844470; x=1690436470;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eUHv1b8aqLsb4R7LditAal7kNTag6lxKqXAOQ2qujCU=;
 b=BWR1jlkE7cVH02HxTkKR8UZupnXkefGfTl13SUdJM74lT6Z8MyJmocYaIAvLYNkyNw
 YWMky2kQFfwDEWhKVwdt+I95+UyKXZS+G8xUarrSiTGFuSBvJye75RXBNI95qOZ3GARr
 sGEA4fxOzm4prZP6XRpvwXfB/KucsJo1PBeLlLnYF+NIsBCJnxMtfeRJLUvFaiRWkO62
 Ok7lG1hxhjQtnFds4hvHyHKYeROCPNCDY/YGYRpJY/RQJ9Pa5AaH2I0Dt1nep0Pfp3Ke
 xTdN56Cbg50XwlpElPloWvsdWMCOmjxm8ZJmnyNDYEbeUiQQhS0IG1PMvpifuLnn/Hpj
 ChLg==
X-Gm-Message-State: AC+VfDwDsXF5PY1F0SoAzKzdT+uzg+14npL2qeuKiB3f4IvGDebyXaEo
 T0tnNsxGU7Hgo46GNIfcpnpwWxiZ2kI=
X-Google-Smtp-Source: ACHHUZ4Aj+CfQoLGg0YEyBUDipJUlv6nej6ije3P7CId9SMSoIBcFwHmOjcIwHyQMLpCclEzduuKWQ==
X-Received: by 2002:a17:902:f54b:b0:1b6:b805:5ae3 with SMTP id
 h11-20020a170902f54b00b001b6b8055ae3mr10571515plf.3.1687844469519; 
 Mon, 26 Jun 2023 22:41:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a1709026a8900b001b80d411e5bsm2144863plk.253.2023.06.26.22.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 22:41:09 -0700 (PDT)
Date: Mon, 26 Jun 2023 22:41:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <fb21bb8b-958a-4238-aab8-c2720ac519ad@roeck-us.net>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-7-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-7-hch@lst.de>
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 06, 2023 at 09:39:25AM +0200, Christoph Hellwig
 wrote: > Signed-off-by: Christoph Hellwig <hch@lst.de> > --- $ git grep
 cdrom_release
 Documentation/cdrom/cdrom-standard.rst: cdrom_release,
 /* release */ Documentation/cdrom/cdrom-standard.rst:the
 door, should be left over to the general routine *cdrom_release [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.175 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [groeck7[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [groeck7[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1qE1Rz-0007UN-De
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

$ git grep cdrom_release
Documentation/cdrom/cdrom-standard.rst:         cdrom_release,          /* release */
Documentation/cdrom/cdrom-standard.rst:the door, should be left over to the general routine *cdrom_release()*.
Documentation/cdrom/cdrom-standard.rst: void cdrom_release(struct inode *ip, struct file *fp)
                                                                           ^^^^^^^^^^^^^^^^^
drivers/cdrom/cdrom.c:void cdrom_release(struct cdrom_device_info *cdi)
drivers/cdrom/cdrom.c:  cd_dbg(CD_CLOSE, "entering cdrom_release\n");
drivers/cdrom/cdrom.c:EXPORT_SYMBOL(cdrom_release);
drivers/cdrom/gdrom.c:  cdrom_release(gd.cd_info, mode);
                                                ^^^^^^
drivers/scsi/sr.c:      cdrom_release(&cd->cdi);
include/linux/cdrom.h:void cdrom_release(struct cdrom_device_info *cdi);

$ git grep cdrom_open
Documentation/cdrom/cdrom-standard.rst:         cdrom_open,             /* open */
Documentation/cdrom/cdrom-standard.rst: int cdrom_open(struct inode * ip, struct file * fp)
Documentation/cdrom/cdrom-standard.rst:This function implements the reverse-logic of *cdrom_open()*, and then
drivers/cdrom/cdrom.c:static int cdrom_open_write(struct cdrom_device_info *cdi)
drivers/cdrom/cdrom.c:int cdrom_open(struct cdrom_device_info *cdi, blk_mode_t mode)
drivers/cdrom/cdrom.c:  cd_dbg(CD_OPEN, "entering cdrom_open\n");
drivers/cdrom/cdrom.c:                  if (cdrom_open_write(cdi))
drivers/cdrom/cdrom.c:EXPORT_SYMBOL(cdrom_open);
drivers/cdrom/gdrom.c:  ret = cdrom_open(gd.cd_info);
                                         ^^^^^^^^^^
drivers/scsi/sr.c:      ret = cdrom_open(&cd->cdi, mode);
include/linux/cdrom.h:int cdrom_open(struct cdrom_device_info *cdi, blk_mode_t mode);

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
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
