Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB08C89E042
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Apr 2024 18:22:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruEFC-0000Zu-Sn;
	Tue, 09 Apr 2024 16:22:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1ruEFA-0000Zb-BX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 16:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qo/B8EyoS3TTtrhkf8uivEzc68xf8bK2b3hv4FqJ2GY=; b=TekJYzccjFEJK/HxUyiZPDwgdZ
 85OaDIpu1D0GOArfCdXRSALuyzovmyaZh+waePraw6bEXI1a39tVHJHtE3HuFVPSj0aArK8PprS6i
 IknKoevhXDj4gaCpy9pMSqLLZvBAEOoN7/RBCgic5wkXqrPxv7cz2YlSw0guNGzAnDSc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qo/B8EyoS3TTtrhkf8uivEzc68xf8bK2b3hv4FqJ2GY=; b=iHbG+mk3fCGL2ifAg4cIlqOAe6
 FN0pGjaW7lwgjMlcY8+k+JdFuqwWzSvlqxcoXfV0s1CF7lBrkBUWl/XjklsOBeX6FRnmJgrELS0xE
 LUwx5+38nZ378K66P0y6Pw8ejGkDi1X/JdP0MY6fchFWLh85RfW/u6nYcJSofxr1Tt4E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruEFA-0002lf-7k for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 16:22:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C995D618D1;
 Tue,  9 Apr 2024 16:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783B4C433F1;
 Tue,  9 Apr 2024 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712679753;
 bh=s81ceGOY/UaeALO8XB1vF4xIKP6ybz9DnJl/IEpTMSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uOf15R97CfO4NRrpGlR+ut/EZaH8gJePsx76fVYZ2CwpkY6p2z9oJg8boVPOdOoce
 WETlWuf5gfSinxoonTC04g5Kc3Sj2wZe9v17KvknHY3kunNrQaSO0L6nThQ5p/8nRJ
 nKKPh7+OV5XuHOCgKUobpVWsMEUosqNN+Oy7MtOavp44t3NaOWktoHNU3flF3rj12P
 bxvOmVWzXpwkP+BPmdlgreV35svfYgm5TTPVIxw45uz3NeIFb27nURTpm/B4vJffGz
 rHBMtsPRwqA5Of0yoDXPSPXCbiEUfKL6dAA1Ko3ghM2b9lkhjl0APrqbDbXL3wc/MZ
 nHjQ03z4Hsjsg==
Date: Tue, 9 Apr 2024 09:22:32 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Message-ID: <20240409162232.GA6367@frogsfrogsfrogs>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
 <1ba5bfccccbf4ff792f178268badde056797d0c4.1712126039.git.sweettea-kernel@dorminy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ba5bfccccbf4ff792f178268badde056797d0c4.1712126039.git.sweettea-kernel@dorminy.me>
