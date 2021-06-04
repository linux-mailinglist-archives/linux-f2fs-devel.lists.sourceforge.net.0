Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1893839AF24
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jun 2021 02:41:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1loxtl-0003vV-Ct; Fri, 04 Jun 2021 00:41:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1loxtj-0003vI-VY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 00:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vAzy0crZpwk1T1tqoO+JxqzO8414jhY+P160tA0u3cE=; b=Y2+uv3y/UKPXdrOKamkJ0OGaVP
 tqZB26xoBAvCc/lG35MwNCsCmxiYpkvxEn6j6qqUhd4EXI+M88+VweSvc8WI+IbEwWbu2RhreRmHo
 AZ0xzJExW7TeUsI9MqG7Gt/EApH6f8ijlSsQ3tyB2PykojY+2i25ovaH6Ap0gHbDjIGE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vAzy0crZpwk1T1tqoO+JxqzO8414jhY+P160tA0u3cE=; b=BgR83mtkxgSr6eU3hsTF8Osdkw
 mInFERxG9atExx3yafFQnV5UpzGHrR81pqeLmAw4b9HIdcuYOXEXTm75EfdJlsXmUBAyF1zsKxjWT
 Tj98DR3mSLevTHgTQ+dv+voRGHKdar1gVmAfs8FWpMzLhcS75Ifl6lO91VPgu06d14HY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loxtZ-0001xZ-Au
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 00:41:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 282F6613C9;
 Fri,  4 Jun 2021 00:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622767250;
 bh=7zGnQkdnuomU21twSfFFKbf7UAFAxDh23BBeCxtbF+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eNt+4eOEILT965TqXZJ/HrthjCqCtQ7VM1mVaxXTmcA4jjCgHwSLw/WHMyRxDbrYl
 4zXnoSWOpyoYXBePeoOkNRTiUvVvadizfgqyaHWKoT/jg69G4FWSD3tFNrJXrn9ee4
 wSI1FVrvgrYEAYTa+sjw6WG4vKGJBM9FRodbqGCMBNQ2E4IYpz0xW59Gx7qXrrdb4G
 MIN84ODLRwRRKKZn3nHpY5O7B3gCt0TlXoSmh8DjWT9cuhkPnfRKqEqD4uARY0oQAm
 t6nLV9RWOR04YkFQFIyYzPWCWNWAAni7gj/5CMMCf7m6GxPYsSGTyto172OZk/oWf2
 YudomP/aixl2w==
Date: Thu, 3 Jun 2021 17:40:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YLl2kEZEDuIjrlfO@sol.localdomain>
References: <20210603220834.1949988-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210603220834.1949988-1-jaegeuk@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1loxtZ-0001xZ-Au
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up /sys/fs/f2fs/<disk>/features
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 03, 2021 at 03:08:34PM -0700, Jaegeuk Kim wrote:
> Let's create /sys/fs/f2fs/<disk>/feature_list/ to meet sysfs rule.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs |  18 ++-
>  fs/f2fs/f2fs.h                          |   3 +
>  fs/f2fs/sysfs.c                         | 152 +++++++++++++++++++++++-
>  3 files changed, 168 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 5088281e312e..43b2cde80b70 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -203,7 +203,23 @@ Description:	Shows total written kbytes issued to disk.
>  What:		/sys/fs/f2fs/<disk>/features
>  Date:		July 2017
>  Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
> -Description:	Shows all enabled features in current device.
> +Description:	<deprecated: should use /sys/fs/f2fs/<disk>/feature_list/
> +		Shows all enabled features in current device.
> +		Supported features:
> +		encryption, blkzoned, extra_attr, projquota, inode_checksum,
> +		flexible_inline_xattr, quota_ino, inode_crtime, lost_found,
> +		verity, sb_checksum, casefold, readonly, compression,
> +		encrypted_casefold, pin_file.

Isn't pin_file a feature of the implementation, not of a particular filesystem
instance?  I.e. something that should go in /sys/fs/f2fs/features/, not here.

Likewise for encrypted_casefold, as it is implied by encryption && casefold.

