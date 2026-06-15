Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zy+8EiwkMGoVOwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 18:11:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D93E688284
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 18:11:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="T/Ej8t+m";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="cIH1mdA/";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=F9WqMzAF;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=DWvAQWzA;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5X4Cqjt2rPLdWkfOfvlUwwZDmzy5xwulkJ0nXNY1lY=; b=T/Ej8t+mfAl7ytkKesAKzClw8r
	Tk5Oy5VYpAvuC+AdvCLJhvO7OtWxNK3xDQzlujtF49sBUETP/QiJHnBxFcHb+veYkgQ8QqvLe3PbB
	LGgz6/0pJguSkJCqwMj3v5vFBlYGuR98c7ruktFpJrKw93pKy+dyn6gZb7KepUfLv8z8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ9u9-0000du-8R;
	Mon, 15 Jun 2026 16:11:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wZ9u8-0000dn-CZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 16:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bzQ+S/hbqwWwKJFHmdfXVu5xJzPEXNzrNS5LXD0NYqY=; b=cIH1mdA/EPcOxQaKxUjA13nwpP
 htuX/rkg97Dn7aMAVPiwmqR/93qBMsgg9owgQfAeyUX2Ev4VAQX5+eo5piZdJndLTJJl7WVu5SUbX
 v4M6JZezOzv8GpWh+Ev5/uDg0tHv0Py1pi8cUyTE9aaZMDM7X1SsDHudOeX4UyvzJuzI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bzQ+S/hbqwWwKJFHmdfXVu5xJzPEXNzrNS5LXD0NYqY=; b=F9WqMzAFtJi/bAFTDl9YZD8OU1
 hxz800smjMwa00/Zv01UEJ9K5bUaw4n9GBGGYO3KYacP9bB9sKW6MRNre7WKC5L/uyUjRzIUJnZUV
 I/YX33QwCAkx5gqdyGqZlwGjkKk3XQmUmOtlagRZXx9ephe8M4prK4b0X6hoNKfCwQAo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ9u6-0003ii-OC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 16:11:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BCE7343BA7;
 Mon, 15 Jun 2026 16:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8411F000E9;
 Mon, 15 Jun 2026 16:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781539864;
 bh=bzQ+S/hbqwWwKJFHmdfXVu5xJzPEXNzrNS5LXD0NYqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=DWvAQWzARoBiVJlcUVCyWFXdhDXPgzHWv7mC0ldSfechaajgKBIJcLiPRY/BXIaEO
 BiQYyPegqwPvVfA2u/hJJw+TjAJGGXEZRv5huLsC5VLPkxnnulz6gNLuyiZrN+kuak
 FCU7HoEiMilC7I9jmvW2dcwYlhKja4SJuWuzA/UxTVKhMvzVLqhG+PO/kABljCwumt
 ghWoyp4vfFegayKtiyQ196CZXlug/qOZGXqXVSqR+9T2GfDqMeUyR7agHsW4w80uUd
 kfRsF8ZVPr9R6wGxoAGQ+TrINW37gW+56Bw5gnCdTgdkoj+pyU5kS/+iAxD63ljpmC
 r3aC8lRCnddqQ==
Date: Mon, 15 Jun 2026 16:11:03 +0000
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <ajAkF5FYJAUyuz2Z@google.com>
References: <20260606011742.1205390-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260606011742.1205390-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daeho, Could you please rebase on top of dev-test? Thanks,
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
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal information
X-Headers-End: 1wZ9u6-0003ii-OC
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: support dynamic include/exclude for
 device aliasing
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,qstr.name:url];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D93E688284

Hi Daeho,

Could you please rebase on top of dev-test?

Thanks,

