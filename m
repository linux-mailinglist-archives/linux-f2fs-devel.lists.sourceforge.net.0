Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28086306A72
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Jan 2021 02:36:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4wE3-0007uN-U2; Thu, 28 Jan 2021 01:35:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1l4wE1-0007u4-Rn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 01:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nIK+EkISMgBW+3QAdlp2jc0EuZJDoGUFsqFb7iGmQso=; b=UC9PqSNAVtRjSN0NUztkZMpb8g
 32JceEGjxHNR+oy89D77IqHfkQEhsPZHrW+nbATQ3nOA6w3nsoAT2J/udrKTGCTqZkD6Y1aDBLlg6
 MZ81hMAbtTBUnB41CBF1A/NfDi9fsKAfKd4OoNSu8/kVFIsLi2Xwwaz2d+CKqHoGyDqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nIK+EkISMgBW+3QAdlp2jc0EuZJDoGUFsqFb7iGmQso=; b=ehwmRZiUK55pphqHvwaJisZdrV
 HW4+LlqOCdIIgY/aMZy9eO9BwyUXIIhQrye2FFQjTS2raxHk9YU4ScuI5CE+PthZFOVG1jwoq6ycy
 wpjR630953noukIpK6rmq9i85b/cRt9zuSMK6erO8+4BVnHOwWw8OW0ImySjfLPT0m/I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4wDn-00FY2U-Gt
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 01:35:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16B9F64DBD;
 Thu, 28 Jan 2021 01:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611796276;
 bh=/Oilbb/ZZgtI9SkGEjwZzZmBkyn7LM79p8zwItCMxtc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K41HnkPDh/xwHbUR9OrfWQtouLDVZAsS0qFXYGJycfwFM1vxZ5fc+CAZxG1Bifigw
 0aHGw7RWaecdeAhDIg8IGmPQL1fRYzhfrBDI52nI0W3LroqedZGNIkRomC7em1gYdz
 MtVwl1aDA+k+T58788eXVA3CINl75CKl3ZDkPhk071i23c0W/7ydsnWIrfoS45pAik
 uX33yfGFCI+dHcxAtFKBULxSK67iOtJlqAqX/9ce/JAdDgLcVi86ijrvKy9YqJyjl4
 qD/G0oHfRCyeW8d32chpwoGmY5N6VFcWgXuliJQa2edUUVcsR6Zqui9FYYgt/thoOW
 Lw41gGul7ee4w==
