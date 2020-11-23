Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C402C1353
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Nov 2020 19:50:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khGuk-0000Xk-Tt; Mon, 23 Nov 2020 18:50:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1khGt6-0000SJ-HO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 18:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nIx8Gbhqw1B+pAnBSnUJZq0OeejW3o9RJBuJ0feFx1w=; b=d0aeY7EMZ5hWosEYUnmOjR8EXH
 XXWJKjZrD1bIX44IlzAIwrX31s5D75nDjpD9Z4gNA1H4WlNUeUGnGQ5sq34aHyM+YTdKP939fruKq
 2m7K4mZzSJtN/YUsiwfGXWbtQ5zZfSJmxO5BuEdC+T6mzdGUzCFY36OfDCKDrK1TIoYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nIx8Gbhqw1B+pAnBSnUJZq0OeejW3o9RJBuJ0feFx1w=; b=VXto0qTmv2X7bETebRX3I2fGo6
 AowQNrK9j4imNeWlb+KtSP+DcLpAMdQkWXKKxzc1e7QTAC1eg3spG86m1GUDEUJ2YxVf2kYjU+tW1
 iDoCOboi9l0zLWSYK4lnsmLRWkKVNg83tsD5fligXHfwS+UAbMtyCHQ5wmgpedH8Z6+g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1khGt2-000uqy-EU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 18:48:32 +0000
Received: from gmail.com (unknown [104.132.1.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A53E120657;
 Mon, 23 Nov 2020 18:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606157302;
 bh=5y8zxaS7HSYEX0hSfqLUMG8rA06A+WPmDFXRVahf/64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uaRHRv6Mf58ZDhI+8qZXP+gdX6+8yOcMoYxj+x8S1b1vIrbKw/r2zQ7LrT/TOXzG9
 Tb17uTUZhk0dWzO5GItPJpEJCAD2sJM4+VJtUL0/2hTySeIAv+1DL8cwEV6QBbNJ4Z
 h1//GrJOKMpcsVy896j3oGN1vSJu6FjsFLqCqZ/E=
Date: Mon, 23 Nov 2020 10:48:21 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20201123184821.GB3694916@gmail.com>
References: <20201123031751.36811-1-daeho43@gmail.com>
 <20201123031751.36811-2-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123031751.36811-2-daeho43@gmail.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1khGt2-000uqy-EU
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add F2FS_IOC_DECOMPRESS_FILE and
 F2FS_IOC_COMPRESS_FILE
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 23, 2020 at 12:17:51PM +0900, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added two ioctl to decompress/compress explicitly the compression
> enabled file in "compress_mode=user-based" mount option.
> 
> Using these two ioctls, the users can make a control of compression
> and decompression of their files.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/file.c            | 181 +++++++++++++++++++++++++++++++++++++-
>  include/uapi/linux/f2fs.h |   2 +
>  2 files changed, 182 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index be8db06aca27..e8f142470e87 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4026,6 +4026,180 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>  	return ret;
>  }
>  
> +static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
> +{
> +	DEFINE_READAHEAD(ractl, NULL, inode->i_mapping, page_idx);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct address_space *mapping = inode->i_mapping;
> +	struct page *page;
> +	pgoff_t redirty_idx = page_idx;
> +	int i, page_len = 0, ret = 0;
> +
> +	page_cache_ra_unbounded(&ractl, len, 0);

Using page_cache_ra_unbounded() here looks wrong.  See the comment above
page_cache_ra_unbounded().

>  static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>  	switch (cmd) {
> @@ -4113,6 +4287,10 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return f2fs_ioc_get_compress_option(filp, arg);
>  	case F2FS_IOC_SET_COMPRESS_OPTION:
>  		return f2fs_ioc_set_compress_option(filp, arg);
> +	case F2FS_IOC_DECOMPRESS_FILE:
> +		return f2fs_ioc_decompress_file(filp, arg);
> +	case F2FS_IOC_COMPRESS_FILE:
> +		return f2fs_ioc_compress_file(filp, arg);
>  	default:
>  		return -ENOTTY;
>  	}

Where is the documentation and tests for these new ioctls?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
