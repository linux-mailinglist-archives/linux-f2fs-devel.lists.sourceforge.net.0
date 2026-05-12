Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GAlIoxWA2qQ4wEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 18:34:20 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F14524C7E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 18:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//6XNXiIUtaq+Z09Njqg1gNncpYOb+Q2CRZQ4CIN0yQ=; b=ToPGvF6Sv8LJCORTzjzhpAbyLu
	gYVQtqIFzUsLG9nX6I9Ch87BzTc3Ym7uJjOyLVtoj8knQZQ5UED5tYeSHYEWsFyDyWe/BQcqDjc3L
	KD/FBDlf9Oc/poWcMLnOaQRjAQ05uLdWTc1ba3ulnNlB63yDw01Lfq+xB1uFNKMs6QQo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMq3d-00064M-I4;
	Tue, 12 May 2026 16:34:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1wMq3b-00064G-R1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 16:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ItVhGWNPqMkZojNFesMD949IRXLri8lrBcqipOYCRsU=; b=mNFrSTLUd0D8gjNA9sDH/ymT4X
 EWu/Ul3QJ3dNPUfjYL09hMvLKFqeFJb6MA7LihQqP7iyBN68ZkRyYM/V1b/4zPqqU+v5PIrLvMsqp
 wkNjPmLzMkkCFWxkSll7dTFv3edLU2EkU5rxbp7GPzCH+teVB0iZqi2Wq+uK7/G7XGJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ItVhGWNPqMkZojNFesMD949IRXLri8lrBcqipOYCRsU=; b=IFoaqyqORT709B81nls4+zcx4U
 t7m4kH4+fEO01xvjcg9dKoMoJTVK9a2Wk52W3XdwN2dBqXPvZRsWQTYvFsrEYDo/l7s9VARTa1lTt
 PaVsjFLSOhxRJ5L2wX42gYDotbwb/Cbt6RMIVGOoeRDakmnW7gvBvhEJ63KuOrdK/0p8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMq3Z-0006O8-0K for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 16:34:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2F0BD401AD;
 Tue, 12 May 2026 16:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF001C2BCB0;
 Tue, 12 May 2026 16:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778603635;
 bh=D41Lo/BqzcWVWGtqJvjaEVWhjm7PNTQ6Z6grjOeFEX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T4J/TLuxP+2dHmMAyJzOlsaeFqGqoQwPq0lje+OxyxJf17f61kaX1CEBE5e+bw+f/
 SfYlPzWX47nIQ9NTF/5tT1CYwO8EDzndaIkwHvtvw2Hd9Kxndoh1MgzTefgSy90mhP
 RkbQxI+spk1V5WFqJayZz+8rzEHMox9FaL1rLVyOQZVTI6lVzLcPc5IX8W2KhdV4z0
 r+W/CvxyiZxHoOUFzWEWuR0ciQfmUMqmC/JCKVL+/vYv2zy+0bf+qaZQUqhFVMTGCX
 YKgwIhbhcZaBLTFRua6tjc3yYJHRYapBDUutfEkNZ1UQJBSrv1w6wt2ug9HROCUFW3
 A0HR8AFCbsnkQ==
Date: Tue, 12 May 2026 09:33:54 -0700
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260512163354.GC9555@frogsfrogsfrogs>
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512053625.2950900-3-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 12, 2026 at 07:35:18AM +0200, Christoph Hellwig
 wrote: > Make the core swap code calculate sis->pages, nr_extents and the
 span, > re-set sis->max based on it and don't require passing the [...] 
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
X-Headers-End: 1wMq3Z-0006O8-0K
Subject: Re: [f2fs-dev] [PATCH 02/12] swap: move boilerplate code into the
 core swap code
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
X-Rspamd-Queue-Id: A6F14524C7E
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
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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

