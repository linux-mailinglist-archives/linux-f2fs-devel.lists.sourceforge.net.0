Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4274F872
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Jun 2019 00:11:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heoEY-0006FF-5O; Sat, 22 Jun 2019 22:11:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1heoEV-0006Ek-WF
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 22:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JfufioqoUbYS7OG5xOKu/k5dzFlwZAUcGDxvG4NtRMY=; b=KJsqz/3od6ptblhZ6oKF6KQ0EV
 eYY08h8xUoooEd+OFRokfEvVN37vbaBUr60FVCIH0VJpmMenV8lrVR1Wbbzk311Bzp0ryxi7e44d9
 nQval9EjONpDy9aPpYamWgtFllVt85RFipMbN2Tm+Y2H5FEXl97n67im9w9b07UZICns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JfufioqoUbYS7OG5xOKu/k5dzFlwZAUcGDxvG4NtRMY=; b=bCYrbrgZAHf9Ssvejfg36WO23G
 pxdHPDnBlHof04pB9NSjHp5pR4GSHE+4UDZuc5r2R1dVqBDqIKX2Jz8N2D5W7DYpmI8cMD8Ot2Ye7
 9aMVUSn8OXglzMnfRFu40uCmgSZm7didIhSvtSRdBXG/vztNU/iwxPELm0KLxHt9+dqM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heoEY-009b0E-Tu
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 22:11:44 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34C3120862;
 Sat, 22 Jun 2019 22:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561241497;
 bh=UNW2ihZinuy71YqpXq2iIU53Glk0HBws/GqjfYmygj4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nssxLDzxoLPgRVQIlKQrkCTqpZmIgPEermLY+Ak/hHUUta860YqAXqE7hozR1ad2w
 3PraRHU/peJCcXbryrIgxCTLdobJw38CE4oSHfNBA8p7FGYDcUkV8ALCvkTgUb1Dti
 3BGQ2uoP0sgFNl+NmhSgsLX80FjX12rK+Ji/0uP4=
Date: Sat, 22 Jun 2019 15:11:36 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190622221136.GC19686@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190620205043.64350-1-ebiggers@kernel.org>
 <20190620205043.64350-4-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620205043.64350-4-ebiggers@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1heoEY-009b0E-Tu
Subject: Re: [f2fs-dev] [PATCH v5 03/16] fs-verity: add UAPI header
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/20, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add the UAPI header for fs-verity, including two ioctls:
> 
> - FS_IOC_ENABLE_VERITY
> - FS_IOC_MEASURE_VERITY
> 
> These ioctls are documented in the "User API" section of
> Documentation/filesystems/fsverity.rst.
> 
> Examples of using these ioctls can be found in fsverity-utils
> (https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git).
> 
> I've also written xfstests that test these ioctls
> (https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git/log/?h=fsverity).
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  Documentation/ioctl/ioctl-number.txt |  1 +
>  include/uapi/linux/fsverity.h        | 39 ++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 include/uapi/linux/fsverity.h
> 
> diff --git a/Documentation/ioctl/ioctl-number.txt b/Documentation/ioctl/ioctl-number.txt
> index c9558146ac5896..21767c81e86d58 100644
> --- a/Documentation/ioctl/ioctl-number.txt
> +++ b/Documentation/ioctl/ioctl-number.txt
> @@ -225,6 +225,7 @@ Code  Seq#(hex)	Include File		Comments
>  'f'	00-0F	fs/ext4/ext4.h		conflict!
>  'f'	00-0F	linux/fs.h		conflict!
>  'f'	00-0F	fs/ocfs2/ocfs2_fs.h	conflict!
> +'f'	81-8F	linux/fsverity.h
>  'g'	00-0F	linux/usb/gadgetfs.h
>  'g'	20-2F	linux/usb/g_printer.h
>  'h'	00-7F				conflict! Charon filesystem
> diff --git a/include/uapi/linux/fsverity.h b/include/uapi/linux/fsverity.h
> new file mode 100644
> index 00000000000000..57d1d7fc0c345a
> --- /dev/null
> +++ b/include/uapi/linux/fsverity.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * fs-verity user API
> + *
> + * These ioctls can be used on filesystems that support fs-verity.  See the
> + * "User API" section of Documentation/filesystems/fsverity.rst.
> + *
> + * Copyright 2019 Google LLC
> + */
> +#ifndef _UAPI_LINUX_FSVERITY_H
> +#define _UAPI_LINUX_FSVERITY_H
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +#define FS_VERITY_HASH_ALG_SHA256	1
> +
> +struct fsverity_enable_arg {
> +	__u32 version;
> +	__u32 hash_algorithm;
> +	__u32 block_size;
> +	__u32 salt_size;
> +	__u64 salt_ptr;
> +	__u32 sig_size;
> +	__u32 __reserved1;
> +	__u64 sig_ptr;
> +	__u64 __reserved2[11];
> +};
> +
> +struct fsverity_digest {
> +	__u16 digest_algorithm;
> +	__u16 digest_size; /* input/output */
> +	__u8 digest[];
> +};
> +
> +#define FS_IOC_ENABLE_VERITY	_IOW('f', 133, struct fsverity_enable_arg)
> +#define FS_IOC_MEASURE_VERITY	_IOWR('f', 134, struct fsverity_digest)
> +
> +#endif /* _UAPI_LINUX_FSVERITY_H */
> -- 
> 2.22.0.410.gd8fdbe21b5-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
