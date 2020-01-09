Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2DD135A38
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2020 14:35:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipXxt-0003pH-55; Thu, 09 Jan 2020 13:35:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jlayton@kernel.org>) id 1ipXxq-0003p8-KR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jan 2020 13:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xWUsYnLJ/w3X2ZAVB7m0VnN+WtW8bajO5eJCN5aJbGk=; b=F4FFC4Bx/oTCFFSznKhBx+vcF5
 JfXfrqOXYavP3YETiEXt+jpQW3UwREXFu6CW9pGcUW/xBPTXiQTnZurKwXVfq6TAjPsSAYmgQEd/X
 lWtYkcraXNNhF37vbRLZuhXXrXoEk0xphfLFcmKD4eHvi1Lyiwo4npYHXWJ6K+wTTYak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xWUsYnLJ/w3X2ZAVB7m0VnN+WtW8bajO5eJCN5aJbGk=; b=CxEQK7girWgtOp47b5R3LZzfeg
 mkxW81id8BJqv86L/4VeqKZajV1wFdkFoa9CVmxThO2Qm04Qq1+MOAx7jzBGZP2OwPbWiaVVcyZ6d
 SNiEm4YbzMFhkIFrncc9BXQEbr3I98HctCthlt/nnr1qF4ZJSZz9Rj4F2zXk5MHqpsH4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ipXxp-00FpS9-0T
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jan 2020 13:35:06 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E05F20661;
 Thu,  9 Jan 2020 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578576899;
 bh=B5yzemeRMvzL4pKKGwpH7BIBwVJZXFC+F4JbFhOpfek=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=FP854yG1iF6PZ3f6ByuN1p2Ck1GBxOzQ7bJVht0FIaYDlv1ZpMklxdzoRLjXc24xu
 yLKaBtnOxLxgrrHRlvX1FPMkTu5c2imI1AWkgiKt56QokkSQZHzV5fJTLYZBVp6zDp
 o7s2RWwZqfybKsBicS2CNXr6XgOrIP1D8y9ov0kg=
Message-ID: <03e0e79fefcd9e7985a5defce5d5833d3175847a.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>, "Darrick J. Wong"
 <darrick.wong@oracle.com>
Date: Thu, 09 Jan 2020 08:34:56 -0500
In-Reply-To: <20200108131528.4279-1-agruenba@redhat.com>
References: <20200108131528.4279-1-agruenba@redhat.com>
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ipXxp-00FpS9-0T
Subject: Re: [f2fs-dev] [PATCH v4] fs: Fix page_mkwrite off-by-one errors
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
Cc: Jan Kara <jack@suse.cz>, Adrian Hunter <adrian.hunter@intel.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Sage Weil <sage@redhat.com>, Richard Weinberger <richard@nod.at>,
 YueHaibing <yuehaibing@huawei.com>, Christoph Hellwig <hch@infradead.org>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Josef Bacik <josef@toxicpanda.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 2020-01-08 at 14:15 +0100, Andreas Gruenbacher wrote:
