Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 907E17260DE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 15:14:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6szr-0004BK-DF;
	Wed, 07 Jun 2023 13:14:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hare@suse.de>) id 1q6szp-0004BC-RM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 13:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g3qm10BFMOoxWlTfzY02rDFkH1MgJHM90hSPqL0EKSU=; b=nLdv6mpJkzm+YqOnzWcydS+xkP
 92F5HKdd2MclehYR8h03WFXv5rq9QtB3GQ9L1+bPVtXKq6fEUGUTUyAhuEWg/yuFiDOC9EIXu/WhJ
 vJPiPGF9jb2JkBmy9YofXD0hg96kBQXyFAtUYz/1H63DasGMYt4G1N6XQMfP7KqEmkRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g3qm10BFMOoxWlTfzY02rDFkH1MgJHM90hSPqL0EKSU=; b=OjmRQz/Wvts8Lla2EVA6FmYVGq
 T/vnt2rZap4e/lyVSb+Jag38eupd8WcTY8qFwYJbd2m3BZztMdBI6zDnbcBU7LcKrS24g4Gtwl2bM
 QiRR0NFDx+LbrXtmn0VQkhlrvAZ58IviR27fbRq3CQ8hQCBLcvMBTGe4zs1OoeaUtn6c=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6szp-00DiKJ-VM for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 13:14:42 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A641A219FE;
 Wed,  7 Jun 2023 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686143675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3qm10BFMOoxWlTfzY02rDFkH1MgJHM90hSPqL0EKSU=;
 b=h0v2DqBB9ySJiLnmn6KXn42VRK0Z/nPXxfHyl6P9vx/g51yoRFC9AAW5wAXqURmVlJIrCN
 2D+/sGF0Dbl/023m3VKR+jyJmZpI81N2dxOsOVo1Iyv6eQHVy55am5AqqgqG5JbeU+LsvI
 y9I3aAtB7v6O/td5ghW63FzKVmGA63w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686143675;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3qm10BFMOoxWlTfzY02rDFkH1MgJHM90hSPqL0EKSU=;
 b=nE+HbFK6uzo+zBGVf8a/fbVecve2gD4PPeEmbpshgySHxZDiiPHczbZcJawWlwnNHAICqS
 Q/nUJxr0GbT6aJBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7308A1346D;
 Wed,  7 Jun 2023 13:14:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uiivG7uCgGS9YAAAMHmgww
 (envelope-from <hare@suse.de>); Wed, 07 Jun 2023 13:14:35 +0000
Message-ID: <04517ec2-bf6c-0783-9494-fb12a89d07a0@suse.de>
Date: Wed, 7 Jun 2023 15:14:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-31-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230606073950.225178-31-hch@lst.de>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/6/23 09:39, Christoph Hellwig wrote: > Store the file
 struct used as the holder in file->private_data as an > indicator that this
 file descriptor was opened exclusively to remove > the last use o [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q6szp-00DiKJ-VM
Subject: Re: [f2fs-dev] [PATCH 30/31] block: store the holder in
 file->private_data
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
> Store the file struct used as the holder in file->private_data as an
> indicator that this file descriptor was opened exclusively to  remove
> the last use of FMODE_EXCL.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/fops.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/block/fops.c b/block/fops.c
> index c40b9f978e3bc7..915e0ef7560993 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -478,7 +478,7 @@ blk_mode_t file_to_blk_mode(struct file *file)
>   		mode |= BLK_OPEN_READ;
>   	if (file->f_mode & FMODE_WRITE)
>   		mode |= BLK_OPEN_WRITE;
> -	if (file->f_mode & FMODE_EXCL)
> +	if (file->private_data)
>   		mode |= BLK_OPEN_EXCL;
>   	if ((file->f_flags & O_ACCMODE) == 3)
>   		mode |= BLK_OPEN_WRITE_IOCTL;
> @@ -501,12 +501,15 @@ static int blkdev_open(struct inode *inode, struct file *filp)
>   	filp->f_flags |= O_LARGEFILE;
>   	filp->f_mode |= FMODE_NOWAIT | FMODE_BUF_RASYNC;
>   
> +	/*
> +	 * Use the file private data to store the holder, file_to_blk_mode
> +	 * relies on this.
> +	 */

Can you update the comment to reflect that we're only use the
->private_data field for exclusive open?
I know it's indicated by the condition, but we really should
be clarify this usage.

>   	if (filp->f_flags & O_EXCL)
> -		filp->f_mode |= FMODE_EXCL;
> +		filp->private_data = filp;
>   
>   	bdev = blkdev_get_by_dev(inode->i_rdev, file_to_blk_mode(filp),
> -				 (filp->f_mode & FMODE_EXCL) ? filp : NULL,
> -				 NULL);
> +				 filp->private_data, NULL);
>   	if (IS_ERR(bdev))
>   		return PTR_ERR(bdev);
>   
> @@ -517,8 +520,7 @@ static int blkdev_open(struct inode *inode, struct file *filp)
>   
>   static int blkdev_release(struct inode *inode, struct file *filp)
>   {
> -	blkdev_put(I_BDEV(filp->f_mapping->host),
> -		   (filp->f_mode & FMODE_EXCL) ? filp : NULL);
> +	blkdev_put(I_BDEV(filp->f_mapping->host), filp->private_data);
>   	return 0;
>   }
>   
Other than that:

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
