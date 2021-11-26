Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBB445F0CF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Nov 2021 16:36:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mqdHM-0004ZN-Cu; Fri, 26 Nov 2021 15:36:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mqdHK-0004ZG-II
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Nov 2021 15:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9sPyh/tM79dP+gIa9UOQq8YC2z2G9fUW1elIUYx/H1c=; b=jbmX/Cpu8yOcjRXnkzIPui6w3D
 1cMibWl3V8lnPQpyB59gnwjZHyNRNHWrXhb0/QOwJsr6EXyIaHFoepR43H3CmYEyueTcAVhIGylmS
 hMl47Eg9HJJcIxZAGOtW2speUVa8+P0U/zbkIUaRxReHtfX4GUcuqJ5T3Bqh5+ld5+JI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9sPyh/tM79dP+gIa9UOQq8YC2z2G9fUW1elIUYx/H1c=; b=D0UTwxpOF1QWnQJ8EDJG3NHBZ/
 XxGzMCDQjeC0mqka3AtYfz+L70OX7StVG+G07CNbNwacSwLL2WJAQKFRDVJZ5QjGcQv2REZBZVZZu
 smacopd7gpqf3qyVH1IiHVyVatj+c5xHC6s6HBssvmVrOrWlWdoTdlYijCffBX6OuJFQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mqdHH-00AF0G-6m
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Nov 2021 15:36:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37D2162280;
 Fri, 26 Nov 2021 15:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A42C93056;
 Fri, 26 Nov 2021 15:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637940068;
 bh=Fa6TGuIztWU+mhxOp7t6mLKVwDR6r2DAjicreLLNpPA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LI1Kr0BdAej3WFqywRZXcrU7ZD+JE8TVsPBHgfemXI6yPtpXF1hFdAY7bksbzmfcu
 fq7/gCuUHPk5f//A4UUueA9h7Iu/wqLmnFk1n6dR1Pq7yVp7BCr+2INe8NfljZsKiA
 Lq4rU1g5eE4YTKgfKhuUiUBs7vEsDp4pN/DxVWWiD6/5qC4ysQ7QgbXQWVGJLoQKTs
 Che+S9DybS95ITZtcIc8hxzyQq2azcW/oh/1hvl46HLBWJHrOFBjG1BfdrEbN5D2kh
 3TvGnzYc9OaulDtnCCY/ylZhaS/6oZf8LGah5ZkX4rAY0kmwrARzKp6nTuhQU2M8tm
 6jHCtUwDHUpng==
Message-ID: <bc37d799-ae77-9ab7-14a3-a70fccb0d454@kernel.org>
Date: Fri, 26 Nov 2021 23:21:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20211126101921.305013-1-changfengnan@vivo.com>
 <20211126101921.305013-2-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211126101921.305013-2-changfengnan@vivo.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/26 18:19, Fengnan Chang wrote: > Previously,
 compressed
 page cache drop when clean page cache, but > POSIX_FADV_DONTNEED can't clean
 compressed page cache because raw page > don't have priv [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mqdHH-00AF0G-6m
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: support POSIX_FADV_DONTNEED
 drop compressed page cache
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/11/26 18:19, Fengnan Chang wrote:
> Previously, compressed page cache drop when clean page cache, but
> POSIX_FADV_DONTNEED can't clean compressed page cache because raw page
> don't have private data, and won't call f2fs_invalidate_compress_pages.
> This commit call f2fs_invalidate_compress_pages() directly in
> f2fs_file_fadvise() for POSIX_FADV_DONTNEED case.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/file.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 32c0bd545c5c..dafdaad9a9e4 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4677,12 +4677,11 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
>   		int advice)
>   {
> -	struct inode *inode;
>   	struct address_space *mapping;
>   	struct backing_dev_info *bdi;
> +	struct inode *inode = file_inode(filp);
>   
>   	if (advice == POSIX_FADV_SEQUENTIAL) {
> -		inode = file_inode(filp);
>   		if (S_ISFIFO(inode->i_mode))
>   			return -ESPIPE;
>   
> @@ -4697,6 +4696,10 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
>   		filp->f_mode &= ~FMODE_RANDOM;
>   		spin_unlock(&filp->f_lock);
>   		return 0;
> +	} else if (advice == POSIX_FADV_DONTNEED) {
> +		if (test_opt(F2FS_I_SB(inode), COMPRESS_CACHE) &&
> +			f2fs_compressed_file(inode))
> +			f2fs_invalidate_compress_pages(F2FS_I_SB(inode), inode->i_ino);
>   	}

Well, how about invalidating compressed pages after generic_fadvise() in order to
check inode status before dropping caches?

Thanks,

>   
>   	return generic_fadvise(filp, offset, len, advice);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
