Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90532725EC0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 14:19:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6s8A-0001WH-Ev;
	Wed, 07 Jun 2023 12:19:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hare@suse.de>) id 1q6s88-0001W9-K6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 12:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B3Xg67NbOS5YKdaySGyicbSsoGzlBjyHFHEFD4Mj8fk=; b=Yg2w/XRI8B4umhGHuEonRpbUMX
 T6x0LRwJAbMZxZpbv3B8MBsWKpAc/xMgDpCkGgkLQ9BDtu6aob/uutfi6Jk5WvjksLlRCOw6KMRIi
 5KC3iKgKtTs1CXCnr7HiIsoGGiOe9xlMPZQBvxGjH78491Z1SMMhl2MhqEcc1vTSdMxk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B3Xg67NbOS5YKdaySGyicbSsoGzlBjyHFHEFD4Mj8fk=; b=F8deTDCU+S5zRWwzcXa0NGDFea
 iag7nwA9I/KmJiNV784tCyP2vk03s7QcUAPRtf7sVZAxA6TBRxeJG8wmjaW3ZoI+Lp9kFNHbW7r5U
 SBxa7EjmmT81mV6kBhgFQgRlcr3aklExbnpAKThZCLcP4ifyBXsngft71lgjJU/7nVmU=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6s86-0003JO-1A for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 12:19:13 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 992EB219BF;
 Wed,  7 Jun 2023 12:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686140340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B3Xg67NbOS5YKdaySGyicbSsoGzlBjyHFHEFD4Mj8fk=;
 b=Zf8A5Tyivs1LBVr9z9fcut+KsQs3kcPY5GvqULx5P0MxaNd5oWQGh+1UzbHH7L+ejvrrTh
 JDmnIQJNe0G+Z00BxJB1bq4IRuImozBYRQpd4LwynxswtstxT9j1wT23SZh+ZR9kxi9nY9
 fU/9FYrR7hcLl9YyuWLg9NqNhV/Ku4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686140340;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B3Xg67NbOS5YKdaySGyicbSsoGzlBjyHFHEFD4Mj8fk=;
 b=eV5SDjF+54GbLqg30Fap2sfm11c6Xv616rnS3/fxtHlHOpZy29z55XNlWk4So5K2w2nPsG
 Z+0rka3GXG+V67DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6987D13776;
 Wed,  7 Jun 2023 12:19:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ngODGbR1gGR3QAAAMHmgww
 (envelope-from <hare@suse.de>); Wed, 07 Jun 2023 12:19:00 +0000
Message-ID: <30183892-dce6-6946-2f7a-1bc693a657a2@suse.de>
Date: Wed, 7 Jun 2023 14:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-9-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230606073950.225178-9-hch@lst.de>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/6/23 09:39, Christoph Hellwig wrote: > Factor the common
 logic between disk_check_media_change and > disk_force_media_change into
 a helper. > > Signed-off-by: Christoph Hellwig <hch@lst.de> > --- [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q6s86-0003JO-1A
Subject: Re: [f2fs-dev] [PATCH 08/31] block: share code between
 disk_check_media_change and disk_force_media_change
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
> Factor the common logic between disk_check_media_change and
> disk_force_media_change into a helper.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/disk-events.c | 37 ++++++++++++++++---------------------
>   1 file changed, 16 insertions(+), 21 deletions(-)
> 
> diff --git a/block/disk-events.c b/block/disk-events.c
> index 8b1b63225738f8..06f325662b3494 100644
> --- a/block/disk-events.c
> +++ b/block/disk-events.c
> @@ -262,6 +262,18 @@ static unsigned int disk_clear_events(struct gendisk *disk, unsigned int mask)
>   	return pending;
>   }
>   
> +static bool __disk_check_media_change(struct gendisk *disk, unsigned int events)
> +{
> +	if (!(events & DISK_EVENT_MEDIA_CHANGE))
> +		return false;
> +
> +	if (__invalidate_device(disk->part0, true))
> +		pr_warn("VFS: busy inodes on changed media %s\n",
> +			disk->disk_name);
> +	set_bit(GD_NEED_PART_SCAN, &disk->state);
> +	return true;
> +}
> +
>   /**
>    * disk_check_media_change - check if a removable media has been changed
>    * @disk: gendisk to check
> @@ -274,18 +286,9 @@ static unsigned int disk_clear_events(struct gendisk *disk, unsigned int mask)
>    */
>   bool disk_check_media_change(struct gendisk *disk)
>   {
> -	unsigned int events;
> -
> -	events = disk_clear_events(disk, DISK_EVENT_MEDIA_CHANGE |
> -				   DISK_EVENT_EJECT_REQUEST);
> -	if (!(events & DISK_EVENT_MEDIA_CHANGE))
> -		return false;
> -
> -	if (__invalidate_device(disk->part0, true))
> -		pr_warn("VFS: busy inodes on changed media %s\n",
> -			disk->disk_name);
> -	set_bit(GD_NEED_PART_SCAN, &disk->state);
> -	return true;
> +	return __disk_check_media_change(disk,
> +			disk_clear_events(disk, DISK_EVENT_MEDIA_CHANGE |
> +						DISK_EVENT_EJECT_REQUEST));

Can you move the call to disk_clear_events() out of the call to 
__disk_check_media_change()?
I find this pattern hard to read.

Cheers,

Hannes



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