> Hi Darrick,
> 
> here's an updated version with the latest feedback incorporated.  Hope
> you find that useful.
> 
> As far as the f2fs merge conflict goes, I've been told by Linus not to
> resolve those kinds of conflicts but to point them out when sending the
> merge request.  So this shouldn't be a big deal.
> 
> Changes:
> 
> * Turn page_mkwrite_check_truncate into a non-inline function.
> * Get rid of now-unused mapping variable in ext4_page_mkwrite.
> * In btrfs_page_mkwrite, don't ignore the return value of
>   block_page_mkwrite_return (no change in behavior).
> * Clean up the f2fs_vm_page_mkwrite changes as suggested by
>   Jaegeuk Kim.
> 
> Thanks,
> Andreas
> 
> --
> 
> The check in block_page_mkwrite that is meant to determine whether an
> offset is within the inode size is off by one.  This bug has been copied
> into iomap_page_mkwrite and several filesystems (ubifs, ext4, f2fs,
> ceph).
> 
> Fix that by introducing a new page_mkwrite_check_truncate helper that
> checks for truncate and computes the bytes in the page up to EOF.  Use
> the helper in the above mentioned filesystems.
> 
> In addition, use the new helper in btrfs as well.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> Acked-by: David Sterba <dsterba@suse.com> (btrfs)
> Acked-by: Richard Weinberger <richard@nod.at> (ubifs)
> Acked-by: Theodore Ts'o <tytso@mit.edu> (ext4)
> Acked-by: Chao Yu <yuchao0@huawei.com> (f2fs)
> ---
>  fs/btrfs/inode.c        | 16 +++++-----------
>  fs/buffer.c             | 16 +++-------------
>  fs/ceph/addr.c          |  2 +-
>  fs/ext4/inode.c         | 15 ++++-----------
>  fs/f2fs/file.c          | 19 +++++++------------
>  fs/iomap/buffered-io.c  | 18 +++++-------------
>  fs/ubifs/file.c         |  3 +--
>  include/linux/pagemap.h |  2 ++
>  mm/filemap.c            | 28 ++++++++++++++++++++++++++++
>  9 files changed, 56 insertions(+), 63 deletions(-)
> 
> diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> index e3c76645cad7..23e6f614e000 100644
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@ -9011,16 +9011,15 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
>  		goto out_noreserve;
>  	}
>  
> -	ret = VM_FAULT_NOPAGE; /* make the VM retry the fault */
>  again:
>  	lock_page(page);
> -	size = i_size_read(inode);
>  
> -	if ((page->mapping != inode->i_mapping) ||
> -	    (page_start >= size)) {
> -		/* page got truncated out from underneath us */
> +	ret2 = page_mkwrite_check_truncate(page, inode);
> +	if (ret2 < 0) {
> +		ret = block_page_mkwrite_return(ret2);
>  		goto out_unlock;
>  	}
> +	zero_start = ret2;
>  	wait_on_page_writeback(page);
>  
>  	lock_extent_bits(io_tree, page_start, page_end, &cached_state);
> @@ -9041,6 +9040,7 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
>  		goto again;
>  	}
>  
> +	size = i_size_read(inode);
>  	if (page->index == ((size - 1) >> PAGE_SHIFT)) {
>  		reserved_space = round_up(size - page_start,
>  					  fs_info->sectorsize);
> @@ -9073,12 +9073,6 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
>  	}
>  	ret2 = 0;
>  
> -	/* page is wholly or partially inside EOF */
> -	if (page_start + PAGE_SIZE > size)
> -		zero_start = offset_in_page(size);
> -	else
> -		zero_start = PAGE_SIZE;
> -
>  	if (zero_start != PAGE_SIZE) {
>  		kaddr = kmap(page);
>  		memset(kaddr + zero_start, 0, PAGE_SIZE - zero_start);
> diff --git a/fs/buffer.c b/fs/buffer.c
> index d8c7242426bb..53aabde57ca7 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -2499,23 +2499,13 @@ int block_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf,
>  	struct page *page = vmf->page;
>  	struct inode *inode = file_inode(vma->vm_file);
>  	unsigned long end;
> -	loff_t size;
>  	int ret;
>  
>  	lock_page(page);
> -	size = i_size_read(inode);
> -	if ((page->mapping != inode->i_mapping) ||
> -	    (page_offset(page) > size)) {
> -		/* We overload EFAULT to mean page got truncated */
> -		ret = -EFAULT;
> +	ret = page_mkwrite_check_truncate(page, inode);
> +	if (ret < 0)
>  		goto out_unlock;
> -	}
> -
> -	/* page is wholly or partially inside EOF */
> -	if (((page->index + 1) << PAGE_SHIFT) > size)
> -		end = size & ~PAGE_MASK;
> -	else
> -		end = PAGE_SIZE;
> +	end = ret;
>  
>  	ret = __block_write_begin(page, 0, end, get_block);
>  	if (!ret)
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 7ab616601141..ef958aa4adb4 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -1575,7 +1575,7 @@ static vm_fault_t ceph_page_mkwrite(struct vm_fault *vmf)
>  	do {
>  		lock_page(page);
>  
> -		if ((off > size) || (page->mapping != inode->i_mapping)) {
> +		if (page_mkwrite_check_truncate(page, inode) < 0) {
>  			unlock_page(page);
>  			ret = VM_FAULT_NOPAGE;
>  			break;


You can add my Acked-by on the ceph part.

-- 
Jeff Layton <jlayton@kernel.org>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
