Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C58607250CF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 01:29:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6g7V-0002lm-88;
	Tue, 06 Jun 2023 23:29:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phil@philpotter.co.uk>) id 1q6g7U-0002lg-98
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 23:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xzrxvHE7NOsDG+KS0tlYsM4OII1tBEP7fRMkD9ta1LM=; b=Ny/X7uwj1Q2UCrzBT/KOQI5gF5
 WfN+AktlRMHGkLCO+gqhmujrRviCrHG13w+YmxKmZep2zXANdl/4Z9IhBi08X4FJAXjt+zIxYvxlq
 xQNXurWLCP0UqV36hq0AosbNF+jH2f2MkIqJP04Z/XeZgq+JQw/72JXY/b53zakQWeXM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xzrxvHE7NOsDG+KS0tlYsM4OII1tBEP7fRMkD9ta1LM=; b=lex1iWmg8IR6D3vZz7j2BAw2ZS
 VkOtiemr2Igyw4T+s9Wm+NBX3MuEidPibQpGZsL9LONv3Bt1HYUs0xLWvTqlf2zxSp/qlkiRxz7Wk
 hY51LAqVk/D0oadmtAG/8tgdHIfFRxctdOrlaWyQCBor+9R1wXgQq384zs6YVgia2iWc=;
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6g7Q-00DAGJ-Nh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 23:29:44 +0000
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-977d0ee1736so498121466b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Jun 2023 16:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philpotter-co-uk.20221208.gappssmtp.com; s=20221208; t=1686094174;
 x=1688686174; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xzrxvHE7NOsDG+KS0tlYsM4OII1tBEP7fRMkD9ta1LM=;
 b=O1qFe/QoLigtHLmT5H8I5UrCkDn5WEKSQjsA8V21uMCY5CTcF6diBpfdeJ9YW1IAjH
 NcRwZXMcJG9VOKG5jnCM3OZRgg9z/fV8UqnGORDn8btA/MYJG1Ix68OBZioHQ9kt86KS
 DpsynyafdA5/60iwH8gvGtNdlj5zridTS4RJ4VksjGAAUHH9dvUVarkevkUqdZV2c2+8
 OqF/tNYF4mt6NpZFDghluIVgo9fInhqiKgYxUJfVaVYzhfhNt3KP8mU9ypOPVs/na/S4
 8SQikK4ZjLyNR7lUP4g5i98kJTNjICbUHhEftMp9PwrnEjmDKKmjRHMVK2wn3YTHJfmo
 suqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686094174; x=1688686174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzrxvHE7NOsDG+KS0tlYsM4OII1tBEP7fRMkD9ta1LM=;
 b=AY/7sPGSLf/c9qs+ayjca2aW0HmiZj8o3A3XNnlyl2eQYLHxBzg3Dhz7BOplu/+QyL
 bdW+81ba7vqIi39PbEQmhb1B6KnbiVG4/pX8w1TNGi1ITZdqL/ZlgMg/Wuh7FQ9Q90/6
 G7wjIapIs4W52XQiwY76hHhqyR7E61Hui7PtXva9jBGvb0hMCqtX0YBTvFy9BoRayLTb
 +qsaEKP+4wIUftl4hVj5w52UoD9PVlx68JwOgnWUhkeVXy9F/VIoQyEfJGby1He/jOXs
 6/weYebncRjN2zlp/cEXJ8EzSbZUe6CZHumm5g2N4q6RzSCV1RMiNXm1F1EPU2+kG/sL
 Dp5Q==
X-Gm-Message-State: AC+VfDxtKQXgc2Vpol5AhihjRPaphca7zkT11bh0YqPHF47PyFieSFHk
 zM6GWf02S0KyqQ1E6fxksqkfLS+bR8o9r7Hef5M23WvV
