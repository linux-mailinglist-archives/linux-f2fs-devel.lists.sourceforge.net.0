Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F42D2196
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Dec 2020 04:52:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmU2g-0003lz-0i; Tue, 08 Dec 2020 03:51:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kmU2d-0003lg-Ug
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 03:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DLo32PKIqBM5w0wTtv7kVLHl6QZIY2IiVw8y3BJbO8I=; b=B85ZRaIO/DsU7QqpvYXodZ3t+w
 pNOlYne97yJmY4gVIiahw1mZnZHS9IFBR1BSernJAEVl4MtGVGaxjmogqKtu6tjoFCPEnjOal9uHZ
 kJ4pWbRNJoIczPfx+XJamrlIjZxVSZC45KeG15zHQI6gV5ZATMf5Wv+ZPot74xF2ZUuo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DLo32PKIqBM5w0wTtv7kVLHl6QZIY2IiVw8y3BJbO8I=; b=kcly1PeLqHyt7tR+zJJCcYQUE+
 nN7RvxoynTFxCO67ER6nXsE63/j2DnC7cbQZYkIgoOf4a95QgddC3Bffi6Y3B45S2O6J5vE2/Oyjz
 gKl/OwqRXcpB5wx6tQ328D49ePuMHzr03zZgYuSUNe4uVp9vDRheo8fDxyjQ8nQthX/8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmU2P-002vuU-MB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 03:51:55 +0000
Date: Mon, 7 Dec 2020 19:51:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607399488;
 bh=uwHFkmRMJNQWu5o/EktiSUuQpKFAf8s/mDCjQuqN0WU=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=hj2AQrK111a4NAJdVMKLrtiByZkLgjt3j1np2yhikhW+uCESRy7eYd7DxHAtQvjBe
 2yDJghoslgQxsec98NCG9pdjn8o81bXne83X09b5B3h8xhLDbnAIT67F0NFH358EFc
 2h6ybdNfjOizuC8ETt+xjz/f41rLNhYAbFalqIEd5Ac5JLhJOWQFQiRv7s5z0Jx6R1
 k5Y8XR3CkWT5mnyJtm/QnmZf93RgC7RJW2ZCVRGQvp6kHsnBnTI64wfSBesMwdPEUV
 aFfHhiadgico2WlHLVtYPC4sYe8uyt9pTB1W8BG/uF1U1UDu8AZMRBo80FhT8yAE/H
 43O3L4Xa5pzAw==
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <X874P2evu7SUgjBA@gmail.com>
References: <20201201040803.3590442-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201040803.3590442-1-daeho43@gmail.com>
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
X-Headers-End: 1kmU2P-002vuU-MB
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: add compress_mode mount option
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

On Tue, Dec 01, 2020 at 01:08:02PM +0900, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We will add a new "compress_mode" mount option to control file
> compression mode. This supports "fs" and "user". In "fs" mode (default),
> f2fs does automatic compression on the compression enabled files.
> In "user" mode, f2fs disables the automaic compression and gives the
> user discretion of choosing the target file and the timing. It means
> the user can do manual compression/decompression on the compression
> enabled files using ioctls.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: changed mount option name and added more explanation of mount option
> ---
>  Documentation/filesystems/f2fs.rst | 35 ++++++++++++++++++++++++++++++
>  fs/f2fs/compress.c                 |  2 +-
>  fs/f2fs/data.c                     |  2 +-
>  fs/f2fs/f2fs.h                     | 30 +++++++++++++++++++++++++
>  fs/f2fs/segment.c                  |  2 +-
>  fs/f2fs/super.c                    | 23 ++++++++++++++++++++
>  6 files changed, 91 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index b8ee761c9922..5eb8d63439ec 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -260,6 +260,13 @@ compress_extension=%s	 Support adding specified extension, so that f2fs can enab
>  			 For other files, we can still enable compression via ioctl.
>  			 Note that, there is one reserved special extension '*', it
>  			 can be set to enable compression for all files.
> +compress_mode=%s	 Control file compression mode. This supports "fs" and "user"
> +			 modes. In "fs" mode (default), f2fs does automatic compression
> +			 on the compression enabled files. In "user" mode, f2fs disables
> +			 the automaic compression and gives the user discretion of
> +			 choosing the target file and the timing. The user can do manual
> +			 compression/decompression on the compression enabled files using
> +			 ioctls.
>  inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
>  			 files using the blk-crypto framework rather than
>  			 filesystem-layer encryption. This allows the use of
> @@ -810,6 +817,34 @@ Compress metadata layout::
>  	| data length | data chksum | reserved |      compressed data       |
>  	+-------------+-------------+----------+----------------------------+
>  
> +Compression mode
> +--------------------------
> +
> +f2fs supports "fs" and "user" compression modes with "compression_mode" mount option.
> +With this option, f2fs provides a choice to select the way how to compress the
> +compression enabled files (refer to "Compression implementation" section for how to
> +enable compression on a regular inode).
> +
> +1) compress_mode=fs
> +This is the default option. f2fs does automatic compression in the writeback of the
> +compression enabled files.
> +
> +2) compress_mode=user
> +This disables the automaic compression and gives the user discretion of choosing the
> +target file and the timing. The user can do manual compression/decompression on the
> +compression enabled files using F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE
> +ioctls like the below.
> +
> +To decompress a file,
> +
> +fd = open(filename, O_WRONLY, 0);
> +ret = ioctl(fd, F2FS_IOC_DECOMPRESS_FILE);
> +
> +To compress a file,
> +
> +fd = open(filename, O_WRONLY, 0);
> +ret = ioctl(fd, F2FS_IOC_COMPRESS_FILE);
> +

Why doesn't compress_mode=user just cause regular files to not inherit the
compression flag?  Then users could set or clear the compression flag using
FS_IOC_SETFLAGS, without any need for these new ioctls.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
