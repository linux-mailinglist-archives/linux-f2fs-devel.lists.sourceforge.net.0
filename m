Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHsDBGNYA2r75AEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 18:42:11 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5125524EE2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 18:42:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYtzvumpBTZjWnaO1C63ym/Zog8Embm+tMIGqenI/W4=; b=HUYyHLLEJrsxai6fHQjdRTzoIG
	eKeL6KPDARAL3nTT038t0ZG1M+jy/+SwaIFTpR85bVFvhxyZkwAQobCv8MtZ4Z3tLoImXmYLHqyU1
	iR/gbAP+ICzu5ZSYorOn1rJYXH0QmtVgSd20kw6E3GIsQ5MYHfAXlNnZ5I7eGqAaR6vg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMqBI-0005YI-LB;
	Tue, 12 May 2026 16:42:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1wMqBH-0005Y6-Fe
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 16:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x3+wL0SBCXTW6uxHcpU69Kjqdinl8My/cHQWdvvbzLc=; b=L1SXchk3bbda1w/9bnEfG0CxYk
 DIR21ReSC6tUrrA8ruGy1dVeDLkc3c4WdhwMFu6W+QIxfX8Vo4uz2HTk33ADM6kgu7tW1oa4BVjSE
 VKaZS844gAQWSZ05ZCeZfBCItYDAjOpxpOaRWOfxg25MoxeSEy96E9Y8knlkvDxW6SVY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x3+wL0SBCXTW6uxHcpU69Kjqdinl8My/cHQWdvvbzLc=; b=NSnr+5GY9TsIka5+xyCavkkaM3
 /S5K9hk0N3Jvlh+9wcq5L9hRvbUvEmbzOnGEihA1iQNTaOqMzKK8LFckqWMRDjHdFQM3398YhPqGs
 bHLg7/q19ARWFceCEya+xgjLfsN5bZR8nFTiHIP7B/Jgyy1FNb1yXd105LiQ31Y3Rlo0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMqBF-00074p-Bd for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 16:42:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 862C140A0B;
 Tue, 12 May 2026 16:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52496C2BCB0;
 Tue, 12 May 2026 16:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778604111;
 bh=uUAaKeSsw/C4gKDe78MS/84nJIqPDsy/FO6kX8E+dGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j9ccH//FOAPLQgKjL4AEWgWAre98shE34Bs2vEr3nfjQGMjq2BCZImyiI+IbmzR3a
 AA7pzMadePHQxfNUtcZVvLt58JHOLbKHIhYsJokAEkT4hP/QtHWpacYAYcsRV5QP34
 ng1SywM5Se2gyM70pv65eaiEV9GWzRZs23/jIcqppTepsXQlTHiDbcrs/UeCnkgln9
 LPqEcr+i8hrXbnO+zxmssChBPWFJdZ0DmgX7R24bi/i27pGT5TTxc8ByCrLYnBndXu
 EOTcMRkHPpES4R+Bxv/SbYbyEO3gMNLorYZb9M90PB+Rq7mzSptjKxXOZIkssUgYZb
 iqweyyjiJwbrA==
