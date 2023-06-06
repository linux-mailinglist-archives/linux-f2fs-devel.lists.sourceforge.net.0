Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F087250A5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 01:18:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6fw5-0006CX-Ua;
	Tue, 06 Jun 2023 23:17:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phil@philpotter.co.uk>) id 1q6fvz-0006CN-8y
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 23:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WXBt7JZzXPFqym4cCnJPiy0FfIw5Z8TRQSIrowmnJ2I=; b=VoOR0sTB6WFjKrS/WIWspLx6Ii
 f0HgKHTHnT1WZ905Gjt9HXsKFCAJHbzEa/KzGoSCA4ApTWEeHDWcxuchHrb5PS+Ppn1btDuc2HHVc
 pwB8kJ6FDqgZtgxR+u4bBJX1vAEGViMTNiJUW4Gr5OMlrQTuMzN4ux2GefROv566a/m0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WXBt7JZzXPFqym4cCnJPiy0FfIw5Z8TRQSIrowmnJ2I=; b=m9psY+/F2XHPSLa8+nbdQKCFuD
 ib2AVGDeiaW7+kLmdAvwU6VhPE2w1TFrlvd3yG2C+SfZMEg542p3cuW2S3exZ2Q7gt+wNIFj2lO4g
 eA7ddfNEsmgA/aEgiviN69R8zrXg7/upf3mFXKtWJQqpFsOdKLcJsvi7tsAqCdF4UNMs=;