> +
> +What:		/sys/fs/f2fs/<disk>/feature_list/
> +Date:		June 2021
> +Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
> +Description:	Expand /sys/fs/f2fs/<disk>/features to meet sysfs rule.
> +		Supported features:
> +		encryption, block_zoned, extra_attr, projquota, inode_checksum,
> +		flexible_inline_xattr, quota_ino, inode_crtime, lost_found,
> +		verity, sb_checksum, casefold, readonly, compression,
> +		encrypted_casefold, pin_file.

Is it intentional that the file has "blkzoned" but the directory has
"blk_zoned"?

Also, your code has another difference -- "project_quota" is used instead of
"projquota".  But that's not mentioned above.

And encrypted_casefold and pin_file don't seem appropriate to include here, as
mentioned above.

> @@ -1665,6 +1665,9 @@ struct f2fs_sb_info {
>  	struct kobject s_stat_kobj;		/* /sys/fs/f2fs/<devname>/stat */
>  	struct completion s_stat_kobj_unregister;
>  
> +	struct kobject s_disk_feat_kobj;		/* /sys/fs/f2fs/<devname>/feature_list */
> +	struct completion s_disk_feat_kobj_unregister;

This is for a particular filesystem instance, not a disk per se.  (A f2fs
filesystem can use multiple disks.)  So having "disk" in the name doesn't make
sense.

Please use more logical names like s_feature_list_kobj,
f2fs_sb_feature_list_ktype, f2fs_sb_feat_attrs, etc.

>  static ssize_t f2fs_feature_show(struct f2fs_attr *a,
>  		struct f2fs_sb_info *sbi, char *buf)
>  {
> +	unsigned long feat_supp = 0;
> +
>  	switch (a->id) {
>  	case FEAT_CRYPTO:
> +		feat_supp |= f2fs_sb_has_encrypt(sbi) ?
> +					(1 << FEAT_CRYPTO) : 0;
> +		fallthrough;
>  	case FEAT_BLKZONED:
> -	case FEAT_ATOMIC_WRITE:
> +		feat_supp |= f2fs_sb_has_blkzoned(sbi) ?
> +					(1 << FEAT_BLKZONED) : 0;
> +		fallthrough;
>  	case FEAT_EXTRA_ATTR:
> +		feat_supp |= f2fs_sb_has_extra_attr(sbi) ?
> +					(1 << FEAT_EXTRA_ATTR) : 0;
> +		fallthrough;
>  	case FEAT_PROJECT_QUOTA:
> +		feat_supp |= f2fs_sb_has_project_quota(sbi) ?
> +					(1 << FEAT_PROJECT_QUOTA) : 0;
> +		fallthrough;
>  	case FEAT_INODE_CHECKSUM:
> +		feat_supp |= f2fs_sb_has_inode_chksum(sbi) ?
> +					(1 << FEAT_INODE_CHECKSUM) : 0;
> +		fallthrough;
>  	case FEAT_FLEXIBLE_INLINE_XATTR:
> +		feat_supp |= f2fs_sb_has_flexible_inline_xattr(sbi) ?
> +					(1 << FEAT_FLEXIBLE_INLINE_XATTR) : 0;
> +		fallthrough;
>  	case FEAT_QUOTA_INO:
> +		feat_supp |= f2fs_sb_has_quota_ino(sbi) ?
> +					(1 << FEAT_QUOTA_INO) : 0;
> +		fallthrough;
>  	case FEAT_INODE_CRTIME:
> +		feat_supp |= f2fs_sb_has_inode_crtime(sbi) ?
> +					(1 << FEAT_INODE_CRTIME) : 0;
> +		fallthrough;
>  	case FEAT_LOST_FOUND:
> +		feat_supp |= f2fs_sb_has_lost_found(sbi) ?
> +					(1 << FEAT_LOST_FOUND) : 0;
> +		fallthrough;
>  	case FEAT_VERITY:
> +		feat_supp |= f2fs_sb_has_verity(sbi) ?
> +					(1 << FEAT_VERITY) : 0;
> +		fallthrough;
>  	case FEAT_SB_CHECKSUM:
> +		feat_supp |= f2fs_sb_has_sb_chksum(sbi) ?
> +					(1 << FEAT_SB_CHECKSUM) : 0;
> +		fallthrough;
>  	case FEAT_CASEFOLD:
> +		feat_supp |= f2fs_sb_has_casefold(sbi) ?
> +					(1 << FEAT_CASEFOLD) : 0;
> +		fallthrough;
>  	case FEAT_COMPRESSION:
> +		feat_supp |= f2fs_sb_has_compression(sbi) ?
> +					(1 << FEAT_COMPRESSION) : 0;
> +		fallthrough;
>  	case FEAT_RO:
> -	case FEAT_TEST_DUMMY_ENCRYPTION_V2:
> +		feat_supp |= f2fs_sb_has_readonly(sbi) ?
> +					(1 << FEAT_RO) : 0;
> +		fallthrough;
>  	case FEAT_ENCRYPTED_CASEFOLD:
> -		return sprintf(buf, "supported\n");
> +		feat_supp |= (f2fs_sb_has_casefold(sbi) &&
> +				f2fs_sb_has_encrypt(sbi)) ?
> +					(1 << FEAT_ENCRYPTED_CASEFOLD) : 0;
> +		fallthrough;
> +	case FEAT_PIN_FILE:
> +		feat_supp |= (1 << FEAT_PIN_FILE);
> +		fallthrough;
> +	case FEAT_TEST_DUMMY_ENCRYPTION_V2:
> +	case FEAT_ATOMIC_WRITE:
> +		if (!a->offset || feat_supp & (1 << a->id))
> +			return sprintf(buf, "supported\n");
>  	}
> -	return 0;
> +	return sprintf(buf, "not supported\n");
>  }

This function doesn't make much sense.

Part of the problem is that the same function is handling both
/sys/fs/f2fs/features/ and /sys/fs/f2fs/$s_id/feature_list/.

All the former needs is to print "supported", since unsupported is indicated by
the file not being there at all.  So it should simply have its own ->show
function separate from the one for feature_list/.

And the feature_list/ ones could just store the F2FS_FEATURE_* bit in
f2fs_attr::id and check for it using F2FS_HAS_FEATURE().  That would be much
simpler -- no need for the feat_id enum or the long switch statement.

Also for feature_list/ it might be better to use "unsupported" than
"not supported", so that \<supported\> doesn't match...

>  static struct f2fs_attr f2fs_attr_##_name = {			\
>  	.attr = {.name = __stringify(_name), .mode = 0444 },	\
>  	.show	= f2fs_feature_show,				\
> +	.offset	= 0,						\
>  	.id	= _id,						\
>  }