Date: Wed, 27 Jan 2021 17:11:14 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YBIPMsl+X8alg09e@google.com>
References: <20210115181819.34732-1-ebiggers@kernel.org>
 <20210115181819.34732-6-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115181819.34732-6-ebiggers@kernel.org>
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
X-Headers-End: 1l4wDn-00FY2U-Gt
Subject: Re: [f2fs-dev] [PATCH 5/6] fs-verity: support reading descriptor
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
> Add support for FS_VERITY_METADATA_TYPE_DESCRIPTOR to
> FS_IOC_READ_VERITY_METADATA.  This allows a userspace server program to
> retrieve the fs-verity descriptor of a file for serving to a client
> which implements fs-verity compatible verification.  See the patch which
> introduced FS_IOC_READ_VERITY_METADATA for more details.
> 
> "fs-verity descriptor" here means only the part that userspace cares
> about because it is hashed to produce the file digest.  It doesn't
> include the signature which ext4 and f2fs append to the
> fsverity_descriptor struct when storing it on-disk, since that way of
> storing the signature is an implementation detail.  The next patch adds
> a separate metadata_type value for retrieving the signature separately.
> 
> This has been tested using a new xfstest which calls this ioctl via a
> new subcommand for the 'fsverity' program from fsverity-utils.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  Documentation/filesystems/fsverity.rst |  4 +++
>  fs/verity/read_metadata.c              | 40 ++++++++++++++++++++++++++
>  include/uapi/linux/fsverity.h          |  1 +
>  3 files changed, 45 insertions(+)
> 
> diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
> index 50b47a6d9ea11..6dc5772037ef9 100644
> --- a/Documentation/filesystems/fsverity.rst
> +++ b/Documentation/filesystems/fsverity.rst
> @@ -235,6 +235,7 @@ need this ioctl.
>  This ioctl takes in a pointer to the following structure::
>  
>     #define FS_VERITY_METADATA_TYPE_MERKLE_TREE     1
> +   #define FS_VERITY_METADATA_TYPE_DESCRIPTOR      2
>  
>     struct fsverity_read_metadata_arg {
>             __u64 metadata_type;
> @@ -252,6 +253,9 @@ This ioctl takes in a pointer to the following structure::
>    the same order that their hashes are themselves hashed.
>    See `Merkle tree`_ for more information.
>  
> +- ``FS_VERITY_METADATA_TYPE_DESCRIPTOR`` reads the fs-verity
> +  descriptor.  See `fs-verity descriptor`_.
> +
>  The semantics are similar to those of ``pread()``.  ``offset``
>  specifies the offset in bytes into the metadata item to read from, and
>  ``length`` specifies the maximum number of bytes to read from the
> diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
> index 0f8ad2991cf90..2dea6dd3bb05a 100644
> --- a/fs/verity/read_metadata.c
> +++ b/fs/verity/read_metadata.c
> @@ -76,6 +76,44 @@ static int fsverity_read_merkle_tree(struct inode *inode,
>  	}
>  	return retval ? retval : err;
>  }
> +
> +/* Copy the requested portion of the buffer to userspace. */
> +static int fsverity_read_buffer(void __user *dst, u64 offset, int length,
> +				const void *src, size_t src_length)
> +{
> +	if (offset >= src_length)
> +		return 0;
> +	src += offset;
> +	src_length -= offset;
> +
> +	length = min_t(size_t, length, src_length);
> +
> +	if (copy_to_user(dst, src, length))
> +		return -EFAULT;
> +
> +	return length;
> +}
> +
> +static int fsverity_read_descriptor(struct inode *inode,
> +				    void __user *buf, u64 offset, int length)
> +{
> +	struct fsverity_descriptor *desc;
> +	size_t desc_size;
> +	int res;
> +
> +	res = fsverity_get_descriptor(inode, &desc, &desc_size);
> +	if (res)
> +		return res;
> +
> +	/* don't include the signature */
> +	desc_size = offsetof(struct fsverity_descriptor, signature);
> +	desc->sig_size = 0;
> +
> +	res = fsverity_read_buffer(buf, offset, length, desc, desc_size);
> +
> +	kfree(desc);
> +	return res;
> +}
>  /**
>   * fsverity_ioctl_read_metadata() - read verity metadata from a file
>   * @filp: file to read the metadata from
> @@ -118,6 +156,8 @@ int fsverity_ioctl_read_metadata(struct file *filp, const void __user *uarg)
>  	case FS_VERITY_METADATA_TYPE_MERKLE_TREE:
>  		return fsverity_read_merkle_tree(inode, vi, buf, arg.offset,
>  						 length);
> +	case FS_VERITY_METADATA_TYPE_DESCRIPTOR:
> +		return fsverity_read_descriptor(inode, buf, arg.offset, length);
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/linux/fsverity.h b/include/uapi/linux/fsverity.h
> index 94003b153cb3d..41abc283dbccb 100644
> --- a/include/uapi/linux/fsverity.h
> +++ b/include/uapi/linux/fsverity.h
> @@ -84,6 +84,7 @@ struct fsverity_formatted_digest {
>  };
>  
>  #define FS_VERITY_METADATA_TYPE_MERKLE_TREE	1
> +#define FS_VERITY_METADATA_TYPE_DESCRIPTOR	2
>  
>  struct fsverity_read_metadata_arg {
>  	__u64 metadata_type;
> -- 
> 2.30.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
