Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9039FAEF028
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 09:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqgDYCpksUGz9gQ3InPKavuJ+lF1OSPJOpNvJwI3x2E=; b=JDLcY9sYy9w97kDn4UsDNSOW1p
	d6rnm5CEoJnTerf+1y47BT6jd6TmtAfOI5+sNdfLtlZnzafw5dzwH1wqh23ml17esk1Dr395hcTQx
	iSGyc/4MYxcDoTEnm6I8kxgZbE3qbZmbhBggG13OLxpknBR5Wxr6N6kfIob6bQd9w4cw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWVnG-0008DB-F0;
	Tue, 01 Jul 2025 07:52:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1uWVnF-0008Cy-4p
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 07:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g17mFsk+rjer39CmabNN4wOmijil2rqvWklqU4OcHbQ=; b=gETcWzcvKy2fH4K9LchELZ8QdN
 5rnVD0zLL/7gs55oSgzffSxx4PTPlk+356rhMFmTy16/rTH/oLuKeh1rIN0Fe5zVmqiEnKU4x3D6P
 8HvL8OitiXz9N53j9nJljfSYnWEfFybaeA+NI0gDGsXpBnP0Sahh04LBCxm7Ccaqx+3c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g17mFsk+rjer39CmabNN4wOmijil2rqvWklqU4OcHbQ=; b=KGoBVKq6AFBFOftGY9GhaxWka6
 p8hWqh9FsUrRDj2hAcEmjwyA3kjG1LGnk4K9qujR78YE3hPx0JyHTQC55v3zRwqvARPBsWwkaFAfa
 8lCqGVYZQ2/2vEHsankEKdBnAHvGVgF+MDd6dSWXcAXgipmseUIC4TyjrzzheDeCLrV0=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uWVnE-0007ur-1D for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 07:52:41 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 378351F393;
 Tue,  1 Jul 2025 07:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1751356348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g17mFsk+rjer39CmabNN4wOmijil2rqvWklqU4OcHbQ=;
 b=covJiODZnGa1zFvjvUAxcoyZRtfc4/cIEya26k2agpRAgBFN4HaRDTOyEN5UOcPHFsXcNK
 pNMIgi5h9Au0uEWoTvAtiAl6mjlLvSev2bqo/1auHFZMH4AvzsH/SMSzOI4jHwGL/kDX/A
 9goe0M1tUhXFR1IbZaG008gfjeWCqiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1751356348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g17mFsk+rjer39CmabNN4wOmijil2rqvWklqU4OcHbQ=;
 b=8dxt5ACAtniBeqOXv7Dpx+l9NctA39FTNubWiZ/rsumiMU6NgUR9Zn7bqT8meCyPtHoej1
 3h/mgwWtAAfQiuBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1751356348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g17mFsk+rjer39CmabNN4wOmijil2rqvWklqU4OcHbQ=;
 b=covJiODZnGa1zFvjvUAxcoyZRtfc4/cIEya26k2agpRAgBFN4HaRDTOyEN5UOcPHFsXcNK
 pNMIgi5h9Au0uEWoTvAtiAl6mjlLvSev2bqo/1auHFZMH4AvzsH/SMSzOI4jHwGL/kDX/A
 9goe0M1tUhXFR1IbZaG008gfjeWCqiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1751356348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g17mFsk+rjer39CmabNN4wOmijil2rqvWklqU4OcHbQ=;
 b=8dxt5ACAtniBeqOXv7Dpx+l9NctA39FTNubWiZ/rsumiMU6NgUR9Zn7bqT8meCyPtHoej1
 3h/mgwWtAAfQiuBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C13F1364B;
 Tue,  1 Jul 2025 07:52:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 49y5CryTY2hPCgAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 01 Jul 2025 07:52:28 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id A74CDA0A23; Tue,  1 Jul 2025 09:52:23 +0200 (CEST)
