Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 245BB70D012
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 May 2023 03:06:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1GU1-0004dc-25;
	Tue, 23 May 2023 01:06:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1q1GTz-0004dV-GL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 01:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ej59/T/mMH9enC8u09fLhXt1y6kmoqAgjeImlgOrUg=; b=bFTHLr+UOayAdFA4bX3/KbEqAA
 F31iNqS8bCA35m4UfQjGWbmqgBxqLHV+tNULRoTcyZmvDk+EZoGyv3+xb0OlFLkNKl2SN6zyMbJzi
 1bEJnp6zIvffSXRFeHmItctSy4bBKnjeHUyMhZf/P3YCQbEHec/OPtW6dgvl6XeBDVeM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2ej59/T/mMH9enC8u09fLhXt1y6kmoqAgjeImlgOrUg=; b=CPcQGP1rAAz/t4I+n8iDqNFyhQ
 Aj0fpDt/hTOUGqvQ+KUjGcf67jLvCVH9LAwIQwNl2Y0wombWIe+qbDj4JwIsG71yNTu/mjLGsoPKz
 S9ikYAal3cJUDSG+kgXKs55ULVxtb8tdJoziST8ZBJyI4YKXnasrsY1cuTtMIXCljqck=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1GTy-00015f-OP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 01:06:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A5E662CFF;
 Tue, 23 May 2023 01:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A8CC433EF;
 Tue, 23 May 2023 01:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684803988;
 bh=h4E1J1AKDKMVuSfgh/Fow3jhm+kdCps73if0IpfmP5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B7HpXX0w8KazRHI9JNKr78xlTtBd/1Nh3mIbBpnJMweSFzrOqUOt7vzqrdBkuR6da
 VpRkQ0B9OD3Lv3dmDJT2f5qM2ZiJ/Kyn1Lq2WhZw69nlhNmf+f3buLVFiU8DbZvv7F
 UZtgkITdSnN+xy5B/gLJIpuTpnarir62FwLnGDW1sBWKc+tVEtQAX97dY0y9SoCq5l
 zRaQqJlwCLVdQFoTj4OZUDBxuXLoYm1YXms74/n+fosCJ8AqmV5X1QCSlaFFWigY5U
 89PsbK7iFzdJ2y1/246qlBtpGb/jm+WXxujyUQIlwqewLNfDNz7C/tJF/7+ceO+zUq
 U9+tx48Oj/N1Q==
