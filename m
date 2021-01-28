Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEA03069BF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Jan 2021 02:11:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4vqb-0000Jd-OZ; Thu, 28 Jan 2021 01:11:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1l4vqZ-0000JV-PX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 01:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7k8qWghpLM9/TlsqKQtlJb3lNrDX7WpzpfRXZc8yvhM=; b=FMmitCQxKAbIFAMGAR+Wm9T26D
 ctUfBMhl3WGhDMpiLVbSwfegHobFCT+LY3SGkfKy4wuwRoQ2DXs+2DbHW5FszPylQcNyuAMvTvd8w
 +o52P5CdiFxiBiXTCp6HtzEo3Xmh/c+C9yoxuRlb9pHyvdfVOqDrgRs3pXrqz+tL/RZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7k8qWghpLM9/TlsqKQtlJb3lNrDX7WpzpfRXZc8yvhM=; b=No3sVLJrwB5pzJXlACotZiqgYm
 lFtn77XTNM89wp7F4NMTcZuNS6LusMwvuBsG47uMMbm8TwufkKqX54fF9IM5c+nBVX0KwFJNTI5YZ
 2aqEjHiwiLnkR5FnwUm39v2FPzkkYhzVVP/7voDDCUrcl40qPel2Gjlk2J8B1xAyx+aE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4vqW-00CeGN-JX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 01:11:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C716E64DDF;
 Thu, 28 Jan 2021 01:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611796290;
 bh=3FKSeGnFSwLkGexruEOmwHRIKSYHxicnwpAlMSpiAT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h/ERDr1EtOYI56UIZB9j2JNHozqDhWyX+bjnXABK2JTnrz8WrPrA2NdNmR0S9Vwr9
 lCeyOi7twFAPbik55xmmPhKyASSD6zfxImNaOv48LzamOPI5XseRZvAgrmHnbUyhJS
 a2ds6MwGuxgOJRvJMdqSRxff+ar+YatPn0QgEzuJ6NbH87qnMp1L5myO7J0pNt4LXm
 wSnzuUHTIWHRh6N5cKhi/twUilgk4nPUTj5KxVVW2mkmCXZlkr8V4hFmuhLnpb4tSn
 VA4e39wM1WfUKoBlSW3DsRlxU0/jt+jFHv7xTXzUR9SdZVZXnqazqZCy/SMpOmbsQY
 3N/OLFEoH0yqw==
