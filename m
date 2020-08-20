Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB30924C328
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Aug 2020 18:14:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k8nCa-0001f5-5v; Thu, 20 Aug 2020 16:14:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1k8nCY-0001eq-KJ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Aug 2020 16:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O3oHFqZU1XlIyDoXJ5Eacn0vCBlnMiEPFl+Lk35kd5s=; b=QbHtkM4g26cxsSXGgOALkaJv0p
 CmqnECYG64hPQzx76Jlm9vrUOPNFfIELzKkr2NRT2K7gSBDGLr+EqA8CSF2XvetZKRkVyCEgg0rIe
 OW2gra1voyysHua9584mzhB+p76hlONYLw20HZC8DcRNo3EhT1p8fDL5i9rz4k3hAgOI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O3oHFqZU1XlIyDoXJ5Eacn0vCBlnMiEPFl+Lk35kd5s=; b=AwexrfMYXN1iJags5eJVB2/M9j
 Ze9UeQB/vI0y7AyIppl23HnuweaDPGsldb/Yw9BbaUTPXGn3JnE9VJh0Hp4mFFLalcE0ZBix5qHRV
 GimsSAXALzwkG0bxpr+Euqitt7b5C4J61Wq/rJftheQmlSeguHrNl0vHaENW9y5fB+mE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8nCX-00Ddzy-G6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Aug 2020 16:14:06 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B0E52072D;
 Thu, 20 Aug 2020 16:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597940040;
 bh=inkVScu8YnKW3Kj0Rfpvc2K7aHPX6KN8CibER59mPLQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sxxGeEcRfnwmJsuNNrTDEE+A1l8deIPxTlbxMr1/Ar3BlerSBgFtdGkOf4fWdkniC
 WQQa2qabyiQRBWWWB6Y/NGw6bPC+E9Umpdz0puGiqXG96sVrkYwIkni/IrBZ44hEaI
 TxmFbqY/5afDE/jc4evMaVg9y1WjFfmCGTwcjgrQ=
Date: Thu, 20 Aug 2020 09:13:59 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200820161359.GB2375181@google.com>
References: <20200819200731.2972195-1-krisman@collabora.com>
 <20200819200731.2972195-3-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819200731.2972195-3-krisman@collabora.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1k8nCX-00Ddzy-G6
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: Return EOF on unaligned end of
 file DIO read
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
Cc: linux-fsdevel@vger.kernel.org, kernel@collabora.com,
 viro@zeniv.linux.org.uk, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Gabriel,

Thank you for the patch. Let me take this separately from the patch set.

Thanks,

On 08/19, Gabriel Krisman Bertazi wrote:
> Reading past end of file returns EOF for aligned reads but -EINVAL for
> unaligned reads on f2fs.  While documentation is not strict about this
> corner case, most filesystem returns EOF on this case, like iomap
> filesystems.  This patch consolidates the behavior for f2fs, by making
> it return EOF(0).
> 
> it can be verified by a read loop on a file that does a partial read
> before EOF (A file that doesn't end at an aligned address).  The
> following code fails on an unaligned file on f2fs, but not on
> btrfs, ext4, and xfs.
> 
>   while (done < total) {
>     ssize_t delta = pread(fd, buf + done, total - done, off + done);
>     if (!delta)
>       break;
>     ...
>   }
> 
> It is arguable whether filesystems should actually return EOF or
> -EINVAL, but since iomap filesystems support it, and so does the
> original DIO code, it seems reasonable to consolidate on that.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  fs/f2fs/data.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 5f527073143e..d9834ffe1da9 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3510,6 +3510,9 @@ static int check_direct_IO(struct inode *inode, struct iov_iter *iter,
>  	unsigned long align = offset | iov_iter_alignment(iter);
>  	struct block_device *bdev = inode->i_sb->s_bdev;
>  
> +	if (iov_iter_rw(iter) == READ && offset >= i_size_read(inode))
> +		return 1;
> +
>  	if (align & blocksize_mask) {
>  		if (bdev)
>  			blkbits = blksize_bits(bdev_logical_block_size(bdev));
> -- 
> 2.28.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
