Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F3C7250A9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 01:19:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6fx7-0002aF-I5;
	Tue, 06 Jun 2023 23:19:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phil@philpotter.co.uk>) id 1q6fx6-0002Zt-5v
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 23:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dxnH2bKFZYPbzBbkbYN/M0Q5lBbTzYSqgYP+SCcXSJI=; b=a7OCcqRomJL8nRfyMOYBroOrqm
 QhWz7XrTAXg6LFl83v+Eq5INfCA5YByBNSmbag4/e/SAWUGIh4wJZqRu68f6YvX8Vjmd6X+IbUQvf
 nq6VpKI8wDPE7anDPOBw918sacV9lo1/JAYaROqWM+pjxHcK4e2UmVUrFPtSX7/phj0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dxnH2bKFZYPbzBbkbYN/M0Q5lBbTzYSqgYP+SCcXSJI=; b=JV+uEQSEIHo+vcdsFkRterB0NX
 I/eO/VkVT2YLDEhBl1zf6ZCyjhNvVB5V3pyyy2r8lTR898w/tR1Mwyvr6vmm4fiCI9AhjeFeyNhqv
 WBNgVG30DRA+zyVOKJlIhA0eBzTBFLQfi3xDt1bjkxDN1otmrXjmO4VZ5Lm+JP/x8+Ac=;
Received: from mail-ej1-f46.google.com ([209.85.218.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6fx2-00D9pZ-PU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 23:19:00 +0000
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-974f4897d87so770624866b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Jun 2023 16:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philpotter-co-uk.20221208.gappssmtp.com; s=20221208; t=1686093530;
 x=1688685530; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dxnH2bKFZYPbzBbkbYN/M0Q5lBbTzYSqgYP+SCcXSJI=;
 b=ZxaGY1tkR2NqQDBbNNfgfgrUlsFbgn4uaJe2FLY+7uQJeViLgy41jBQY7Sj3+nXVzb
 y/yUQ75sGU4iKRrsxUn/2AgwGgLfxf4ntY4eAYCn9TR4p+fT76KCXQCiecxaMfxoYvjd
 0e/51HUhl0C3auUJTyMlIVJun4iwpA+4RnhZ1S1gPfu1MWvwWNSAUuJQx0s/WeWLkGTY
 g307gGYtRvTpklGSeuqWeL29U4bGbQ+n2T11+tlPh1jrECdxl/zu2WhavHcdmxLDbnqI
 CWZR65kJLd8qqfSH61rBwvc6jNlb59/6BvZ+erJjqN4G9YDcYBVz+TLAH7nHe/N29cO2
 k8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686093530; x=1688685530;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dxnH2bKFZYPbzBbkbYN/M0Q5lBbTzYSqgYP+SCcXSJI=;
 b=N5Ezraf3ut7nPzrO8s82unIpJNsXjQatQED0+5iGyeMFMh0T7LYawOaJL3Nsj25zZQ
 gWFEEwB16moID97eewFpZHTmymiqRMPpvfK3LCsZRa6IDcl9uiKqn2qZiqJnMCM43c/q
 jN0mD3z+HUyhCJCqTPtmDdqNX5AXGPVhjY/8+zJK1lF8ShQj0OwdLsQQR4x5y0q/duPW
 tYii3xKHKYDIVIX2zuqmqknAvFFlTZsV+5kiQL8orXa3+Nl1grL1O2e72H0cAEI8/A9G
 o5iweReB2f0epljEYafuFmXTUH13MU1KBwjhuvvn0aSgf7dNiXRvT3SUiMcsZCOijOVe
 of9g==
X-Gm-Message-State: AC+VfDzoH74fENv4x1pGuvoEsI858Z/Rf9ZSYrw3S0WyFwQ2R8f9UMAX
 gR+MeaVqQB7uxcJQ1ewvzMGkslWRRlN49DNHiGlozkzI
X-Google-Smtp-Source: ACHHUZ5pQzUTLLtnHvgmo1ol8cE04EwQ5GBQgMMp4jQLTMwchBoXo98AWKbZj6A4D3QlrXQs6Z+F2A==
X-Received: by 2002:a5d:4711:0:b0:309:4e06:ff0b with SMTP id
 y17-20020a5d4711000000b003094e06ff0bmr2933775wrq.27.1686092198322; 
 Tue, 06 Jun 2023 15:56:38 -0700 (PDT)
Received: from equinox
 (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:dfde:e1a0::2]) by smtp.gmail.com with ESMTPSA id
 o14-20020a5d62ce000000b0030af54c5f33sm13658638wrv.113.2023.06.06.15.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 15:56:37 -0700 (PDT)
Date: Tue, 6 Jun 2023 23:56:35 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ZH+5oxuJzPnIlVxZ@equinox>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-5-hch@lst.de>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 06, 2023 at 09:39:23AM +0200, Christoph Hellwig
 wrote: > cdrom_close_write is empty, and the for_data flag it is keyed off
 is > never set. Remove all this clutter. > > Signed-off-by: Chris [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.46 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.46 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1q6fx2-00D9pZ-PU
Subject: Re: [f2fs-dev] [PATCH 04/31] cdrom: remove the unused
 cdrom_close_write release code
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

On Tue, Jun 06, 2023 at 09:39:23AM +0200, Christoph Hellwig wrote:
> cdrom_close_write is empty, and the for_data flag it is keyed off is
> never set.  Remove all this clutter.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/cdrom/cdrom.c | 15 ---------------
>  include/linux/cdrom.h |  1 -
>  2 files changed, 16 deletions(-)
> 
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index 245e5bbb05d41c..08abf1ffede002 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -978,15 +978,6 @@ static void cdrom_dvd_rw_close_write(struct cdrom_device_info *cdi)
>  	cdi->media_written = 0;
>  }
>  
> -static int cdrom_close_write(struct cdrom_device_info *cdi)
> -{
> -#if 0
> -	return cdrom_flush_cache(cdi);
> -#else
> -	return 0;
> -#endif
> -}
> -
>  /* badly broken, I know. Is due for a fixup anytime. */
>  static void cdrom_count_tracks(struct cdrom_device_info *cdi, tracktype *tracks)
>  {
> @@ -1282,12 +1273,6 @@ void cdrom_release(struct cdrom_device_info *cdi, fmode_t mode)
>  	opened_for_data = !(cdi->options & CDO_USE_FFLAGS) ||
>  		!(mode & FMODE_NDELAY);
>  
> -	/*
> -	 * flush cache on last write release
> -	 */
> -	if (CDROM_CAN(CDC_RAM) && !cdi->use_count && cdi->for_data)
> -		cdrom_close_write(cdi);
> -
>  	cdo->release(cdi);
>  	if (cdi->use_count == 0) {      /* last process that closes dev*/
>  		if (opened_for_data &&
> diff --git a/include/linux/cdrom.h b/include/linux/cdrom.h
> index 4aea8c82d16971..0a5db0b0c958a1 100644
> --- a/include/linux/cdrom.h
> +++ b/include/linux/cdrom.h
> @@ -61,7 +61,6 @@ struct cdrom_device_info {
>  	__u8 last_sense;
>  	__u8 media_written;		/* dirty flag, DVD+RW bookkeeping */
>  	unsigned short mmc3_profile;	/* current MMC3 profile */
> -	int for_data;
>  	int (*exit)(struct cdrom_device_info *);
>  	int mrw_mode_page;
>  	__s64 last_media_change_ms;
> -- 
> 2.39.2
> 

All good, many thanks.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