On Tue, May 12, 2026 at 07:35:18AM +0200, Christoph Hellwig wrote:
> Make the core swap code calculate sis->pages, nr_extents and the span,
> re-set sis->max based on it and don't require passing the current offset
> into the swap file to swap_add_extent as all that can trivially be
> calculated internally.  Also truncate the spans based on the available
> information.
> 
> All this removes a lot of boilerplate code in the callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks great to me.  I'm glad the weird @span parameter goes away with
this.

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  Documentation/filesystems/locking.rst |   2 +-
>  Documentation/filesystems/vfs.rst     |   2 +-
>  fs/btrfs/inode.c                      |  58 ++-----------
>  fs/ext4/inode.c                       |   5 +-
>  fs/f2fs/data.c                        |  38 ++-------
>  fs/iomap/swapfile.c                   |  58 +------------
>  fs/nfs/file.c                         |   9 +-
>  fs/ntfs/aops.c                        |   5 +-
>  fs/smb/client/file.c                  |   5 +-
>  fs/xfs/xfs_aops.c                     |   6 +-
>  fs/zonefs/file.c                      |   5 +-
>  include/linux/fs.h                    |   3 +-
>  include/linux/iomap.h                 |   5 +-
>  include/linux/swap.h                  |  11 ++-
>  mm/page_io.c                          |  39 ++-------
>  mm/swapfile.c                         | 116 ++++++++++++++++----------
>  16 files changed, 121 insertions(+), 246 deletions(-)
> 
> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
> index 8421ea21bd35..f3658204d070 100644
> --- a/Documentation/filesystems/locking.rst
> +++ b/Documentation/filesystems/locking.rst
> @@ -264,7 +264,7 @@ prototypes::
>  	int (*launder_folio)(struct folio *);
>  	bool (*is_partially_uptodate)(struct folio *, size_t from, size_t count);
>  	int (*error_remove_folio)(struct address_space *, struct folio *);
> -	int (*swap_activate)(struct swap_info_struct *sis, struct file *f, sector_t *span)
> +	int (*swap_activate)(struct swap_info_struct *sis, struct file *f)
>  	int (*swap_deactivate)(struct file *);
>  	int (*swap_rw)(struct kiocb *iocb, struct iov_iter *iter);
>  
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index 7c753148af88..4092b2149a5d 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -774,7 +774,7 @@ cache in your filesystem.  The following members are defined:
>  					       size_t count);
>  		void (*is_dirty_writeback)(struct folio *, bool *, bool *);
>  		int (*error_remove_folio)(struct mapping *mapping, struct folio *);
> -		int (*swap_activate)(struct swap_info_struct *sis, struct file *f, sector_t *span)
> +		int (*swap_activate)(struct swap_info_struct *sis, struct file *f);
>  		int (*swap_deactivate)(struct file *);
>  		int (*swap_rw)(struct kiocb *iocb, struct iov_iter *iter);
>  	};
> diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> index 906d5c21ebc4..198d87e6f19a 100644
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@ -10204,51 +10204,17 @@ struct btrfs_swap_info {
>  	u64 start;
>  	u64 block_start;
>  	u64 block_len;
> -	u64 lowest_ppage;
> -	u64 highest_ppage;
> -	unsigned long nr_pages;
> -	int nr_extents;
>  };
>  
>  static int btrfs_add_swap_extent(struct swap_info_struct *sis,
>  				 struct btrfs_swap_info *bsi)
>  {
> -	unsigned long nr_pages;
> -	unsigned long max_pages;
> -	u64 first_ppage, first_ppage_reported, next_ppage;
> -	int ret;
> -
> -	/*
> -	 * Our swapfile may have had its size extended after the swap header was
> -	 * written. In that case activating the swapfile should not go beyond
> -	 * the max size set in the swap header.
> -	 */
> -	if (bsi->nr_pages >= sis->max)
> -		return 0;
> +	u64 first_ppage, next_ppage;
>  
> -	max_pages = sis->max - bsi->nr_pages;
>  	first_ppage = PAGE_ALIGN(bsi->block_start) >> PAGE_SHIFT;
>  	next_ppage = PAGE_ALIGN_DOWN(bsi->block_start + bsi->block_len) >> PAGE_SHIFT;
>  
> -	if (first_ppage >= next_ppage)
> -		return 0;
> -	nr_pages = next_ppage - first_ppage;
> -	nr_pages = min(nr_pages, max_pages);
> -
> -	first_ppage_reported = first_ppage;
> -	if (bsi->start == 0)
> -		first_ppage_reported++;
> -	if (bsi->lowest_ppage > first_ppage_reported)
> -		bsi->lowest_ppage = first_ppage_reported;
> -	if (bsi->highest_ppage < (next_ppage - 1))
> -		bsi->highest_ppage = next_ppage - 1;
> -
> -	ret = add_swap_extent(sis, bsi->nr_pages, nr_pages, first_ppage);
> -	if (ret < 0)
> -		return ret;
> -	bsi->nr_extents += ret;
> -	bsi->nr_pages += nr_pages;
> -	return 0;
> +	return add_swap_extent(sis, next_ppage - first_ppage, first_ppage);
>  }
>  
>  static void btrfs_swap_deactivate(struct file *file)
> @@ -10259,8 +10225,7 @@ static void btrfs_swap_deactivate(struct file *file)
>  	atomic_dec(&BTRFS_I(inode)->root->nr_swapfiles);
>  }
>  
> -static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file,
> -			       sector_t *span)
> +static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file)
>  {
>  	struct inode *inode = file_inode(file);
>  	struct btrfs_root *root = BTRFS_I(inode)->root;
> @@ -10269,9 +10234,7 @@ static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file,
>  	struct extent_state *cached_state = NULL;
>  	struct btrfs_chunk_map *map = NULL;
>  	struct btrfs_device *device = NULL;
> -	struct btrfs_swap_info bsi = {
> -		.lowest_ppage = (sector_t)-1ULL,
> -	};
> +	struct btrfs_swap_info bsi = {};
>  	struct btrfs_backref_share_check_ctx *backref_ctx = NULL;
>  	struct btrfs_path *path = NULL;
>  	int ret = 0;
> @@ -10570,23 +10533,16 @@ static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file,
>  	up_write(&BTRFS_I(inode)->i_mmap_lock);
>  	btrfs_free_backref_share_ctx(backref_ctx);
>  	btrfs_free_path(path);
> -	if (ret)
> -		return ret;
> -
> -	if (device)
> +	if (!ret && device)
>  		sis->bdev = device->bdev;
> -	*span = bsi.highest_ppage - bsi.lowest_ppage + 1;
> -	sis->max = bsi.nr_pages;
> -	sis->pages = bsi.nr_pages - 1;
> -	return bsi.nr_extents;
> +	return ret;
>  }
>  #else
>  static void btrfs_swap_deactivate(struct file *file)
>  {
>  }
>  
> -static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file,
> -			       sector_t *span)
> +static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index c2c2d6ac7f3d..ca7bac4a8b4a 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -3940,10 +3940,9 @@ static bool ext4_dirty_folio(struct address_space *mapping, struct folio *folio)
>  }
>  
>  static int ext4_iomap_swap_activate(struct swap_info_struct *sis,
> -				    struct file *file, sector_t *span)
> +				    struct file *file)
>  {
> -	return iomap_swapfile_activate(sis, file, span,
> -				       &ext4_iomap_report_ops);
> +	return iomap_swapfile_activate(sis, file, &ext4_iomap_report_ops);
>  }
>  
>  static const struct address_space_operations ext4_aops = {
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 8d4f1e75dee3..86fabacc67e6 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4249,7 +4249,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
>  }
>  
>  static int check_swap_activate(struct swap_info_struct *sis,
> -				struct file *swap_file, sector_t *span)
> +				struct file *swap_file)
>  {
>  	struct address_space *mapping = swap_file->f_mapping;
>  	struct inode *inode = mapping->host;
> @@ -4257,9 +4257,6 @@ static int check_swap_activate(struct swap_info_struct *sis,
>  	block_t cur_lblock;
>  	block_t last_lblock;
>  	block_t pblock;
> -	block_t lowest_pblock = -1;
> -	block_t highest_pblock = 0;
> -	int nr_extents = 0;
>  	unsigned int nr_pblocks;
>  	unsigned int blks_per_sec = BLKS_PER_SEC(sbi);
>  	unsigned int not_aligned = 0;
> @@ -4272,7 +4269,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
>  	cur_lblock = 0;
>  	last_lblock = F2FS_BYTES_TO_BLK(i_size_read(inode));
>  
> -	while (cur_lblock < last_lblock && cur_lblock < sis->max) {
> +	while (cur_lblock < last_lblock) {
>  		struct f2fs_map_blocks map;
>  		bool last_extent = false;
>  retry:
> @@ -4307,8 +4304,6 @@ static int check_swap_activate(struct swap_info_struct *sis,
>  			not_aligned++;
>  
>  			nr_pblocks = roundup(nr_pblocks, blks_per_sec);
> -			if (cur_lblock + nr_pblocks > sis->max)
> -				nr_pblocks -= blks_per_sec;
>  
>  			/* this extent is last one */
>  			if (!nr_pblocks) {
> @@ -4328,31 +4323,14 @@ static int check_swap_activate(struct swap_info_struct *sis,
>  			goto retry;
>  		}
>  
> -		if (cur_lblock + nr_pblocks >= sis->max)
> -			nr_pblocks = sis->max - cur_lblock;
> -
> -		if (cur_lblock) {	/* exclude the header page */
> -			if (pblock < lowest_pblock)
> -				lowest_pblock = pblock;
> -			if (pblock + nr_pblocks - 1 > highest_pblock)
> -				highest_pblock = pblock + nr_pblocks - 1;
> -		}
> -
>  		/*
>  		 * We found a PAGE_SIZE-length, PAGE_SIZE-aligned run of blocks
>  		 */
> -		ret = add_swap_extent(sis, cur_lblock, nr_pblocks, pblock);
> +		ret = add_swap_extent(sis, nr_pblocks, pblock);
>  		if (ret < 0)
>  			goto out;
> -		nr_extents += ret;
>  		cur_lblock += nr_pblocks;
>  	}
> -	ret = nr_extents;
> -	*span = 1 + highest_pblock - lowest_pblock;
> -	if (cur_lblock == 0)
> -		cur_lblock = 1;	/* force Empty message */
> -	sis->max = cur_lblock;
> -	sis->pages = cur_lblock - 1;
>  out:
>  	if (not_aligned)
>  		f2fs_warn(sbi, "Swapfile (%u) is not align to section: 1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate(%lu * N)",
> @@ -4360,8 +4338,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
>  	return ret;
>  }
>  
> -static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
> -				sector_t *span)
> +static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file)
>  {
>  	struct inode *inode = file_inode(file);
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> @@ -4391,14 +4368,14 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
>  
>  	f2fs_precache_extents(inode);
>  
> -	ret = check_swap_activate(sis, file, span);
> +	ret = check_swap_activate(sis, file);
>  	if (ret < 0)
>  		return ret;
>  
>  	stat_inc_swapfile_inode(inode);
>  	set_inode_flag(inode, FI_PIN_FILE);
>  	f2fs_update_time(sbi, REQ_TIME);
> -	return ret;
> +	return 0;
>  }
>  
>  static void f2fs_swap_deactivate(struct file *file)
> @@ -4409,8 +4386,7 @@ static void f2fs_swap_deactivate(struct file *file)
>  	clear_inode_flag(inode, FI_PIN_FILE);
>  }
>  #else
> -static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
> -				sector_t *span)
> +static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/fs/iomap/swapfile.c b/fs/iomap/swapfile.c
> index 0db77c449467..f778b2c6c922 100644
> --- a/fs/iomap/swapfile.c
> +++ b/fs/iomap/swapfile.c
> @@ -11,10 +11,7 @@
>  struct iomap_swapfile_info {
>  	struct iomap iomap;		/* accumulated iomap */
>  	struct swap_info_struct *sis;
> -	uint64_t lowest_ppage;		/* lowest physical addr seen (pages) */
> -	uint64_t highest_ppage;		/* highest physical addr seen (pages) */
>  	unsigned long nr_pages;		/* number of pages collected */
> -	int nr_extents;			/* extent count */
>  	struct file *file;
>  };
>  
> @@ -27,16 +24,8 @@ struct iomap_swapfile_info {
>  static int iomap_swapfile_add_extent(struct iomap_swapfile_info *isi)
>  {
>  	struct iomap *iomap = &isi->iomap;
> -	unsigned long nr_pages;
> -	unsigned long max_pages;
>  	uint64_t first_ppage;
> -	uint64_t first_ppage_reported;
>  	uint64_t next_ppage;
> -	int error;
> -
> -	if (unlikely(isi->nr_pages >= isi->sis->max))
> -		return 0;
> -	max_pages = isi->sis->max - isi->nr_pages;
>  
>  	/*
>  	 * Round the start up and the end down so that the physical
> @@ -45,33 +34,7 @@ static int iomap_swapfile_add_extent(struct iomap_swapfile_info *isi)
>  	first_ppage = ALIGN(iomap->addr, PAGE_SIZE) >> PAGE_SHIFT;
>  	next_ppage = ALIGN_DOWN(iomap->addr + iomap->length, PAGE_SIZE) >>
>  			PAGE_SHIFT;
> -
> -	/* Skip too-short physical extents. */
> -	if (first_ppage >= next_ppage)
> -		return 0;
> -	nr_pages = next_ppage - first_ppage;
> -	nr_pages = min(nr_pages, max_pages);
> -
> -	/*
> -	 * Calculate how much swap space we're adding; the first page contains
> -	 * the swap header and doesn't count.  The mm still wants that first
> -	 * page fed to add_swap_extent, however.
> -	 */
> -	first_ppage_reported = first_ppage;
> -	if (iomap->offset == 0)
> -		first_ppage_reported++;
> -	if (isi->lowest_ppage > first_ppage_reported)
> -		isi->lowest_ppage = first_ppage_reported;
> -	if (isi->highest_ppage < (next_ppage - 1))
> -		isi->highest_ppage = next_ppage - 1;
> -
> -	/* Add extent, set up for the next call. */
> -	error = add_swap_extent(isi->sis, isi->nr_pages, nr_pages, first_ppage);
> -	if (error < 0)
> -		return error;
> -	isi->nr_extents += error;
> -	isi->nr_pages += nr_pages;
> -	return 0;
> +	return add_swap_extent(isi->sis, next_ppage - first_ppage, first_ppage);
>  }
>  
>  static int iomap_swapfile_fail(struct iomap_swapfile_info *isi, const char *str)
> @@ -138,8 +101,7 @@ static int iomap_swapfile_iter(struct iomap_iter *iter,
>   * passed to the swapfile subsystem.
>   */
>  int iomap_swapfile_activate(struct swap_info_struct *sis,
> -		struct file *swap_file, sector_t *pagespan,
> -		const struct iomap_ops *ops)
> +		struct file *swap_file, const struct iomap_ops *ops)
>  {
>  	struct inode *inode = swap_file->f_mapping->host;
>  	struct iomap_iter iter = {
> @@ -150,7 +112,6 @@ int iomap_swapfile_activate(struct swap_info_struct *sis,
>  	};
>  	struct iomap_swapfile_info isi = {
>  		.sis = sis,
> -		.lowest_ppage = (sector_t)-1ULL,
>  		.file = swap_file,
>  	};
>  	int ret;
> @@ -174,19 +135,6 @@ int iomap_swapfile_activate(struct swap_info_struct *sis,
>  			return ret;
>  	}
>  
> -	/*
> -	 * If this swapfile doesn't contain even a single page-aligned
> -	 * contiguous range of blocks, reject this useless swapfile to
> -	 * prevent confusion later on.
> -	 */
> -	if (isi.nr_pages == 0) {
> -		pr_warn("swapon: Cannot find a single usable page in file.\n");
> -		return -EINVAL;
> -	}
> -
> -	*pagespan = 1 + isi.highest_ppage - isi.lowest_ppage;
> -	sis->max = isi.nr_pages;
> -	sis->pages = isi.nr_pages - 1;
> -	return isi.nr_extents;
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(iomap_swapfile_activate);
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index 25048a3c2364..74b401aa2b3a 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -567,8 +567,7 @@ static int nfs_launder_folio(struct folio *folio)
>  	return ret;
>  }
>  
> -static int nfs_swap_activate(struct swap_info_struct *sis, struct file *file,
> -						sector_t *span)
> +static int nfs_swap_activate(struct swap_info_struct *sis, struct file *file)
>  {
>  	unsigned long blocks;
>  	long long isize;
> @@ -589,19 +588,17 @@ static int nfs_swap_activate(struct swap_info_struct *sis, struct file *file,
>  	ret = rpc_clnt_swap_activate(clnt);
>  	if (ret)
>  		return ret;
> -	ret = add_swap_extent(sis, 0, sis->max, 0);
> +	ret = add_swap_extent(sis, sis->max, 0);
>  	if (ret < 0) {
>  		rpc_clnt_swap_deactivate(clnt);
>  		return ret;
>  	}
>  
> -	*span = sis->pages;
> -
>  	if (cl->rpc_ops->enable_swap)
>  		cl->rpc_ops->enable_swap(inode);
>  
>  	sis->flags |= SWP_FS_OPS;
> -	return ret;
> +	return 0;
>  }
>  
>  static void nfs_swap_deactivate(struct file *file)
> diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
> index 1fbf832ad165..4b7d019bc6ed 100644
> --- a/fs/ntfs/aops.c
> +++ b/fs/ntfs/aops.c
> @@ -271,10 +271,9 @@ static int ntfs_writepages(struct address_space *mapping,
>  }
>  
>  static int ntfs_swap_activate(struct swap_info_struct *sis,
> -		struct file *swap_file, sector_t *span)
> +		struct file *swap_file)
>  {
> -	return iomap_swapfile_activate(sis, swap_file, span,
> -			&ntfs_read_iomap_ops);
> +	return iomap_swapfile_activate(sis, swap_file, &ntfs_read_iomap_ops);
>  }
>  
>  const struct address_space_operations ntfs_aops = {
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index 664a2c223089..11d4655ef490 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -3287,7 +3287,7 @@ void cifs_oplock_break(struct work_struct *work)
>  }
>  
>  static int cifs_swap_activate(struct swap_info_struct *sis,
> -			      struct file *swap_file, sector_t *span)
> +			      struct file *swap_file)
>  {
>  	struct cifsFileInfo *cfile = swap_file->private_data;
>  	struct inode *inode = swap_file->f_mapping->host;
> @@ -3308,7 +3308,6 @@ static int cifs_swap_activate(struct swap_info_struct *sis,
>  		pr_warn("swap activate: swapfile has holes\n");
>  		return -EINVAL;
>  	}
> -	*span = sis->pages;
>  
>  	pr_warn_once("Swap support over SMB3 is experimental\n");
>  
> @@ -3329,7 +3328,7 @@ static int cifs_swap_activate(struct swap_info_struct *sis,
>  	 */
>  
>  	sis->flags |= SWP_FS_OPS;
> -	return add_swap_extent(sis, 0, sis->max, 0);
> +	return add_swap_extent(sis, sis->max, 0);
>  }
>  
>  static void cifs_swap_deactivate(struct file *file)
> diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> index f279055fcea0..1e8662e0e7cd 100644
> --- a/fs/xfs/xfs_aops.c
> +++ b/fs/xfs/xfs_aops.c
> @@ -799,8 +799,7 @@ xfs_vm_readahead(
>  static int
>  xfs_vm_swap_activate(
>  	struct swap_info_struct		*sis,
> -	struct file			*swap_file,
> -	sector_t			*span)
> +	struct file			*swap_file)
>  {
>  	struct xfs_inode		*ip = XFS_I(file_inode(swap_file));
>  
> @@ -838,8 +837,7 @@ xfs_vm_swap_activate(
>  	 */
>  	sis->bdev = xfs_inode_buftarg(ip)->bt_bdev;
>  
> -	return iomap_swapfile_activate(sis, swap_file, span,
> -			&xfs_read_iomap_ops);
> +	return iomap_swapfile_activate(sis, swap_file, &xfs_read_iomap_ops);
>  }
>  
>  const struct address_space_operations xfs_address_space_operations = {
> diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
> index 5ada33f70bb4..214e4bf8e30a 100644
> --- a/fs/zonefs/file.c
> +++ b/fs/zonefs/file.c
> @@ -168,7 +168,7 @@ static int zonefs_writepages(struct address_space *mapping,
>  }
>  
>  static int zonefs_swap_activate(struct swap_info_struct *sis,
> -				struct file *swap_file, sector_t *span)
> +				struct file *swap_file)
>  {
>  	struct inode *inode = file_inode(swap_file);
>  
> @@ -178,8 +178,7 @@ static int zonefs_swap_activate(struct swap_info_struct *sis,
>  		return -EINVAL;
>  	}
>  
> -	return iomap_swapfile_activate(sis, swap_file, span,
> -				       &zonefs_read_iomap_ops);
> +	return iomap_swapfile_activate(sis, swap_file, &zonefs_read_iomap_ops);
>  }
>  
>  const struct address_space_operations zonefs_file_aops = {
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 11559c513dfb..b8b6f7a38f4d 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -435,8 +435,7 @@ struct address_space_operations {
>  	int (*error_remove_folio)(struct address_space *, struct folio *);
>  
>  	/* swapfile support */
> -	int (*swap_activate)(struct swap_info_struct *sis, struct file *file,
> -				sector_t *span);
> +	int (*swap_activate)(struct swap_info_struct *sis, struct file *file);
>  	void (*swap_deactivate)(struct file *file);
>  	int (*swap_rw)(struct kiocb *iocb, struct iov_iter *iter);
>  };
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 2c5685adf3a9..d82126e3d086 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -604,10 +604,9 @@ struct file;
>  struct swap_info_struct;
>  
>  int iomap_swapfile_activate(struct swap_info_struct *sis,
> -		struct file *swap_file, sector_t *pagespan,
> -		const struct iomap_ops *ops);
> +		struct file *swap_file, const struct iomap_ops *ops);
>  #else
> -# define iomap_swapfile_activate(sis, swapfile, pagespan, ops)	(-EIO)
> +# define iomap_swapfile_activate(sis, swapfile, ops)	(-EIO)
>  #endif /* CONFIG_SWAP */
>  
>  extern struct bio_set iomap_ioend_bioset;
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 7a09df6977a5..b8dfe2c6bc98 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -403,10 +403,9 @@ extern void __meminit kswapd_stop(int nid);
>  
>  #ifdef CONFIG_SWAP
>  
> -int add_swap_extent(struct swap_info_struct *sis, unsigned long start_page,
> -		unsigned long nr_pages, sector_t start_block);
> -int generic_swapfile_activate(struct swap_info_struct *, struct file *,
> -		sector_t *);
> +int add_swap_extent(struct swap_info_struct *sis, unsigned long nr_pages,
> +		sector_t start_block);
> +int generic_swapfile_activate(struct swap_info_struct *, struct file *);
>  
>  static inline unsigned long total_swapcache_pages(void)
>  {
> @@ -528,8 +527,8 @@ static inline bool folio_free_swap(struct folio *folio)
>  }
>  
>  static inline int add_swap_extent(struct swap_info_struct *sis,
> -				  unsigned long start_page,
> -				  unsigned long nr_pages, sector_t start_block)
> +		unsigned long start_page, unsigned long nr_pages,
> +		sector_t start_block)
>  {
>  	return -EINVAL;
>  }
> diff --git a/mm/page_io.c b/mm/page_io.c
> index 70cea9e24d2f..f30f36ec1ed0 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -76,19 +76,14 @@ static void end_swap_bio_read(struct bio *bio)
>  }
>  
>  int generic_swapfile_activate(struct swap_info_struct *sis,
> -				struct file *swap_file,
> -				sector_t *span)
> +				struct file *swap_file)
>  {
>  	struct address_space *mapping = swap_file->f_mapping;
>  	struct inode *inode = mapping->host;
>  	unsigned blocks_per_page;
> -	unsigned long page_no;
>  	unsigned blkbits;
>  	sector_t probe_block;
>  	sector_t last_block;
> -	sector_t lowest_block = -1;
> -	sector_t highest_block = 0;
> -	int nr_extents = 0;
>  	int ret;
>  
>  	blkbits = inode->i_blkbits;
> @@ -99,10 +94,8 @@ int generic_swapfile_activate(struct swap_info_struct *sis,
>  	 * to be very smart.
>  	 */
>  	probe_block = 0;
> -	page_no = 0;
>  	last_block = i_size_read(inode) >> blkbits;
> -	while ((probe_block + blocks_per_page) <= last_block &&
> -			page_no < sis->max) {
> +	while ((probe_block + blocks_per_page) <= last_block) {
>  		unsigned block_in_page;
>  		sector_t first_block;
>  
> @@ -137,38 +130,22 @@ int generic_swapfile_activate(struct swap_info_struct *sis,
>  			}
>  		}
>  
> -		first_block >>= (PAGE_SHIFT - blkbits);
> -		if (page_no) {	/* exclude the header page */
> -			if (first_block < lowest_block)
> -				lowest_block = first_block;
> -			if (first_block > highest_block)
> -				highest_block = first_block;
> -		}
> -
>  		/*
>  		 * We found a PAGE_SIZE-length, PAGE_SIZE-aligned run of blocks
>  		 */
> -		ret = add_swap_extent(sis, page_no, 1, first_block);
> +		ret = add_swap_extent(sis, 1,
> +				first_block >> (PAGE_SHIFT - blkbits));
>  		if (ret < 0)
> -			goto out;
> -		nr_extents += ret;
> -		page_no++;
> +			return ret;
>  		probe_block += blocks_per_page;
>  reprobe:
>  		continue;
>  	}
> -	ret = nr_extents;
> -	*span = 1 + highest_block - lowest_block;
> -	if (page_no == 0)
> -		page_no = 1;	/* force Empty message */
> -	sis->max = page_no;
> -	sis->pages = page_no - 1;
> -out:
> -	return ret;
> +	return 0;
> +
>  bad_bmap:
>  	pr_err("swapon: swapfile has holes\n");
> -	ret = -EINVAL;
> -	goto out;
> +	return -EINVAL;
>  }
>  
>  static bool is_folio_zero_filled(struct folio *folio)
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index f7ebd97e28a3..158620fd2978 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -2704,15 +2704,21 @@ static void destroy_swap_extents(struct swap_info_struct *sis,
>   * Add a block range (and the corresponding page range) into this swapdev's
>   * extent tree.
>   *
> - * This function rather assumes that it is called in ascending page order.
> + * Note that start_block is in units of PAGE_SIZE and not actually in block
> + * layer sectors as the sector_t would suggest.
>   */
>  int
> -add_swap_extent(struct swap_info_struct *sis, unsigned long start_page,
> -		unsigned long nr_pages, sector_t start_block)
> +add_swap_extent(struct swap_info_struct *sis, unsigned long nr_pages,
> +		sector_t start_block)
>  {
>  	struct rb_node **link = &sis->swap_extent_root.rb_node, *parent = NULL;
>  	struct swap_extent *se;
> -	struct swap_extent *new_se;
> +
> +	if (!nr_pages)
> +		return 0;
> +	if (unlikely(sis->pages >= sis->max))
> +		return 0;
> +	nr_pages = min(nr_pages, sis->max - sis->pages);
>  
>  	/*
>  	 * place the new node at the right most since the
> @@ -2725,25 +2731,25 @@ add_swap_extent(struct swap_info_struct *sis, unsigned long start_page,
>  
>  	if (parent) {
>  		se = rb_entry(parent, struct swap_extent, rb_node);
> -		BUG_ON(se->start_page + se->nr_pages != start_page);
> -		if (se->start_block + se->nr_pages == start_block) {
> -			/* Merge it */
> -			se->nr_pages += nr_pages;
> -			return 0;
> -		}
> +		if (WARN_ON_ONCE(se->start_page + se->nr_pages != sis->pages))
> +			return -EINVAL;
> +		if (se->start_block + se->nr_pages == start_block)
> +			goto add;
>  	}
>  
>  	/* No merge, insert a new extent. */
> -	new_se = kmalloc_obj(*se);
> -	if (new_se == NULL)
> +	se = kzalloc_obj(*se);
> +	if (!se)
>  		return -ENOMEM;
> -	new_se->start_page = start_page;
> -	new_se->nr_pages = nr_pages;
> -	new_se->start_block = start_block;
> -
> -	rb_link_node(&new_se->rb_node, parent, link);
> -	rb_insert_color(&new_se->rb_node, &sis->swap_extent_root);
> -	return 1;
> +	rb_link_node(&se->rb_node, parent, link);
> +	rb_insert_color(&se->rb_node, &sis->swap_extent_root);
> +
> +	se->start_page = sis->pages;
> +	se->start_block = start_block;
> +add:
> +	se->nr_pages += nr_pages;
> +	sis->pages += nr_pages;
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(add_swap_extent);
>  
> @@ -2775,20 +2781,17 @@ EXPORT_SYMBOL_GPL(add_swap_extent);
>   * extents in the rbtree. - akpm.
>   */
>  static int setup_swap_extents(struct swap_info_struct *sis,
> -			      struct file *swap_file, sector_t *span)
> +			      struct file *swap_file)
>  {
>  	struct address_space *mapping = swap_file->f_mapping;
>  	struct inode *inode = mapping->host;
>  	int ret;
>  
> -	if (S_ISBLK(inode->i_mode)) {
> -		ret = add_swap_extent(sis, 0, sis->max, 0);
> -		*span = sis->pages;
> -		return ret;
> -	}
> +	if (S_ISBLK(inode->i_mode))
> +		return add_swap_extent(sis, sis->max, 0);
>  
>  	if (mapping->a_ops->swap_activate) {
> -		ret = mapping->a_ops->swap_activate(sis, swap_file, span);
> +		ret = mapping->a_ops->swap_activate(sis, swap_file);
>  		if (ret < 0)
>  			return ret;
>  		sis->flags |= SWP_ACTIVATED;
> @@ -2800,7 +2803,7 @@ static int setup_swap_extents(struct swap_info_struct *sis,
>  		return ret;
>  	}
>  
> -	return generic_swapfile_activate(sis, swap_file, span);
> +	return generic_swapfile_activate(sis, swap_file);
>  }
>  
>  static void _enable_swap_info(struct swap_info_struct *si)
> @@ -3428,6 +3431,40 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
>  	return err;
>  }
>  
> +static void swap_print_info(struct swap_info_struct *si, const char *name)
> +{
> +	unsigned int nr_extents = 0;
> +	u64 lowest_ppage = (u64)-1;
> +	u64 highest_ppage = 0;
> +	struct swap_extent *se;
> +
> +	/*
> +	 * Calculate how much swap space we're adding; the first page contains
> +	 * the swap header and doesn't count.
> +	 */
> +	for (se = first_se(si); se; se = next_se(se)) {
> +		u64 first_ppage = se->start_block;
> +		u64 next_ppage = se->start_block + se->nr_pages;
> +
> +		if (se->start_page == 0)
> +			first_ppage++;
> +
> +		if (lowest_ppage > first_ppage)
> +			lowest_ppage = first_ppage;
> +		if (highest_ppage < next_ppage - 1)
> +			highest_ppage = next_ppage - 1;
> +		nr_extents++;
> +	}
> +
> +	pr_info("Adding %uk swap on %s.  Priority:%d extents:%d across:%lluk %s%s%s%s\n",
> +		K(si->pages), name, si->prio, nr_extents,
> +		K(highest_ppage - lowest_ppage),
> +		(si->flags & SWP_SOLIDSTATE) ? "SS" : "",
> +		(si->flags & SWP_DISCARDABLE) ? "D" : "",
> +		(si->flags & SWP_AREA_DISCARD) ? "s" : "",
> +		(si->flags & SWP_PAGE_DISCARD) ? "c" : "");
> +}
> +
>  SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
>  {
>  	struct swap_info_struct *si;
> @@ -3437,8 +3474,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
>  	int prio;
>  	int error;
>  	union swap_header *swap_header;
> -	int nr_extents;
> -	sector_t span;
>  	struct folio *folio = NULL;
>  	struct inode *inode = NULL;
>  	bool inced_nr_rotate_swap = false;
> @@ -3510,24 +3545,25 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
>  	}
>  	swap_header = kmap_local_folio(folio, 0);
>  
> +	si->pages = 0;
>  	si->max = read_swap_header(si, swap_header, inode);
>  	if (unlikely(!si->max)) {
>  		error = -EINVAL;
>  		goto bad_swap_unlock_inode;
>  	}
>  
> -	si->pages = si->max - 1;
> -	nr_extents = setup_swap_extents(si, swap_file, &span);
> -	if (nr_extents < 0) {
> -		error = nr_extents;
> +	error = setup_swap_extents(si, swap_file);
> +	if (error < 0)
>  		goto bad_swap_unlock_inode;
> -	}
> -	if (si->pages != si->max - 1) {
> -		pr_err("swap:%u != (max:%u - 1)\n", si->pages, si->max);
> +	if (si->pages != si->max) {
> +		pr_err("swap:%u != (max:%u)\n", si->pages, si->max);
>  		error = -EINVAL;
>  		goto bad_swap_unlock_inode;
>  	}
>  
> +	/* Remove the first page countaining the swap header. */
> +	si->pages--;
> +
>  	/* Set up the swap cluster info */
>  	error = setup_swap_clusters_info(si, swap_header);
>  	if (error)
> @@ -3624,13 +3660,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
>  	/* Sets SWP_WRITEOK, resurrect the percpu ref, expose the swap device */
>  	enable_swap_info(si);
>  
> -	pr_info("Adding %uk swap on %s.  Priority:%d extents:%d across:%lluk %s%s%s%s\n",
> -		K(si->pages), name->name, si->prio, nr_extents,
> -		K((unsigned long long)span),
> -		(si->flags & SWP_SOLIDSTATE) ? "SS" : "",
> -		(si->flags & SWP_DISCARDABLE) ? "D" : "",
> -		(si->flags & SWP_AREA_DISCARD) ? "s" : "",
> -		(si->flags & SWP_PAGE_DISCARD) ? "c" : "");
> +	swap_print_info(si, name->name);
>  
>  	mutex_unlock(&swapon_mutex);
>  	atomic_inc(&proc_poll_event);
> -- 
> 2.53.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
