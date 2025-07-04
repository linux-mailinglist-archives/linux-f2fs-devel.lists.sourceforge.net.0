Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5206AF8D74
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jul 2025 11:05:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kdknKHkYBFKPKnzVdyiQwAOZEDrDqR3YcVMpxbPhEE=; b=kE8MkflFC3YwkWipjfz/xY+K95
	9X6A3VI0AD4Zm3DHf+ZjHL4f4aJEWgrgnaqLzNQ+ALx2JoRFOnhmi5No8CBW4KxNasMwETuAOV84s
	BrtvoPuv5AZQXRtrUTIM8InLpt51GCc/n5UQtsDwdGiiy8/PsmlUzxRFfNetwBy6njC0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXcMV-0003rz-SO;
	Fri, 04 Jul 2025 09:05:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1uXcMU-0003rt-Je
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 09:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Om6I5tFyyfcVPangDfbiEU+nIPjPaTL8L4plfMPqXn8=; b=MikXtPAWs9HyDmKSRO4FncPnWJ
 SGoAgbwLPZt+1XQqcN3CxIHluRCwsAui7k7DsZr6Feaf/UPXosR22m1vKeaFvilii/V5KmE7PXQOj
 ONWEdt1UuqFn9x7ye99Jf3j3KFwYTS9CJXLdaHqid0a3xNthgGzvfmVqVTTLpB9uwKPc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Om6I5tFyyfcVPangDfbiEU+nIPjPaTL8L4plfMPqXn8=; b=JMsknVO4g3S96VDepF9Jewfvhj
 +YkQPo4rTl6EhedmBEGlsv1BVQXG76iOx5DvOieW8p7w2D0JOgSCNIQQVUCodpMOWqgUlNbXqUN4S
 bxcH5mcZU3ace5Mlahbg7I0UCdWfDfAUGUGdLNxRgLXBHesOlsCoTTOCrHA6JJJnY+LY=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uXcMT-00047V-9d for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 09:05:38 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C048D21185;
 Fri,  4 Jul 2025 09:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1751619931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Om6I5tFyyfcVPangDfbiEU+nIPjPaTL8L4plfMPqXn8=;
 b=qfBb4+sHK9BfeeWcUjfD5mRPSdttXFRP64KYHtqu+d0Q472yOpgmCOkOrfJ1UgFQBGZHV5
 OYusvWl+4kvunMmtGzU8NBtDoWEMYAFHmJdnazWbJ0FcpYGBiV30EznAdAyKxRyElrfMjD
 1Zqhd4b3zVLE67rnzr8Gue23N6nz4IM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1751619931;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Om6I5tFyyfcVPangDfbiEU+nIPjPaTL8L4plfMPqXn8=;
 b=NM9DKMq5jHqAwl6hKHyll9FNBaFPMblKpdnWRn3dxhn/RQqvOGBnR42lfm3ngX91BzRweD
 THSzZ6RUelehQfAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1751619929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Om6I5tFyyfcVPangDfbiEU+nIPjPaTL8L4plfMPqXn8=;
 b=vDHsu56aBWMos2GEDefWTDa1hJ4vdTD/vFFqfy0jbznRGu6ZxhpsLzK6J9A2RnlUC8+oci
 +lFT4zi7SnLsFdVEHt6jVYYq5rD1F7/PyAn3Y8b66ojk14Ijjv8SAjSNwcAXi3D5hisHhH
 hqj5gayWwu/9zGgCFuj6ATx8JXyrFC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1751619929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Om6I5tFyyfcVPangDfbiEU+nIPjPaTL8L4plfMPqXn8=;
 b=jEFmAHHOjAnGAPIJL648yH8UYVIw7cG7M41c2+nXbcEkuLgbd3nrWV4Bcgq3KltDpPS/Vl
 7pA57YOx0PTfq5Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9CCFB13757;
 Fri,  4 Jul 2025 09:05:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id axZDJlmZZ2gGHwAAD6G6ig
 (envelope-from <jack@suse.cz>); Fri, 04 Jul 2025 09:05:29 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 4770BA0A31; Fri,  4 Jul 2025 11:05:25 +0200 (CEST)
