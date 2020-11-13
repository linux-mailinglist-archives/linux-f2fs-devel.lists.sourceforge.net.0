Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FCF2B147D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Nov 2020 03:58:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kdPHj-0006R9-IQ; Fri, 13 Nov 2020 02:57:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kdPHi-0006R2-Do
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 02:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7UqCugTahvZeZKHS3qjmajQCkYAVeBqhd5wgjX9hZDA=; b=l+WjFkmQ65cyZDVYjRdU5Eek+m
 XmqyovX6BFGTjXKofv6rkPeHC9x36ELwovfHgQG6yo3qJFMg25gfYP+Jh3O/uEFl55iEchMXG0Sxf
 SInOeM+dZ1D0/dmO9IS1+oWjRfhaHz3d9byDPShNiTgytxvT+Lg9i8qq0waHUC5ix8sI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7UqCugTahvZeZKHS3qjmajQCkYAVeBqhd5wgjX9hZDA=; b=kxJfFhPGQEPjADq9mbyCqGMv1b
 QjHHlRwIXEbr5mEX1vHxtcQ9MN5SeXuydz6sY1OONr0kILuGAXkqj+YNgJNpVjHKv23kxflty9z9x
 zwrvD7HwPLIRXc81cT5UD96OhGC0X071fyQ3GQtzW7WVHgN4OVbKWPYRp/6PsRdj67IU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kdPHa-001VPo-Il
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 02:57:58 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE72920A8B;
 Fri, 13 Nov 2020 02:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605236260;
 bh=2wN3lqPPGVPacP2VEcKydls6XJJaUzqDhHB6a+6UYE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Or1Xb8/yMxVK5ZFmeV484FdrrgCKe/m2SbKPdLhYxJGQhUgBufGUDR47D65f0Jctp
 6WbXQaYzk9o3GD6ZS2+GIf2HiWWiZDh6bFmVDBnDHVtXhHJKtWUzwKFwpibtwnEx4z
 B7ZbKl14Rb2f2DlbMUfApjX2l4OEy7tMvW1J2ahc=
Date: Thu, 12 Nov 2020 18:57:38 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Lihong Kou <koulihong@huawei.com>
Message-ID: <X632Ivd2KfuUrGzx@sol.localdomain>
References: <20201113034348.12131-1-koulihong@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113034348.12131-1-koulihong@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kdPHa-001VPo-Il
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix the bug in f2fs_direct_IO with
 inline encryption
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
Cc: jaegeuk@kernel.org, Satya Tangirala <satyat@google.com>,
 linux-fscrypt@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 13, 2020 at 11:43:48AM +0800, Lihong Kou wrote:
> Now we have inline encrytion and fs layer encrption in the kernel, when we
> choose inline encryption, we should not use bufferd IO instead of direct IO.
> 
> Signed-off-by: Lihong Kou <koulihong@huawei.com>
> ---
>  fs/f2fs/f2fs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index cb700d797296..ccc5c9734f55 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3889,8 +3889,8 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
>   */
>  static inline bool f2fs_post_read_required(struct inode *inode)
>  {
> -	return f2fs_encrypted_file(inode) || fsverity_active(inode) ||
> -		f2fs_compressed_file(inode);
> +	return (f2fs_encrypted_file(inode) && fscrypt_inode_uses_fs_layer_crypto(inode))
> +		|| fsverity_active(inode) || f2fs_compressed_file(inode);
>  }

This isn't correct for upstream because upstream doesn't support direct I/O with
fscrypt inline encryption yet.  The patchset to support direct I/O with fscrypt
inline encryption was last sent out at
https://lkml.kernel.org/linux-fscrypt/20200720233739.824943-1-satyat@google.com.
I believe that Satya is planning to send it again soon.

On the other hand, downstream, the Android common kernels have the fscrypt
direct I/O support already, and f2fs_force_buffered_io() has been updated
accordingly.  If you're using one of the Android common kernels, can you make
sure it's up-to-date?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
