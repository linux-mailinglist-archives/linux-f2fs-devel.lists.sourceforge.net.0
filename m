Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D896D6911
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 18:39:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjjhH-0006yf-IG;
	Tue, 04 Apr 2023 16:39:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1pjjhH-0006yW-3d
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 16:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cx809+sZWoL1IsNa87TqTMVOK9Xcc2MtQnYx9IfVsBY=; b=KpP0mU6NRLSWIfWbNH7APRPfwJ
 UpC485roqCFe/cNsZ63r3ZGz1LJ3pF9NSpjoXHNX/oDCrmtkF41kUtGbKDddFaiXuemHDz7vIzDe6
 4Eqjvz0OezwgeOF6OWoM7TIZ7jdC6qH06nQ6KuQ0I4iZLMpeNJMQbEBTbIwa/jEo/oDU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cx809+sZWoL1IsNa87TqTMVOK9Xcc2MtQnYx9IfVsBY=; b=cr9ulsOL0vvdCJqjnvIs3wpj4H
 jhhieW6TqGL0TnVJqxvp4JtqUC3t8TK03HtPZBJTXIyrUGug/4NPco7aBJVic56zhVfAnmd967qNy
 BXiT72PqsXnA7avIfQeRcbnpXJw1BbiTUJTKOwupxy6dzg2zeSsHSXv+WNuWF9x3dZno=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjjhF-00F6D2-8S for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 16:39:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D95FA635E2;
 Tue,  4 Apr 2023 16:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF72C433EF;
 Tue,  4 Apr 2023 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680626383;
 bh=OE3ZhwpdXPaUqbe2ZMl6jqgbpE3w1OI7ZuqJWZhJ9Rk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tJNnG55gT+GKx8EnOOA6ED0jlulGw+gVV0uR2fvkQGmBLoTW8kHPNJOMV7FBxSufn
 dQ6/dxTCxv0WdL24xSib3p+lvOBS/TDA4kXAnGYIzlxe2k7rkZGU5uelrlH/1TuWPs
 yEXk1dgkFPFmYWePJES61x+0w3pEDZOEPB3thyFUZtzF0nlmVDQa7+ghsComnWSias
 LI3aYMXUxu2hok4/tjUi0aFNwpi2/WfUjsE3vfGiYEw+bpKXq/yy9T+U44wDrXCe6x
 Fj6GXpUyixej+22neU4W2/gEdnaOnDLAV3CUAF1uwIu3tRUa+fdqn3Z9sMBM5sHqfD
 BxUbxmwwlxfNw==
Date: Tue, 4 Apr 2023 09:39:42 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20230404163942.GD109974@frogsfrogsfrogs>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 04, 2023 at 04:52:56PM +0200, Andrey Albershteyn
 wrote: > Hi all, > > This is V2 of fs-verity support in XFS. In this series
 I did > numerous changes from V1 which are described below. > > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjjhF-00F6D2-8S
Subject: Re: [f2fs-dev] [PATCH v2 00/23] fs-verity support for XFS
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
Cc: fsverity@lists.linux.dev, hch@infradead.org, linux-ext4@vger.kernel.org,
 agruenba@redhat.com, damien.lemoal@opensource.wdc.com,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 04, 2023 at 04:52:56PM +0200, Andrey Albershteyn wrote:
> Hi all,
> 
> This is V2 of fs-verity support in XFS. In this series I did
> numerous changes from V1 which are described below.
> 
> This patchset introduces fs-verity [5] support for XFS. This
> implementation utilizes extended attributes to store fs-verity
> metadata. The Merkle tree blocks are stored in the remote extended
> attributes.
> 
> A few key points:
> - fs-verity metadata is stored in extended attributes
> - Direct path and DAX are disabled for inodes with fs-verity
> - Pages are verified in iomap's read IO path (offloaded to
>   workqueue)
> - New workqueue for verification processing
> - New ro-compat flag
> - Inodes with fs-verity have new on-disk diflag
> - xfs_attr_get() can return buffer with the attribute
> 
> The patchset is tested with xfstests -g auto on xfs_1k, xfs_4k,
> xfs_1k_quota, and xfs_4k_quota. Haven't found any major failures.
> 
> Patches [6/23] and [7/23] touch ext4, f2fs, btrfs, and patch [8/23]
> touches erofs, gfs2, and zonefs.
> 
> The patchset consist of four parts:
> - [1..4]: Patches from Parent Pointer patchset which add binary
>           xattr names with a few deps
> - [5..7]: Improvements to core fs-verity
> - [8..9]: Add read path verification to iomap
> - [10..23]: Integration of fs-verity to xfs
> 
> Changes from V1:
> - Added parent pointer patches for easier testing
> - Many issues and refactoring points fixed from the V1 review
> - Adjusted for recent changes in fs-verity core (folios, non-4k)
> - Dropped disabling of large folios
> - Completely new fsverity patches (fix, callout, log_blocksize)
> - Change approach to verification in iomap to the same one as in
>   write path. Callouts to fs instead of direct fs-verity use.
> - New XFS workqueue for post read folio verification
> - xfs_attr_get() can return underlying xfs_buf
> - xfs_bufs are marked with XBF_VERITY_CHECKED to track verified
>   blocks
> 
> kernel:
> [1]: https://github.com/alberand/linux/tree/xfs-verity-v2
> 
> xfsprogs:
> [2]: https://github.com/alberand/xfsprogs/tree/fsverity-v2

