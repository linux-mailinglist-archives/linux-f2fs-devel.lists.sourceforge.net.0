Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7DC390AA1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 May 2021 22:43:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lldtk-0001M1-JV; Tue, 25 May 2021 20:43:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <djwong@kernel.org>) id 1lldtj-0001Lu-GT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 20:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JYHCxr6LufvivKs4OH3BoEUu178723VBpMzZchPaoOk=; b=ciPxtKSU5cLg5jHj1pi1y45nxd
 nQlbgJHyfV0V/4qUlKlOc0Lp6TzOZjz82LTlwUEG+354TdC7XX4KzMb7C2f8rwp35XMv541YqEa31
 Ni53R+kh8CDQWcM+CGEmBS+UxloBUsPCt5kDQQYjuE6G4HV48Mk1M7P6tjrCnitSuT8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JYHCxr6LufvivKs4OH3BoEUu178723VBpMzZchPaoOk=; b=d3VG42KWx1bPv9pZu90j+G84Eq
 Et8Y7vXWypEW+GSTLIAz8HZWQKnkEErjezt02u2dheJr6dsF1yZsDb6h3ElHz4wRXqx1p/rYVIlSf
 6/dZ8jIB36ow7mRsszqTbTjxY/IaH61G+uQ8JIshS85zn6kyBRvsj2hXkdclmifmxSDU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lldtc-005mlH-1g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 20:43:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A400061409;
 Tue, 25 May 2021 20:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621975393;
 bh=D9/lkDf7/4G2MsG+84gaDXO7v7xhTSSqmHMTWi1xl5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gWt3V53WTHyJPdEqHJaiSjzFKDoxv0siITj6vkwlqJXoCFCv3a3exQZokq6Tonv30
 gMlbZf5iUa/Tplf7dwGeETBsjwgLMAEfIxdlTKGU+qc54RBD6xX/YQQvQ5ekFgP4qd
 2+r05F69dPROmTIFIVRPzEBOiSjcvk4cl99FWfRWeS/2hUrt1iSElUvXsOhXbbeYrI
 3Jy9OORfYg3TKBLlS3Bi54A4zCiGK6t5PZVWbNrjze/xPOo+5rBtv4rgxsNNeh02E1
 Whjvii7J/mMCnawZPlrhtapQheVSwKVYf3ytpEB2b4316qWTYa5vsbWoW7/muPlCfX
 GhrzuzD+2ASMw==
Date: Tue, 25 May 2021 13:43:13 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210525204313.GL202121@locust>
References: <20210525125652.20457-1-jack@suse.cz>
 <20210525135100.11221-2-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525135100.11221-2-jack@suse.cz>
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
X-Headers-End: 1lldtc-005mlH-1g
Subject: Re: [f2fs-dev] [PATCH 02/13] documentation: Sync file_operations
 members with reality
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
Cc: linux-cifs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, May 25, 2021 at 03:50:39PM +0200, Jan Kara wrote:
> Sync listing of struct file_operations members with the real one in
> fs.h.
> 
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  Documentation/filesystems/locking.rst | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
> index 1e894480115b..4ed2b22bd0a8 100644
> --- a/Documentation/filesystems/locking.rst
> +++ b/Documentation/filesystems/locking.rst
> @@ -506,6 +506,7 @@ prototypes::
>  	ssize_t (*write) (struct file *, const char __user *, size_t, loff_t *);
>  	ssize_t (*read_iter) (struct kiocb *, struct iov_iter *);
>  	ssize_t (*write_iter) (struct kiocb *, struct iov_iter *);
> +	int (*iopoll) (struct kiocb *kiocb, bool spin);
>  	int (*iterate) (struct file *, struct dir_context *);
>  	int (*iterate_shared) (struct file *, struct dir_context *);
>  	__poll_t (*poll) (struct file *, struct poll_table_struct *);
> @@ -518,12 +519,6 @@ prototypes::
>  	int (*fsync) (struct file *, loff_t start, loff_t end, int datasync);
>  	int (*fasync) (int, struct file *, int);
>  	int (*lock) (struct file *, int, struct file_lock *);
> -	ssize_t (*readv) (struct file *, const struct iovec *, unsigned long,
> -			loff_t *);
> -	ssize_t (*writev) (struct file *, const struct iovec *, unsigned long,
> -			loff_t *);
> -	ssize_t (*sendfile) (struct file *, loff_t *, size_t, read_actor_t,
> -			void __user *);
>  	ssize_t (*sendpage) (struct file *, struct page *, int, size_t,
>  			loff_t *, int);
>  	unsigned long (*get_unmapped_area)(struct file *, unsigned long,
> @@ -536,6 +531,14 @@ prototypes::
>  			size_t, unsigned int);
>  	int (*setlease)(struct file *, long, struct file_lock **, void **);
>  	long (*fallocate)(struct file *, int, loff_t, loff_t);
> +	void (*show_fdinfo)(struct seq_file *m, struct file *f);
> +	unsigned (*mmap_capabilities)(struct file *);
> +	ssize_t (*copy_file_range)(struct file *, loff_t, struct file *,
> +			loff_t, size_t, unsigned int);
> +	loff_t (*remap_file_range)(struct file *file_in, loff_t pos_in,
> +			struct file *file_out, loff_t pos_out,
> +			loff_t len, unsigned int remap_flags);

Acked-by: Darrick J. Wong <djwong@kernel.org>

The remap_file_range part looks correct to me.  At a glance the others
seem fine too, but I'm not as familiar with them...

--D

> +	int (*fadvise)(struct file *, loff_t, loff_t, int);
>  
>  locking rules:
>  	All may block.
> -- 
> 2.26.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
