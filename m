Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AD676EA2C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Aug 2023 15:26:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRYLW-0001xA-Jp;
	Thu, 03 Aug 2023 13:26:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qRYLQ-0001wi-GP
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 13:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=czrjJnN2HxRC7i/fG8IN5ZkPGObJTznqSzeqzEFMAfI=; b=Hog+diAGPdcaWPzUof11aPX+Ag
 15RyV9yxlfFOQyw8ssyr+QOKRbXurxALVyPzbUjl5sv17QLJGUXa3boy170n4MI8kp98fKS9ILvxf
 J2mdCwiXvAy3DYNV6CKTj3ARcUzPTDVAxOnFrrxXJzUz0GM6+Aa+ovTy8Onrpp1RufyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=czrjJnN2HxRC7i/fG8IN5ZkPGObJTznqSzeqzEFMAfI=; b=aJbY7+ZmnuLYyTyxWyBetLWB7y
 S2pdRCwaqeqizsDByx9gZPoG8vRvd9TvB54Wdy8xBBV6xJHdNvMy3m0tpuPpJEtdHO0SI/A8rro64
 G6aKV9UxOdPqA0Vd2QxgnJunYWggCveCL203AqVC6EOAEqpyZ8BSDXsDLDL3gcgHdHhY=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qRYLO-00Bzgh-J3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 13:26:23 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B946021940;
 Thu,  3 Aug 2023 13:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691069172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=czrjJnN2HxRC7i/fG8IN5ZkPGObJTznqSzeqzEFMAfI=;
 b=wq91WWpvnSedYJdGwxyAHRuhULngL4TW+QxyjlQSIgOm9vzoIijZL+fuXgGH27SgDGDcHV
 FoeCFq/0aiqhvder0VM5024ioXOum9rplassX+LEAzRT3adw+Xf1v0nNIhphuKiBV/N2l+
 L3SYhOBPBF6HKsy54g0r11BfGvDb168=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691069172;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=czrjJnN2HxRC7i/fG8IN5ZkPGObJTznqSzeqzEFMAfI=;
 b=n8k+znUSFN07XPPJXmlt2RR0X8ZEt40U6FtziK4ImHIaG9rsYzEY9lfUUW8vYHrWf7+dQ6
 UeiGqgm46X8GZ0DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9EB7F134B0;
 Thu,  3 Aug 2023 13:26:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Xiy9JvSqy2QpbwAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 03 Aug 2023 13:26:12 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 38424A076B; Thu,  3 Aug 2023 15:26:12 +0200 (CEST)
Date: Thu, 3 Aug 2023 15:26:12 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230803132612.xyy34buhujno42ia@quack3>
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-11-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802154131.2221419-11-hch@lst.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 02-08-23 17:41:29, Christoph Hellwig wrote: > Use the
 generic fs_holder_ops to shut down the file system when the > log device
 goes away instead of duplicating the logic. > > Signed-off-by: Chr [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qRYLO-00Bzgh-J3
Subject: Re: [f2fs-dev] [PATCH 10/12] ext4: use fs_holder_ops for the log
 device
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, linux-nilfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 02-08-23 17:41:29, Christoph Hellwig wrote:
> Use the generic fs_holder_ops to shut down the file system when the
> log device goes away instead of duplicating the logic.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext4/super.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 2ccb19d345c6dd..063832e2d12a8e 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -1096,15 +1096,6 @@ void ext4_update_dynamic_rev(struct super_block *sb)
>  	 */
>  }
>  
> -static void ext4_bdev_mark_dead(struct block_device *bdev)
> -{
> -	ext4_force_shutdown(bdev->bd_holder, EXT4_GOING_FLAGS_NOLOGFLUSH);
> -}
> -
> -static const struct blk_holder_ops ext4_holder_ops = {
> -	.mark_dead		= ext4_bdev_mark_dead,
> -};
> -
>  /*
>   * Open the external journal device
>   */
> @@ -1113,7 +1104,7 @@ static struct block_device *ext4_blkdev_get(dev_t dev, struct super_block *sb)
>  	struct block_device *bdev;
>  
>  	bdev = blkdev_get_by_dev(dev, BLK_OPEN_READ | BLK_OPEN_WRITE, sb,
> -				 &ext4_holder_ops);
> +				 &fs_holder_ops);
>  	if (IS_ERR(bdev))
>  		goto fail;
>  	return bdev;
> -- 
> 2.39.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