Date: Fri, 4 Jul 2025 11:05:25 +0200
From: Jan Kara <jack@suse.cz>
To: Qu Wenruo <wqu@suse.com>
Message-ID: <3koe4okqyngnl3djuj46xz5jk2hbwnsukmwn4wwpgf3nebn3uh@uxaot4z2wdgc>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCVD_COUNT_THREE(0.00)[3];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[10]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_LAST(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.com:email,
 suse.cz:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.80
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  OK, now that you've made me read the changelog :) : On Fri
 04-07-25 10:12:29,
 Qu Wenruo wrote: > Currently all the filesystems implementing
 the > super_opearations::shutdown() callback can not afford losing a device.
 ^^^ operations 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uXcMT-00047V-9d
Subject: Re: [f2fs-dev] [PATCH v4 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
Cc: brauner@kernel.org, ntfs3@lists.linux.dev, jack@suse.cz,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

OK, now that you've made me read the changelog :) :

On Fri 04-07-25 10:12:29, Qu Wenruo wrote:
> Currently all the filesystems implementing the
> super_opearations::shutdown() callback can not afford losing a device.
        ^^^ operations

> Thus fs_bdev_mark_dead() will just call the shutdown() callback for the
> involved filesystem.
> 
> But it will no longer be the case, with multi-device filesystems like
> btrfs and bcachefs the filesystem can handle certain device loss without
> shutting down the whole filesystem.
> 
> To allow those multi-device filesystems to be integrated to use
> fs_holder_ops:
> 
> - Replace super_opearation::shutdown() with
>   super_opearations::remove_bdev()
    ^^ again typos in work "operations"

>   To better describe when the callback is called.
> 
> - Add a new @bdev parameter to remove_bdev() callback
>   To allow the fs to determine which device is missing, and do the
>   proper handling when needed.
> 
> For the existing shutdown callback users, the change is minimal.
> They only need to follow the rename and the new parameter list.
> The new @bdev parameter can be ignored if the filesystem can not afford
> losing any device, and continue using the old shutdown behavior.
> 
> Btrfs is going to implement the callback soon, which will either
> shutdown the fs or continue read-write operations.
> 
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-ext4@vger.kernel.org
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: ntfs3@lists.linux.dev
> Cc: linux-xfs@vger.kernel.org
> Signed-off-by: Qu Wenruo <wqu@suse.com>

Still feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/exfat/super.c   | 4 ++--
>  fs/ext4/super.c    | 4 ++--
>  fs/f2fs/super.c    | 4 ++--
>  fs/ntfs3/super.c   | 6 +++---
>  fs/super.c         | 4 ++--
>  fs/xfs/xfs_super.c | 7 ++++---
>  include/linux/fs.h | 7 ++++++-
>  7 files changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/fs/exfat/super.c b/fs/exfat/super.c
> index 7ed858937d45..a0e11166b194 100644
> --- a/fs/exfat/super.c
> +++ b/fs/exfat/super.c
> @@ -172,7 +172,7 @@ int exfat_force_shutdown(struct super_block *sb, u32 flags)
>  	return 0;
>  }
>  
> -static void exfat_shutdown(struct super_block *sb)
> +static void exfat_remove_bdev(struct super_block *sb, struct block_device *bdev)
>  {
>  	exfat_force_shutdown(sb, EXFAT_GOING_DOWN_NOSYNC);
>  }
> @@ -202,7 +202,7 @@ static const struct super_operations exfat_sops = {
>  	.put_super	= exfat_put_super,
>  	.statfs		= exfat_statfs,
>  	.show_options	= exfat_show_options,
> -	.shutdown	= exfat_shutdown,
> +	.remove_bdev	= exfat_remove_bdev,
>  };
>  
>  enum {
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index c7d39da7e733..d75b416401ae 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -1456,7 +1456,7 @@ static void ext4_destroy_inode(struct inode *inode)
>  			 EXT4_I(inode)->i_reserved_data_blocks);
>  }
>  
> -static void ext4_shutdown(struct super_block *sb)
> +static void ext4_remove_bdev(struct super_block *sb, struct block_device *bdev)
>  {
>         ext4_force_shutdown(sb, EXT4_GOING_FLAGS_NOLOGFLUSH);
>  }
> @@ -1620,7 +1620,7 @@ static const struct super_operations ext4_sops = {
>  	.unfreeze_fs	= ext4_unfreeze,
>  	.statfs		= ext4_statfs,
>  	.show_options	= ext4_show_options,
> -	.shutdown	= ext4_shutdown,
> +	.remove_bdev	= ext4_remove_bdev,
>  #ifdef CONFIG_QUOTA
>  	.quota_read	= ext4_quota_read,
>  	.quota_write	= ext4_quota_write,
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index bbf1dad6843f..8667af9f76e4 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2640,7 +2640,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	return err;
>  }
>  
> -static void f2fs_shutdown(struct super_block *sb)
> +static void f2fs_remove_bdev(struct super_block *sb, struct block_device *bdev)
>  {
>  	f2fs_do_shutdown(F2FS_SB(sb), F2FS_GOING_DOWN_NOSYNC, false, false);
>  }
> @@ -3264,7 +3264,7 @@ static const struct super_operations f2fs_sops = {
>  	.unfreeze_fs	= f2fs_unfreeze,
>  	.statfs		= f2fs_statfs,
>  	.remount_fs	= f2fs_remount,
> -	.shutdown	= f2fs_shutdown,
> +	.remove_bdev	= f2fs_remove_bdev,
>  };
>  
>  #ifdef CONFIG_FS_ENCRYPTION
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 920a1ab47b63..3e69dc805e3a 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -762,9 +762,9 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
>  }
>  
>  /*
> - * ntfs_shutdown - super_operations::shutdown
> + * ntfs_remove_bdev - super_operations::remove_bdev
>   */
> -static void ntfs_shutdown(struct super_block *sb)
> +static void ntfs_remove_bdev(struct super_block *sb, struct block_device *bdev)
>  {
>  	set_bit(NTFS_FLAGS_SHUTDOWN_BIT, &ntfs_sb(sb)->flags);
>  }
> @@ -821,7 +821,7 @@ static const struct super_operations ntfs_sops = {
>  	.put_super = ntfs_put_super,
>  	.statfs = ntfs_statfs,
>  	.show_options = ntfs_show_options,
> -	.shutdown = ntfs_shutdown,
> +	.remove_bdev = ntfs_remove_bdev,
>  	.sync_fs = ntfs_sync_fs,
>  	.write_inode = ntfs3_write_inode,
>  };
> diff --git a/fs/super.c b/fs/super.c
> index 80418ca8e215..c972efb38f6a 100644
> --- a/fs/super.c
> +++ b/fs/super.c
> @@ -1463,8 +1463,8 @@ static void fs_bdev_mark_dead(struct block_device *bdev, bool surprise)
>  		sync_filesystem(sb);
>  	shrink_dcache_sb(sb);
>  	evict_inodes(sb);
> -	if (sb->s_op->shutdown)
> -		sb->s_op->shutdown(sb);
> +	if (sb->s_op->remove_bdev)
> +		sb->s_op->remove_bdev(sb, bdev);
>  
>  	super_unlock_shared(sb);
>  }
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index 0bc4b5489078..8e307b036133 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -1276,8 +1276,9 @@ xfs_fs_free_cached_objects(
>  }
>  
>  static void
> -xfs_fs_shutdown(
> -	struct super_block	*sb)
> +xfs_fs_remove_bdev(
> +	struct super_block	*sb,
> +	struct block_device	*bdev)
>  {
>  	xfs_force_shutdown(XFS_M(sb), SHUTDOWN_DEVICE_REMOVED);
>  }
> @@ -1308,7 +1309,7 @@ static const struct super_operations xfs_super_operations = {
>  	.show_options		= xfs_fs_show_options,
>  	.nr_cached_objects	= xfs_fs_nr_cached_objects,
>  	.free_cached_objects	= xfs_fs_free_cached_objects,
> -	.shutdown		= xfs_fs_shutdown,
> +	.remove_bdev		= xfs_fs_remove_bdev,
>  	.show_stats		= xfs_fs_show_stats,
>  };
>  
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index b085f161ed22..b08af63d2d4f 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2367,7 +2367,12 @@ struct super_operations {
>  				  struct shrink_control *);
>  	long (*free_cached_objects)(struct super_block *,
>  				    struct shrink_control *);
> -	void (*shutdown)(struct super_block *sb);
> +	/*
> +	 * Called when block device @bdev belonging to @sb is removed.
> +	 *
> +	 * If the fs can't afford the device loss, it should be shutdown.
> +	 */
> +	void (*remove_bdev)(struct super_block *sb, struct block_device *bdev);
>  };
>  
>  /*
> -- 
> 2.50.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
