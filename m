Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B177D306A47
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Jan 2021 02:20:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4vzP-0004fp-39; Thu, 28 Jan 2021 01:20:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1l4vzK-0004fZ-Gx
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 01:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UiRKydvGEQjWiUF6HCcHhl3Mjr+DlJt7Uebsj0mpOAo=; b=GKtllzc/n9Czq4fY06pEPmaF4X
 lUfKLsHUzLHYM8U/MwctO6G+KkDn+DKu1zCFJcDqwPXT7ysSMS7KS9WC5JakEhokALQNNXk/5e3/G
 UpXewNYg0avi6vjUTss+XWKkvuFzppLxY+Vq9LTJ8qEitajc9TNEDrMb6g0zfiWdM2co=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UiRKydvGEQjWiUF6HCcHhl3Mjr+DlJt7Uebsj0mpOAo=; b=Cmz/HEOlEZ8CsD5ipP342BOyqN
 GwtY3ysdN0qMaUnyxrc/VOkouNe7MAVixJ9fsej6ukwQC6YCfdG3Ybs8dqgjgMtrpHRYiulRkhunF
 Tedq8qdnh6MacazDL7tutpUtJNKCkxepyQjUTtOtZoFL1Jh6m1MhawgreaRhAOzqZJeU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4vzH-00CfnH-IY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 01:20:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DC8960C40;
 Thu, 28 Jan 2021 01:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611796242;
 bh=v3T7ujwKzSnkDtCCImiUZpKv0YgdS5KXdKZ00euqCw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RV991imw0fVh9WuRc7VZ1451DK+8xNudMlmBSu97HfL/HcAG9EyJ1e7YNloQE4ILz
 elCgFA61wcaut5wzKbnnk0ifs0RqDiLl723PFM9yyMWgnrRpNhKQxPfoG+XgvL1kUy
 6XlI59+no6iuAZSuD5reFegb6Qb9+WUT9LWC57KFskhN80VGRPn/QMZer4GyYh9gNk
 d7yXXDc+QS4mYUHJnrhMH0ElxbMnh4dqMZ7u/itMFe7DChNCgDNEo0tngRwOrRk/0i
 uj0s1HyPFsKM1vELAsrjK1+RWRRBPjBj4kV82JwQ4ZQbhmIZ/FASrnPH+4oWOAT5AF
 E/nbh2iHNYlMg==
Date: Wed, 27 Jan 2021 17:10:39 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YBIPD53iVg1US++r@google.com>
References: <20210115181819.34732-1-ebiggers@kernel.org>
 <20210115181819.34732-5-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115181819.34732-5-ebiggers@kernel.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l4vzH-00CfnH-IY