X-Spam-Score: -6.9 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 03, 2024 at 03:22:42AM -0400, Sweet Tea Dorminy
 wrote: > Some filesystems support compressed extents which have a larger
 logical > size than physical, and for those filesystems, it can be [...] 
 Content analysis details:   (-6.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ruEFA-0002lf-7k
Subject: Re: [f2fs-dev] [PATCH v3 01/13] fs: fiemap: add physical_length
 field to extents
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
Cc: linux-bcachefs@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-btrfs@vger.kernel.org,
 Brian Foster <bfoster@redhat.com>, Kent Overstreet <kent.overstreet@linux.dev>,
 linux-doc@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@meta.com, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 03, 2024 at 03:22:42AM -0400, Sweet Tea Dorminy wrote:
> Some filesystems support compressed extents which have a larger logical
> size than physical, and for those filesystems, it can be useful for
> userspace to know how much space those extents actually use. For
> instance, the compsize [1] tool for btrfs currently uses btrfs-internal,
> root-only ioctl to find the actual disk space used by a file; it would
> be better and more useful for this information to require fewer
> privileges and to be usable on more filesystems. Therefore, use one of
> the padding u64s in the fiemap extent structure to return the actual
> physical length; and, for now, return this as equal to the logical
> length.
> 
> [1] https://github.com/kilobyte/compsize
> 
> Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
> ---
>  Documentation/filesystems/fiemap.rst | 28 +++++++++++++++++-------
>  fs/ioctl.c                           |  3 ++-
>  include/uapi/linux/fiemap.h          | 32 ++++++++++++++++++++++------
>  3 files changed, 47 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/filesystems/fiemap.rst b/Documentation/filesystems/fiemap.rst
> index 93fc96f760aa..c2bfa107c8d7 100644
> --- a/Documentation/filesystems/fiemap.rst
> +++ b/Documentation/filesystems/fiemap.rst
> @@ -80,14 +80,24 @@ Each extent is described by a single fiemap_extent structure as
>  returned in fm_extents::
>  
>      struct fiemap_extent {
> -	    __u64	fe_logical;  /* logical offset in bytes for the start of
> -				* the extent */
> -	    __u64	fe_physical; /* physical offset in bytes for the start
> -				* of the extent */
> -	    __u64	fe_length;   /* length in bytes for the extent */
> -	    __u64	fe_reserved64[2];
> -	    __u32	fe_flags;    /* FIEMAP_EXTENT_* flags for this extent */
> -	    __u32	fe_reserved[3];
> +            /*
> +             * logical offset in bytes for the start of
> +             * the extent from the beginning of the file
> +             */
> +            __u64 fe_logical;
> +            /*
> +             * physical offset in bytes for the start
> +             * of the extent from the beginning of the disk
> +             */
> +            __u64 fe_physical;
> +            /* logical length in bytes for this extent */
> +            __u64 fe_logical_length;
> +            /* physical length in bytes for this extent */
> +            __u64 fe_physical_length;
> +            __u64 fe_reserved64[1];
> +            /* FIEMAP_EXTENT_* flags for this extent */
> +            __u32 fe_flags;
> +            __u32 fe_reserved[3];
>      };
>  
>  All offsets and lengths are in bytes and mirror those on disk.  It is valid
> @@ -175,6 +185,8 @@ FIEMAP_EXTENT_MERGED
>    userspace would be highly inefficient, the kernel will try to merge most
>    adjacent blocks into 'extents'.
>  
> +FIEMAP_EXTENT_HAS_PHYS_LEN
> +  This will be set if the file system populated the physical length field.

Just out of curiosity, should filesystems set this flag and
fe_physical_length if fe_physical_length == fe_logical_length?
Or just leave both blank?

>  VFS -> File System Implementation
>  ---------------------------------
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index 661b46125669..8afd32e1a27a 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -138,7 +138,8 @@ int fiemap_fill_next_extent(struct fiemap_extent_info *fieinfo, u64 logical,
>  	memset(&extent, 0, sizeof(extent));
>  	extent.fe_logical = logical;
>  	extent.fe_physical = phys;
> -	extent.fe_length = len;
> +	extent.fe_logical_length = len;
> +	extent.fe_physical_length = len;
>  	extent.fe_flags = flags;
>  
>  	dest += fieinfo->fi_extents_mapped;
> diff --git a/include/uapi/linux/fiemap.h b/include/uapi/linux/fiemap.h
> index 24ca0c00cae3..3079159b8e94 100644
> --- a/include/uapi/linux/fiemap.h
> +++ b/include/uapi/linux/fiemap.h
> @@ -14,14 +14,30 @@
>  
>  #include <linux/types.h>
>  
> +/*
> + * For backward compatibility, where the member of the struct was called
> + * fe_length instead of fe_logical_length.
> + */
> +#define fe_length fe_logical_length

This #define has global scope; are you sure this isn't going to cause a
weird build problem downstream with some program that declares an
unrelated fe_length symbol?

> +
>  struct fiemap_extent {
> -	__u64 fe_logical;  /* logical offset in bytes for the start of
> -			    * the extent from the beginning of the file */
> -	__u64 fe_physical; /* physical offset in bytes for the start
> -			    * of the extent from the beginning of the disk */
> -	__u64 fe_length;   /* length in bytes for this extent */
> -	__u64 fe_reserved64[2];
> -	__u32 fe_flags;    /* FIEMAP_EXTENT_* flags for this extent */
> +	/*
> +	 * logical offset in bytes for the start of
> +	 * the extent from the beginning of the file
> +	 */
> +	__u64 fe_logical;
> +	/*
> +	 * physical offset in bytes for the start
> +	 * of the extent from the beginning of the disk
> +	 */
> +	__u64 fe_physical;
> +	/* logical length in bytes for this extent */
> +	__u64 fe_logical_length;

Or why not just leave the field name the same since the "logical length
in bytes" comment is present both here in the header and again in the
documentation?

--D

> +	/* physical length in bytes for this extent */
> +	__u64 fe_physical_length;
> +	__u64 fe_reserved64[1];
> +	/* FIEMAP_EXTENT_* flags for this extent */
> +	__u32 fe_flags;
>  	__u32 fe_reserved[3];
>  };
>  
> @@ -66,5 +82,7 @@ struct fiemap {
>  						    * merged for efficiency. */
>  #define FIEMAP_EXTENT_SHARED		0x00002000 /* Space shared with other
>  						    * files. */
> +#define FIEMAP_EXTENT_HAS_PHYS_LEN	0x00004000 /* Physical length is valid
> +						    * and set by FS. */
>  
>  #endif /* _UAPI_LINUX_FIEMAP_H */
> -- 
> 2.43.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