Will there any means for xfs_repair to check the merkle tree contents?
Should it clear the ondisk inode flag if it decides to trash the xattr
structure, or is it ok to let the kernel deal with flag set and no
verity data?

--D

> xfstests:
> [3]: https://github.com/alberand/xfstests/tree/fsverity-v2
> 
> v1:
> [4]: https://lore.kernel.org/linux-xfs/20221213172935.680971-1-aalbersh@redhat.com/
> 
> fs-verity:
> [5]: https://www.kernel.org/doc/html/latest/filesystems/fsverity.html
> 
> Thanks,
> Andrey
> 
> Allison Henderson (4):
>   xfs: Add new name to attri/d
>   xfs: add parent pointer support to attribute code
>   xfs: define parent pointer xattr format
>   xfs: Add xfs_verify_pptr
> 
> Andrey Albershteyn (19):
>   fsverity: make fsverity_verify_folio() accept folio's offset and size
>   fsverity: add drop_page() callout
>   fsverity: pass Merkle tree block size to ->read_merkle_tree_page()
>   iomap: hoist iomap_readpage_ctx from the iomap_readahead/_folio
>   iomap: allow filesystem to implement read path verification
>   xfs: add XBF_VERITY_CHECKED xfs_buf flag
>   xfs: add XFS_DA_OP_BUFFER to make xfs_attr_get() return buffer
>   xfs: introduce workqueue for post read IO work
>   xfs: add iomap's readpage operations
>   xfs: add attribute type for fs-verity
>   xfs: add fs-verity ro-compat flag
>   xfs: add inode on-disk VERITY flag
>   xfs: initialize fs-verity on file open and cleanup on inode
>     destruction
>   xfs: don't allow to enable DAX on fs-verity sealsed inode
>   xfs: disable direct read path for fs-verity sealed files
>   xfs: add fs-verity support
>   xfs: handle merkle tree block size != fs blocksize != PAGE_SIZE
>   xfs: add fs-verity ioctls
>   xfs: enable ro-compat fs-verity flag
> 
>  fs/btrfs/verity.c               |  15 +-
>  fs/erofs/data.c                 |  12 +-
>  fs/ext4/verity.c                |   9 +-
>  fs/f2fs/verity.c                |   9 +-
>  fs/gfs2/aops.c                  |  10 +-
>  fs/ioctl.c                      |   4 +
>  fs/iomap/buffered-io.c          |  89 ++++++-----
>  fs/verity/read_metadata.c       |   7 +-
>  fs/verity/verify.c              |   9 +-
>  fs/xfs/Makefile                 |   1 +
>  fs/xfs/libxfs/xfs_attr.c        |  81 +++++++++-
>  fs/xfs/libxfs/xfs_attr.h        |   7 +-
>  fs/xfs/libxfs/xfs_attr_leaf.c   |   7 +
>  fs/xfs/libxfs/xfs_attr_remote.c |  13 +-
>  fs/xfs/libxfs/xfs_da_btree.h    |   7 +-
>  fs/xfs/libxfs/xfs_da_format.h   |  46 +++++-
>  fs/xfs/libxfs/xfs_format.h      |  14 +-
>  fs/xfs/libxfs/xfs_log_format.h  |   8 +-
>  fs/xfs/libxfs/xfs_sb.c          |   2 +
>  fs/xfs/scrub/attr.c             |   4 +-
>  fs/xfs/xfs_aops.c               |  61 +++++++-
>  fs/xfs/xfs_attr_item.c          | 142 +++++++++++++++---
>  fs/xfs/xfs_attr_item.h          |   1 +
>  fs/xfs/xfs_attr_list.c          |  17 ++-
>  fs/xfs/xfs_buf.h                |  17 ++-
>  fs/xfs/xfs_file.c               |  22 ++-
>  fs/xfs/xfs_inode.c              |   2 +
>  fs/xfs/xfs_inode.h              |   3 +-
>  fs/xfs/xfs_ioctl.c              |  22 +++
>  fs/xfs/xfs_iomap.c              |  14 ++
>  fs/xfs/xfs_iops.c               |   4 +
>  fs/xfs/xfs_linux.h              |   1 +
>  fs/xfs/xfs_mount.h              |   3 +
>  fs/xfs/xfs_ondisk.h             |   4 +
>  fs/xfs/xfs_super.c              |  19 +++
>  fs/xfs/xfs_trace.h              |   1 +
>  fs/xfs/xfs_verity.c             | 256 ++++++++++++++++++++++++++++++++
>  fs/xfs/xfs_verity.h             |  27 ++++
>  fs/xfs/xfs_xattr.c              |   9 ++
>  fs/zonefs/file.c                |  12 +-
>  include/linux/fsverity.h        |  18 ++-
>  include/linux/iomap.h           |  39 ++++-
>  include/uapi/linux/fs.h         |   1 +
>  43 files changed, 923 insertions(+), 126 deletions(-)
>  create mode 100644 fs/xfs/xfs_verity.c
>  create mode 100644 fs/xfs/xfs_verity.h
> 
> -- 
> 2.38.4
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
