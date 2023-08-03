Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6401776E9B0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Aug 2023 15:12:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRY84-0004H4-Dp;
	Thu, 03 Aug 2023 13:12:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qRY82-0004Gy-6S
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 13:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ot59AV78ck5rwDh+ZxSbqdOYuWP3zspJplYXbIDCPEg=; b=Lbm1y5HbjWa3hzZI0sXgx5pI5/
 OTA9Um+Ow6YoON9LEpUgdLtzUcqyeR3hw13IIYK0/A4RM+6Q1p6iHbgovX9ZgQtY4Bjj1P+28+vlr
 dVfUNcESBXba5tg6G7Po7mnQCKUA4KExsQuukZfxmdebDupyR9enh5wDQH36PV7W5jvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ot59AV78ck5rwDh+ZxSbqdOYuWP3zspJplYXbIDCPEg=; b=eMxcTYJvNV+/tg60gaDGnzCt/o
 UlwNkjUh4scAomst3PZ7Nxb+/GXbBNClhxwrWqZHAVtFW97gs1KlB9+3DOwxR3v0//RI6k1zOwW1f
 Oaib8ibe5UyjslCA2/xFY69JdOyiy4aSXOhcEVraMnpXrjBDn3yN5Iyx0js6A4qBcoE0=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qRY7y-0005TT-6p for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 13:12:34 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EA5B021873;
 Thu,  3 Aug 2023 13:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691068343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ot59AV78ck5rwDh+ZxSbqdOYuWP3zspJplYXbIDCPEg=;
 b=it/uueHk20C6SWEYwRpODhnx+51PxdNAjrwcS9cfESIfoTBPsaMl9lEOEhlF32ejDxtO2A
 EA1m1wBtZxzuyOfvHcObttcWzU7rZueXbv/p4C8VY+JnylCyIh0khx8jqCl/EH+nKWK8JT
 UnXxYqzEOKMjCjdEpmW3Haw1++m2Mys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691068343;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ot59AV78ck5rwDh+ZxSbqdOYuWP3zspJplYXbIDCPEg=;
 b=mHyzUQlS3YILs5AEHKYro3JJ7LVvtu/qJYwnmvIum04HjMQdynKDQAHtFCrr8yiH4eTuHl
 jsD3rd1lPhJ7MJAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8406134B0;
 Thu,  3 Aug 2023 13:12:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YUvNNLeny2RAaAAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 03 Aug 2023 13:12:23 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 67ED8A076B; Thu,  3 Aug 2023 15:12:23 +0200 (CEST)
Date: Thu, 3 Aug 2023 15:12:23 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230803131223.qkxsxs7svtcu5buz@quack3>
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802154131.2221419-8-hch@lst.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 02-08-23 17:41:26,
 Christoph Hellwig wrote: > fs_mark_dead
 currently uses get_super to find the superblock for the > block device that
 is going away. This means it is limited to the > main devi [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qRY7y-0005TT-6p
Subject: Re: [f2fs-dev] [PATCH 07/12] fs: stop using get_super in
 fs_mark_dead
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

On Wed 02-08-23 17:41:26, Christoph Hellwig wrote:
> fs_mark_dead currently uses get_super to find the superblock for the
> block device that is going away.  This means it is limited to the
> main device stored in sb->s_dev, leading to a lot of code duplication
> for file systems that can use multiple block devices.
> 
> Now that the holder for all block devices used by file systems is set
> to the super_block, we can instead look at that holder and then check
> if the file system is born and active, so do that instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/super.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/super.c b/fs/super.c
> index 09b65ee1a8b737..0cda4af0a7e16c 100644
> --- a/fs/super.c
> +++ b/fs/super.c
> @@ -1209,17 +1209,39 @@ int get_tree_keyed(struct fs_context *fc,
>  EXPORT_SYMBOL(get_tree_keyed);
>  
>  #ifdef CONFIG_BLOCK
> +/*
> + * Lock a super block that the callers holds a reference to.
> + *
> + * The caller needs to ensure that the super_block isn't being freed while
> + * calling this function, e.g. by holding a lock over the call to this function
> + * and the place that clears the pointer to the superblock used by this function
> + * before freeing the superblock.
> + */
> +static bool lock_active_super(struct super_block *sb)
> +{
> +	down_read(&sb->s_umount);
> +	if (!sb->s_root ||
> +	    (sb->s_flags & (SB_ACTIVE | SB_BORN)) != (SB_ACTIVE | SB_BORN)) {
> +		up_read(&sb->s_umount);
> +		return false;
> +	}
> +	return true;
> +}
> +
>  static void fs_mark_dead(struct block_device *bdev)
>  {
> -	struct super_block *sb;
> +	struct super_block *sb = bdev->bd_holder;
>  
> -	sb = get_super(bdev);
> -	if (!sb)
> +	/* bd_holder_lock ensures that the sb isn't freed */
> +	lockdep_assert_held(&bdev->bd_holder_lock);
> +
> +	if (!lock_active_super(sb))
>  		return;
>  
>  	if (sb->s_op->shutdown)
>  		sb->s_op->shutdown(sb);
> -	drop_super(sb);
> +
> +	up_read(&sb->s_umount);
>  }
>  
>  static const struct blk_holder_ops fs_holder_ops = {
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
