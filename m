Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1863972508B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 01:14:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6fsE-0002V6-Sb;
	Tue, 06 Jun 2023 23:13:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phil@philpotter.co.uk>) id 1q6fsD-0002V0-8p
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 23:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZsgUvAUYrCnrR/1XiT9juxzkogVY5Vs72GapwMni78s=; b=WfWWKNNOBY0ctPgmVWfexyKBRp
 vjEIwB2Zd3vnpdrp5/+DTeQJxNhzsr72iMq3K2GWPoTkHuDcFV4wQ8OYaN9HDMu6TtycEHACeOX2s
 wFxyF//qgP3BBIOHvKEB+yRPUGNB2G75MGZlIA21b4BdSB3xJO2GeOyHtn7Mg1e3FFnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZsgUvAUYrCnrR/1XiT9juxzkogVY5Vs72GapwMni78s=; b=B1WyeUgHsUeLc1w6O67mOMqqCK
 aCsFV+/Z+06/jtVeqJArDwI4D+YK7G0rj0/J3DAMztFqM7iyeI0It6c2UCwFlAxi7qTV/TZEvKoxd
 2OOiG/yMqkbRglh1ysozjKNIV2lFD2+hveNJOT49oLUgsqE8LhxK2qEveVbOoYkiBX9o=;