Date: Tue, 1 Jul 2025 09:52:23 +0200
From: Jan Kara <jack@suse.cz>
To: Qu Wenruo <wqu@suse.com>
Message-ID: <ze5gpppvnww2bjft5e2i4wu3vvenvrywsremmcnr2asljmiols@c3bmycqsh5st>
References: <cover.1751347436.git.wqu@suse.com>
 <6164b8c708b6606c640c066fbc42f8ca9838c24b.1751347436.git.wqu@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6164b8c708b6606c640c066fbc42f8ca9838c24b.1751347436.git.wqu@suse.com>
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MISSING_XM_UA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_COUNT_THREE(0.00)[3];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_LAST(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 01-07-25 15:02:34, Qu Wenruo wrote: > Currently all
 the filesystems implementing the > super_opearations::shutdown() call back
 can not afford losing a device. > > Thus fs_bdev_mark_dead() will [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uWVnE-0007ur-1D
Subject: Re: [f2fs-dev] [PATCH v2 1/6] fs: enhance and rename shutdown()
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

On Tue 01-07-25 15:02:34, Qu Wenruo wrote:
> Currently all the filesystems implementing the
> super_opearations::shutdown() call back can not afford losing a device.
> 
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
> - Rename shutdown() call back to remove_bdev()
>   To better describe when the call back is called.
> 
> - Add a new @bdev parameter to remove_bdev() callback
>   To allow the fs to determine which device is missing, and do the
>   proper handling when needed.
> 
> For the existing shutdown callback users, the change is minimal.
> 
> They only need to follow the rename and the new parameter list.
> Since the behavior is still to shutdown the fs, they shouldn't change
> their function names.
> 
> This has a good side effect that, a single line like
> ".remove_bdev = ext4_shutdown," will easily show the fs behavior and
> indicate the fs will shutdown when a device went missing.
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

So I don't feel as strongly as Christoph about individual filesystem method
names but I tend to agree that over long term and large codebase
mismatching hook & implementation names does more harm than good (it just
creates these WTH is this moments couple years down the road when you
already forget about the original motivation). So I'd prefer they are named
like ext4_remove_bdev() etc. Otherwise the patch looks good!

								Honza

> ---
>  fs/exfat/super.c   | 4 ++--
>  fs/ext4/super.c    | 4 ++--
>  fs/f2fs/super.c    | 4 ++--
>  fs/ntfs3/super.c   | 4 ++--
>  fs/super.c         | 4 ++--
>  fs/xfs/xfs_super.c | 5 +++--
>  include/linux/fs.h | 7 ++++++-
>  7 files changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/exfat/super.c b/fs/exfat/super.c
> index 7ed858937d45..5773026be84c 100644
> --- a/fs/exfat/super.c
> +++ b/fs/exfat/super.c
> @@ -172,7 +172,7 @@ int exfat_force_shutdown(struct super_block *sb, u32 flags)
>  	return 0;
>  }
>  
> -static void exfat_shutdown(struct super_block *sb)
> +static void exfat_shutdown(struct super_block *sb, struct block_device *bdev)
>  {
>  	exfat_force_shutdown(sb, EXFAT_GOING_DOWN_NOSYNC);
>  }
> @@ -202,7 +202,7 @@ static const struct super_operations exfat_sops = {
>  	.put_super	= exfat_put_super,
>  	.statfs		= exfat_statfs,
>  	.show_options	= exfat_show_options,
> -	.shutdown	= exfat_shutdown,
> +	.remove_bdev	= exfat_shutdown,
>  };
>  
>  enum {
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index c7d39da7e733..8724f89d20d8 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -1456,7 +1456,7 @@ static void ext4_destroy_inode(struct inode *inode)
>  			 EXT4_I(inode)->i_reserved_data_blocks);
>  }
>  
> -static void ext4_shutdown(struct super_block *sb)
> +static void ext4_shutdown(struct super_block *sb, struct block_device *bdev)
>  {
>         ext4_force_shutdown(sb, EXT4_GOING_FLAGS_NOLOGFLUSH);
>  }
> @@ -1620,7 +1620,7 @@ static const struct super_operations ext4_sops = {
>  	.unfreeze_fs	= ext4_unfreeze,
>  	.statfs		= ext4_statfs,
>  	.show_options	= ext4_show_options,
> -	.shutdown	= ext4_shutdown,
> +	.remove_bdev	= ext4_shutdown,
>  #ifdef CONFIG_QUOTA
>  	.quota_read	= ext4_quota_read,
>  	.quota_write	= ext4_quota_write,
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index bbf1dad6843f..51c60b429a31 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2640,7 +2640,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	return err;
>  }
>  
> -static void f2fs_shutdown(struct super_block *sb)
> +static void f2fs_shutdown(struct super_block *sb, struct block_device *bdev)
>  {
>  	f2fs_do_shutdown(F2FS_SB(sb), F2FS_GOING_DOWN_NOSYNC, false, false);
>  }
> @@ -3264,7 +3264,7 @@ static const struct super_operations f2fs_sops = {
>  	.unfreeze_fs	= f2fs_unfreeze,
>  	.statfs		= f2fs_statfs,
>  	.remount_fs	= f2fs_remount,
> -	.shutdown	= f2fs_shutdown,
> +	.remove_bdev	= f2fs_shutdown,
>  };
>  
>  #ifdef CONFIG_FS_ENCRYPTION
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 920a1ab47b63..5e422543b851 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -764,7 +764,7 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
>  /*
>   * ntfs_shutdown - super_operations::shutdown
>   */
> -static void ntfs_shutdown(struct super_block *sb)
> +static void ntfs_shutdown(struct super_block *sb, struct block_device *bdev)
>  {
>  	set_bit(NTFS_FLAGS_SHUTDOWN_BIT, &ntfs_sb(sb)->flags);
>  }
> @@ -821,7 +821,7 @@ static const struct super_operations ntfs_sops = {
>  	.put_super = ntfs_put_super,
>  	.statfs = ntfs_statfs,
>  	.show_options = ntfs_show_options,
> -	.shutdown = ntfs_shutdown,
> +	.remove_bdev = ntfs_shutdown,
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
> index 0bc4b5489078..e47d427f4416 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -1277,7 +1277,8 @@ xfs_fs_free_cached_objects(
>  
>  static void
>  xfs_fs_shutdown(
> -	struct super_block	*sb)
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
> +	.remove_bdev		= xfs_fs_shutdown,
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