Date: Tue, 12 May 2026 09:41:50 -0700
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260512164150.GD9555@frogsfrogsfrogs>
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512053625.2950900-4-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 12, 2026 at 07:35:19AM +0200, Christoph Hellwig
 wrote: > The swap operations have nothing to do with the address_space, which
 is > used for pagecache operations. Move them to struct file_o [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wMqBF-00074p-Bd
Subject: Re: [f2fs-dev] [PATCH 03/12] swap,
 fs: move swapfile operations to struct file_operations
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
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
 linux-mm@kvack.org, Naohiro Aota <naohiro.aota@wdc.com>,
 linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, Chris Li <chrisl@kernel.org>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Kairui Song <kasong@tencent.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-cifs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-btrfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: E5125524EE2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:chrisl@kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:linux-cifs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:linux-btrfs@vger.kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,tencent.com,mit.edu,lists.sourceforge.net,samba.org,linux-foundation.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 07:35:19AM +0200, Christoph Hellwig wrote:
> The swap operations have nothing to do with the address_space, which is
> used for pagecache operations.  Move them to struct file_operations
> instead.  This will allow moving the block device special cases into
> block/fops.c subsequently.
> 
> Pass struct file first to ->swap_activate as file operations typically
> get the file or iocb as first argument and use swap_activate instead of
> swapfile_activate in all names to be consistent.
> 
> Note that while the trivial iomap wrappers are moved to a new file when
> applicable to keep them local to the file operation instances, complex
> implementation are kept in their existing place.  It might be worth to
> move them in follow-on patches if the maintainers desire so.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This sounds like a good idea because the filesystem is effectively
giving the kernel a lease on a file's layout, which has little to do
with the pagecache.

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  .../filesystems/iomap/operations.rst          |  3 +-
>  Documentation/filesystems/locking.rst         | 35 +++++++-------
>  Documentation/filesystems/vfs.rst             | 40 ++++++++--------
>  fs/btrfs/btrfs_inode.h                        |  3 ++
>  fs/btrfs/file.c                               |  4 ++
>  fs/btrfs/inode.c                              | 15 +-----
>  fs/ext4/file.c                                |  6 +++
>  fs/ext4/inode.c                               | 10 ----
>  fs/f2fs/data.c                                | 15 +-----
>  fs/f2fs/f2fs.h                                |  2 +
>  fs/f2fs/file.c                                |  4 ++
>  fs/iomap/swapfile.c                           | 12 ++---
>  fs/nfs/direct.c                               |  1 +
>  fs/nfs/file.c                                 | 12 +++--
>  fs/nfs/nfs4file.c                             |  3 ++
>  fs/ntfs/aops.c                                |  7 ---
>  fs/ntfs/file.c                                |  6 +++
>  fs/smb/client/cifsfs.c                        | 18 ++++++++
>  fs/smb/client/cifsfs.h                        |  3 ++
>  fs/smb/client/file.c                          | 12 ++---
>  fs/xfs/xfs_aops.c                             | 46 -------------------
>  fs/xfs/xfs_file.c                             | 45 ++++++++++++++++++
>  fs/zonefs/file.c                              | 29 ++++++------
>  include/linux/fs.h                            | 10 ++--
>  include/linux/iomap.h                         |  6 +--
>  include/linux/nfs_fs.h                        |  3 ++
>  include/linux/swap.h                          |  2 +-
>  mm/page_io.c                                  |  9 ++--
>  mm/swapfile.c                                 | 12 ++---
>  29 files changed, 187 insertions(+), 186 deletions(-)
> 
> diff --git a/Documentation/filesystems/iomap/operations.rst b/Documentation/filesystems/iomap/operations.rst
> index da982ca7e413..2a78037665b7 100644
> --- a/Documentation/filesystems/iomap/operations.rst
> +++ b/Documentation/filesystems/iomap/operations.rst
> @@ -55,7 +55,6 @@ The following address space operations can be wrapped easily:
>   * ``readahead``
>   * ``writepages``
>   * ``bmap``
> - * ``swap_activate``
>  
>  ``struct iomap_write_ops``
>  --------------------------
> @@ -747,7 +746,7 @@ function.
>  Swap File Activation
>  ====================
>  
> -The ``iomap_swapfile_activate`` function finds all the base-page aligned
> +The ``iomap_swap_activate`` function finds all the base-page aligned
>  regions in a file and sets them up as swap space.
>  The file will be ``fsync()``'d before activation.
>  ``IOMAP_REPORT`` will be passed as the ``flags`` argument to
> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
> index f3658204d070..e79d72a12273 100644
> --- a/Documentation/filesystems/locking.rst
> +++ b/Documentation/filesystems/locking.rst
> @@ -264,9 +264,6 @@ prototypes::
>  	int (*launder_folio)(struct folio *);
>  	bool (*is_partially_uptodate)(struct folio *, size_t from, size_t count);
>  	int (*error_remove_folio)(struct address_space *, struct folio *);
> -	int (*swap_activate)(struct swap_info_struct *sis, struct file *f)
> -	int (*swap_deactivate)(struct file *);
> -	int (*swap_rw)(struct kiocb *iocb, struct iov_iter *iter);
>  
>  locking rules:
>  	All except dirty_folio and free_folio may block
> @@ -289,9 +286,6 @@ migrate_folio:		yes (both)
>  launder_folio:		yes
>  is_partially_uptodate:	yes
>  error_remove_folio:	yes
> -swap_activate:		no
> -swap_deactivate:	no
> -swap_rw:		yes, unlocks
>  ======================	======================== =========	===============
>  
>  ->write_begin(), ->write_end() and ->read_folio() may be called from
> @@ -350,19 +344,6 @@ cleaned, or an error value if not. Note that in order to prevent the folio
>  getting mapped back in and redirtied, it needs to be kept locked
>  across the entire operation.
>  
> -->swap_activate() will be called to prepare the given file for swap.  It
> -should perform any validation and preparation necessary to ensure that
> -writes can be performed with minimal memory allocation.  It should call
> -add_swap_extent(), or the helper iomap_swapfile_activate(), and return
> -the number of extents added.  If IO should be submitted through
> -->swap_rw(), it should set SWP_FS_OPS, otherwise IO will be submitted
> -directly to the block device ``sis->bdev``.
> -
> -->swap_deactivate() will be called in the sys_swapoff()
> -path after ->swap_activate() returned success.
> -
> -->swap_rw will be called for swap IO if SWP_FS_OPS was set by ->swap_activate().
> -
>  file_lock_operations
>  ====================
>  
> @@ -503,6 +484,9 @@ prototypes::
>  			struct file *file_out, loff_t pos_out,
>  			loff_t len, unsigned int remap_flags);
>  	int (*fadvise)(struct file *, loff_t, loff_t, int);
> +	int (*swap_activate)(struct file *file, struct swap_info_struct *sis);
> +	int (*swap_deactivate)(struct file *);
> +	int (*swap_rw)(struct kiocb *iocb, struct iov_iter *iter);
>  
>  locking rules:
>  	All may block.
> @@ -555,6 +539,19 @@ used. To block changes to file contents via a memory mapping during the
>  operation, the filesystem must take mapping->invalidate_lock to coordinate
>  with ->page_mkwrite.
>  
> +->swap_activate() is called to prepare the given file for swap.  It should
> +perform any validation and preparation necessary to ensure that writes can be
> +performed with minimal memory allocation.  It should call add_swap_extent(),
> +or the helper iomap_swap_activate(), and return the number of extents added.
> +If IO should be submitted through ->swap_rw(), the file system must set
> +SWP_FS_OPS from ->swap_activate(), otherwise IO will be submitted directly to
> +the block device ``sis->bdev``.
> +
> +->swap_deactivate() is called from the swapoff path to disable a swapfile
> +successfully activated using ->swap_activate().
> +
> +->swap_rw will be called for swap IO if SWP_FS_OPS was set by ->swap_activate().
> +
>  dquot_operations
>  ================
>  
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index 4092b2149a5d..1624c1ee82d6 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -774,9 +774,6 @@ cache in your filesystem.  The following members are defined:
>  					       size_t count);
>  		void (*is_dirty_writeback)(struct folio *, bool *, bool *);
>  		int (*error_remove_folio)(struct mapping *mapping, struct folio *);
> -		int (*swap_activate)(struct swap_info_struct *sis, struct file *f);
> -		int (*swap_deactivate)(struct file *);
> -		int (*swap_rw)(struct kiocb *iocb, struct iov_iter *iter);
>  	};
>  
>  ``read_folio``
> @@ -970,23 +967,6 @@ cache in your filesystem.  The following members are defined:
>  	Setting this implies you deal with pages going away under you,
>  	unless you have them locked or reference counts increased.
>  
> -``swap_activate``
> -
> -	Called to prepare the given file for swap.  It should perform
> -	any validation and preparation necessary to ensure that writes
> -	can be performed with minimal memory allocation.  It should call
> -	add_swap_extent(), or the helper iomap_swapfile_activate(), and
> -	return the number of extents added.  If IO should be submitted
> -	through ->swap_rw(), it should set SWP_FS_OPS, otherwise IO will
> -	be submitted directly to the block device ``sis->bdev``.
> -
> -``swap_deactivate``
> -	Called during swapoff on files where swap_activate was
> -	successful.
> -
> -``swap_rw``
> -	Called to read or write swap pages when SWP_FS_OPS is set.
> -
>  The File Object
>  ===============
>  
> @@ -1046,6 +1026,9 @@ This describes how the VFS can manipulate an open file.  As of kernel
>  		int (*uring_cmd_iopoll)(struct io_uring_cmd *, struct io_comp_batch *,
>  					unsigned int poll_flags);
>  		int (*mmap_prepare)(struct vm_area_desc *);
> +		int (*swap_activate)(struct file *file, struct swap_info_struct *sis);
> +		int (*swap_deactivate)(struct file *);
> +		int (*swap_rw)(struct kiocb *iocb, struct iov_iter *iter);
>  	};
>  
>  Again, all methods are called without any locks being held, unless
> @@ -1175,6 +1158,23 @@ otherwise noted.
>  	this can be specified by the vm_area_desc->action field and related
>  	parameters.
>  
> +``swap_activate``
> +
> +	Called to prepare the given file for swap.  It should perform
> +	any validation and preparation necessary to ensure that writes
> +	can be performed with minimal memory allocation.  It should call
> +	add_swap_extent(), or the helper iomap_swap_activate(), and
> +	return the number of extents added.  If IO should be submitted
> +	through ->swap_rw(), it should set SWP_FS_OPS, otherwise IO will
> +	be submitted directly to the block device ``sis->bdev``.
> +
> +``swap_deactivate``
> +	Called during swapoff on files where swap_activate was
> +	successful.
> +
> +``swap_rw``
> +	Called to read or write swap pages when SWP_FS_OPS is set.
> +
>  Note that the file operations are implemented by the specific
>  filesystem in which the inode resides.  When opening a device node
>  (character or block special) most filesystems will call special
> diff --git a/fs/btrfs/btrfs_inode.h b/fs/btrfs/btrfs_inode.h
> index 55c272fe5d92..f527126882d6 100644
> --- a/fs/btrfs/btrfs_inode.h
> +++ b/fs/btrfs/btrfs_inode.h
> @@ -670,4 +670,7 @@ struct extent_map *btrfs_create_io_em(struct btrfs_inode *inode, u64 start,
>  				      const struct btrfs_file_extent *file_extent,
>  				      int type);
>  
> +int btrfs_swap_activate(struct file *file, struct swap_info_struct *sis);
> +void btrfs_swap_deactivate(struct file *file);
> +
>  #endif
> diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
> index cf1cb5c4db75..165b8da1d7db 100644
> --- a/fs/btrfs/file.c
> +++ b/fs/btrfs/file.c
> @@ -3867,6 +3867,10 @@ const struct file_operations btrfs_file_operations = {
>  	.uring_cmd	= btrfs_uring_cmd,
>  	.fop_flags	= FOP_BUFFER_RASYNC | FOP_BUFFER_WASYNC,
>  	.setlease	= generic_setlease,
> +#ifdef CONFIG_SWAP
> +	.swap_activate	= btrfs_swap_activate,
> +	.swap_deactivate = btrfs_swap_deactivate,
> +#endif
>  };
>  
>  int btrfs_fdatawrite_range(struct btrfs_inode *inode, loff_t start, loff_t end)
> diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> index 198d87e6f19a..ee0a7947706a 100644
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@ -10217,7 +10217,7 @@ static int btrfs_add_swap_extent(struct swap_info_struct *sis,
>  	return add_swap_extent(sis, next_ppage - first_ppage, first_ppage);
>  }
>  
> -static void btrfs_swap_deactivate(struct file *file)
> +void btrfs_swap_deactivate(struct file *file)
>  {
>  	struct inode *inode = file_inode(file);
>  
> @@ -10225,7 +10225,7 @@ static void btrfs_swap_deactivate(struct file *file)
>  	atomic_dec(&BTRFS_I(inode)->root->nr_swapfiles);
>  }
>  
> -static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file)
> +int btrfs_swap_activate(struct file *file, struct swap_info_struct *sis)
>  {
>  	struct inode *inode = file_inode(file);
>  	struct btrfs_root *root = BTRFS_I(inode)->root;
> @@ -10537,15 +10537,6 @@ static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file)
>  		sis->bdev = device->bdev;
>  	return ret;
>  }
> -#else
> -static void btrfs_swap_deactivate(struct file *file)
> -{
> -}
> -
> -static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file)
> -{
> -	return -EOPNOTSUPP;
> -}
>  #endif
>  
>  /*
> @@ -10692,8 +10683,6 @@ static const struct address_space_operations btrfs_aops = {
>  	.migrate_folio	= btrfs_migrate_folio,
>  	.dirty_folio	= filemap_dirty_folio,
>  	.error_remove_folio = generic_error_remove_folio,
> -	.swap_activate	= btrfs_swap_activate,
> -	.swap_deactivate = btrfs_swap_deactivate,
>  };
>  
>  static const struct inode_operations btrfs_file_inode_operations = {
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index eb1a323962b1..fad3ed05c02a 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -971,6 +971,11 @@ loff_t ext4_llseek(struct file *file, loff_t offset, int whence)
>  	return vfs_setpos(file, offset, maxbytes);
>  }
>  
> +static int ext4_swap_activate(struct file *file, struct swap_info_struct *sis)
> +{
> +	return iomap_swap_activate(file, sis, &ext4_iomap_report_ops);
> +}
> +
>  const struct file_operations ext4_file_operations = {
>  	.llseek		= ext4_llseek,
>  	.read_iter	= ext4_file_read_iter,
> @@ -992,6 +997,7 @@ const struct file_operations ext4_file_operations = {
>  			  FOP_DIO_PARALLEL_WRITE |
>  			  FOP_DONTCACHE,
>  	.setlease	= generic_setlease,
> +	.swap_activate	= ext4_swap_activate,
>  };
>  
>  const struct inode_operations ext4_file_inode_operations = {
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index ca7bac4a8b4a..efbb2ddad363 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -3939,12 +3939,6 @@ static bool ext4_dirty_folio(struct address_space *mapping, struct folio *folio)
>  	return block_dirty_folio(mapping, folio);
>  }
>  
> -static int ext4_iomap_swap_activate(struct swap_info_struct *sis,
> -				    struct file *file)
> -{
> -	return iomap_swapfile_activate(sis, file, &ext4_iomap_report_ops);
> -}
> -
>  static const struct address_space_operations ext4_aops = {
>  	.read_folio		= ext4_read_folio,
>  	.readahead		= ext4_readahead,
> @@ -3958,7 +3952,6 @@ static const struct address_space_operations ext4_aops = {
>  	.migrate_folio		= buffer_migrate_folio,
>  	.is_partially_uptodate  = block_is_partially_uptodate,
>  	.error_remove_folio	= generic_error_remove_folio,
> -	.swap_activate		= ext4_iomap_swap_activate,
>  };
>  
>  static const struct address_space_operations ext4_journalled_aops = {
> @@ -3974,7 +3967,6 @@ static const struct address_space_operations ext4_journalled_aops = {
>  	.migrate_folio		= buffer_migrate_folio_norefs,
>  	.is_partially_uptodate  = block_is_partially_uptodate,
>  	.error_remove_folio	= generic_error_remove_folio,
> -	.swap_activate		= ext4_iomap_swap_activate,
>  };
>  
>  static const struct address_space_operations ext4_da_aops = {
> @@ -3990,14 +3982,12 @@ static const struct address_space_operations ext4_da_aops = {
>  	.migrate_folio		= buffer_migrate_folio,
>  	.is_partially_uptodate  = block_is_partially_uptodate,
>  	.error_remove_folio	= generic_error_remove_folio,
> -	.swap_activate		= ext4_iomap_swap_activate,
>  };
>  
>  static const struct address_space_operations ext4_dax_aops = {
>  	.writepages		= ext4_dax_writepages,
>  	.dirty_folio		= noop_dirty_folio,
>  	.bmap			= ext4_bmap,
> -	.swap_activate		= ext4_iomap_swap_activate,
>  };
>  
>  void ext4_set_aops(struct inode *inode)
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 86fabacc67e6..8bcf630df557 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4338,7 +4338,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
>  	return ret;
>  }
>  
> -static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file)
> +int f2fs_swap_activate(struct file *file, struct swap_info_struct *sis)
>  {
>  	struct inode *inode = file_inode(file);
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> @@ -4378,22 +4378,13 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file)
>  	return 0;
>  }
>  
> -static void f2fs_swap_deactivate(struct file *file)
> +void f2fs_swap_deactivate(struct file *file)
>  {
>  	struct inode *inode = file_inode(file);
>  
>  	stat_dec_swapfile_inode(inode);
>  	clear_inode_flag(inode, FI_PIN_FILE);
>  }
> -#else
> -static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file)
> -{
> -	return -EOPNOTSUPP;
> -}
> -
> -static void f2fs_swap_deactivate(struct file *file)
> -{
> -}
>  #endif
>  
>  const struct address_space_operations f2fs_dblock_aops = {
> @@ -4407,8 +4398,6 @@ const struct address_space_operations f2fs_dblock_aops = {
>  	.invalidate_folio = f2fs_invalidate_folio,
>  	.release_folio	= f2fs_release_folio,
>  	.bmap		= f2fs_bmap,
> -	.swap_activate  = f2fs_swap_activate,
> -	.swap_deactivate = f2fs_swap_deactivate,
>  };
>  
>  void f2fs_clear_page_cache_dirty_tag(struct folio *folio)
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 91f506e7c9cf..93e9709f26fa 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4195,6 +4195,8 @@ int f2fs_init_post_read_processing(void);
>  void f2fs_destroy_post_read_processing(void);
>  int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
>  void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
> +int f2fs_swap_activate(struct file *file, struct swap_info_struct *sis);
> +void f2fs_swap_deactivate(struct file *file);
>  extern const struct iomap_ops f2fs_iomap_ops;
>  
>  /*
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index fb12c5c9affd..aa91d5fff1cf 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -5488,4 +5488,8 @@ const struct file_operations f2fs_file_operations = {
>  	.fadvise	= f2fs_file_fadvise,
>  	.fop_flags	= FOP_BUFFER_RASYNC,
>  	.setlease	= generic_setlease,
> +#ifdef CONFIG_SWAP
> +	.swap_activate  = f2fs_swap_activate,
> +	.swap_deactivate = f2fs_swap_deactivate,
> +#endif
>  };
> diff --git a/fs/iomap/swapfile.c b/fs/iomap/swapfile.c
> index f778b2c6c922..cf354fdfb7c3 100644
> --- a/fs/iomap/swapfile.c
> +++ b/fs/iomap/swapfile.c
> @@ -100,10 +100,10 @@ static int iomap_swapfile_iter(struct iomap_iter *iter,
>   * Iterate a swap file's iomaps to construct physical extents that can be
>   * passed to the swapfile subsystem.
>   */
> -int iomap_swapfile_activate(struct swap_info_struct *sis,
> -		struct file *swap_file, const struct iomap_ops *ops)
> +int iomap_swap_activate(struct file *file, struct swap_info_struct *sis,
> +		const struct iomap_ops *ops)
>  {
> -	struct inode *inode = swap_file->f_mapping->host;
> +	struct inode *inode = file->f_mapping->host;
>  	struct iomap_iter iter = {
>  		.inode	= inode,
>  		.pos	= 0,
> @@ -112,7 +112,7 @@ int iomap_swapfile_activate(struct swap_info_struct *sis,
>  	};
>  	struct iomap_swapfile_info isi = {
>  		.sis = sis,
> -		.file = swap_file,
> +		.file = file,
>  	};
>  	int ret;
>  
> @@ -120,7 +120,7 @@ int iomap_swapfile_activate(struct swap_info_struct *sis,
>  	 * Persist all file mapping metadata so that we won't have any
>  	 * IOMAP_F_DIRTY iomaps.
>  	 */
> -	ret = vfs_fsync(swap_file, 1);
> +	ret = vfs_fsync(file, 1);
>  	if (ret)
>  		return ret;
>  
> @@ -137,4 +137,4 @@ int iomap_swapfile_activate(struct swap_info_struct *sis,
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(iomap_swapfile_activate);
> +EXPORT_SYMBOL_GPL(iomap_swap_activate);
> diff --git a/fs/nfs/direct.c b/fs/nfs/direct.c
> index 48d89716193a..e92a4c8f8f77 100644
> --- a/fs/nfs/direct.c
> +++ b/fs/nfs/direct.c
> @@ -164,6 +164,7 @@ int nfs_swap_rw(struct kiocb *iocb, struct iov_iter *iter)
>  		return ret;
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(nfs_swap_rw);
>  
>  static void nfs_direct_release_pages(struct page **pages, unsigned int npages)
>  {
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index 74b401aa2b3a..2bc55d9d71e1 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -567,7 +567,7 @@ static int nfs_launder_folio(struct folio *folio)
>  	return ret;
>  }
>  
> -static int nfs_swap_activate(struct swap_info_struct *sis, struct file *file)
> +int nfs_swap_activate(struct file *file, struct swap_info_struct *sis)
>  {
>  	unsigned long blocks;
>  	long long isize;
> @@ -600,8 +600,9 @@ static int nfs_swap_activate(struct swap_info_struct *sis, struct file *file)
>  	sis->flags |= SWP_FS_OPS;
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(nfs_swap_activate);
>  
> -static void nfs_swap_deactivate(struct file *file)
> +void nfs_swap_deactivate(struct file *file)
>  {
>  	struct inode *inode = file_inode(file);
>  	struct rpc_clnt *clnt = NFS_CLIENT(inode);
> @@ -611,6 +612,7 @@ static void nfs_swap_deactivate(struct file *file)
>  	if (cl->rpc_ops->disable_swap)
>  		cl->rpc_ops->disable_swap(file_inode(file));
>  }
> +EXPORT_SYMBOL_GPL(nfs_swap_deactivate);
>  
>  const struct address_space_operations nfs_file_aops = {
>  	.read_folio = nfs_read_folio,
> @@ -625,9 +627,6 @@ const struct address_space_operations nfs_file_aops = {
>  	.launder_folio = nfs_launder_folio,
>  	.is_dirty_writeback = nfs_check_dirty_writeback,
>  	.error_remove_folio = generic_error_remove_folio,
> -	.swap_activate = nfs_swap_activate,
> -	.swap_deactivate = nfs_swap_deactivate,
> -	.swap_rw = nfs_swap_rw,
>  };
>  
>  /*
> @@ -960,6 +959,9 @@ const struct file_operations nfs_file_operations = {
>  	.splice_read	= nfs_file_splice_read,
>  	.splice_write	= iter_file_splice_write,
>  	.check_flags	= nfs_check_flags,
> +	.swap_activate	= nfs_swap_activate,
> +	.swap_deactivate = nfs_swap_deactivate,
> +	.swap_rw	= nfs_swap_rw,
>  	.fop_flags	= FOP_DONTCACHE,
>  };
>  EXPORT_SYMBOL_GPL(nfs_file_operations);
> diff --git a/fs/nfs/nfs4file.c b/fs/nfs/nfs4file.c
> index be40e126c539..eb1a8dbab55a 100644
> --- a/fs/nfs/nfs4file.c
> +++ b/fs/nfs/nfs4file.c
> @@ -455,5 +455,8 @@ const struct file_operations nfs4_file_operations = {
>  #else
>  	.llseek		= nfs_file_llseek,
>  #endif
> +	.swap_activate	= nfs_swap_activate,
> +	.swap_deactivate = nfs_swap_deactivate,
> +	.swap_rw	= nfs_swap_rw,
>  	.fop_flags	= FOP_DONTCACHE,
>  };
> diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
> index 4b7d019bc6ed..a94f5f675790 100644
> --- a/fs/ntfs/aops.c
> +++ b/fs/ntfs/aops.c
> @@ -270,12 +270,6 @@ static int ntfs_writepages(struct address_space *mapping,
>  	return iomap_writepages(&wpc);
>  }
>  
> -static int ntfs_swap_activate(struct swap_info_struct *sis,
> -		struct file *swap_file)
> -{
> -	return iomap_swapfile_activate(sis, swap_file, &ntfs_read_iomap_ops);
> -}
> -
>  const struct address_space_operations ntfs_aops = {
>  	.read_folio		= ntfs_read_folio,
>  	.readahead		= ntfs_readahead,
> @@ -287,7 +281,6 @@ const struct address_space_operations ntfs_aops = {
>  	.error_remove_folio	= generic_error_remove_folio,
>  	.release_folio		= iomap_release_folio,
>  	.invalidate_folio	= iomap_invalidate_folio,
> -	.swap_activate          = ntfs_swap_activate,
>  };
>  
>  const struct address_space_operations ntfs_mft_aops = {
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index e8bea22b81a7..0dcf8479362a 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -1114,6 +1114,11 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
>  	return err;
>  }
>  
> +static int ntfs_swap_activate(struct file *file, struct swap_info_struct *sis)
> +{
> +	return iomap_swap_activate(file, sis, &ntfs_read_iomap_ops);
> +}
> +
>  const struct file_operations ntfs_file_ops = {
>  	.llseek		= ntfs_file_llseek,
>  	.read_iter	= ntfs_file_read_iter,
> @@ -1130,6 +1135,7 @@ const struct file_operations ntfs_file_ops = {
>  #endif
>  	.fallocate	= ntfs_fallocate,
>  	.setlease	= generic_setlease,
> +	.swap_activate	= ntfs_swap_activate,
>  };
>  
>  const struct inode_operations ntfs_file_inode_ops = {
> diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
> index 9f76b0347fa9..f0d8a3a46074 100644
> --- a/fs/smb/client/cifsfs.c
> +++ b/fs/smb/client/cifsfs.c
> @@ -1577,6 +1577,9 @@ const struct file_operations cifs_file_ops = {
>  	.remap_file_range = cifs_remap_file_range,
>  	.setlease = cifs_setlease,
>  	.fallocate = cifs_fallocate,
> +	.swap_activate	= cifs_swap_activate,
> +	.swap_deactivate = cifs_swap_deactivate,
> +	.swap_rw = cifs_swap_rw,
>  };
>  
>  const struct file_operations cifs_file_strict_ops = {
> @@ -1597,6 +1600,9 @@ const struct file_operations cifs_file_strict_ops = {
>  	.remap_file_range = cifs_remap_file_range,
>  	.setlease = cifs_setlease,
>  	.fallocate = cifs_fallocate,
> +	.swap_activate	= cifs_swap_activate,
> +	.swap_deactivate = cifs_swap_deactivate,
> +	.swap_rw = cifs_swap_rw,
>  };
>  
>  const struct file_operations cifs_file_direct_ops = {
> @@ -1617,6 +1623,9 @@ const struct file_operations cifs_file_direct_ops = {
>  	.llseek = cifs_llseek,
>  	.setlease = cifs_setlease,
>  	.fallocate = cifs_fallocate,
> +	.swap_activate	= cifs_swap_activate,
> +	.swap_deactivate = cifs_swap_deactivate,
> +	.swap_rw = cifs_swap_rw,
>  };
>  
>  const struct file_operations cifs_file_nobrl_ops = {
> @@ -1635,6 +1644,9 @@ const struct file_operations cifs_file_nobrl_ops = {
>  	.remap_file_range = cifs_remap_file_range,
>  	.setlease = cifs_setlease,
>  	.fallocate = cifs_fallocate,
> +	.swap_activate	= cifs_swap_activate,
> +	.swap_deactivate = cifs_swap_deactivate,
> +	.swap_rw = cifs_swap_rw,
>  };
>  
>  const struct file_operations cifs_file_strict_nobrl_ops = {
> @@ -1653,6 +1665,9 @@ const struct file_operations cifs_file_strict_nobrl_ops = {
>  	.remap_file_range = cifs_remap_file_range,
>  	.setlease = cifs_setlease,
>  	.fallocate = cifs_fallocate,
> +	.swap_activate	= cifs_swap_activate,
> +	.swap_deactivate = cifs_swap_deactivate,
> +	.swap_rw = cifs_swap_rw,
>  };
>  
>  const struct file_operations cifs_file_direct_nobrl_ops = {
> @@ -1671,6 +1686,9 @@ const struct file_operations cifs_file_direct_nobrl_ops = {
>  	.llseek = cifs_llseek,
>  	.setlease = cifs_setlease,
>  	.fallocate = cifs_fallocate,
> +	.swap_activate	= cifs_swap_activate,
> +	.swap_deactivate = cifs_swap_deactivate,
> +	.swap_rw = cifs_swap_rw,
>  };
>  
>  const struct file_operations cifs_dir_ops = {
> diff --git a/fs/smb/client/cifsfs.h b/fs/smb/client/cifsfs.h
> index c455b15f2778..1e5b9fce84f9 100644
> --- a/fs/smb/client/cifsfs.h
> +++ b/fs/smb/client/cifsfs.h
> @@ -115,6 +115,9 @@ int cifs_file_mmap_prepare(struct vm_area_desc *desc);
>  int cifs_file_strict_mmap_prepare(struct vm_area_desc *desc);
>  extern const struct file_operations cifs_dir_ops;
>  int cifs_readdir(struct file *file, struct dir_context *ctx);
> +int cifs_swap_activate(struct file *swap_file, struct swap_info_struct *sis);
> +void cifs_swap_deactivate(struct file *file);
> +int cifs_swap_rw(struct kiocb *iocb, struct iov_iter *iter);
>  
>  /* Functions related to dir entries */
>  extern const struct dentry_operations cifs_dentry_ops;
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index 11d4655ef490..84459f87907e 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -3286,8 +3286,7 @@ void cifs_oplock_break(struct work_struct *work)
>  	cifs_done_oplock_break(cinode);
>  }
>  
> -static int cifs_swap_activate(struct swap_info_struct *sis,
> -			      struct file *swap_file)
> +int cifs_swap_activate(struct file *swap_file, struct swap_info_struct *sis)
>  {
>  	struct cifsFileInfo *cfile = swap_file->private_data;
>  	struct inode *inode = swap_file->f_mapping->host;
> @@ -3296,7 +3295,7 @@ static int cifs_swap_activate(struct swap_info_struct *sis,
>  
>  	cifs_dbg(FYI, "swap activate\n");
>  
> -	if (!swap_file->f_mapping->a_ops->swap_rw)
> +	if (!swap_file->f_op->swap_rw)
>  		/* Cannot support swap */
>  		return -EINVAL;
>  
> @@ -3331,7 +3330,7 @@ static int cifs_swap_activate(struct swap_info_struct *sis,
>  	return add_swap_extent(sis, sis->max, 0);
>  }
>  
> -static void cifs_swap_deactivate(struct file *file)
> +void cifs_swap_deactivate(struct file *file)
>  {
>  	struct cifsFileInfo *cfile = file->private_data;
>  
> @@ -3352,7 +3351,7 @@ static void cifs_swap_deactivate(struct file *file)
>   *
>   * Perform IO to the swap-file.  This is much like direct IO.
>   */
> -static int cifs_swap_rw(struct kiocb *iocb, struct iov_iter *iter)
> +int cifs_swap_rw(struct kiocb *iocb, struct iov_iter *iter)
>  {
>  	ssize_t ret;
>  
> @@ -3378,9 +3377,6 @@ const struct address_space_operations cifs_addr_ops = {
>  	 * TODO: investigate and if useful we could add an is_dirty_writeback
>  	 * helper if needed
>  	 */
> -	.swap_activate	= cifs_swap_activate,
> -	.swap_deactivate = cifs_swap_deactivate,
> -	.swap_rw = cifs_swap_rw,
>  };
>  
>  /*
> diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> index 1e8662e0e7cd..7488fc6a7b78 100644
> --- a/fs/xfs/xfs_aops.c
> +++ b/fs/xfs/xfs_aops.c
> @@ -796,50 +796,6 @@ xfs_vm_readahead(
>  	iomap_readahead(&xfs_read_iomap_ops, &ctx, NULL);
>  }
>  
> -static int
> -xfs_vm_swap_activate(
> -	struct swap_info_struct		*sis,
> -	struct file			*swap_file)
> -{
> -	struct xfs_inode		*ip = XFS_I(file_inode(swap_file));
> -
> -	if (xfs_is_zoned_inode(ip))
> -		return -EINVAL;
> -
> -	/*
> -	 * Swap file activation can race against concurrent shared extent
> -	 * removal in files that have been cloned.  If this happens,
> -	 * iomap_swapfile_iter() can fail because it encountered a shared
> -	 * extent even though an operation is in progress to remove those
> -	 * shared extents.
> -	 *
> -	 * This race becomes problematic when we defer extent removal
> -	 * operations beyond the end of a syscall (i.e. use async background
> -	 * processing algorithms).  Users think the extents are no longer
> -	 * shared, but iomap_swapfile_iter() still sees them as shared
> -	 * because the refcountbt entries for the extents being removed have
> -	 * not yet been updated.  Hence the swapon call fails unexpectedly.
> -	 *
> -	 * The race condition is currently most obvious from the unlink()
> -	 * operation as extent removal is deferred until after the last
> -	 * reference to the inode goes away.  We then process the extent
> -	 * removal asynchronously, hence triggers the "syscall completed but
> -	 * work not done" condition mentioned above.  To close this race
> -	 * window, we need to flush any pending inodegc operations to ensure
> -	 * they have updated the refcountbt records before we try to map the
> -	 * swapfile.
> -	 */
> -	xfs_inodegc_flush(ip->i_mount);
> -
> -	/*
> -	 * Direct the swap code to the correct block device when this file
> -	 * sits on the RT device.
> -	 */
> -	sis->bdev = xfs_inode_buftarg(ip)->bt_bdev;
> -
> -	return iomap_swapfile_activate(sis, swap_file, &xfs_read_iomap_ops);
> -}
> -
>  const struct address_space_operations xfs_address_space_operations = {
>  	.read_folio		= xfs_vm_read_folio,
>  	.readahead		= xfs_vm_readahead,
> @@ -851,11 +807,9 @@ const struct address_space_operations xfs_address_space_operations = {
>  	.migrate_folio		= filemap_migrate_folio,
>  	.is_partially_uptodate  = iomap_is_partially_uptodate,
>  	.error_remove_folio	= generic_error_remove_folio,
> -	.swap_activate		= xfs_vm_swap_activate,
>  };
>  
>  const struct address_space_operations xfs_dax_aops = {
>  	.writepages		= xfs_dax_writepages,
>  	.dirty_folio		= noop_dirty_folio,
> -	.swap_activate		= xfs_vm_swap_activate,
>  };
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index 845a97c9b063..41f7e19bd31f 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -2081,6 +2081,50 @@ xfs_file_mmap_prepare(
>  	return 0;
>  }
>  
> +static int
> +xfs_file_swap_activate(
> +	struct file			*file,
> +	struct swap_info_struct		*sis)
> +{
> +	struct xfs_inode		*ip = XFS_I(file_inode(file));
> +
> +	if (xfs_is_zoned_inode(ip))
> +		return -EINVAL;
> +
> +	/*
> +	 * Swap file activation can race against concurrent shared extent
> +	 * removal in files that have been cloned.  If this happens,
> +	 * iomap_swapfile_iter() can fail because it encountered a shared
> +	 * extent even though an operation is in progress to remove those
> +	 * shared extents.
> +	 *
> +	 * This race becomes problematic when we defer extent removal
> +	 * operations beyond the end of a syscall (i.e. use async background
> +	 * processing algorithms).  Users think the extents are no longer
> +	 * shared, but iomap_swapfile_iter() still sees them as shared
> +	 * because the refcountbt entries for the extents being removed have
> +	 * not yet been updated.  Hence the swapon call fails unexpectedly.
> +	 *
> +	 * The race condition is currently most obvious from the unlink()
> +	 * operation as extent removal is deferred until after the last
> +	 * reference to the inode goes away.  We then process the extent
> +	 * removal asynchronously, hence triggers the "syscall completed but
> +	 * work not done" condition mentioned above.  To close this race
> +	 * window, we need to flush any pending inodegc operations to ensure
> +	 * they have updated the refcountbt records before we try to map the
> +	 * swapfile.
> +	 */
> +	xfs_inodegc_flush(ip->i_mount);
> +
> +	/*
> +	 * Direct the swap code to the correct block device when this file
> +	 * sits on the RT device.
> +	 */
> +	sis->bdev = xfs_inode_buftarg(ip)->bt_bdev;
> +
> +	return iomap_swap_activate(file, sis, &xfs_read_iomap_ops);
> +}
> +
>  const struct file_operations xfs_file_operations = {
>  	.llseek		= xfs_file_llseek,
>  	.read_iter	= xfs_file_read_iter,
> @@ -2104,6 +2148,7 @@ const struct file_operations xfs_file_operations = {
>  			  FOP_BUFFER_WASYNC | FOP_DIO_PARALLEL_WRITE |
>  			  FOP_DONTCACHE,
>  	.setlease	= generic_setlease,
> +	.swap_activate	= xfs_file_swap_activate,
>  };
>  
>  const struct file_operations xfs_dir_file_operations = {
> diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
> index 214e4bf8e30a..2c817917a13d 100644
> --- a/fs/zonefs/file.c
> +++ b/fs/zonefs/file.c
> @@ -167,20 +167,6 @@ static int zonefs_writepages(struct address_space *mapping,
>  	return iomap_writepages(&wpc);
>  }
>  
> -static int zonefs_swap_activate(struct swap_info_struct *sis,
> -				struct file *swap_file)
> -{
> -	struct inode *inode = file_inode(swap_file);
> -
> -	if (zonefs_inode_is_seq(inode)) {
> -		zonefs_err(inode->i_sb,
> -			   "swap file: not a conventional zone file\n");
> -		return -EINVAL;
> -	}
> -
> -	return iomap_swapfile_activate(sis, swap_file, &zonefs_read_iomap_ops);
> -}
> -
>  const struct address_space_operations zonefs_file_aops = {
>  	.read_folio		= zonefs_read_folio,
>  	.readahead		= zonefs_readahead,
> @@ -191,7 +177,6 @@ const struct address_space_operations zonefs_file_aops = {
>  	.migrate_folio		= filemap_migrate_folio,
>  	.is_partially_uptodate	= iomap_is_partially_uptodate,
>  	.error_remove_folio	= generic_error_remove_folio,
> -	.swap_activate		= zonefs_swap_activate,
>  };
>  
>  int zonefs_file_truncate(struct inode *inode, loff_t isize)
> @@ -858,6 +843,19 @@ static int zonefs_file_release(struct inode *inode, struct file *file)
>  	return 0;
>  }
>  
> +static int zonefs_swap_activate(struct file *file, struct swap_info_struct *sis)
> +{
> +	struct inode *inode = file_inode(file);
> +
> +	if (zonefs_inode_is_seq(inode)) {
> +		zonefs_err(inode->i_sb,
> +			   "swap file: not a conventional zone file\n");
> +		return -EINVAL;
> +	}
> +
> +	return iomap_swap_activate(file, sis, &zonefs_read_iomap_ops);
> +}
> +
>  const struct file_operations zonefs_file_operations = {
>  	.open		= zonefs_file_open,
>  	.release	= zonefs_file_release,
> @@ -869,4 +867,5 @@ const struct file_operations zonefs_file_operations = {
>  	.splice_read	= zonefs_file_splice_read,
>  	.splice_write	= iter_file_splice_write,
>  	.iopoll		= iocb_bio_iopoll,
> +	.swap_activate	= zonefs_swap_activate,
>  };
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index b8b6f7a38f4d..7564cef5405d 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -433,11 +433,6 @@ struct address_space_operations {
>  			size_t count);
>  	void (*is_dirty_writeback) (struct folio *, bool *dirty, bool *wb);
>  	int (*error_remove_folio)(struct address_space *, struct folio *);
> -
> -	/* swapfile support */
> -	int (*swap_activate)(struct swap_info_struct *sis, struct file *file);
> -	void (*swap_deactivate)(struct file *file);
> -	int (*swap_rw)(struct kiocb *iocb, struct iov_iter *iter);
>  };
>  
>  extern const struct address_space_operations empty_aops;
> @@ -1966,6 +1961,11 @@ struct file_operations {
>  	int (*uring_cmd_iopoll)(struct io_uring_cmd *, struct io_comp_batch *,
>  				unsigned int poll_flags);
>  	int (*mmap_prepare)(struct vm_area_desc *);
> +
> +	/* swapfile support */
> +	int (*swap_activate)(struct file *file, struct swap_info_struct *sis);
> +	void (*swap_deactivate)(struct file *file);
> +	int (*swap_rw)(struct kiocb *iocb, struct iov_iter *iter);
>  } __randomize_layout;
>  
>  /* Supports async buffered reads */
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index d82126e3d086..3fd582d375b6 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -603,10 +603,10 @@ void iomap_dio_bio_end_io(struct bio *bio);
>  struct file;
>  struct swap_info_struct;
>  
> -int iomap_swapfile_activate(struct swap_info_struct *sis,
> -		struct file *swap_file, const struct iomap_ops *ops);
> +int iomap_swap_activate(struct file *file, struct swap_info_struct *sis,
> +		const struct iomap_ops *ops);
>  #else
> -# define iomap_swapfile_activate(sis, swapfile, ops)	(-EIO)
> +# define iomap_swap_activate(file, sis, ops)	(-EIO)
>  #endif /* CONFIG_SWAP */
>  
>  extern struct bio_set iomap_ioend_bioset;
> diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
> index 4623262da3c0..9746212a085e 100644
> --- a/include/linux/nfs_fs.h
> +++ b/include/linux/nfs_fs.h
> @@ -538,6 +538,9 @@ extern __be32 root_nfs_parse_addr(char *name); /*__init*/
>  /*
>   * linux/fs/nfs/file.c
>   */
> +int nfs_swap_activate(struct file *file, struct swap_info_struct *sis);
> +void nfs_swap_deactivate(struct file *file);
> +
>  extern const struct file_operations nfs_file_operations;
>  #if IS_ENABLED(CONFIG_NFS_V4)
>  extern const struct file_operations nfs4_file_operations;
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index b8dfe2c6bc98..657779485ae4 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -405,7 +405,7 @@ extern void __meminit kswapd_stop(int nid);
>  
>  int add_swap_extent(struct swap_info_struct *sis, unsigned long nr_pages,
>  		sector_t start_block);
> -int generic_swapfile_activate(struct swap_info_struct *, struct file *);
> +int generic_swap_activate(struct file *swap_file, struct swap_info_struct *sis);
>  
>  static inline unsigned long total_swapcache_pages(void)
>  {
> diff --git a/mm/page_io.c b/mm/page_io.c
> index f30f36ec1ed0..3e1c12649448 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -75,8 +75,7 @@ static void end_swap_bio_read(struct bio *bio)
>  	bio_put(bio);
>  }
>  
> -int generic_swapfile_activate(struct swap_info_struct *sis,
> -				struct file *swap_file)
> +int generic_swap_activate(struct file *swap_file, struct swap_info_struct *sis)
>  {
>  	struct address_space *mapping = swap_file->f_mapping;
>  	struct inode *inode = mapping->host;
> @@ -451,11 +450,10 @@ void __swap_writepage(struct folio *folio, struct swap_iocb **swap_plug)
>  void swap_write_unplug(struct swap_iocb *sio)
>  {
>  	struct iov_iter from;
> -	struct address_space *mapping = sio->iocb.ki_filp->f_mapping;
>  	int ret;
>  
>  	iov_iter_bvec(&from, ITER_SOURCE, sio->bvec, sio->pages, sio->len);
> -	ret = mapping->a_ops->swap_rw(&sio->iocb, &from);
> +	ret = sio->iocb.ki_filp->f_op->swap_rw(&sio->iocb, &from);
>  	if (ret != -EIOCBQUEUED)
>  		sio_write_complete(&sio->iocb, ret);
>  }
> @@ -640,11 +638,10 @@ void swap_read_folio(struct folio *folio, struct swap_iocb **plug)
>  void __swap_read_unplug(struct swap_iocb *sio)
>  {
>  	struct iov_iter from;
> -	struct address_space *mapping = sio->iocb.ki_filp->f_mapping;
>  	int ret;
>  
>  	iov_iter_bvec(&from, ITER_DEST, sio->bvec, sio->pages, sio->len);
> -	ret = mapping->a_ops->swap_rw(&sio->iocb, &from);
> +	ret = sio->iocb.ki_filp->f_op->swap_rw(&sio->iocb, &from);
>  	if (ret != -EIOCBQUEUED)
>  		sio_read_complete(&sio->iocb, ret);
>  }
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 158620fd2978..a183c9c95695 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -2692,11 +2692,9 @@ static void destroy_swap_extents(struct swap_info_struct *sis,
>  	}
>  
>  	if (sis->flags & SWP_ACTIVATED) {
> -		struct address_space *mapping = swap_file->f_mapping;
> -
>  		sis->flags &= ~SWP_ACTIVATED;
> -		if (mapping->a_ops->swap_deactivate)
> -			mapping->a_ops->swap_deactivate(swap_file);
> +		if (swap_file->f_op->swap_deactivate)
> +			swap_file->f_op->swap_deactivate(swap_file);
>  	}
>  }
>  
> @@ -2790,8 +2788,8 @@ static int setup_swap_extents(struct swap_info_struct *sis,
>  	if (S_ISBLK(inode->i_mode))
>  		return add_swap_extent(sis, sis->max, 0);
>  
> -	if (mapping->a_ops->swap_activate) {
> -		ret = mapping->a_ops->swap_activate(sis, swap_file);
> +	if (swap_file->f_op->swap_activate) {
> +		ret = swap_file->f_op->swap_activate(swap_file, sis);
>  		if (ret < 0)
>  			return ret;
>  		sis->flags |= SWP_ACTIVATED;
> @@ -2803,7 +2801,7 @@ static int setup_swap_extents(struct swap_info_struct *sis,
>  		return ret;
>  	}
>  
> -	return generic_swapfile_activate(sis, swap_file);
> +	return generic_swap_activate(swap_file, sis);
>  }
>  
>  static void _enable_swap_info(struct swap_info_struct *si)
> -- 
> 2.53.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