Received: from mail-ej1-f48.google.com ([209.85.218.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6fs8-00D9c3-KO for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 23:13:57 +0000
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-9768fd99c0cso8033666b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Jun 2023 16:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philpotter-co-uk.20221208.gappssmtp.com; s=20221208; t=1686093226;
 x=1688685226; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZsgUvAUYrCnrR/1XiT9juxzkogVY5Vs72GapwMni78s=;
 b=jJxzphhd1H1jafny7+oFhEHaDLcrBDA0gjkRPBwHlW+IatuOrYhAEGnjVDcKT8fRE2
 WdHLg6XXSBT41IYFDrd54gdkY6LyQPov0qRHsvvLZ0PMcYySTEvFu6PVR0rPKB4vU00u
 AO4F01xdvKJ0GILWjzsqEhrS3f9VQyRubdVJQEuqAU2NvUNfNeG/Z4YFm1tOL6L3FI2Q
 o1+nDtS988a6595fUpR24HrOciBarvMN/OkmI7K8fkloYZeX1jzr7hfll4YT89dvcewU
 Rt+Xlvu6C9po+Tu9wjJlFowjMWQkRnbfc6XfHMhjuKbcTPHu0x497sW7w8eCVQpq9dSX
 iqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686093226; x=1688685226;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZsgUvAUYrCnrR/1XiT9juxzkogVY5Vs72GapwMni78s=;
 b=MPNpmBRfWXqIRxuxhEBJM3HjXXdmN+mjgRxJBgr3LPTYiJuKXOff3QaKoycx0j2Nyj
 yXeEqmpo5DHfzhmOw57XEX5HfKMDQ07Ckff4ODEhQLsX8Wbzg6Poptmd9mHJ03VB4qTt
 KbOg2eWtdufTJSUF+JGntwudRPC1V9XaqpfaOt+wNkaM7MMN8m161SpstGc7LCDZA4gR
 O/mBR0l1Ri4L8q1a4w2POY4cni0/yEPGCBhkYB5JiR+HmfoQpFQLMrB7ewP46AEbgKbt
 3Egol/+LHLxI8YJ0bdkoOhzMyWRn7SGSdLXgqMTzUgCtsvHrZczsDsG0AADOjNoqCs32
 SFtw==
X-Gm-Message-State: AC+VfDxVJeMC2aS1gvu4i5kyyRn7oeSPYyqkqTUDXzxKLCsA1NzYDe6U
 yvYm9Sl14eoISYMi6pYW2h10xmIe4ryw38G5PRpqpbm7
X-Google-Smtp-Source: ACHHUZ6DIZ/PhyT9JV3FzdchvbYZ3qIwLNNEqf/pmfFBTRfAYv0aDDapWKAK27qD8k0ew1wS3jRAUg==
X-Received: by 2002:a5d:6b82:0:b0:30e:47e2:7eca with SMTP id
 n2-20020a5d6b82000000b0030e47e27ecamr4524731wrx.3.1686091845858; 
 Tue, 06 Jun 2023 15:50:45 -0700 (PDT)
Received: from equinox
 (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:dfde:e1a0::2]) by smtp.gmail.com with ESMTPSA id
 l6-20020a5d4bc6000000b0030ae3a6be5bsm13760443wrt.78.2023.06.06.15.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 15:50:45 -0700 (PDT)
Date: Tue, 6 Jun 2023 23:50:43 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ZH+4QyeJ2WCOaPGO@equinox>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-3-hch@lst.de>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 06, 2023 at 09:39:21AM +0200, Christoph Hellwig
 wrote: > Signed-off-by: Christoph Hellwig <hch@lst.de> > --- >
 drivers/cdrom/cdrom.c
 | 3 +-- > drivers/cdrom/gdrom.c | 2 +- > drivers/scsi/s [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.48 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.48 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q6fs8-00D9c3-KO
Subject: Re: [f2fs-dev] [PATCH 02/31] cdrom: remove the unused bdev argument
 to cdrom_open
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

On Tue, Jun 06, 2023 at 09:39:21AM +0200, Christoph Hellwig wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/cdrom/cdrom.c | 3 +--
>  drivers/cdrom/gdrom.c | 2 +-
>  drivers/scsi/sr.c     | 2 +-
>  include/linux/cdrom.h | 3 +--
>  4 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index 416f723a2dbb33..e3eab319cb0474 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -1155,8 +1155,7 @@ int open_for_data(struct cdrom_device_info *cdi)
>   * is in their own interest: device control becomes a lot easier
>   * this way.
>   */
> -int cdrom_open(struct cdrom_device_info *cdi, struct block_device *bdev,
> -	       fmode_t mode)
> +int cdrom_open(struct cdrom_device_info *cdi, fmode_t mode)
>  {
>  	int ret;
>  
> diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
> index ceded5772aac6d..eaa2d5a90bc82f 100644
> --- a/drivers/cdrom/gdrom.c
> +++ b/drivers/cdrom/gdrom.c
> @@ -481,7 +481,7 @@ static int gdrom_bdops_open(struct block_device *bdev, fmode_t mode)
>  	bdev_check_media_change(bdev);
>  
>  	mutex_lock(&gdrom_mutex);
> -	ret = cdrom_open(gd.cd_info, bdev, mode);
> +	ret = cdrom_open(gd.cd_info, mode);
>  	mutex_unlock(&gdrom_mutex);
>  	return ret;
>  }
> diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
> index 12869e6d4ebda8..61b83880e395a4 100644
> --- a/drivers/scsi/sr.c
> +++ b/drivers/scsi/sr.c
> @@ -498,7 +498,7 @@ static int sr_block_open(struct block_device *bdev, fmode_t mode)
>  		sr_revalidate_disk(cd);
>  
>  	mutex_lock(&cd->lock);
> -	ret = cdrom_open(&cd->cdi, bdev, mode);
> +	ret = cdrom_open(&cd->cdi, mode);
>  	mutex_unlock(&cd->lock);
>  
>  	scsi_autopm_put_device(sdev);
> diff --git a/include/linux/cdrom.h b/include/linux/cdrom.h
> index 67caa909e3e615..cc5717cb0fa8a8 100644
> --- a/include/linux/cdrom.h
> +++ b/include/linux/cdrom.h
> @@ -101,8 +101,7 @@ int cdrom_read_tocentry(struct cdrom_device_info *cdi,
>  		struct cdrom_tocentry *entry);
>  
>  /* the general block_device operations structure: */
> -extern int cdrom_open(struct cdrom_device_info *cdi, struct block_device *bdev,
> -			fmode_t mode);
> +int cdrom_open(struct cdrom_device_info *cdi, fmode_t mode);
>  extern void cdrom_release(struct cdrom_device_info *cdi, fmode_t mode);
>  extern int cdrom_ioctl(struct cdrom_device_info *cdi, struct block_device *bdev,
>  		       fmode_t mode, unsigned int cmd, unsigned long arg);
> -- 
> 2.39.2
> 

Thanks for the patch, looks good to me.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
