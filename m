Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0041E725E47
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 14:13:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6s2q-0006WE-Ey;
	Wed, 07 Jun 2023 12:13:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hare@suse.de>) id 1q6s2p-0006W8-N7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 12:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=StU8bsjNjflHj0YFd3pOgj01pYtuKwFRrsba2nNmHxc=; b=H8y548ZmU6fkl8GViQXuFebAkh
 pZvi6bNEmI1InfywZ5iEG35w/BfHkTg/qnsotfW9iMr7iOMOGi30Z5lgyrL4hStPF2LIwjhIABZyj
 cDnGyPyJ8X1fFK//69Gz63XNKmllvXbYRip+xn5FZaE9AXU695mSAfh+9sSm8NjO1xa0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=StU8bsjNjflHj0YFd3pOgj01pYtuKwFRrsba2nNmHxc=; b=FbSPJ6BkLmHxwONftvfUQn52Ik
 tP9G+M+uJuYKNHz9f18PfQklEZn9y7u7JczUTFM1gyM4p9gQGp2+0v9bnfEdVGcLmzq1bnZIp6dfB
 8+9SQoFW+GwFw0PuA8kz8hsyCbiaCa3PtQD8Y0sxZjkQaPsp08g3iytz4U1+AxD+Ttp8=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6s2m-00DfeD-5h for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 12:13:44 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E1308218B8;
 Wed,  7 Jun 2023 12:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686140013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=StU8bsjNjflHj0YFd3pOgj01pYtuKwFRrsba2nNmHxc=;
 b=dMMg+c9NJGeIwDBEGbx2Qu0RmdyzjEbDquVhtxZPyu0hsWDj62tdshi8Pk+C/wPadb/RFE
 FnFkUmm9S3NcyQ4hIfWvWWKM5Qe4kSe5QdN4EGvw7IISWJ49A0dyy9AvJh3Hu0hoLwhkxh
 nEwP4x5dY8zjOJEiuhgizoLxmTJK3bM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686140013;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=StU8bsjNjflHj0YFd3pOgj01pYtuKwFRrsba2nNmHxc=;
 b=UHMYFZOyP/acMA8ezhNsMXSgaL/blHnAMYHL7lhda0+2cRiUsjJd9ypcsD0e8JWz2sThGU
 CZGpXJmSh+0RoTCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF4DF13776;
 Wed,  7 Jun 2023 12:13:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QoqCKm10gGSJPQAAMHmgww
 (envelope-from <hare@suse.de>); Wed, 07 Jun 2023 12:13:33 +0000
Message-ID: <a7524776-f4c3-147a-cfa5-da92d2f877bb@suse.de>
Date: Wed, 7 Jun 2023 14:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-6-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230606073950.225178-6-hch@lst.de>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/6/23 09:39, Christoph Hellwig wrote: > Set a flag when
 a cdrom_device_info is opened for writing, instead of > trying to figure
 out this at release time. This will allow to eventually > remove th [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q6s2m-00DfeD-5h
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
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/6/23 09:39, Christoph Hellwig wrote:
> Set a flag when a cdrom_device_info is opened for writing, instead of
> trying to figure out this at release time.  This will allow to eventually
> remove the mode argument to the ->release block_device_operation as
> nothing but the CDROM drivers uses that argument.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/cdrom/cdrom.c | 12 +++++-------
>   include/linux/cdrom.h |  1 +
>   2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index 08abf1ffede002..adebac1bd210d9 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -1172,6 +1172,7 @@ int cdrom_open(struct cdrom_device_info *cdi, fmode_t mode)
>   			ret = 0;
>   			cdi->media_written = 0;
>   		}
> +		cdi->opened_for_data = true;
>   	}
>   
>   	if (ret)
> @@ -1252,7 +1253,6 @@ static int check_for_audio_disc(struct cdrom_device_info *cdi,
>   void cdrom_release(struct cdrom_device_info *cdi, fmode_t mode)
>   {
>   	const struct cdrom_device_ops *cdo = cdi->ops;
> -	int opened_for_data;
>   
>   	cd_dbg(CD_CLOSE, "entering cdrom_release\n");
>   
> @@ -1270,14 +1270,12 @@ void cdrom_release(struct cdrom_device_info *cdi, fmode_t mode)
>   		}
>   	}
>   
> -	opened_for_data = !(cdi->options & CDO_USE_FFLAGS) ||
> -		!(mode & FMODE_NDELAY);
> -
>   	cdo->release(cdi);
> -	if (cdi->use_count == 0) {      /* last process that closes dev*/
> -		if (opened_for_data &&
> -		    cdi->options & CDO_AUTO_EJECT && CDROM_CAN(CDC_OPEN_TRAY))
> +
> +	if (cdi->use_count == 0 && cdi->opened_for_data) {
> +		if (cdi->options & CDO_AUTO_EJECT && CDROM_CAN(CDC_OPEN_TRAY))
>   			cdo->tray_move(cdi, 1);
> +		cdi->opened_for_data = false;
>   	}
>   }
>   EXPORT_SYMBOL(cdrom_release);
> diff --git a/include/linux/cdrom.h b/include/linux/cdrom.h
> index 0a5db0b0c958a1..385e94732b2cf1 100644
> --- a/include/linux/cdrom.h
> +++ b/include/linux/cdrom.h
> @@ -64,6 +64,7 @@ struct cdrom_device_info {
>   	int (*exit)(struct cdrom_device_info *);
>   	int mrw_mode_page;
>   	__s64 last_media_change_ms;
> +	bool opened_for_data;
>   };
>   
>   struct cdrom_device_ops {

Do we care about alignment here?
integer followed by a 64 bit value followed by a bool seems
like an automatic padding to me ...

Cheers,

Hannes



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
