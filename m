Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E23788C2E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 17:11:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZYTB-0005h8-9k;
	Fri, 25 Aug 2023 15:11:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1qZYTA-0005h0-5H
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 15:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RZbkUY9e8Wi7Z5FQEWEttp+LseNlXBERK1HYThFqoFg=; b=aJJCVC4ugq/WZKE30MxJlayJ5o
 X6tA8iw+8IL403GzOiAdflzQ0+nwq1uNolmBXRHPjyw6Cb6vGKlKbngm6Zu4kB5H58jJ9+pRYHgW2
 yOr+iZNtl1F4YWoiXqRuF+WMlK6gv77MkIQe3Ap7BFEjsMi4crlwY7xWFPpRxD+DHPyk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RZbkUY9e8Wi7Z5FQEWEttp+LseNlXBERK1HYThFqoFg=; b=bY6G+m+cfIDdStmPXG4m2uK0U2
 2t1ZVchxcOduPv7AdcQaGXiAiiZb656Vqx93VlQWa83vai1iGuTOOSyV3sN5cdXZ3Kp7/YphBzv4q
 Nopcnfa02Jj6D5nYNx9pe6vlW3dq00qYWZuszghT/57WYAas7I+alvUK3wIWh2XmvlO4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZYT7-0001hb-5w for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 15:11:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DC0561D9A;
 Fri, 25 Aug 2023 15:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51CFC433C7;
 Fri, 25 Aug 2023 15:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692976275;
 bh=Yk82zBo/CO5JhPqCebob30ONG4lnlvLUkORIUTY0ODE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NYYVRerqYqnGpLF8blJdmxVpMOEPQLv0528BjC5vvBFsZNAz6HSSGB0+0FSTqmw/7
 Db7P0mmTsJO1oNY1/ZHWu8NyzK9JrsOCasrcwziq7v3vDEDceQvRopW668kANjqE5f
 XtN676xYCoJvkIHN5kf251pR26YpJ9SQiBSWWbB3qvKX/kVrAeNfp0cfhulI06kGyS
 rDA+euytpnrfPPjqUYcEaqjX12Vj0EdMyf1Oo7A6QZMfrIIcEUaHvGZ8srUTvsTFVz
 en/rpIYHaZ7zIlQRk5TaAyXVnqxQP9imT2Z+zB9eRFWghRFbDct0Qujy/WQpJcsiaU
 Wx3ea7l8r3I0w==