Date: Mon, 22 May 2023 18:06:27 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230523010627.GD11598@frogsfrogsfrogs>
References: <20230519093521.133226-1-hch@lst.de>
 <20230519093521.133226-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230519093521.133226-9-hch@lst.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 19, 2023 at 11:35:16AM +0200, Christoph Hellwig
 wrote: > Move the assignment to current->backing_dev_info from the callers
 into > iomap_file_buffered_write to reduce boiler plate code and [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q1GTy-00015f-OP
Subject: Re: [f2fs-dev] [PATCH 08/13] iomap: assign
 current->backing_dev_info in iomap_file_buffered_write
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
Cc: linux-mm@kvack.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 19, 2023 at 11:35:16AM +0200, Christoph Hellwig wrote:
> Move the assignment to current->backing_dev_info from the callers into
> iomap_file_buffered_write to reduce boiler plate code and reduce the
> scope to just around the page dirtying loop.
> 
> Note that zonefs was missing this assignment before.

I'm still wondering (a) what the hell current->backing_dev_info is for,
and (b) if we need it around the iomap_unshare operation.

$ git grep current..backing_dev_info
fs/btrfs/file.c:1148:   current->backing_dev_info = inode_to_bdi(inode);
fs/btrfs/file.c:1169:                   current->backing_dev_info = NULL;
fs/btrfs/file.c:1692:   current->backing_dev_info = NULL;
fs/ceph/file.c:1795:    current->backing_dev_info = inode_to_bdi(inode);
fs/ceph/file.c:1943:    current->backing_dev_info = NULL;
fs/ext4/file.c:288:     current->backing_dev_info = inode_to_bdi(inode);
fs/ext4/file.c:290:     current->backing_dev_info = NULL;
fs/f2fs/file.c:4520:    current->backing_dev_info = inode_to_bdi(inode);
fs/f2fs/file.c:4522:    current->backing_dev_info = NULL;
fs/fuse/file.c:1366:    current->backing_dev_info = inode_to_bdi(inode);
fs/fuse/file.c:1412:    current->backing_dev_info = NULL;
fs/gfs2/file.c:1044:    current->backing_dev_info = inode_to_bdi(inode);
fs/gfs2/file.c:1048:    current->backing_dev_info = NULL;
fs/nfs/file.c:652:              current->backing_dev_info = inode_to_bdi(inode);
fs/nfs/file.c:654:              current->backing_dev_info = NULL;
fs/ntfs/file.c:1914:    current->backing_dev_info = inode_to_bdi(vi);
fs/ntfs/file.c:1918:    current->backing_dev_info = NULL;
fs/ntfs3/file.c:823:    current->backing_dev_info = inode_to_bdi(inode);
fs/ntfs3/file.c:996:    current->backing_dev_info = NULL;
fs/xfs/xfs_file.c:721:  current->backing_dev_info = inode_to_bdi(inode);
fs/xfs/xfs_file.c:756:  current->backing_dev_info = NULL;
mm/filemap.c:3995:      current->backing_dev_info = inode_to_bdi(inode);
mm/filemap.c:4056:      current->backing_dev_info = NULL;

AFAICT nobody uses it at all?  Unless there's some bizarre user that
isn't extracting it from @current?

Oh, hey, new question (c) isn't this set incorrectly for xfs realtime
files?

--D

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/gfs2/file.c         | 3 ---
>  fs/iomap/buffered-io.c | 3 +++
>  fs/xfs/xfs_file.c      | 5 -----
>  3 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index 499ef174dec138..261897fcfbc495 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -25,7 +25,6 @@
>  #include <linux/dlm.h>
>  #include <linux/dlm_plock.h>
>  #include <linux/delay.h>
> -#include <linux/backing-dev.h>
>  #include <linux/fileattr.h>
>  
>  #include "gfs2.h"
> @@ -1041,11 +1040,9 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
>  			goto out_unlock;
>  	}
>  
> -	current->backing_dev_info = inode_to_bdi(inode);
>  	pagefault_disable();
>  	ret = iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
>  	pagefault_enable();
> -	current->backing_dev_info = NULL;
>  	if (ret > 0)
>  		written += ret;
>  
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 550525a525c45c..b2779bd1f10611 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2010 Red Hat, Inc.
>   * Copyright (C) 2016-2019 Christoph Hellwig.
>   */
> +#include <linux/backing-dev.h>
>  #include <linux/module.h>
>  #include <linux/compiler.h>
>  #include <linux/fs.h>
> @@ -869,8 +870,10 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
>  	if (iocb->ki_flags & IOCB_NOWAIT)
>  		iter.flags |= IOMAP_NOWAIT;
>  
> +	current->backing_dev_info = inode_to_bdi(iter.inode);
>  	while ((ret = iomap_iter(&iter, ops)) > 0)
>  		iter.processed = iomap_write_iter(&iter, i);
> +	current->backing_dev_info = NULL;
>  
>  	if (unlikely(ret < 0))
>  		return ret;
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index bfba10e0b0f3c2..98d763cc3b114c 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -27,7 +27,6 @@
>  
>  #include <linux/dax.h>
>  #include <linux/falloc.h>
> -#include <linux/backing-dev.h>
>  #include <linux/mman.h>
>  #include <linux/fadvise.h>
>  #include <linux/mount.h>
> @@ -717,9 +716,6 @@ xfs_file_buffered_write(
>  	if (ret)
>  		goto out;
>  
> -	/* We can write back this queue in page reclaim */
> -	current->backing_dev_info = inode_to_bdi(inode);
> -
>  	trace_xfs_file_buffered_write(iocb, from);
>  	ret = iomap_file_buffered_write(iocb, from,
>  			&xfs_buffered_write_iomap_ops);
> @@ -751,7 +747,6 @@ xfs_file_buffered_write(
>  		goto write_retry;
>  	}
>  
> -	current->backing_dev_info = NULL;
>  out:
>  	if (iolock)
>  		xfs_iunlock(ip, iolock);
> -- 
> 2.39.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