X-Google-Smtp-Source: ACHHUZ5dEmrYamI1Roz1b/XXwx7e2SyRLgLDxBk8a4qqwZElHaxX8CqOd+UmcQ9YIORhk7TJQYcx6A==
X-Received: by 2002:adf:ff8e:0:b0:30e:412a:841b with SMTP id
 j14-20020adfff8e000000b0030e412a841bmr2765794wrr.37.1686092369334; 
 Tue, 06 Jun 2023 15:59:29 -0700 (PDT)
Received: from equinox
 (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:dfde:e1a0::2]) by smtp.gmail.com with ESMTPSA id
 y14-20020a5d470e000000b002fed865c55esm13607049wrq.56.2023.06.06.15.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 15:59:28 -0700 (PDT)
Date: Tue, 6 Jun 2023 23:59:27 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ZH+6T/ibWkjSrWdt@equinox>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-6-hch@lst.de>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 06, 2023 at 09:39:24AM +0200, Christoph Hellwig
 wrote: > Set a flag when a cdrom_device_info is opened for writing, instead
 of > trying to figure out this at release time. This will allow [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.47 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q6g7Q-00DAGJ-Nh
Subject: Re: [f2fs-dev] [PATCH 05/31] cdrom: track if a cdrom_device_info
 was opened for data
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

On Tue, Jun 06, 2023 at 09:39:24AM +0200, Christoph Hellwig wrote:
> Set a flag when a cdrom_device_info is opened for writing, instead of
> trying to figure out this at release time.  This will allow to eventually
> remove the mode argument to the ->release block_device_operation as
> nothing but the CDROM drivers uses that argument.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/cdrom/cdrom.c | 12 +++++-------
>  include/linux/cdrom.h |  1 +
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index 08abf1ffede002..adebac1bd210d9 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -1172,6 +1172,7 @@ int cdrom_open(struct cdrom_device_info *cdi, fmode_t mode)
>  			ret = 0;
>  			cdi->media_written = 0;
>  		}
> +		cdi->opened_for_data = true;
>  	}
>  
>  	if (ret)
> @@ -1252,7 +1253,6 @@ static int check_for_audio_disc(struct cdrom_device_info *cdi,
>  void cdrom_release(struct cdrom_device_info *cdi, fmode_t mode)
>  {
>  	const struct cdrom_device_ops *cdo = cdi->ops;
> -	int opened_for_data;
>  
>  	cd_dbg(CD_CLOSE, "entering cdrom_release\n");
>  
> @@ -1270,14 +1270,12 @@ void cdrom_release(struct cdrom_device_info *cdi, fmode_t mode)
>  		}
>  	}
>  
> -	opened_for_data = !(cdi->options & CDO_USE_FFLAGS) ||
> -		!(mode & FMODE_NDELAY);
> -
>  	cdo->release(cdi);
> -	if (cdi->use_count == 0) {      /* last process that closes dev*/
> -		if (opened_for_data &&
> -		    cdi->options & CDO_AUTO_EJECT && CDROM_CAN(CDC_OPEN_TRAY))
> +
> +	if (cdi->use_count == 0 && cdi->opened_for_data) {
> +		if (cdi->options & CDO_AUTO_EJECT && CDROM_CAN(CDC_OPEN_TRAY))
>  			cdo->tray_move(cdi, 1);
> +		cdi->opened_for_data = false;
>  	}
>  }
>  EXPORT_SYMBOL(cdrom_release);
> diff --git a/include/linux/cdrom.h b/include/linux/cdrom.h
> index 0a5db0b0c958a1..385e94732b2cf1 100644
> --- a/include/linux/cdrom.h
> +++ b/include/linux/cdrom.h
> @@ -64,6 +64,7 @@ struct cdrom_device_info {
>  	int (*exit)(struct cdrom_device_info *);
>  	int mrw_mode_page;
>  	__s64 last_media_change_ms;
> +	bool opened_for_data;
>  };
>  
>  struct cdrom_device_ops {
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