Date: Fri, 25 Aug 2023 08:11:15 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <20230825151115.GB17891@frogsfrogsfrogs>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 25, 2023 at 09:54:02PM +0800, Hao Xu wrote: >
 From: Hao Xu <howeyxu@tencent.com> > > This series introduce getdents64 to
 io_uring, the code logic is similar > with the snychronized version [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZYT7-0001hb-5w
Subject: Re: [f2fs-dev] [PATCH RFC v5 00/29] io_uring getdents
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
Cc: Wanpeng Li <wanpengli@tencent.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 25, 2023 at 09:54:02PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> This series introduce getdents64 to io_uring, the code logic is similar
> with the snychronized version's. It first try nowait issue, and offload
> it to io-wq threads if the first try fails.

NAK on the entire series until Jens actually writes down what NOWAIT
does, so that we can check that the *existing* nowait code branches
actually behave how he says it should.

https://lore.kernel.org/all/e2d8e5f1-f794-38eb-cecf-ed30c571206b@kernel.dk/

--D

> 
> Patch1 and Patch2 are some preparation
> Patch3 supports nowait for xfs getdents code
> Patch4-11 are vfs change, include adding helpers and trylock for locks
> Patch12-29 supports nowait for involved xfs journal stuff
> note, Patch24 and 27 are actually two questions, might be removed later.
> an xfs test may come later.
> 
> Tests I've done:
> a liburing test case for functional test:
> https://github.com/HowHsu/liburing/commit/39dc9a8e19c06a8cebf8c2301b85320eb45c061e?diff=unified
> 
> xfstests:
>     test/generic: 1 fails and 171 not run
>     test/xfs: 72 fails and 156 not run
> run the code before without this patchset, same result.
> I'll try to make the environment more right to run more tests here.
> 
> 
> Tested it with a liburing performance test:
> https://github.com/HowHsu/liburing/blob/getdents/test/getdents2.c
> 
> The test is controlled by the below script[2] which runs getdents2.t 100
> times and calulate the avg.
> The result show that io_uring version is about 2.6% faster:
> 
> note:
> [1] the number of getdents call/request in io_uring and normal sync version
> are made sure to be same beforehand.
> 
> [2] run_getdents.py
> 
> ```python3
> 
> import subprocess
> 
> N = 100
> sum = 0.0
> args = ["/data/home/howeyxu/tmpdir", "sync"]
> 
> for i in range(N):
>     output = subprocess.check_output(["./liburing/test/getdents2.t"] + args)
>     sum += float(output)
> 
> average = sum / N
> print("Average of sync:", average)
> 
> sum = 0.0
> args = ["/data/home/howeyxu/tmpdir", "iouring"]
> 
> for i in range(N):
>     output = subprocess.check_output(["./liburing/test/getdents2.t"] + args)
>     sum += float(output)
> 
> average = sum / N
> print("Average of iouring:", average)
> 
> ```
> 
> v4->v5:
>  - move atime update to the beginning of getdents operation
>  - trylock for i_rwsem
>  - nowait semantics for involved xfs journal stuff
> 
> v3->v4:
>  - add Dave's xfs nowait code and fix a deadlock problem, with some code
>    style tweak.
>  - disable fixed file to avoid a race problem for now
>  - add a test program.
> 
> v2->v3:
>  - removed the kernfs patches
>  - add f_pos_lock logic
>  - remove the "reduce last EOF getdents try" optimization since
>    Dominique reports that doesn't make difference
>  - remove the rewind logic, I think the right way is to introduce lseek
>    to io_uring not to patch this logic to getdents.
>  - add Singed-off-by of Stefan Roesch for patch 1 since checkpatch
>    complained that Co-developed-by someone should be accompanied with
>    Signed-off-by same person, I can remove them if Stefan thinks that's
>    not proper.
> 
> 
> Dominique Martinet (1):
>   fs: split off vfs_getdents function of getdents64 syscall
> 
> Hao Xu (28):
>   xfs: rename XBF_TRYLOCK to XBF_NOWAIT
>   xfs: add NOWAIT semantics for readdir
>   vfs: add nowait flag for struct dir_context
>   vfs: add a vfs helper for io_uring file pos lock
>   vfs: add file_pos_unlock() for io_uring usage
>   vfs: add a nowait parameter for touch_atime()
>   vfs: add nowait parameter for file_accessed()
>   vfs: move file_accessed() to the beginning of iterate_dir()
>   vfs: add S_NOWAIT for nowait time update
>   vfs: trylock inode->i_rwsem in iterate_dir() to support nowait
>   xfs: enforce GFP_NOIO implicitly during nowait time update
>   xfs: make xfs_trans_alloc() support nowait semantics
>   xfs: support nowait for xfs_log_reserve()
>   xfs: don't wait for free space in xlog_grant_head_check() in nowait
>     case
>   xfs: add nowait parameter for xfs_inode_item_init()
>   xfs: make xfs_trans_ijoin() error out -EAGAIN
>   xfs: set XBF_NOWAIT for xfs_buf_read_map if necessary
>   xfs: support nowait memory allocation in _xfs_buf_alloc()
>   xfs: distinguish error type of memory allocation failure for nowait
>     case
>   xfs: return -EAGAIN when bulk memory allocation fails in nowait case
>   xfs: comment page allocation for nowait case in xfs_buf_find_insert()
>   xfs: don't print warn info for -EAGAIN error in  xfs_buf_get_map()
>   xfs: support nowait for xfs_buf_read_map()
>   xfs: support nowait for xfs_buf_item_init()
>   xfs: return -EAGAIN when nowait meets sync in transaction commit
>   xfs: add a comment for xlog_kvmalloc()
>   xfs: support nowait semantics for xc_ctx_lock in xlog_cil_commit()
>   io_uring: add support for getdents
> 
>  arch/s390/hypfs/inode.c         |  2 +-
>  block/fops.c                    |  2 +-
>  fs/btrfs/file.c                 |  2 +-
>  fs/btrfs/inode.c                |  2 +-
>  fs/cachefiles/namei.c           |  2 +-
>  fs/coda/dir.c                   |  4 +--
>  fs/ecryptfs/file.c              |  4 +--
>  fs/ext2/file.c                  |  4 +--
>  fs/ext4/file.c                  |  6 ++--
>  fs/f2fs/file.c                  |  4 +--
>  fs/file.c                       | 13 +++++++
>  fs/fuse/dax.c                   |  2 +-
>  fs/fuse/file.c                  |  4 +--
>  fs/gfs2/file.c                  |  2 +-
>  fs/hugetlbfs/inode.c            |  2 +-
>  fs/inode.c                      | 10 +++---
>  fs/internal.h                   |  8 +++++
>  fs/namei.c                      |  4 +--
>  fs/nfsd/vfs.c                   |  2 +-
>  fs/nilfs2/file.c                |  2 +-
>  fs/orangefs/file.c              |  2 +-
>  fs/orangefs/inode.c             |  2 +-
>  fs/overlayfs/file.c             |  2 +-
>  fs/overlayfs/inode.c            |  2 +-
>  fs/pipe.c                       |  2 +-
>  fs/ramfs/file-nommu.c           |  2 +-
>  fs/readdir.c                    | 61 +++++++++++++++++++++++++--------
>  fs/smb/client/cifsfs.c          |  2 +-
>  fs/splice.c                     |  2 +-
>  fs/stat.c                       |  2 +-
>  fs/ubifs/file.c                 |  2 +-
>  fs/udf/file.c                   |  2 +-
>  fs/xfs/libxfs/xfs_alloc.c       |  2 +-
>  fs/xfs/libxfs/xfs_attr_remote.c |  2 +-
>  fs/xfs/libxfs/xfs_btree.c       |  2 +-
>  fs/xfs/libxfs/xfs_da_btree.c    | 16 +++++++++
>  fs/xfs/libxfs/xfs_da_btree.h    |  1 +
>  fs/xfs/libxfs/xfs_dir2_block.c  |  7 ++--
>  fs/xfs/libxfs/xfs_dir2_priv.h   |  2 +-
>  fs/xfs/libxfs/xfs_shared.h      |  2 ++
>  fs/xfs/libxfs/xfs_trans_inode.c | 12 +++++--
>  fs/xfs/scrub/dir.c              |  2 +-
>  fs/xfs/scrub/readdir.c          |  2 +-
>  fs/xfs/scrub/repair.c           |  2 +-
>  fs/xfs/xfs_buf.c                | 43 +++++++++++++++++------
>  fs/xfs/xfs_buf.h                |  4 +--
>  fs/xfs/xfs_buf_item.c           |  9 +++--
>  fs/xfs/xfs_buf_item.h           |  2 +-
>  fs/xfs/xfs_buf_item_recover.c   |  2 +-
>  fs/xfs/xfs_dir2_readdir.c       | 49 ++++++++++++++++++++------
>  fs/xfs/xfs_dquot.c              |  2 +-
>  fs/xfs/xfs_file.c               |  6 ++--
>  fs/xfs/xfs_inode.c              | 27 +++++++++++++++
>  fs/xfs/xfs_inode.h              | 17 +++++----
>  fs/xfs/xfs_inode_item.c         | 12 ++++---
>  fs/xfs/xfs_inode_item.h         |  3 +-
>  fs/xfs/xfs_iops.c               | 31 ++++++++++++++---
>  fs/xfs/xfs_log.c                | 33 ++++++++++++------
>  fs/xfs/xfs_log.h                |  5 +--
>  fs/xfs/xfs_log_cil.c            | 17 +++++++--
>  fs/xfs/xfs_log_priv.h           |  4 +--
>  fs/xfs/xfs_trans.c              | 44 ++++++++++++++++++++----
>  fs/xfs/xfs_trans.h              |  2 +-
>  fs/xfs/xfs_trans_buf.c          | 18 ++++++++--
>  fs/zonefs/file.c                |  4 +--
>  include/linux/file.h            |  7 ++++
>  include/linux/fs.h              | 16 +++++++--
>  include/uapi/linux/io_uring.h   |  1 +
>  io_uring/fs.c                   | 53 ++++++++++++++++++++++++++++
>  io_uring/fs.h                   |  3 ++
>  io_uring/opdef.c                |  8 +++++
>  kernel/bpf/inode.c              |  4 +--
>  mm/filemap.c                    |  8 ++---
>  mm/shmem.c                      |  6 ++--
>  net/unix/af_unix.c              |  4 +--
>  75 files changed, 499 insertions(+), 161 deletions(-)
> 
> -- 
> 2.25.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