There's no need to use the .offset argument if features/ and $s_id/feature_list/
just used different ->show functions.

> +#define F2FS_DISK_FEATURE_RO_ATTR(_name, _id)			\

F2FS_SB_FEATURE_ATTR would be a much better name, since these pertain to a
filesystem instance (not necessarily a disk), and all the feature attributes are
read-only.

>  static int __maybe_unused segment_info_seq_show(struct seq_file *seq,
>  						void *offset)
>  {
> @@ -1149,6 +1279,15 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
>  	if (err)
>  		goto put_stat_kobj;
>  
> +	sbi->s_disk_feat_kobj.kset = &f2fs_kset;
> +	init_completion(&sbi->s_disk_feat_kobj_unregister);
> +	err = kobject_init_and_add(&sbi->s_disk_feat_kobj,
> +						&f2fs_disk_feat_ktype,
> +						&sbi->s_kobj, "feature_list");
> +	if (err)
> +		goto put_stat_kobj;
> +
> +
>  	if (f2fs_proc_root)
>  		sbi->s_proc = proc_mkdir(sb->s_id, f2fs_proc_root);
>  
> @@ -1166,6 +1305,8 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
>  put_stat_kobj:
>  	kobject_put(&sbi->s_stat_kobj);
>  	wait_for_completion(&sbi->s_stat_kobj_unregister);
> +	kobject_put(&sbi->s_disk_feat_kobj);
> +	wait_for_completion(&sbi->s_disk_feat_kobj_unregister);

It seems this should go to its own label.

Also, please note that it's very easy to get confused between
/sys/fs/f2fs/features/, /sys/fs/f2fs/$s_id/features, and
/sys/fs/f2fs/$s_id/feature_list/.  Adding some comments could clarify things a
lot.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