Subject: Re: [f2fs-dev] [PATCH 4/6] fs-verity: support reading Merkle tree
 with ioctl
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/15, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add support for FS_VERITY_METADATA_TYPE_MERKLE_TREE to
> FS_IOC_READ_VERITY_METADATA.  This allows a userspace server program to
> retrieve the Merkle tree of a verity file for serving to a client which
> implements fs-verity compatible verification.  See the patch which
> introduced FS_IOC_READ_VERITY_METADATA for more details.
> 
> This has been tested using a new xfstest which calls this ioctl via a
> new subcommand for the 'fsverity' program from fsverity-utils.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  Documentation/filesystems/fsverity.rst | 10 +++-
>  fs/verity/read_metadata.c              | 70 ++++++++++++++++++++++++++
>  include/uapi/linux/fsverity.h          |  2 +
>  3 files changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
> index 9ef7a7de60085..50b47a6d9ea11 100644
> --- a/Documentation/filesystems/fsverity.rst
> +++ b/Documentation/filesystems/fsverity.rst
> @@ -234,6 +234,8 @@ need this ioctl.
>  
>  This ioctl takes in a pointer to the following structure::
>  
> +   #define FS_VERITY_METADATA_TYPE_MERKLE_TREE     1
> +
>     struct fsverity_read_metadata_arg {
>             __u64 metadata_type;
>             __u64 offset;
> @@ -242,7 +244,13 @@ This ioctl takes in a pointer to the following structure::
>             __u64 __reserved;
>     };
>  
> -``metadata_type`` specifies the type of metadata to read.
> +``metadata_type`` specifies the type of metadata to read:
> +
> +- ``FS_VERITY_METADATA_TYPE_MERKLE_TREE`` reads the blocks of the
> +  Merkle tree.  The blocks are returned in order from the root level
> +  to the leaf level.  Within each level, the blocks are returned in
> +  the same order that their hashes are themselves hashed.
> +  See `Merkle tree`_ for more information.
>  
>  The semantics are similar to those of ``pread()``.  ``offset``
>  specifies the offset in bytes into the metadata item to read from, and
> diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
> index 43be990fd53e4..0f8ad2991cf90 100644
> --- a/fs/verity/read_metadata.c
> +++ b/fs/verity/read_metadata.c
> @@ -7,8 +7,75 @@
>  
>  #include "fsverity_private.h"
>  
> +#include <linux/backing-dev.h>
> +#include <linux/highmem.h>
> +#include <linux/sched/signal.h>
>  #include <linux/uaccess.h>
>  
> +static int fsverity_read_merkle_tree(struct inode *inode,
> +				     const struct fsverity_info *vi,
> +				     void __user *buf, u64 offset, int length)
> +{
> +	const struct fsverity_operations *vops = inode->i_sb->s_vop;
> +	u64 end_offset;
> +	unsigned int offs_in_page;
> +	pgoff_t index, last_index;
> +	int retval = 0;
> +	int err = 0;
> +
> +	end_offset = min(offset + length, vi->tree_params.tree_size);
> +	if (offset >= end_offset)
> +		return 0;
> +	offs_in_page = offset_in_page(offset);
> +	last_index = (end_offset - 1) >> PAGE_SHIFT;
> +
> +	/*
> +	 * Iterate through each Merkle tree page in the requested range and copy
> +	 * the requested portion to userspace.  Note that the Merkle tree block
> +	 * size isn't important here, as we are returning a byte stream; i.e.,
> +	 * we can just work with pages even if the tree block size != PAGE_SIZE.
> +	 */
> +	for (index = offset >> PAGE_SHIFT; index <= last_index; index++) {
> +		unsigned long num_ra_pages =
> +			min_t(unsigned long, last_index - index + 1,
> +			      inode->i_sb->s_bdi->io_pages);
> +		unsigned int bytes_to_copy = min_t(u64, end_offset - offset,
> +						   PAGE_SIZE - offs_in_page);
> +		struct page *page;
> +		const void *virt;
> +
> +		page = vops->read_merkle_tree_page(inode, index, num_ra_pages);
> +		if (IS_ERR(page)) {
> +			err = PTR_ERR(page);
> +			fsverity_err(inode,
> +				     "Error %d reading Merkle tree page %lu",
> +				     err, index);
> +			break;
> +		}
> +
> +		virt = kmap(page);
> +		if (copy_to_user(buf, virt + offs_in_page, bytes_to_copy)) {
> +			kunmap(page);
> +			put_page(page);
> +			err = -EFAULT;
> +			break;
> +		}
> +		kunmap(page);
> +		put_page(page);
> +
> +		retval += bytes_to_copy;
> +		buf += bytes_to_copy;
> +		offset += bytes_to_copy;
> +
> +		if (fatal_signal_pending(current))  {
> +			err = -EINTR;
> +			break;
> +		}
> +		cond_resched();
> +		offs_in_page = 0;
> +	}

Minor thought:
How about invalidating or truncating merkel tree pages?

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> +	return retval ? retval : err;
> +}
>  /**
>   * fsverity_ioctl_read_metadata() - read verity metadata from a file
>   * @filp: file to read the metadata from
> @@ -48,6 +115,9 @@ int fsverity_ioctl_read_metadata(struct file *filp, const void __user *uarg)
>  	buf = u64_to_user_ptr(arg.buf_ptr);
>  
>  	switch (arg.metadata_type) {
> +	case FS_VERITY_METADATA_TYPE_MERKLE_TREE:
> +		return fsverity_read_merkle_tree(inode, vi, buf, arg.offset,
> +						 length);
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/linux/fsverity.h b/include/uapi/linux/fsverity.h
> index e062751294d01..94003b153cb3d 100644
> --- a/include/uapi/linux/fsverity.h
> +++ b/include/uapi/linux/fsverity.h
> @@ -83,6 +83,8 @@ struct fsverity_formatted_digest {
>  	__u8 digest[];
>  };
>  
> +#define FS_VERITY_METADATA_TYPE_MERKLE_TREE	1
> +
>  struct fsverity_read_metadata_arg {
>  	__u64 metadata_type;
>  	__u64 offset;
> -- 
> 2.30.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
