Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B649EB4EB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2019 17:43:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQDXw-0005fI-6I; Thu, 31 Oct 2019 16:43:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1iQDXp-0005eo-DY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 16:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rE1L67Ij6PAnNO5oQe+u5ThIA/6aAZzus5OAA/8nkKk=; b=eWTaE1c9aj6SqmMcWQH0x2fmQx
 FG6MptOinyPVB++06tCMApvKDMUIVQVH57mYXMwOq/gRUM0vqzzL7JiqY9rg/Ll+tdYUSuWzLWRId
 m1nIRCr3tu3qbGfj8qbORBXrc8cVcVp16FatBaQ+DEOHE9FBqLG3bHUGTT7VV/szUaIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rE1L67Ij6PAnNO5oQe+u5ThIA/6aAZzus5OAA/8nkKk=; b=LenNoiqkR33k+NDaBa0h9Iad7+
 Ndy0JizM3UsvjcJ7YGADKcJpfEvhxubfPc/vEWknHOPguM9fjlntJszqRv4sO3xz4WDuVGUsWQgkI
 nNAGejzXpycjHeVuOIItcEKtpIklJdPP7zqx3S30iqtqPT/f8WtCrWymTuYltPJGaLbo=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQDXm-00CmcN-W7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 16:43:33 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 71E17B243;
 Thu, 31 Oct 2019 16:43:23 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 5597C1E482D; Thu, 31 Oct 2019 17:43:22 +0100 (CET)
Date: Thu, 31 Oct 2019 17:43:22 +0100
From: Jan Kara <jack@suse.cz>
To: Valdis Kletnieks <valdis.kletnieks@vt.edu>
Message-ID: <20191031164322.GC13321@quack2.suse.cz>
References: <20191031010736.113783-1-Valdis.Kletnieks@vt.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031010736.113783-1-Valdis.Kletnieks@vt.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iQDXm-00CmcN-W7
Subject: Re: [f2fs-dev] [RFC] errno.h: Provide EFSCORRUPTED for everybody
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
Cc: devel@driverdev.osuosl.org, linux-arch@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 30-10-19 21:07:33, Valdis Kletnieks wrote:
> Three questions: (a) ACK/NAK on this patch, (b) should it be all in one
> patch, or one to add to errno.h and 6 patches for 6 filesystems?), and
> (c) if one patch, who gets to shepherd it through?
> 
> 
> There's currently 6 filesystems that have the same #define. Move it
> into errno.h so it's defined in just one place.
> 
> Signed-off-by: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/staging/exfat/exfat.h    | 2 --
>  fs/erofs/internal.h              | 2 --
>  fs/ext4/ext4.h                   | 1 -
>  fs/f2fs/f2fs.h                   | 1 -
>  fs/xfs/xfs_linux.h               | 1 -
>  include/linux/jbd2.h             | 1 -
>  include/uapi/asm-generic/errno.h | 1 +
>  7 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
> index 84de1123e178..3cf7e54af0b7 100644
> --- a/drivers/staging/exfat/exfat.h
> +++ b/drivers/staging/exfat/exfat.h
> @@ -30,8 +30,6 @@
>  #undef DEBUG
>  #endif
>  
> -#define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
> -
>  #define DENTRY_SIZE		32	/* dir entry size */
>  #define DENTRY_SIZE_BITS	5
>  
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index 544a453f3076..3980026a8882 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -425,7 +425,5 @@ static inline int z_erofs_init_zip_subsystem(void) { return 0; }
>  static inline void z_erofs_exit_zip_subsystem(void) {}
>  #endif	/* !CONFIG_EROFS_FS_ZIP */
>  
> -#define EFSCORRUPTED    EUCLEAN         /* Filesystem is corrupted */
> -
>  #endif	/* __EROFS_INTERNAL_H */
>  
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index 03db3e71676c..a86c2585457d 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -3396,6 +3396,5 @@ static inline int ext4_buffer_uptodate(struct buffer_head *bh)
>  #endif	/* __KERNEL__ */
>  
>  #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
> -#define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
>  
>  #endif	/* _EXT4_H */
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 4024790028aa..04ebe77569a3 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3752,6 +3752,5 @@ static inline bool is_journalled_quota(struct f2fs_sb_info *sbi)
>  }
>  
>  #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
> -#define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
>  
>  #endif /* _LINUX_F2FS_H */
> diff --git a/fs/xfs/xfs_linux.h b/fs/xfs/xfs_linux.h
> index ca15105681ca..3409d02a7d21 100644
> --- a/fs/xfs/xfs_linux.h
> +++ b/fs/xfs/xfs_linux.h
> @@ -123,7 +123,6 @@ typedef __u32			xfs_nlink_t;
>  
>  #define ENOATTR		ENODATA		/* Attribute not found */
>  #define EWRONGFS	EINVAL		/* Mount with wrong filesystem type */
> -#define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
>  #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
>  
>  #define SYNCHRONIZE()	barrier()
> diff --git a/include/linux/jbd2.h b/include/linux/jbd2.h
> index 564793c24d12..1ecd3859d040 100644
> --- a/include/linux/jbd2.h
> +++ b/include/linux/jbd2.h
> @@ -1657,6 +1657,5 @@ static inline tid_t  jbd2_get_latest_transaction(journal_t *journal)
>  #endif	/* __KERNEL__ */
>  
>  #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
> -#define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
>  
>  #endif	/* _LINUX_JBD2_H */
> diff --git a/include/uapi/asm-generic/errno.h b/include/uapi/asm-generic/errno.h
> index cf9c51ac49f9..1d5ffdf54cb0 100644
> --- a/include/uapi/asm-generic/errno.h
> +++ b/include/uapi/asm-generic/errno.h
> @@ -98,6 +98,7 @@
>  #define	EINPROGRESS	115	/* Operation now in progress */
>  #define	ESTALE		116	/* Stale file handle */
>  #define	EUCLEAN		117	/* Structure needs cleaning */
> +#define	EFSCORRUPTED	EUCLEAN
>  #define	ENOTNAM		118	/* Not a XENIX named type file */
>  #define	ENAVAIL		119	/* No XENIX semaphores available */
>  #define	EISNAM		120	/* Is a named type file */
> -- 
> 2.24.0.rc1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
