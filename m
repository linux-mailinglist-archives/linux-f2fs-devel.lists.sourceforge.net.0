Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B194F885
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Jun 2019 00:18:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heoKw-0005ip-P3; Sat, 22 Jun 2019 22:18:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1heoKv-0005ih-4I
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 22:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gCW49dCLLxz5ELE54okTyHUOU4s7ivV18lieNukEReg=; b=BCpRIekIckiqE+01Rdx/yzN8TJ
 mWsXCwY+l8ov6jD58ZGOOeqJS20NlEHe2zi/cNISgLNhNnyxznGIcLv+dg8VhlU2qqDA38o0UGX7T
 CwbXbWlN+DkAclrI5ZzGkYeTPPKCn0lJLcjCHhn1RbAvLDjUk+2qZG/IGcDj5tR+YoFA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gCW49dCLLxz5ELE54okTyHUOU4s7ivV18lieNukEReg=; b=CJRiu3CuLPrgdNjTC7Vz5bEOV5
 OQouiQyMbSrOlQcXZoVvLnzxLA18CpVbmjhdQGqZkPY0gxSCcBm8ThZ1XLq+oQS6O/c3IxtH/jks5
 YF59VFI4HXX5TPaE7mXQipqa4yejVyLlc3ZSCx6pqWPcKcgt20VUBy6J+n+XXDD3vypM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heoKw-009bGX-Fn
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 22:18:19 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7D8C20862;
 Sat, 22 Jun 2019 22:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561241892;
 bh=aL5ZbVVWiFeYPbhaqN3zYqtsFHIMk0l/RXgTunPmNGc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gk0P59ReUmP5WcLnj6sWDkMCVW2otxDLfVGqXBug3VcTyYRBpOPtjrdL6ECwn7Ao5
 3I/sPMbVqablLz07Q/tdfixwZojnbXqMbwhoGNGHFbUQkrTx0x7YtVfTPsat3WtdQV
 lFJA22AYsm4IhmWEowCbgTNEc8INfVCzS22KbGe8=
Date: Sat, 22 Jun 2019 15:18:12 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190622221812.GF19686@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190620205043.64350-1-ebiggers@kernel.org>
 <20190620205043.64350-7-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620205043.64350-7-ebiggers@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1heoKw-009bGX-Fn
Subject: Re: [f2fs-dev] [PATCH v5 06/16] fs-verity: add inode and superblock
 fields
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/20, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Analogous to fs/crypto/, add fields to the VFS inode and superblock for
> use by the fs/verity/ support layer:
> 
> - ->s_vop: points to the fsverity_operations if the filesystem supports
>   fs-verity, otherwise is NULL.
> 
> - ->i_verity_info: points to cached fs-verity information for the inode
>   after someone opens it, otherwise is NULL.
> 
> - S_VERITY: bit in ->i_flags that identifies verity inodes, even when
>   they haven't been opened yet and thus still have NULL ->i_verity_info.
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  include/linux/fs.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index f7fdfe93e25d3e..a80a192cdcf285 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -64,6 +64,8 @@ struct workqueue_struct;
>  struct iov_iter;
>  struct fscrypt_info;
>  struct fscrypt_operations;
> +struct fsverity_info;
> +struct fsverity_operations;
>  struct fs_context;
>  struct fs_parameter_description;
>  
> @@ -723,6 +725,10 @@ struct inode {
>  	struct fscrypt_info	*i_crypt_info;
>  #endif
>  
> +#ifdef CONFIG_FS_VERITY
> +	struct fsverity_info	*i_verity_info;
> +#endif
> +
>  	void			*i_private; /* fs or device private pointer */
>  } __randomize_layout;
>  
> @@ -1429,6 +1435,9 @@ struct super_block {
>  	const struct xattr_handler **s_xattr;
>  #ifdef CONFIG_FS_ENCRYPTION
>  	const struct fscrypt_operations	*s_cop;
> +#endif
> +#ifdef CONFIG_FS_VERITY
> +	const struct fsverity_operations *s_vop;
>  #endif
>  	struct hlist_bl_head	s_roots;	/* alternate root dentries for NFS */
>  	struct list_head	s_mounts;	/* list of mounts; _not_ for fs use */
> @@ -1964,6 +1973,7 @@ struct super_operations {
>  #endif
>  #define S_ENCRYPTED	16384	/* Encrypted file (using fs/crypto/) */
>  #define S_CASEFOLD	32768	/* Casefolded file */
> +#define S_VERITY	65536	/* Verity file (using fs/verity/) */
>  
>  /*
>   * Note that nosuid etc flags are inode-specific: setting some file-system
> @@ -2005,6 +2015,7 @@ static inline bool sb_rdonly(const struct super_block *sb) { return sb->s_flags
>  #define IS_DAX(inode)		((inode)->i_flags & S_DAX)
>  #define IS_ENCRYPTED(inode)	((inode)->i_flags & S_ENCRYPTED)
>  #define IS_CASEFOLDED(inode)	((inode)->i_flags & S_CASEFOLD)
> +#define IS_VERITY(inode)	((inode)->i_flags & S_VERITY)
>  
>  #define IS_WHITEOUT(inode)	(S_ISCHR(inode->i_mode) && \
>  				 (inode)->i_rdev == WHITEOUT_DEV)
> -- 
> 2.22.0.410.gd8fdbe21b5-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
