Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9602221DF65
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2020 20:12:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jv2vo-000284-MZ; Mon, 13 Jul 2020 18:12:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jv2vn-00027w-HB
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jul 2020 18:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xSOP0QFOG5fFneajdFhrd/NuffTypQWDrXBYpLC2h54=; b=l7wBAHOi8ZlAtQfkpIcdavg5oC
 rM6S4WaCANItBWKe5Bdf8yViNqm9AT3gzpi4STb101Y3daohAmmKnHRwpEmE2FyvelsFQZGUnWsbF
 8a8BwWIAIS4LDNsA1UlynCVZgTi4qNaZ0qHvvv8IIYFkSBfnntUMn9r8zVyr1p2BBCss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xSOP0QFOG5fFneajdFhrd/NuffTypQWDrXBYpLC2h54=; b=JX93vYBMMSUvG8ILiXFg6F8EfO
 YZ0IhP+VB9YyhbIONi9pE1AuiyLOfyz58hrXIvJ171tNMQ7NbEpzf7KKw4LBVhcjTOWqxGE2+CIXx
 Lc+2QLBbCAT4M4qzyB2n4ocQnzqoBM+Qjs1wvDcFuYfvcExbCTGS5i8ADn7daoK3f648=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jv2vm-005lkD-4a
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jul 2020 18:11:59 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1DC92067D;
 Mon, 13 Jul 2020 18:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594663912;
 bh=EU4XBUKixkiBQkaZjve6Zl3d8EFVm2Xr3DvAAaRr9v8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u3FM4191eqbzPrCOk4wonTAFKU839z1y72CQ7CG/VQrqIhDysamckyPYvP2M5CG9x
 QqUkL6WCl4ZUrs6hVIJkYShQ346si7hwOtESi9PWTx43Q0inHqphIWL2KRkYcKBkUs
 i79cEVoYHX/hPgGFKVqMSjQgQaC9iV6lqbANXEms=
Date: Mon, 13 Jul 2020 11:11:52 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200713181152.GC2910046@google.com>
References: <20200713031252.3873546-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713031252.3873546-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jv2vm-005lkD-4a
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: change the way of handling
 range.len in F2FS_IOC_SEC_TRIM_FILE
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

Hi Daeho,

Please take a look at this.

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=35245180459aebf6d70fde88a538f0400a794aa6

Thanks,

On 07/13, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Changed the way of handling range.len of F2FS_IOC_SEC_TRIM_FILE.
>  1. Added -1 value support for range.len to secure trim the whole blocks
>     starting from range.start regardless of i_size.
>  2. If the end of the range passes over the end of file, it means until
>     the end of file (i_size).
>  3. ignored the case of that range.len is zero to prevent the function
>     from making end_addr zero and triggering different behaviour of
>     the function.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> Changes in v2:
>  - Changed -1 range.len option to mean the whole blocks starting from
>    range.start regardless of i_size
> ---
>  fs/f2fs/file.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 368c80f8e2a1..2485841e3b2d 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3792,7 +3792,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>  	pgoff_t index, pg_end;
>  	block_t prev_block = 0, len = 0;
>  	loff_t end_addr;
> -	bool to_end;
> +	bool to_end = false;
>  	int ret = 0;
>  
>  	if (!(filp->f_mode & FMODE_WRITE))
> @@ -3813,23 +3813,23 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>  	file_start_write(filp);
>  	inode_lock(inode);
>  
> -	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
> +	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode) ||
> +			range.start >= inode->i_size) {
>  		ret = -EINVAL;
>  		goto err;
>  	}
>  
> -	if (range.start >= inode->i_size) {
> -		ret = -EINVAL;
> +	if (range.len == 0)
>  		goto err;
> -	}
>  
> -	if (inode->i_size - range.start < range.len) {
> -		ret = -E2BIG;
> -		goto err;
> +	if (inode->i_size - range.start > range.len) {
> +		end_addr = range.start + range.len;
> +	} else {
> +		end_addr = range.len == (u64)-1 ?
> +			sbi->sb->s_maxbytes : inode->i_size;
> +		to_end = true;
>  	}
> -	end_addr = range.start + range.len;
>  
> -	to_end = (end_addr == inode->i_size);
>  	if (!IS_ALIGNED(range.start, F2FS_BLKSIZE) ||
>  			(!to_end && !IS_ALIGNED(end_addr, F2FS_BLKSIZE))) {
>  		ret = -EINVAL;
> @@ -3846,7 +3846,8 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>  	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  	down_write(&F2FS_I(inode)->i_mmap_sem);
>  
> -	ret = filemap_write_and_wait_range(mapping, range.start, end_addr - 1);
> +	ret = filemap_write_and_wait_range(mapping, range.start,
> +			to_end ? LLONG_MAX : end_addr - 1);
>  	if (ret)
>  		goto out;
>  
> -- 
> 2.27.0.383.g050319c2ae-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