Received: from mail-lf1-f47.google.com ([209.85.167.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6fvv-00D9nO-I2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 23:17:51 +0000
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-4f62b552751so3474074e87.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Jun 2023 16:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philpotter-co-uk.20221208.gappssmtp.com; s=20221208; t=1686093461;
 x=1688685461; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WXBt7JZzXPFqym4cCnJPiy0FfIw5Z8TRQSIrowmnJ2I=;
 b=XL82Yg7jZgFAvrlY+039WYFOpxz9m9/0cd54TqClxvpQYZMUJaQG5VMm+poKsCaVpm
 5J1aoY3ds3clnPxwtj+mBsthGB/qCo87t4xycIfg/GleDrzdSEdc7fnWitDGKJhsWl4f
 co6qawsRGobQX6e7t7N0sWHRtQh8HXmGmuUPMysPEMJNIn5bnXHPjyHzgPmviyKow53k
 16QDGEcJnh2igJ+1koI2vJsXkfmg60ZnKMb9mFkNMdE+HaY7iWhg/CVSSTk5IJCk0jgB
 NvGucjSZrZEZ06CmXFW/4mw+PQRV5H0C/oH+TfAy8Ft0cwKQJa5HQ5bKFQUX5g5T/Zfn
 trRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686093461; x=1688685461;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXBt7JZzXPFqym4cCnJPiy0FfIw5Z8TRQSIrowmnJ2I=;
 b=cOYsaf+Ell7CACtYvWS6f4UAS4w3biTadMYjs2mk/bT789vtJEfIZC8mdQG5/Fd2g5
 jNVv4UdgqcNv9puvyga71OtT+niG2JdWoPVwKJgQUiWXe75JfcI2gXFqJo/9HKLfWXOS
 Q3xLPx8rOY04dVhyZ8My+GFdFSsPSSElF8rJhxjOXr25edY8YWbl2B+8rwvY/tF9DvZ2
 riMPXd9iH/luKDPMwMiHNOEVq/82gHvtFP+kggF+wr7ClRe/rofdBQ3uBnH9ixvJzW4+
 8xy8JqhLLKVeOEeet2HAHCsRZZjbKaAm9f9segu/x6u69PSuMXR2DobH5DSwhpiyzar8
 6vOA==
X-Gm-Message-State: AC+VfDxBzOmKOB9QPh3zJnt9BfyTiErBD5p6doP1siZxk+Bt+xiu29Ar
 t5ATVpxiGVIYLzdmzzvpZMB11WCeu/upO1K7hxJA6eTp
X-Google-Smtp-Source: ACHHUZ5EAPVlS/dXZUIlff9U6cMvQ7qyxaaebNKkscChr1x36A65KZewdQ5EyNlkJSg7wU45zOpv+A==
X-Received: by 2002:a5d:458c:0:b0:309:4e85:897e with SMTP id
 p12-20020a5d458c000000b003094e85897emr2751249wrq.17.1686092054063; 
 Tue, 06 Jun 2023 15:54:14 -0700 (PDT)
Received: from equinox
 (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:dfde:e1a0::2]) by smtp.gmail.com with ESMTPSA id
 y6-20020a5d4ac6000000b002c70ce264bfsm13877769wrs.76.2023.06.06.15.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 15:54:13 -0700 (PDT)
Date: Tue, 6 Jun 2023 23:54:11 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ZH+5E5OUUBcE1URG@equinox>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-4-hch@lst.de>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 06, 2023 at 09:39:22AM +0200, Christoph Hellwig
 wrote: > Signed-off-by: Christoph Hellwig <hch@lst.de> > --- >
 drivers/cdrom/cdrom.c
 | 2 +- > drivers/cdrom/gdrom.c | 2 +- > drivers/scsi/sr [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.47 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q6fvv-00D9nO-I2
Subject: Re: [f2fs-dev] [PATCH 03/31] cdrom: remove the unused mode argument
 to cdrom_ioctl
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

On Tue, Jun 06, 2023 at 09:39:22AM +0200, Christoph Hellwig wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/cdrom/cdrom.c | 2 +-
>  drivers/cdrom/gdrom.c | 2 +-
>  drivers/scsi/sr.c     | 2 +-
>  include/linux/cdrom.h | 4 ++--
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index e3eab319cb0474..245e5bbb05d41c 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -3336,7 +3336,7 @@ static int mmc_ioctl(struct cdrom_device_info *cdi, unsigned int cmd,
>   * ATAPI / SCSI specific code now mainly resides in mmc_ioctl().
>   */
>  int cdrom_ioctl(struct cdrom_device_info *cdi, struct block_device *bdev,
> -		fmode_t mode, unsigned int cmd, unsigned long arg)
> +		unsigned int cmd, unsigned long arg)
>  {
>  	void __user *argp = (void __user *)arg;
>  	int ret;
> diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
> index eaa2d5a90bc82f..14922403983e9e 100644
> --- a/drivers/cdrom/gdrom.c
> +++ b/drivers/cdrom/gdrom.c
> @@ -505,7 +505,7 @@ static int gdrom_bdops_ioctl(struct block_device *bdev, fmode_t mode,
>  	int ret;
>  
>  	mutex_lock(&gdrom_mutex);
> -	ret = cdrom_ioctl(gd.cd_info, bdev, mode, cmd, arg);
> +	ret = cdrom_ioctl(gd.cd_info, bdev, cmd, arg);
>  	mutex_unlock(&gdrom_mutex);
>  
>  	return ret;
> diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
> index 61b83880e395a4..444c7efc14cba7 100644
> --- a/drivers/scsi/sr.c
> +++ b/drivers/scsi/sr.c
> @@ -539,7 +539,7 @@ static int sr_block_ioctl(struct block_device *bdev, fmode_t mode, unsigned cmd,
>  	scsi_autopm_get_device(sdev);
>  
>  	if (cmd != CDROMCLOSETRAY && cmd != CDROMEJECT) {
> -		ret = cdrom_ioctl(&cd->cdi, bdev, mode, cmd, arg);
> +		ret = cdrom_ioctl(&cd->cdi, bdev, cmd, arg);
>  		if (ret != -ENOSYS)
>  			goto put;
>  	}
> diff --git a/include/linux/cdrom.h b/include/linux/cdrom.h
> index cc5717cb0fa8a8..4aea8c82d16971 100644
> --- a/include/linux/cdrom.h
> +++ b/include/linux/cdrom.h
> @@ -103,8 +103,8 @@ int cdrom_read_tocentry(struct cdrom_device_info *cdi,
>  /* the general block_device operations structure: */
>  int cdrom_open(struct cdrom_device_info *cdi, fmode_t mode);
>  extern void cdrom_release(struct cdrom_device_info *cdi, fmode_t mode);
> -extern int cdrom_ioctl(struct cdrom_device_info *cdi, struct block_device *bdev,
> -		       fmode_t mode, unsigned int cmd, unsigned long arg);
> +int cdrom_ioctl(struct cdrom_device_info *cdi, struct block_device *bdev,
> +		unsigned int cmd, unsigned long arg);
>  extern unsigned int cdrom_check_events(struct cdrom_device_info *cdi,
>  				       unsigned int clearing);
>  
> -- 
> 2.39.2
> 

Thanks, looks good.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