Date: Wed, 27 Jan 2021 17:11:28 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YBIPQOGtzsTUFsNg@google.com>
References: <20210115181819.34732-1-ebiggers@kernel.org>
 <20210115181819.34732-7-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115181819.34732-7-ebiggers@kernel.org>
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
X-Headers-End: 1l4vqW-00CeGN-JX
Subject: Re: [f2fs-dev] [PATCH 6/6] fs-verity: support reading signature
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
> Add support for FS_VERITY_METADATA_TYPE_SIGNATURE to
> FS_IOC_READ_VERITY_METADATA.  This allows a userspace server program to
> retrieve the built-in signature (if present) of a verity file for
> serving to a client which implements fs-verity compatible verification.
> See the patch which introduced FS_IOC_READ_VERITY_METADATA for more
> details.
> 
> The ability for userspace to read the built-in signatures is also useful
> because it allows a system that is using the in-kernel signature
> verification to migrate to userspace signature verification.
> 
> This has been tested using a new xfstest which calls this ioctl via a
> new subcommand for the 'fsverity' program from fsverity-utils.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  Documentation/filesystems/fsverity.rst |  9 +++++++-
>  fs/verity/read_metadata.c              | 30 ++++++++++++++++++++++++++
>  include/uapi/linux/fsverity.h          |  1 +
>  3 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
> index 6dc5772037ef9..1d831e3cbcb33 100644
> --- a/Documentation/filesystems/fsverity.rst
> +++ b/Documentation/filesystems/fsverity.rst
> @@ -236,6 +236,7 @@ This ioctl takes in a pointer to the following structure::
>  
>     #define FS_VERITY_METADATA_TYPE_MERKLE_TREE     1
>     #define FS_VERITY_METADATA_TYPE_DESCRIPTOR      2
> +   #define FS_VERITY_METADATA_TYPE_SIGNATURE       3
>  
>     struct fsverity_read_metadata_arg {
>             __u64 metadata_type;
> @@ -256,6 +257,10 @@ This ioctl takes in a pointer to the following structure::
>  - ``FS_VERITY_METADATA_TYPE_DESCRIPTOR`` reads the fs-verity
>    descriptor.  See `fs-verity descriptor`_.
>  
> +- ``FS_VERITY_METADATA_TYPE_SIGNATURE`` reads the signature which was
> +  passed to FS_IOC_ENABLE_VERITY, if any.  See `Built-in signature
> +  verification`_.
> +
>  The semantics are similar to those of ``pread()``.  ``offset``
>  specifies the offset in bytes into the metadata item to read from, and
>  ``length`` specifies the maximum number of bytes to read from the
> @@ -279,7 +284,9 @@ FS_IOC_READ_VERITY_METADATA can fail with the following errors:
>  - ``EINTR``: the ioctl was interrupted before any data was read
>  - ``EINVAL``: reserved fields were set, or ``offset + length``
>    overflowed
> -- ``ENODATA``: the file is not a verity file
> +- ``ENODATA``: the file is not a verity file, or
> +  FS_VERITY_METADATA_TYPE_SIGNATURE was requested but the file doesn't
> +  have a built-in signature
>  - ``ENOTTY``: this type of filesystem does not implement fs-verity, or
>    this ioctl is not yet implemented on it
>  - ``EOPNOTSUPP``: the kernel was not configured with fs-verity
> diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
> index 2dea6dd3bb05a..7e2d0c7bdf0de 100644
> --- a/fs/verity/read_metadata.c
> +++ b/fs/verity/read_metadata.c
> @@ -114,6 +114,34 @@ static int fsverity_read_descriptor(struct inode *inode,
>  	kfree(desc);
>  	return res;
>  }
> +
> +static int fsverity_read_signature(struct inode *inode,
> +				   void __user *buf, u64 offset, int length)
> +{
> +	struct fsverity_descriptor *desc;
> +	size_t desc_size;
> +	int res;
> +
> +	res = fsverity_get_descriptor(inode, &desc, &desc_size);
> +	if (res)
> +		return res;
> +
> +	if (desc->sig_size == 0) {
> +		res = -ENODATA;
> +		goto out;
> +	}
> +
> +	/*
> +	 * Include only the signature.  Note that fsverity_get_descriptor()
> +	 * already verified that sig_size is in-bounds.
> +	 */
> +	res = fsverity_read_buffer(buf, offset, length, desc->signature,
> +				   le32_to_cpu(desc->sig_size));
> +out:
> +	kfree(desc);
> +	return res;
> +}
> +
>  /**
>   * fsverity_ioctl_read_metadata() - read verity metadata from a file
>   * @filp: file to read the metadata from
> @@ -158,6 +186,8 @@ int fsverity_ioctl_read_metadata(struct file *filp, const void __user *uarg)
>  						 length);
>  	case FS_VERITY_METADATA_TYPE_DESCRIPTOR:
>  		return fsverity_read_descriptor(inode, buf, arg.offset, length);
> +	case FS_VERITY_METADATA_TYPE_SIGNATURE:
> +		return fsverity_read_signature(inode, buf, arg.offset, length);
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/linux/fsverity.h b/include/uapi/linux/fsverity.h
> index 41abc283dbccb..15384e22e331e 100644
> --- a/include/uapi/linux/fsverity.h
> +++ b/include/uapi/linux/fsverity.h
> @@ -85,6 +85,7 @@ struct fsverity_formatted_digest {
>  
>  #define FS_VERITY_METADATA_TYPE_MERKLE_TREE	1
>  #define FS_VERITY_METADATA_TYPE_DESCRIPTOR	2
> +#define FS_VERITY_METADATA_TYPE_SIGNATURE	3
>  
>  struct fsverity_read_metadata_arg {
>  	__u64 metadata_type;
> -- 
> 2.30.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
