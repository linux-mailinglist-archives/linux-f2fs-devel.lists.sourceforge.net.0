Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 270C7AEEE08
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 07:55:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9EVTLuwUmdYFNekGWuI/f09GXMjij+8lyU/L12muAg=; b=Pc4Ys5iyRwylrmsPvj/VmlEw49
	Y1P5NsVBQc9gIFHIymQApVgv77S4oPuaOQcloutZFlPIEcuAJWhFMJooySTC8Lsq9lf7IykaXysZb
	5ZqZus1SJJjhBC0hI39mYl8f6wXmwAr9jUiapVHURAbVoKjKPVPMkDuZ+scV0AhImxUU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWTxK-0005sQ-L7;
	Tue, 01 Jul 2025 05:54:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1uWTxJ-0005sI-Eu
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 05:54:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AJOOpmuGE+FR2N7zUiZzy+vbdjCU600lpZ6oCCoQERY=; b=d4PfXVxd2/iqF8aXUqCKsVLKVt
 Uz+fr7jZuX9vHpY2ynqZa4rUJN5pVbZQCBg/1Wzh4/vExcwQ+DnwXKX5bxpVuPLeMW8geJCnWJdrF
 Tym9utxaLIF7lTYWLKy9Q9iXWJQc5rfxt5aL0EHQaL+MIahwZ0nuzqJv5Fdo8VptBFto=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AJOOpmuGE+FR2N7zUiZzy+vbdjCU600lpZ6oCCoQERY=; b=Dq3P8CdeoVegI2La53V031VrEx
 MxK7pkbExalxQVJBJwcbQoJpZ8Iymi+9Q24URmeCQBcvCbziDZRNdpQIrYqQJdU/dr1gp/BcvIABv
 A8Qxh1XttwaHTKN62uXcFGWJr7KPgPXvQX4nXnUiTCh4BgcNJJrWDvZLOlBlImx02rCQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWTxI-0002YF-Rp for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 05:54:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 674135C48C7;
 Tue,  1 Jul 2025 05:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACB4C4CEEB;
 Tue,  1 Jul 2025 05:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751349286;
 bh=AyerdwE+nKSV4R8WYgCDCHBqdWUhvaF5i0l5F4+SV9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bkxkK2Mo2MpEzgbyZ0p6o52VugbPcf5slJkEdlU+VQSO2hAEUVSJqJHUgdlZ5vX2c
 AlHQRi+czW0Y2H1QHl8IOv7ABlBwhai38qpI2pDiRX4olsfXLOskXG61bkGdGEPP1T
 Ho17I2FO6y4lOZWjJoVa0tR350F9OLFrwFEq96SuOd+eqPVCSVUlFdWIEg3JYMtJdi
 UxgTU0Gt8PvL5lLG82HjEZfM3eI/uMpxhCgWtp4c9rUcMIeefq0ZJNjc5IOl7QgXkM
 BpNk/n2mLQxPjFgmkSTXc1oU8KPMe0cYgaW91XiQHgLY/Yl9vnCl5PENyxSNuT3eVU
 wIJOFk/Lt5mtQ==
Date: Mon, 30 Jun 2025 22:54:45 -0700
To: Qu Wenruo <wqu@suse.com>
Message-ID: <20250701055445.GE9987@frogsfrogsfrogs>
References: <cover.1751347436.git.wqu@suse.com>
 <6164b8c708b6606c640c066fbc42f8ca9838c24b.1751347436.git.wqu@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6164b8c708b6606c640c066fbc42f8ca9838c24b.1751347436.git.wqu@suse.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 01, 2025 at 03:02:34PM +0930, Qu Wenruo wrote:
 > Currently all the filesystems implementing the >
 super_opearations::shutdown()
 call back can not afford losing a device. > > Thus fs_bdev_m [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWTxI-0002YF-Rp
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: brauner@kernel.org, ntfs3@lists.linux.dev, jack@suse.cz,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 01, 2025 at 03:02:34PM +0930, Qu Wenruo wrote:
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

Hrmm, this could be useful for xfs rt devices, if we could some day
reattach a resurrected bdev to a still-running filesystem....

Looks good to me,
Acked-by: "Darrick J. Wong" <djwong@kernel.org>

--D


> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-ext4@vger.kernel.org
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: ntfs3@lists.linux.dev
> Cc: linux-xfs@vger.kernel.org
> Signed-off-by: Qu Wenruo <wqu@suse.com>
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
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
