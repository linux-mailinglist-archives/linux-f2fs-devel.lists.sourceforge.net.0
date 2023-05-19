Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C22870997E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 May 2023 16:22:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q00zr-0004md-L7;
	Fri, 19 May 2023 14:22:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hare@suse.de>) id 1q00zq-0004mR-GV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 14:22:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WlcBct/wzp7TvW6xV2C5NZk4K9r7Xb2dIshCQXz8B/o=; b=RzCqbkkWuJobgM6Xt8OzsKdNsE
 ii33qWKRaxtDNeBgqLWrONzvll7+jASw75TpMRDyIPwS1MxQ19LSr0jXRXYQsRH7NZTflywOHOBA5
 XbL2jR5fGyqe7neVIUmxLhIkwO/46FqnKtDfaAjp28Rksuz7M4O8Y8QCgNLZBc/4CH14=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WlcBct/wzp7TvW6xV2C5NZk4K9r7Xb2dIshCQXz8B/o=; b=H191KgAko/3j0LJV0aDxX2OlUQ
 YemqTVYIcNyUoWStSt+H+c+MK1Q9VhKfnUIEqYLFhcHsL+yq+Fw9Eo07HZDl/4uutJTSwkGDEcemd
 6vnt1G0k8pGeVGDc01kx1S4TFSJZEiSbLxBb8mp8rL8lBL5b2e/mSiZvd7aBJVTLQT2Q=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q00zn-00DQJn-W8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 14:22:16 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D51C11FDA9;
 Fri, 19 May 2023 14:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684506122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlcBct/wzp7TvW6xV2C5NZk4K9r7Xb2dIshCQXz8B/o=;
 b=AFt2rU6BsN/C4LLgMrh7gKGcpHYIHok4I1/ZlixA6CgBGql3l73YlMa9C48tJmr9NqegsT
 LN8AClWFtwITzTZAUWgoU01jAS1F2lDDOB4JawywQhzdu2BdTVwBO7ISqWbV6ElVvIXcHy
 pS+mrAVAokuwV8tW3e7shtOpSuVArgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684506122;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlcBct/wzp7TvW6xV2C5NZk4K9r7Xb2dIshCQXz8B/o=;
 b=n6vjt7WKTMi/w+YlBK3seqHcXPDKocScWzVVUDL+yCxdpf+f0GwrDIg68CO/X1/yI4orBU
 4xpJjA0dEHwk/dCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23E2213A12;
 Fri, 19 May 2023 14:22:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zjpzBgqGZ2TWHwAAMHmgww
 (envelope-from <hare@suse.de>); Fri, 19 May 2023 14:22:02 +0000
Message-ID: <b96b397e-2f5e-7910-3bb3-7405d0e293a7@suse.de>
Date: Fri, 19 May 2023 16:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-17-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230424054926.26927-17-hch@lst.de>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/24/23 07:49, Christoph Hellwig wrote: > Use iomap in
 buffer_head compat mode to write to block devices. > > Signed-off-by:
 Christoph
 Hellwig <hch@lst.de> > --- > block/Kconfig | 1 + > block/fops. [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q00zn-00DQJn-W8
Subject: Re: [f2fs-dev] [PATCH 16/17] block: use iomap for writes to block
 devices
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/24/23 07:49, Christoph Hellwig wrote:
> Use iomap in buffer_head compat mode to write to block devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/Kconfig |  1 +
>   block/fops.c  | 33 +++++++++++++++++++++++++++++----
>   2 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/block/Kconfig b/block/Kconfig
> index 941b2dca70db73..672b08f0096ab4 100644
> --- a/block/Kconfig
> +++ b/block/Kconfig
> @@ -5,6 +5,7 @@
>   menuconfig BLOCK
>          bool "Enable the block layer" if EXPERT
>          default y
> +       select IOMAP
>          select SBITMAP
>          help
>   	 Provide block layer support for the kernel.
> diff --git a/block/fops.c b/block/fops.c
> index 318247832a7bcf..7910636f8df33b 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -15,6 +15,7 @@
>   #include <linux/falloc.h>
>   #include <linux/suspend.h>
>   #include <linux/fs.h>
> +#include <linux/iomap.h>
>   #include <linux/module.h>
>   #include "blk.h"
>   
> @@ -386,6 +387,27 @@ static ssize_t blkdev_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
>   	return __blkdev_direct_IO(iocb, iter, bio_max_segs(nr_pages));
>   }
>   
> +static int blkdev_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
> +		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
> +{
> +	struct block_device *bdev = I_BDEV(inode);
> +	loff_t isize = i_size_read(inode);
> +
> +	iomap->bdev = bdev;
> +	iomap->offset = ALIGN_DOWN(offset, bdev_logical_block_size(bdev));
> +	if (WARN_ON_ONCE(iomap->offset >= isize))
> +		return -EIO;

I'm hitting this during booting:
[    5.016324]  <TASK>
[    5.030256]  iomap_iter+0x11a/0x350
[    5.030264]  iomap_readahead+0x1eb/0x2c0
[    5.030272]  read_pages+0x5d/0x220
[    5.030279]  page_cache_ra_unbounded+0x131/0x180
[    5.030284]  filemap_get_pages+0xff/0x5a0
[    5.030292]  filemap_read+0xca/0x320
[    5.030296]  ? aa_file_perm+0x126/0x500
[    5.040216]  ? touch_atime+0xc8/0x150
[    5.040224]  blkdev_read_iter+0xb0/0x150
[    5.040228]  vfs_read+0x226/0x2d0
[    5.040234]  ksys_read+0xa5/0xe0
[    5.040238]  do_syscall_64+0x5b/0x80

Maybe we should consider this patch:

diff --git a/block/fops.c b/block/fops.c
index 524b8a828aad..d202fb663f25 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -386,10 +386,13 @@ static int blkdev_iomap_begin(struct inode *inode, 
loff_t offset, loff_t length,

         iomap->bdev = bdev;
         iomap->offset = ALIGN_DOWN(offset, bdev_logical_block_size(bdev));
-       if (WARN_ON_ONCE(iomap->offset >= isize))
-               return -EIO;
-       iomap->type = IOMAP_MAPPED;
-       iomap->addr = iomap->offset;
+       if (WARN_ON_ONCE(iomap->offset >= isize)) {
+               iomap->type = IOMAP_HOLE;
+               iomap->addr = IOMAP_NULL_ADDR;
+       } else {
+               iomap->type = IOMAP_MAPPED;
+               iomap->addr = iomap->offset;
+       }
         iomap->length = isize - iomap->offset;
         if (IS_ENABLED(CONFIG_BUFFER_HEAD))
                 iomap->flags |= IOMAP_F_BUFFER_HEAD;


Other that the the system seems fine.

Cheers,

Hannes



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