On 06/05, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> This patch adds a dynamic management feature to the existing device
> aliasing functionality. It allows users to dynamically exclude or
> include specific devices from the filesystem's free pool at runtime
> through new ioctls.
> 
> To support this, three new ioctls are introduced:
> - F2FS_IOC_EXCLUDE_DEV_ALIAS: This reclaims the space occupied by a
>   device aliasing file. It first performs a capacity check, resets GC
>   victim information for the target range, marks the segments as in-use
>   to prevent new allocations, and then triggers GC to migrate existing
>   valid data out of the range. Finally, it reserves these blocks in the
>   SIT to effectively exclude the device from the usable capacity.
> 
> - F2FS_IOC_INCLUDE_DEV_ALIAS: This releases the reserved space of a
>   previously excluded device aliasing file. It truncates the blocks
>   associated with the file, which makes them available for general
>   filesystem allocation again.
> 
> - F2FS_IOC_GET_DEV_ALIAS_STATUS: This retrieves the current aliasing
>   status of a device aliasing file, returning whether the file is
>   included (active alias) or excluded (inactive alias, with blocks
>   fully allocated on the device).
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v3: add CAP_SYS_ADMIN and checkpoint=disabled check.
>     remove a f2fs specific flag exposed with getflags.
> v2: prevent operations during checkpoint=disabled.
> ---
>  Documentation/filesystems/f2fs.rst |  35 ++++
>  fs/f2fs/f2fs.h                     |   9 +-
>  fs/f2fs/file.c                     | 272 ++++++++++++++++++++++++++++-
>  fs/f2fs/gc.c                       |  30 ++--
>  fs/f2fs/namei.c                    |  11 ++
>  fs/f2fs/segment.c                  | 178 +++++++++++++------
>  fs/f2fs/segment.h                  |  11 ++
>  fs/f2fs/super.c                    |  34 ++++
>  include/uapi/linux/f2fs.h          |   7 +
>  9 files changed, 520 insertions(+), 67 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 7e4031631286..d154c8ac0cd7 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -1036,6 +1036,41 @@ So, the key idea is, user can do any file operations on /dev/vdc, and
>  reclaim the space after the use, while the space is counted as /data.
>  That doesn't require modifying partition size and filesystem format.
>  
> +Dynamic Device Aliasing Management
> +----------------------------------
> +
> +In addition to static device aliasing by deleting the aliasing file, F2FS
> +supports dynamic management of device aliasing. This mechanism allows the system
> +to dynamically transition partition ownership between F2FS userdata and external
> +entities (e.g., zRAM, raw partition) based on system requirements without
> +deleting the master aliasing file or requiring unmount/remount.
> +
> +The master aliasing file is created during the initial format of the file system
> +and remains as a persistent control entity (ioctl gateway) in the root directory.
> +
> +- Partition Exclusion (In-service to Aliased)
> +  When a specific partition needs to be dedicated to external services (e.g., zRAM),
> +  a user can exclude the device alias range via ioctl. The kernel resets GC victim
> +  information for the target range, marks segments as in-use to prevent new
> +  allocations, and triggers forced GC to migrate existing valid data out of the
> +  range. Finally, it reserves these blocks in the SIT to effectively exclude the
> +  device from the usable capacity.
> +
> +- Partition Inclusion (Aliased to In-service)
> +  When external usage concludes, the space is reclaimed not by deleting the file,
> +  but through the inclusion ioctl. The kernel truncates blocks associated with
> +  the file, releasing them back to general filesystem allocation.
> +
> +.. code-block::
> +
> +   # f2fs_io dev_alias include /mnt/f2fs/vdc.file
> +   # df -h
> +   /dev/vdb                            64G  753M   64G   2% /mnt/f2fs
> +
> +   # f2fs_io dev_alias exclude /mnt/f2fs/vdc.file
> +   # df -h
> +   /dev/vdb                            64G   33G   32G  52% /mnt/f2fs
> +
>  Per-file Read-Only Large Folio Support
>  --------------------------------------
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 29f81a496b72..5e0c5701c088 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1398,6 +1398,8 @@ struct f2fs_dev_info {
>  	unsigned int total_segments;
>  	block_t start_blk;
>  	block_t end_blk;
> +	bool has_alias;
> +	bool is_excluding;
>  #ifdef CONFIG_BLK_DEV_ZONED
>  	unsigned int nr_blkz;		/* Total number of zones */
>  	unsigned long *blkz_seq;	/* Bitmap indicating sequential zones */
> @@ -3970,7 +3972,10 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi);
>  int f2fs_flush_device_cache(struct f2fs_sb_info *sbi);
>  void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free);
>  void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr,
> -						unsigned int len);
> +				unsigned int len);
> +void f2fs_reserve_device_alias(struct f2fs_sb_info *sbi, block_t addr,
> +				unsigned int len);
> +
>  bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr);
>  int f2fs_start_discard_thread(struct f2fs_sb_info *sbi);
>  void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
> @@ -4189,6 +4194,8 @@ void f2fs_build_gc_manager(struct f2fs_sb_info *sbi);
>  int f2fs_gc_range(struct f2fs_sb_info *sbi,
>  		unsigned int start_seg, unsigned int end_seg,
>  		bool dry_run, unsigned int dry_run_sections);
> +void f2fs_reset_gc_victim_resource(struct f2fs_sb_info *sbi,
> +		unsigned int start, unsigned int end);
>  int f2fs_resize_fs(struct file *filp, __u64 block_count);
>  int __init f2fs_create_garbage_collection_cache(void);
>  void f2fs_destroy_garbage_collection_cache(void);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index abcf6f486dd7..8a25467ca4f4 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -803,13 +803,25 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
>  
>  	if (IS_DEVICE_ALIASING(inode)) {
>  		struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
> -		struct extent_info ei = et->largest;
> +		struct extent_info ei;
> +
> +		if (!et) {
> +			f2fs_folio_put(ifolio, true);
> +			err = -ENODATA;
> +			goto out;
> +		}
> +
> +		read_lock(&et->lock);
> +		ei = et->largest;
> +		read_unlock(&et->lock);
>  
>  		f2fs_invalidate_blocks(sbi, ei.blk, ei.len);
>  
>  		dec_valid_block_count(sbi, inode, ei.len);
>  		f2fs_update_time(sbi, REQ_TIME);
>  
> +		f2fs_drop_extent_tree(inode);
> +
>  		f2fs_folio_put(ifolio, true);
>  		goto out;
>  	}
> @@ -1092,8 +1104,9 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  		return -EPERM;
>  
>  	if ((attr->ia_valid & ATTR_SIZE)) {
> -		if (!f2fs_is_compress_backend_ready(inode) ||
> -				IS_DEVICE_ALIASING(inode))
> +		if (IS_DEVICE_ALIASING(inode))
> +			return -EPERM;
> +		if (!f2fs_is_compress_backend_ready(inode))
>  			return -EOPNOTSUPP;
>  		if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED) &&
>  			!IS_ALIGNED(attr->ia_size,
> @@ -2115,6 +2128,9 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  	if (IS_NOQUOTA(inode))
>  		return -EPERM;
>  
> +	if (IS_DEVICE_ALIASING(inode))
> +		return -EPERM;
> +
>  	if ((iflags ^ masked_flags) & F2FS_CASEFOLD_FL) {
>  		if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
>  			return -EOPNOTSUPP;
> @@ -2663,6 +2679,17 @@ static int f2fs_ioc_get_encryption_policy(struct file *filp, unsigned long arg)
>  	return fscrypt_ioctl_get_policy(filp, (void __user *)arg);
>  }
>  
> +static int f2fs_ioc_get_dev_alias_status(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +
> +	if (!IS_DEVICE_ALIASING(inode))
> +		return -EINVAL;
> +
> +	return put_user(F2FS_HAS_BLOCKS(inode) ? F2FS_DEV_ALIAS_STATUS_EXCLUDED :
> +				F2FS_DEV_ALIAS_STATUS_INCLUDED, (u32 __user *)arg);
> +}
> +
>  static int f2fs_ioc_get_encryption_pwsalt(struct file *filp, unsigned long arg)
>  {
>  	struct inode *inode = file_inode(filp);
> @@ -3599,6 +3626,236 @@ static int f2fs_ioc_get_dev_alias_file(struct file *filp, unsigned long arg)
>  			(u32 __user *)arg);
>  }
>  
> +static int f2fs_ioc_exclude_dev_alias(struct file *filp)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
> +	struct extent_info ei;
> +	struct cp_control cpc = { CP_SYNC, 0, 0, 0 };
> +	struct f2fs_lock_context lc;
> +	blkcnt_t count;
> +	unsigned int start, end, segno;
> +	int type, i, err;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +
> +	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> +		return -EINVAL;
> +
> +	err = mnt_want_write_file(filp);
> +	if (err)
> +		return err;
> +
> +	inode_lock(inode);
> +
> +	if (!IS_DEVICE_ALIASING(inode)) {
> +		err = -EINVAL;
> +		goto out_inode_unlock;
> +	}
> +
> +	if (F2FS_HAS_BLOCKS(inode)) {
> +		err = 0;
> +		goto out_inode_unlock;
> +	}
> +
> +	for (i = 1; i < sbi->s_ndevs; i++) {
> +		char *name = strrchr(FDEV(i).path, '/');
> +
> +		name = name ? name + 1 : FDEV(i).path;
> +		if (!strcmp(name, filp->f_path.dentry->d_name.name)) {
> +			ei.blk = FDEV(i).start_blk;
> +			ei.len = FDEV(i).total_segments << sbi->log_blocks_per_seg;
> +			ei.fofs = 0;
> +			break;
> +		}
> +	}
> +
> +	if (i == sbi->s_ndevs) {
> +		err = -ENODATA;
> +		goto out_inode_unlock;
> +	}
> +
> +	count = ei.len;
> +	err = inc_valid_block_count(sbi, inode, &count, false);
> +	if (err)
> +		goto out_inode_unlock;
> +
> +	f2fs_down_write(&sbi->gc_lock);
> +	f2fs_lock_op(sbi, &lc);
> +
> +	FDEV(f2fs_target_device_index(sbi, ei.blk)).is_excluding = true;
> +
> +	start = GET_SEGNO(sbi, ei.blk);
> +	end = GET_SEGNO(sbi, ei.blk + ei.len - 1);
> +
> +	/* Reset the victim information to prevent GC from targeting the range */
> +	f2fs_reset_gc_victim_resource(sbi, start, end);
> +
> +	/* Mark the range as inuse to prevent new allocations in it */
> +	for (segno = start; segno <= end; segno++)
> +		__set_test_and_inuse(sbi, segno);
> +
> +	/* Move out cursegs from the target range */
> +	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_PERSIST_TYPE; type++) {
> +		err = f2fs_allocate_segment_for_resize(sbi, type, start, end);
> +		if (err) {
> +			f2fs_unlock_op(sbi, &lc);
> +			goto out_gc_unlock;
> +		}
> +	}
> +
> +	f2fs_unlock_op(sbi, &lc);
> +	f2fs_up_write(&sbi->gc_lock);
> +
> +	/* Write checkpoint synchronously to flush all pending writes and free space */
> +	err = f2fs_write_checkpoint(sbi, &cpc);
> +	if (err) {
> +		f2fs_down_write(&sbi->gc_lock);
> +		goto out_gc_unlock;
> +	}
> +
> +	/* Re-acquire gc_lock and cp_rwsem read lock for the entire range GC */
> +	f2fs_down_write(&sbi->gc_lock);
> +	f2fs_lock_op(sbi, &lc);
> +
> +	/* do GC to move out valid blocks in the range all at once! */
> +	err = f2fs_gc_range(sbi, start, end, false, 0);
> +	if (err) {
> +		f2fs_unlock_op(sbi, &lc);
> +		goto out_gc_unlock;
> +	}
> +
> +	if (et) {
> +		write_lock(&et->lock);
> +		et->largest = ei;
> +		write_unlock(&et->lock);
> +	}
> +	clear_inode_flag(inode, FI_NO_EXTENT);
> +
> +	f2fs_reserve_device_alias(sbi, ei.blk, ei.len);
> +
> +	i_size_write(inode, (loff_t)ei.len << PAGE_SHIFT);
> +	f2fs_update_inode_page(inode);
> +
> +	FDEV(f2fs_target_device_index(sbi, ei.blk)).is_excluding = false;
> +
> +	f2fs_unlock_op(sbi, &lc);
> +	f2fs_up_write(&sbi->gc_lock);
> +
> +	inode_unlock(inode);
> +	mnt_drop_write_file(filp);
> +
> +	err = f2fs_write_checkpoint(sbi, &cpc);
> +	return err;
> +
> +out_gc_unlock:
> +	FDEV(f2fs_target_device_index(sbi, ei.blk)).is_excluding = false;
> +	f2fs_up_write(&sbi->gc_lock);
> +
> +	/*
> +	 * Put successfully GC'ed segments back into PRE list so checkpoint
> +	 * commits and frees them!
> +	 */
> +	f2fs_lock_op(sbi, &lc);
> +	for (segno = start; segno <= end; segno++) {
> +		if (get_valid_blocks(sbi, segno, false) == 0) {
> +			mutex_lock(&DIRTY_I(sbi)->seglist_lock);
> +			if (!test_and_set_bit(segno, DIRTY_I(sbi)->dirty_segmap[PRE]))
> +				DIRTY_I(sbi)->nr_dirty[PRE]++;
> +			mutex_unlock(&DIRTY_I(sbi)->seglist_lock);
> +		}
> +	}
> +	f2fs_unlock_op(sbi, &lc);
> +
> +	count = ei.len;
> +	dec_valid_block_count(sbi, inode, count);
> +
> +	inode_unlock(inode);
> +	mnt_drop_write_file(filp);
> +
> +	f2fs_write_checkpoint(sbi, &cpc);
> +	return err;
> +
> +out_inode_unlock:
> +	inode_unlock(inode);
> +	mnt_drop_write_file(filp);
> +	return err;
> +}
> +
> +static int f2fs_ioc_include_dev_alias(struct file *filp)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
> +	struct extent_info ei = {0, };
> +	struct cp_control cpc = { CP_SYNC, 0, 0, 0 };
> +	struct f2fs_lock_context lc;
> +	int err;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +
> +	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> +		return -EINVAL;
> +
> +	err = mnt_want_write_file(filp);
> +	if (err)
> +		return err;
> +
> +	inode_lock(inode);
> +
> +	if (!IS_DEVICE_ALIASING(inode)) {
> +		err = -EINVAL;
> +		goto out_inode_unlock;
> +	}
> +
> +	if (!F2FS_HAS_BLOCKS(inode)) {
> +		err = 0;
> +		goto out_inode_unlock;
> +	}
> +
> +	err = filemap_write_and_wait(inode->i_mapping);
> +	if (err)
> +		goto out_inode_unlock;
> +
> +	if (et) {
> +		read_lock(&et->lock);
> +		ei = et->largest;
> +		read_unlock(&et->lock);
> +	}
> +
> +	f2fs_down_write(&sbi->gc_lock);
> +	f2fs_lock_op(sbi, &lc);
> +
> +	truncate_setsize(inode, 0);
> +
> +	err = f2fs_truncate_blocks(inode, 0, false);
> +	if (err) {
> +		i_size_write(inode, (loff_t)ei.len << PAGE_SHIFT);
> +		f2fs_unlock_op(sbi, &lc);
> +		f2fs_up_write(&sbi->gc_lock);
> +		goto out_inode_unlock;
> +	}
> +
> +	f2fs_update_inode_page(inode);
> +
> +	f2fs_unlock_op(sbi, &lc);
> +	f2fs_up_write(&sbi->gc_lock);
> +
> +	inode_unlock(inode);
> +	mnt_drop_write_file(filp);
> +
> +	err = f2fs_write_checkpoint(sbi, &cpc);
> +	return err;
> +
> +out_inode_unlock:
> +	inode_unlock(inode);
> +	mnt_drop_write_file(filp);
> +	return err;
> +}
> +
>  static int f2fs_ioc_io_prio(struct file *filp, unsigned long arg)
>  {
>  	struct inode *inode = file_inode(filp);
> @@ -4721,8 +4978,14 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return f2fs_ioc_compress_file(filp);
>  	case F2FS_IOC_GET_DEV_ALIAS_FILE:
>  		return f2fs_ioc_get_dev_alias_file(filp, arg);
> +	case F2FS_IOC_GET_DEV_ALIAS_STATUS:
> +		return f2fs_ioc_get_dev_alias_status(filp, arg);
>  	case F2FS_IOC_IO_PRIO:
>  		return f2fs_ioc_io_prio(filp, arg);
> +	case F2FS_IOC_EXCLUDE_DEV_ALIAS:
> +		return f2fs_ioc_exclude_dev_alias(filp);
> +	case F2FS_IOC_INCLUDE_DEV_ALIAS:
> +		return f2fs_ioc_include_dev_alias(filp);
>  	default:
>  		return -ENOTTY;
>  	}
> @@ -5447,7 +5710,10 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	case F2FS_IOC_DECOMPRESS_FILE:
>  	case F2FS_IOC_COMPRESS_FILE:
>  	case F2FS_IOC_GET_DEV_ALIAS_FILE:
> +	case F2FS_IOC_GET_DEV_ALIAS_STATUS:
>  	case F2FS_IOC_IO_PRIO:
> +	case F2FS_IOC_EXCLUDE_DEV_ALIAS:
> +	case F2FS_IOC_INCLUDE_DEV_ALIAS:
>  		break;
>  	default:
>  		return -ENOIOCTLCMD;
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 60378614bc54..755df9b6bbaa 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -2143,29 +2143,37 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
>  	return 0;
>  }
>  
> +void f2fs_reset_gc_victim_resource(struct f2fs_sb_info *sbi,
> +			unsigned int start, unsigned int end)
> +{
> +	int i;
> +
> +	mutex_lock(&DIRTY_I(sbi)->seglist_lock);
> +	for (i = 0; i < MAX_GC_POLICY; i++)
> +		if (SIT_I(sbi)->last_victim[i] >= start &&
> +			SIT_I(sbi)->last_victim[i] <= end)
> +			SIT_I(sbi)->last_victim[i] = 0;
> +
> +	for (i = BG_GC; i <= FG_GC; i++)
> +		if (sbi->next_victim_seg[i] >= start &&
> +			sbi->next_victim_seg[i] <= end)
> +			sbi->next_victim_seg[i] = NULL_SEGNO;
> +	mutex_unlock(&DIRTY_I(sbi)->seglist_lock);
> +}
> +
>  static int free_segment_range(struct f2fs_sb_info *sbi,
>  				unsigned int secs, bool dry_run)
>  {
>  	unsigned int next_inuse, start, end;
>  	struct cp_control cpc = { CP_RESIZE, 0, 0, 0 };
> -	int gc_mode, gc_type;
>  	int err = 0;
>  	int type;
>  
> -	/* Force block allocation for GC */
>  	MAIN_SECS(sbi) -= secs;
>  	start = MAIN_SECS(sbi) * SEGS_PER_SEC(sbi);
>  	end = MAIN_SEGS(sbi) - 1;
>  
> -	mutex_lock(&DIRTY_I(sbi)->seglist_lock);
> -	for (gc_mode = 0; gc_mode < MAX_GC_POLICY; gc_mode++)
> -		if (SIT_I(sbi)->last_victim[gc_mode] >= start)
> -			SIT_I(sbi)->last_victim[gc_mode] = 0;
> -
> -	for (gc_type = BG_GC; gc_type <= FG_GC; gc_type++)
> -		if (sbi->next_victim_seg[gc_type] >= start)
> -			sbi->next_victim_seg[gc_type] = NULL_SEGNO;
> -	mutex_unlock(&DIRTY_I(sbi)->seglist_lock);
> +	f2fs_reset_gc_victim_resource(sbi, start, end);
>  
>  	/* Move out cursegs from the target range */
>  	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_PERSIST_TYPE; type++) {
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index e360f08a9586..b7974242ead1 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -553,6 +553,9 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>  
>  	trace_f2fs_unlink_enter(dir, dentry);
>  
> +	if (IS_DEVICE_ALIASING(inode))
> +		return -EPERM;
> +
>  	if (unlikely(f2fs_cp_error(sbi))) {
>  		err = -EIO;
>  		goto out;
> @@ -931,6 +934,9 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
>  	bool old_is_dir = S_ISDIR(old_inode->i_mode);
>  	int err;
>  
> +	if (IS_DEVICE_ALIASING(old_inode))
> +		return -EPERM;
> +
>  	if (unlikely(f2fs_cp_error(sbi)))
>  		return -EIO;
>  	if (!f2fs_is_checkpoint_ready(sbi))
> @@ -1000,6 +1006,8 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
>  	}
>  
>  	if (new_inode) {
> +		if (IS_DEVICE_ALIASING(new_inode))
> +			return -EPERM;
>  
>  		err = -ENOTEMPTY;
>  		if (old_is_dir && !f2fs_empty_dir(new_inode))
> @@ -1127,6 +1135,9 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
>  	int old_nlink = 0, new_nlink = 0;
>  	int err;
>  
> +	if (IS_DEVICE_ALIASING(old_inode) || IS_DEVICE_ALIASING(new_inode))
> +		return -EPERM;
> +
>  	if (unlikely(f2fs_cp_error(sbi)))
>  		return -EIO;
>  	if (!f2fs_is_checkpoint_ready(sbi))
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 6a97fe76712b..c0ddc09adc51 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2498,44 +2498,51 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
>  #ifdef CONFIG_F2FS_CHECK_FS
>  	bool mir_exist;
>  #endif
> +	int del_count = del;
> +	int i;
> +
> +	f2fs_bug_on(sbi, GET_SEGNO(sbi, blkaddr) != GET_SEGNO(sbi, blkaddr + del_count - 1));
>  
> -	exist = f2fs_test_and_set_bit(offset, se->cur_valid_map);
> +	for (i = 0; i < del_count; i++) {
> +		exist = f2fs_test_and_set_bit(offset + i, se->cur_valid_map);
>  #ifdef CONFIG_F2FS_CHECK_FS
> -	mir_exist = f2fs_test_and_set_bit(offset,
> -					se->cur_valid_map_mir);
> -	if (unlikely(exist != mir_exist)) {
> -		f2fs_err(sbi, "Inconsistent error when setting bitmap, blk:%u, old bit:%d",
> -			blkaddr, exist);
> -		f2fs_bug_on(sbi, 1);
> -	}
> +		mir_exist = f2fs_test_and_set_bit(offset + i,
> +						se->cur_valid_map_mir);
> +		if (unlikely(exist != mir_exist)) {
> +			f2fs_err(sbi, "Inconsistent error when setting bitmap, blk:%u, old bit:%d",
> +				blkaddr + i, exist);
> +			f2fs_bug_on(sbi, 1);
> +		}
>  #endif
> -	if (unlikely(exist)) {
> -		f2fs_err(sbi, "Bitmap was wrongly set, blk:%u", blkaddr);
> -		f2fs_bug_on(sbi, 1);
> -		se->valid_blocks--;
> -		del = 0;
> -	}
> +		if (unlikely(exist)) {
> +			f2fs_err(sbi, "Bitmap was wrongly set, blk:%u", blkaddr + i);
> +			f2fs_bug_on(sbi, 1);
> +			se->valid_blocks--;
> +			del -= 1;
> +			continue;
> +		}
>  
> -	if (f2fs_block_unit_discard(sbi) &&
> -			!f2fs_test_and_set_bit(offset, se->discard_map))
> -		sbi->discard_blks--;
> +		if (f2fs_block_unit_discard(sbi) &&
> +				!f2fs_test_and_set_bit(offset + i, se->discard_map))
> +			sbi->discard_blks--;
>  
> -	/*
> -	 * SSR should never reuse block which is checkpointed
> -	 * or newly invalidated.
> -	 */
> -	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> -		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map)) {
> -			se->ckpt_valid_blocks++;
> -			if (__is_large_section(sbi))
> -				get_sec_entry(sbi, segno)->ckpt_valid_blocks++;
> +		/*
> +		 * SSR should never reuse block which is checkpointed
> +		 * or newly invalidated.
> +		 */
> +		if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> +			if (!f2fs_test_and_set_bit(offset + i, se->ckpt_valid_map)) {
> +				se->ckpt_valid_blocks++;
> +				if (__is_large_section(sbi))
> +					get_sec_entry(sbi, segno)->ckpt_valid_blocks++;
> +			}
>  		}
> -	}
>  
> -	if (!f2fs_test_bit(offset, se->ckpt_valid_map)) {
> -		se->ckpt_valid_blocks += del;
> -		if (__is_large_section(sbi))
> -			get_sec_entry(sbi, segno)->ckpt_valid_blocks += del;
> +		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map)) {
> +			se->ckpt_valid_blocks += 1;
> +			if (__is_large_section(sbi))
> +				get_sec_entry(sbi, segno)->ckpt_valid_blocks += 1;
> +		}
>  	}
>  
>  	if (__is_large_section(sbi))
> @@ -2590,9 +2597,14 @@ void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr,
>  	unsigned int segno = GET_SEGNO(sbi, addr);
>  	struct sit_info *sit_i = SIT_I(sbi);
>  	block_t addr_start = addr, addr_end = addr + len - 1;
> -	unsigned int seg_num = GET_SEGNO(sbi, addr_end) - segno + 1;
> +	unsigned int seg_num;
>  	unsigned int i = 1, max_blocks = sbi->blocks_per_seg, cnt;
>  
> +	if (len == 0)
> +		return;
> +
> +	seg_num = GET_SEGNO(sbi, addr_end) - segno + 1;
> +
>  	f2fs_bug_on(sbi, addr == NULL_ADDR);
>  	if (addr == NEW_ADDR || addr == COMPRESS_ADDR)
>  		return;
> @@ -2625,6 +2637,51 @@ void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr,
>  	up_write(&sit_i->sentry_lock);
>  }
>  
> +void f2fs_reserve_device_alias(struct f2fs_sb_info *sbi, block_t addr,
> +				unsigned int len)
> +{
> +	unsigned int segno = GET_SEGNO(sbi, addr);
> +	struct sit_info *sit_i = SIT_I(sbi);
> +	block_t addr_start = addr, addr_end = addr + len - 1;
> +	unsigned int seg_num;
> +	unsigned int i = 1, max_blocks = sbi->blocks_per_seg, cnt;
> +
> +	if (len == 0)
> +		return;
> +
> +	seg_num = GET_SEGNO(sbi, addr_end) - segno + 1;
> +
> +	down_write(&sit_i->sentry_lock);
> +
> +	if (seg_num == 1)
> +		cnt = len;
> +	else
> +		cnt = max_blocks - GET_BLKOFF_FROM_SEG0(sbi, addr);
> +
> +	do {
> +		update_segment_mtime(sbi, addr_start, 0);
> +		update_sit_entry(sbi, addr_start, cnt);
> +
> +		/* Remove the segment from PRE (prefree) to prevent checkpoint from freeing it! */
> +		mutex_lock(&DIRTY_I(sbi)->seglist_lock);
> +		if (test_and_clear_bit(segno, DIRTY_I(sbi)->dirty_segmap[PRE]))
> +			DIRTY_I(sbi)->nr_dirty[PRE]--;
> +		mutex_unlock(&DIRTY_I(sbi)->seglist_lock);
> +
> +		/* add it into dirty seglist */
> +		locate_dirty_segment(sbi, segno);
> +
> +		/* update @addr_start and @cnt and @segno */
> +		addr_start = START_BLOCK(sbi, ++segno);
> +		if (++i == seg_num)
> +			cnt = GET_BLKOFF_FROM_SEG0(sbi, addr_end) + 1;
> +		else
> +			cnt = max_blocks;
> +	} while (i <= seg_num);
> +
> +	up_write(&sit_i->sentry_lock);
> +}
> +
>  bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr)
>  {
>  	struct sit_info *sit_i = SIT_I(sbi);
> @@ -2783,6 +2840,7 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
>  	unsigned int alloc_policy = sbi->allocate_section_policy;
>  	unsigned int alloc_hint = sbi->allocate_section_hint;
>  	bool init = true;
> +	bool looped = false;
>  	int i;
>  	int ret = 0;
>  
> @@ -2833,33 +2891,49 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
>  find_other_zone:
>  	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
>  
> -#ifdef CONFIG_BLK_DEV_ZONED
> -	if (secno >= MAIN_SECS(sbi) && f2fs_sb_has_blkzoned(sbi)) {
> -		/* Write only to sequential zones */
> -		if (sbi->blkzone_alloc_policy == BLKZONE_ALLOC_ONLY_SEQ) {
> -			hint = GET_SEC_FROM_SEG(sbi, sbi->first_seq_zone_segno);
> -			secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
> -		} else
> -			secno = find_first_zero_bit(free_i->free_secmap,
> -								MAIN_SECS(sbi));
> -		if (secno >= MAIN_SECS(sbi)) {
> -			ret = -ENOSPC;
> -			f2fs_bug_on(sbi, 1);
> -			goto out_unlock;
> -		}
> -	}
> -#endif
> -
>  	if (secno >= MAIN_SECS(sbi)) {
> -		secno = find_first_zero_bit(free_i->free_secmap,
> -							MAIN_SECS(sbi));
> -		if (secno >= MAIN_SECS(sbi)) {
> +		if (looped) {
>  			ret = -ENOSPC;
>  			f2fs_bug_on(sbi, !pinning);
>  			goto out_unlock;
>  		}
> +#ifdef CONFIG_BLK_DEV_ZONED
> +		/* Write only to sequential zones */
> +		if (f2fs_sb_has_blkzoned(sbi) &&
> +			sbi->blkzone_alloc_policy == BLKZONE_ALLOC_ONLY_SEQ)
> +			hint = GET_SEC_FROM_SEG(sbi, sbi->first_seq_zone_segno);
> +		else
> +#endif
> +			hint = 0;
> +		looped = true;
> +		goto find_other_zone;
>  	}
> +
>  	segno = GET_SEG_FROM_SEC(sbi, secno);
> +
> +	if (f2fs_sb_has_device_alias(sbi) && pinning && f2fs_is_multi_device(sbi)) {
> +		int devi = f2fs_target_device_index(sbi, START_BLOCK(sbi, segno));
> +
> +		if (FDEV(devi).has_alias) {
> +			unsigned int end_segno;
> +
> +			while (devi < sbi->s_ndevs && FDEV(devi).has_alias) {
> +				block_t next_blk;
> +
> +				end_segno = GET_SEGNO(sbi, FDEV(devi).end_blk);
> +				hint = GET_SEC_FROM_SEG(sbi, end_segno) + 1;
> +
> +				if (hint >= MAIN_SECS(sbi) || ++devi >= sbi->s_ndevs)
> +					break;
> +
> +				next_blk = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, hint));
> +				if (next_blk < FDEV(devi).start_blk ||
> +					next_blk > FDEV(devi).end_blk)
> +					break;
> +			}
> +			goto find_other_zone;
> +		}
> +	}
>  	zoneno = GET_ZONE_FROM_SEC(sbi, secno);
>  
>  	/* give up on finding another zone */
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 068845660b0f..914523f5d3ea 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -980,6 +980,17 @@ static inline bool sec_usage_check(struct f2fs_sb_info *sbi, unsigned int secno)
>  {
>  	if (is_cursec(sbi, secno) || (sbi->cur_victim_sec == secno))
>  		return true;
> +	if (f2fs_sb_has_device_alias(sbi) && f2fs_is_multi_device(sbi)) {
> +		int i;
> +		block_t start_blk = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, secno));
> +
> +		for (i = 0; i < sbi->s_ndevs; i++) {
> +			if (FDEV(i).is_excluding &&
> +				start_blk >= FDEV(i).start_blk &&
> +				start_blk <= FDEV(i).end_blk)
> +				return true;
> +		}
> +	}
>  	return false;
>  }
>  
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 9d421a07d2d5..ee599d202fc9 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4916,6 +4916,38 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
>  	sbi->readdir_ra = true;
>  }
>  
> +static void f2fs_restore_device_alias(struct f2fs_sb_info *sbi)
> +{
> +	struct inode *root = d_inode(sbi->sb->s_root);
> +	struct f2fs_dir_entry *de;
> +	struct folio *folio;
> +	int i;
> +
> +	if (!f2fs_sb_has_device_alias(sbi))
> +		return;
> +
> +	for (i = 1; i < sbi->s_ndevs; i++) {
> +		char *name = strrchr(FDEV(i).path, '/');
> +		struct qstr qstr;
> +
> +		name = name ? name + 1 : FDEV(i).path;
> +		qstr.name = name;
> +		qstr.len = strlen(name);
> +
> +		de = f2fs_find_entry(root, &qstr, &folio);
> +		if (de) {
> +			struct inode *inode = f2fs_iget(sbi->sb, le32_to_cpu(de->ino));
> +
> +			if (!IS_ERR(inode)) {
> +				if (IS_DEVICE_ALIASING(inode))
> +					FDEV(i).has_alias = true;
> +				iput(inode);
> +			}
> +			f2fs_folio_put(folio, 0);
> +		}
> +	}
> +}
> +
>  static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>  {
>  	struct f2fs_fs_context *ctx = fc->fs_private;
> @@ -5341,6 +5373,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>  	f2fs_update_time(sbi, REQ_TIME);
>  	clear_sbi_flag(sbi, SBI_CP_DISABLED_QUICK);
>  
> +	f2fs_restore_device_alias(sbi);
> +
>  	sbi->umount_lock_holder = NULL;
>  	return 0;
>  
> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> index 795e26258355..6ca6ae06918e 100644
> --- a/include/uapi/linux/f2fs.h
> +++ b/include/uapi/linux/f2fs.h
> @@ -45,6 +45,9 @@
>  #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
>  #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
>  #define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 27, __u32)
> +#define F2FS_IOC_EXCLUDE_DEV_ALIAS	_IO(F2FS_IOCTL_MAGIC, 28)
> +#define F2FS_IOC_INCLUDE_DEV_ALIAS	_IO(F2FS_IOCTL_MAGIC, 29)
> +#define F2FS_IOC_GET_DEV_ALIAS_STATUS	_IOR(F2FS_IOCTL_MAGIC, 30, __u32)
>  
>  /*
>   * should be same as XFS_IOC_GOINGDOWN.
> @@ -70,6 +73,10 @@ enum {
>  	F2FS_IOPRIO_MAX,
>  };
>  
> +/* for F2FS_IOC_GET_DEV_ALIAS_STATUS */
> +#define F2FS_DEV_ALIAS_STATUS_INCLUDED	0
> +#define F2FS_DEV_ALIAS_STATUS_EXCLUDED	1
> +
>  struct f2fs_gc_range {
>  	__u32 sync;
>  	__u64 start;
> -- 
> 2.54.0.1032.g2f8565e1d1-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
