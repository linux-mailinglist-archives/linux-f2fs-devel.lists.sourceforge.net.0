Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9564F893
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Jun 2019 00:29:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heoVJ-0006u9-BS; Sat, 22 Jun 2019 22:29:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1heoVI-0006th-6F
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 22:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FzpPIfcdBzzLFN3eAal+vlRTB9z3wGDWiD2s62vzw5s=; b=ZDTlWW3jsmjfLnmEFyncbIpbC9
 3IhuHnwfEaMUEdaGH2KZM+JOcum/hOg7mauXMcaKWPYLAq2zzhD48Y6XzuTOL0VAhBLsUTcwQqXM1
 lw2mFqJrseU37IZMqYlok850yuX4ynKUXjgXmUE3JzJIYLE39/ePle26dWjZHhevDYkQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FzpPIfcdBzzLFN3eAal+vlRTB9z3wGDWiD2s62vzw5s=; b=SAe1zt5XqXjHgEjdqJ+RPKTw/r
 H71tTgTgYC24BlCLzz/vS6uVhNH3SaWExs9QlrmI/OoHSypm92+KHmCln0jCM3guHSjQ2M4scXbWM
 mkdzxFXYG7g6gQcXWZrrJGaM2Dd2nCibAvr1YdZ8pZQQmnFIMlTv+kXBsrWVcLSjlFiw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heoVM-009znq-Sz
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 22:29:06 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45A6E206B7;
 Sat, 22 Jun 2019 22:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561242539;
 bh=c8fVFZZuYkZhgy8reLNIA8g+E5ers06eeDGckiaZq3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AYXStsrVq/xuYzf7uWcwMuGUXLnWY2Lo7cZxbMQPrq04wyTcErdo9cKIrdtloCcw2
 80jHKyEdHZqbsjLmjF+7FwM2ykvZmhCZOYDwBNbJX8w4Xl7uYNzfqNncqR8ZgEYcpU
 Nh1jzXQiG2CFGViyc0d8oXrh17vVK382gSxHhz+A=
Date: Sat, 22 Jun 2019 15:28:58 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190622222858.GH19686@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190620205043.64350-1-ebiggers@kernel.org>
 <20190620205043.64350-9-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620205043.64350-9-ebiggers@kernel.org>
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
X-Headers-End: 1heoVM-009znq-Sz
Subject: Re: [f2fs-dev] [PATCH v5 08/16] fs-verity: add the hook for file
 ->setattr()
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
> Add a function fsverity_prepare_setattr() which filesystems that support
> fs-verity must call to deny truncates of verity files.
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/verity/open.c         | 21 +++++++++++++++++++++
>  include/linux/fsverity.h |  7 +++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/fs/verity/open.c b/fs/verity/open.c
> index 3a3bb27e23f5e3..21ae0ef254a695 100644
> --- a/fs/verity/open.c
> +++ b/fs/verity/open.c
> @@ -296,6 +296,27 @@ int fsverity_file_open(struct inode *inode, struct file *filp)
>  }
>  EXPORT_SYMBOL_GPL(fsverity_file_open);
>  
> +/**
> + * fsverity_prepare_setattr - prepare to change a verity inode's attributes
> + * @dentry: dentry through which the inode is being changed
> + * @attr: attributes to change
> + *
> + * Verity files are immutable, so deny truncates.  This isn't covered by the
> + * open-time check because sys_truncate() takes a path, not a file descriptor.
> + *
> + * Return: 0 on success, -errno on failure
> + */
> +int fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr)
> +{
> +	if (IS_VERITY(d_inode(dentry)) && (attr->ia_valid & ATTR_SIZE)) {
> +		pr_debug("Denying truncate of verity file (ino %lu)\n",
> +			 d_inode(dentry)->i_ino);
> +		return -EPERM;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(fsverity_prepare_setattr);
> +
>  /**
>   * fsverity_cleanup_inode - free the inode's verity info, if present
>   *
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index 1372c236c8770c..cbcc358d073652 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -46,6 +46,7 @@ static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
>  /* open.c */
>  
>  extern int fsverity_file_open(struct inode *inode, struct file *filp);
> +extern int fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr);
>  extern void fsverity_cleanup_inode(struct inode *inode);
>  
>  #else /* !CONFIG_FS_VERITY */
> @@ -62,6 +63,12 @@ static inline int fsverity_file_open(struct inode *inode, struct file *filp)
>  	return IS_VERITY(inode) ? -EOPNOTSUPP : 0;
>  }
>  
> +static inline int fsverity_prepare_setattr(struct dentry *dentry,
> +					   struct iattr *attr)
> +{
> +	return IS_VERITY(d_inode(dentry)) ? -EOPNOTSUPP : 0;
> +}
> +
>  static inline void fsverity_cleanup_inode(struct inode *inode)
>  {
>  }
> -- 
> 2.22.0.410.gd8fdbe21b5-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
