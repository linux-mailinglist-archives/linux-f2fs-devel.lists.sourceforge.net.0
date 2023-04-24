Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6FB6ED54B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 21:22:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pr1lz-0005G2-Ll;
	Mon, 24 Apr 2023 19:22:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rdunlap@infradead.org>) id 1pr1ly-0005Fq-D1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 19:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nrJOvD5ki07BgC1+m6zA5u3PXXHEIqqCNZygV4WG4uU=; b=UJCs4GZGK61Pm2dQn3HipabvSz
 ZW36UKIL8LVET8W9xwfb/hxJVrteHZ4QIkITcTUkwDuNG+H3savq9IY/Du/EtHjbsjN9UzcFjWwDe
 QKKk8IrRlGhr1aLx0z/vsnrmFg3xlVRQ94RJwcKdrkKSKKcV/2Y2xehafoLWVWN+6Ups=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nrJOvD5ki07BgC1+m6zA5u3PXXHEIqqCNZygV4WG4uU=; b=JjKI7RiopUOKyOfO5DoxbUKIKF
 gblYWFPMK9x6xmuhmFlw6O0SpLuabFE1dDmDsRBlHIKjNAj6Jp7LDwteDBCbnvcoIlWnvThujLDRg
 7qk4UZO9sVK8JQH2PA9SbF43lNrvRRIQeZjOu5Qn7nsiXtYNTvXdH7qcewdRd2u5woRc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pr1lv-00007M-2x for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 19:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=nrJOvD5ki07BgC1+m6zA5u3PXXHEIqqCNZygV4WG4uU=; b=jnaw2GVRUGJ3XgLDcnTm28/EGW
 I2c3SbIfk7aZCwr+R62bxYgluHATBsXpKHRc3Kd6eZ7X7q4C2PFIRnKN2s2rlLjl0PYv4/SHsIN/P
 Rj2zV9EqLlkLs/pB1Tdm+dvzQqZ3dxlb0SloO08wS4cUh9bmguHSZK/++Sq79+k4zzVbiIuZ6QX0S
 G/8MCyWL3hZerN11vkKzieKj7slIpAxQGdYJVp+7U764B2QvlYl7+o1DeyOxzKUG+7D0WMFdPQDdQ
 HSq8SrEJKQQidA3dpPqgpftvseREm3IU//74IrRNpeEcmqw1SOz1YOqefNqU0PC23jpEwwctyAAtq
 26XseFOA==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pr1lf-00H3HP-0y; Mon, 24 Apr 2023 19:22:31 +0000
Message-ID: <5f30b56e-b46b-1d3f-75fb-7f30ff6ca3e9@infradead.org>
Date: Mon, 24 Apr 2023 12:22:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-3-hch@lst.de>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230424054926.26927-3-hch@lst.de>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On 4/23/23 22:49, Christoph Hellwig wrote: > def_blk_fops
 always returns -ENODEV, which dosn't match the return value > of a non-existing
 block device with CONFIG_BLOCK, which is -ENXIO. > Just remove [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pr1lv-00007M-2x
Subject: Re: [f2fs-dev] [PATCH 02/17] fs: remove the special !CONFIG_BLOCK
 def_blk_fops
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On 4/23/23 22:49, Christoph Hellwig wrote:
> def_blk_fops always returns -ENODEV, which dosn't match the return value
> of a non-existing block device with CONFIG_BLOCK, which is -ENXIO.
> Just remove the extra implementation and fall back to the default
> no_open_fops that always returns -ENXIO.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/Makefile   | 10 ++--------
>  fs/inode.c    |  3 ++-
>  fs/no-block.c | 19 -------------------
>  3 files changed, 4 insertions(+), 28 deletions(-)
>  delete mode 100644 fs/no-block.c
> 
> diff --git a/fs/Makefile b/fs/Makefile
> index 05f89b5c962f88..da21e7d0a1cf37 100644
> --- a/fs/Makefile
> +++ b/fs/Makefile
> @@ -18,14 +18,8 @@ obj-y :=	open.o read_write.o file_table.o super.o \
>  		fs_types.o fs_context.o fs_parser.o fsopen.o init.o \
>  		kernel_read_file.o mnt_idmapping.o remap_range.o
>  
> -ifeq ($(CONFIG_BLOCK),y)
> -obj-y +=	buffer.o mpage.o
> -else
> -obj-y +=	no-block.o
> -endif
> -
> -obj-$(CONFIG_PROC_FS) += proc_namespace.o
> -
> +obj-$(CONFIG_BLOCK)		+= buffer.o mpage.o
> +obj-$(CONFIG_PROC_FS)		+= proc_namespace.o
>  obj-$(CONFIG_LEGACY_DIRECT_IO)	+= direct-io.o
>  obj-y				+= notify/
>  obj-$(CONFIG_EPOLL)		+= eventpoll.o
> diff --git a/fs/inode.c b/fs/inode.c
> index 4558dc2f135573..d43f07f146eb73 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2265,7 +2265,8 @@ void init_special_inode(struct inode *inode, umode_t mode, dev_t rdev)
>  		inode->i_fop = &def_chr_fops;
>  		inode->i_rdev = rdev;
>  	} else if (S_ISBLK(mode)) {
> -		inode->i_fop = &def_blk_fops;
> +		if (IS_ENABLED(CONFIG_BLOCK))
> +			inode->i_fop = &def_blk_fops;

It looks like def_blk_fops is being removed (commit message and patch
fragment below), but here (above line) it is being used.

Am I just confused?

>  		inode->i_rdev = rdev;
>  	} else if (S_ISFIFO(mode))
>  		inode->i_fop = &pipefifo_fops;
> diff --git a/fs/no-block.c b/fs/no-block.c
> deleted file mode 100644
> index 481c0f0ab4bd2c..00000000000000
> --- a/fs/no-block.c
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/* no-block.c: implementation of routines required for non-BLOCK configuration
> - *
> - * Copyright (C) 2006 Red Hat, Inc. All Rights Reserved.
> - * Written by David Howells (dhowells@redhat.com)
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/fs.h>
> -
> -static int no_blkdev_open(struct inode * inode, struct file * filp)
> -{
> -	return -ENODEV;
> -}
> -
> -const struct file_operations def_blk_fops = {
> -	.open		= no_blkdev_open,
> -	.llseek		= noop_llseek,
> -};

-- 
~Randy


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
