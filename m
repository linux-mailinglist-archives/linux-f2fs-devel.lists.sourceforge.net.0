Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 536884F8AB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Jun 2019 00:43:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heoja-0007bv-Ls; Sat, 22 Jun 2019 22:43:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1heojZ-0007bp-IU
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 22:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Gb9STRnk+xlxZiw8pOQ0xCrm4q6pO2fO6ABb/TiDDE=; b=em/4nFu/oiU8tvgwCIuAGvFQoT
 jQ384hhRXXZCEr8xQlNKmyLOxyCB9FloMOvxCURk4ozjg/4QsIbwvpgi812yTF53eHmqahixAuCB5
 b53POah5dBdF5W0lzeby7nKqi34zv1IciN/vcKedYVowQFKXHpAyU1IsS2m4qGb36APY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Gb9STRnk+xlxZiw8pOQ0xCrm4q6pO2fO6ABb/TiDDE=; b=Zhg/jzcqUAijeBQ4g1/rap+7mx
 z4dgvyYYvoO6H+iSs8FvDOo0wr2TOIC4xWQxOYX+ETCfIRbkzqtYiHfE1roocF14G9atR06XlnQI3
 s/3zqcCG5h1PgtPqBrSdMRRRiL0DqpMM3gOYU1YwtgsKOQzCdFWFB4yboF5aaiXX0r2c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heojb-005QAL-TU
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 22:43:49 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4AA812084E;
 Sat, 22 Jun 2019 22:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561243422;
 bh=DcyohrKT72HLIRQWpmZKgJ9cYufyV5h3FgzJrKSEzqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j0UcE3JNB92K56eXwIaeRiAOevDg9flpmPmcEW0WWWiVvcr7eSRw0Z9orFqbTJZ1w
 wIeoStA/9a0DlOVbZOu3SGFsd1PJdAeKDTRnH9iSx/BopGxHP4WMfhVSr3Qt+4+KCs
 vToVvBi+I8LblcGPSzKdB/4BVO6uCtB1QOo0jyjA=
Date: Sat, 22 Jun 2019 15:43:41 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190622224341.GK19686@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190620205043.64350-1-ebiggers@kernel.org>
 <20190620205043.64350-12-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620205043.64350-12-ebiggers@kernel.org>
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
X-Headers-End: 1heojb-005QAL-TU
Subject: Re: [f2fs-dev] [PATCH v5 11/16] fs-verity: implement
 FS_IOC_MEASURE_VERITY ioctl
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
> Add a function for filesystems to call to implement the
> FS_IOC_MEASURE_VERITY ioctl.  This ioctl retrieves the file measurement
> that fs-verity calculated for the given file and is enforcing for reads;
> i.e., reads that don't match this hash will fail.  This ioctl can be
> used for authentication or logging of file measurements in userspace.
> 
> See the "FS_IOC_MEASURE_VERITY" section of
> Documentation/filesystems/fsverity.rst for the documentation.
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/verity/Makefile       |  1 +
>  fs/verity/measure.c      | 57 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/fsverity.h | 11 ++++++++
>  3 files changed, 69 insertions(+)
>  create mode 100644 fs/verity/measure.c
> 
> diff --git a/fs/verity/Makefile b/fs/verity/Makefile
> index 04b37475fd280a..6f7675ae0a3110 100644
> --- a/fs/verity/Makefile
> +++ b/fs/verity/Makefile
> @@ -3,5 +3,6 @@
>  obj-$(CONFIG_FS_VERITY) += enable.o \
>  			   hash_algs.o \
>  			   init.o \
> +			   measure.o \
>  			   open.o \
>  			   verify.o
> diff --git a/fs/verity/measure.c b/fs/verity/measure.c
> new file mode 100644
> index 00000000000000..05049b68c74553
> --- /dev/null
> +++ b/fs/verity/measure.c
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * fs/verity/measure.c: ioctl to get a verity file's measurement
> + *
> + * Copyright 2019 Google LLC
> + */
> +
> +#include "fsverity_private.h"
> +
> +#include <linux/uaccess.h>
> +
> +/**
> + * fsverity_ioctl_measure() - get a verity file's measurement
> + *
> + * Retrieve the file measurement that the kernel is enforcing for reads from a
> + * verity file.  See the "FS_IOC_MEASURE_VERITY" section of
> + * Documentation/filesystems/fsverity.rst for the documentation.
> + *
> + * Return: 0 on success, -errno on failure
> + */
> +int fsverity_ioctl_measure(struct file *filp, void __user *_uarg)
> +{
> +	const struct inode *inode = file_inode(filp);
> +	struct fsverity_digest __user *uarg = _uarg;
> +	const struct fsverity_info *vi;
> +	const struct fsverity_hash_alg *hash_alg;
> +	struct fsverity_digest arg;
> +
> +	vi = fsverity_get_info(inode);
> +	if (!vi)
> +		return -ENODATA; /* not a verity file */
> +	hash_alg = vi->tree_params.hash_alg;
> +
> +	/*
> +	 * The user specifies the digest_size their buffer has space for; we can
> +	 * return the digest if it fits in the available space.  We write back
> +	 * the actual size, which may be shorter than the user-specified size.
> +	 */
> +
> +	if (get_user(arg.digest_size, &uarg->digest_size))
> +		return -EFAULT;
> +	if (arg.digest_size < hash_alg->digest_size)
> +		return -EOVERFLOW;
> +
> +	memset(&arg, 0, sizeof(arg));
> +	arg.digest_algorithm = hash_alg - fsverity_hash_algs;
> +	arg.digest_size = hash_alg->digest_size;
> +
> +	if (copy_to_user(uarg, &arg, sizeof(arg)))
> +		return -EFAULT;
> +
> +	if (copy_to_user(uarg->digest, vi->measurement, hash_alg->digest_size))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(fsverity_ioctl_measure);
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index 7ef2ef82653409..247359c86b72e0 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -116,6 +116,10 @@ static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
>  
>  extern int fsverity_ioctl_enable(struct file *filp, const void __user *arg);
>  
> +/* measure.c */
> +
> +extern int fsverity_ioctl_measure(struct file *filp, void __user *arg);
> +
>  /* open.c */
>  
>  extern int fsverity_file_open(struct inode *inode, struct file *filp);
> @@ -143,6 +147,13 @@ static inline int fsverity_ioctl_enable(struct file *filp,
>  	return -EOPNOTSUPP;
>  }
>  
> +/* measure.c */
> +
> +static inline int fsverity_ioctl_measure(struct file *filp, void __user *arg)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
>  /* open.c */
>  
>  static inline int fsverity_file_open(struct inode *inode, struct file *filp)
> -- 
> 2.22.0.410.gd8fdbe21b5-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
