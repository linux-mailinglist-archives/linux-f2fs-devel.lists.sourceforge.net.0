Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D1016336F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 21:49:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j49o4-0004nb-45; Tue, 18 Feb 2020 20:49:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j49o2-0004nQ-Ip
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 20:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sSzUuAsXGIrXy4vQ0zTAGyf0jed9sNlmwz2tpEx8I1w=; b=URXAMtrCjb2q6m0ygVuVPTNueh
 TSRVppdDmhewzRDP7AZbPb0weI0G4Tj9s4AYXGK3Nz2/aVDty78a9YHgIS/2YWqK7XabtYbNnE+xb
 SrvpoXLV7DoUtYMq9gSjRs/njTuxGG2bRmDlyfyTYIzKEXjTuTtupS0zfp1jIh87o+Os=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sSzUuAsXGIrXy4vQ0zTAGyf0jed9sNlmwz2tpEx8I1w=; b=cN5qLhQL7hL0cVXyplGKKt9IhY
 EJuzOhSUZ2gxYtDUN2pPPzL+WA6nxZ1ztk40e4Xua1qm9DM0PW3h6H+X7bi2CjIi42/jWanWsQBbu
 Te7CZLlM0fCf3zZ+eEtZx9TfQtzfjQ1DPdjdGxJi9b9rkuku0WG6xpQNXab9ZTAqJ5go=;
Received: from hqnvemgate25.nvidia.com ([216.228.121.64])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j49o0-00Gv3T-9c
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 20:49:22 +0000
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4c4da80000>; Tue, 18 Feb 2020 12:48:40 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 18 Feb 2020 12:49:11 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 18 Feb 2020 12:49:11 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Feb
 2020 20:49:11 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200217184613.19668-1-willy@infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <80d98657-2f93-da92-a541-707429a6fcdf@nvidia.com>
Date: Tue, 18 Feb 2020 12:49:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582058920; bh=sSzUuAsXGIrXy4vQ0zTAGyf0jed9sNlmwz2tpEx8I1w=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=OYgEBVV/ua9FohonQVxYl3qPPXVMYQG31aVJZXFPu7SkYOwxhtaZfQM11ZRWuKWRn
 lVI3HR/RIXFrZMOWjvHUihTcKXkE2jgWZqXXGCNxpXb3Nv2SKAT+FXp4fzmW9R+SbR
 +H8xokJDzpZ6UCukKlMzu/5eKP5axPGrm5jxpyyz73wcaxjN5ykeBaYI4TDMwgMSY8
 xsZHrBQYyHRUHdXgYU3ZVNQuJpgqlmVcDrdSv4XqikXa55cxrAOxN2l1s5oRfr4SZG
 EEyk1LdZCMme+4QhBVN+8g/HUCynjQ8e9lz6/YoFujDdaTBOhd1TQ8nXhH+hrOTVqL
 JwGZHfev+XX/A==
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1j49o0-00Gv3T-9c
Subject: Re: [f2fs-dev] [PATCH v6 00/19] Change readahead API
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/17/20 10:45 AM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> This series adds a readahead address_space operation to eventually
> replace the readpages operation.  The key difference is that
> pages are added to the page cache as they are allocated (and
> then looked up by the filesystem) instead of passing them on a
> list to the readpages operation and having the filesystem add
> them to the page cache.  It's a net reduction in code for each
> implementation, more efficient than walking a list, and solves
> the direct-write vs buffered-read problem reported by yu kuai at
> https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@huawei.com/
> 
> The only unconverted filesystems are those which use fscache.
> Their conversion is pending Dave Howells' rewrite which will make the
> conversion substantially easier.

Hi Matthew,

I see that Dave Chinner is reviewing this series, but I'm trying out his recent
advice about code reviews [1], and so I'm not going to read his comments first.
So you may see some duplication or contradictions this time around.


[1] Somewhere in this thread, "[LSF/MM/BPF TOPIC] FS Maintainers Don't Scale": 
https://lore.kernel.org/r/20200131052520.GC6869@magnolia


thanks,
-- 
John Hubbard
NVIDIA

> 
> v6:
>  - Name the private members of readahead_control with a leading underscore
>    (suggested by Christoph Hellwig)
>  - Fix whitespace in rst file
>  - Remove misleading comment in btrfs patch
>  - Add readahead_next() API and use it in iomap
>  - Add iomap_readahead kerneldoc.
>  - Fix the mpage_readahead kerneldoc
>  - Make various readahead functions return void
>  - Keep readahead_index() and readahead_offset() pointing to the start of
>    this batch through the body.  No current user requires this, but it's
>    less surprising.
>  - Add kerneldoc for page_cache_readahead_limit
>  - Make page_idx an unsigned long, and rename it to just 'i'
>  - Get rid of page_offset local variable
>  - Add patch to call memalloc_nofs_save() before allocating pages (suggested
>    by Michal Hocko)
>  - Resplit a lot of patches for more logical progression and easier review
>    (suggested by John Hubbard)
>  - Added sign-offs where received, and I deemed still relevant
> 
> v5 switched to passing a readahead_control struct (mirroring the
> writepages_control struct passed to writepages).  This has a number of
> advantages:
>  - It fixes a number of bugs in various implementations, eg forgetting to
>    increment 'start', an off-by-one error in 'nr_pages' or treating 'start'
>    as a byte offset instead of a page offset.
>  - It allows us to change the arguments without changing all the
>    implementations of ->readahead which just call mpage_readahead() or
>    iomap_readahead()
>  - Figuring out which pages haven't been attempted by the implementation
>    is more natural this way.
>  - There's less code in each implementation.
> 
> Matthew Wilcox (Oracle) (19):
>   mm: Return void from various readahead functions
>   mm: Ignore return value of ->readpages
>   mm: Use readahead_control to pass arguments
>   mm: Rearrange readahead loop
>   mm: Remove 'page_offset' from readahead loop
>   mm: rename readahead loop variable to 'i'
>   mm: Put readahead pages in cache earlier
>   mm: Add readahead address space operation
>   mm: Add page_cache_readahead_limit
>   fs: Convert mpage_readpages to mpage_readahead
>   btrfs: Convert from readpages to readahead
>   erofs: Convert uncompressed files from readpages to readahead
>   erofs: Convert compressed files from readpages to readahead
>   ext4: Convert from readpages to readahead
>   f2fs: Convert from readpages to readahead
>   fuse: Convert from readpages to readahead
>   iomap: Restructure iomap_readpages_actor
>   iomap: Convert from readpages to readahead
>   mm: Use memalloc_nofs_save in readahead path
> 
>  Documentation/filesystems/locking.rst |   6 +-
>  Documentation/filesystems/vfs.rst     |  13 ++
>  drivers/staging/exfat/exfat_super.c   |   7 +-
>  fs/block_dev.c                        |   7 +-
>  fs/btrfs/extent_io.c                  |  46 ++-----
>  fs/btrfs/extent_io.h                  |   3 +-
>  fs/btrfs/inode.c                      |  16 +--
>  fs/erofs/data.c                       |  39 ++----
>  fs/erofs/zdata.c                      |  29 ++--
>  fs/ext2/inode.c                       |  10 +-
>  fs/ext4/ext4.h                        |   3 +-
>  fs/ext4/inode.c                       |  23 ++--
>  fs/ext4/readpage.c                    |  22 ++-
>  fs/ext4/verity.c                      |  35 +----
>  fs/f2fs/data.c                        |  50 +++----
>  fs/f2fs/f2fs.h                        |   5 +-
>  fs/f2fs/verity.c                      |  35 +----
>  fs/fat/inode.c                        |   7 +-
>  fs/fuse/file.c                        |  46 +++----
>  fs/gfs2/aops.c                        |  23 ++--
>  fs/hpfs/file.c                        |   7 +-
>  fs/iomap/buffered-io.c                | 118 +++++++----------
>  fs/iomap/trace.h                      |   2 +-
>  fs/isofs/inode.c                      |   7 +-
>  fs/jfs/inode.c                        |   7 +-
>  fs/mpage.c                            |  38 ++----
>  fs/nilfs2/inode.c                     |  15 +--
>  fs/ocfs2/aops.c                       |  34 ++---
>  fs/omfs/file.c                        |   7 +-
>  fs/qnx6/inode.c                       |   7 +-
>  fs/reiserfs/inode.c                   |   8 +-
>  fs/udf/inode.c                        |   7 +-
>  fs/xfs/xfs_aops.c                     |  13 +-
>  fs/zonefs/super.c                     |   7 +-
>  include/linux/fs.h                    |   2 +
>  include/linux/iomap.h                 |   3 +-
>  include/linux/mpage.h                 |   4 +-
>  include/linux/pagemap.h               |  90 +++++++++++++
>  include/trace/events/erofs.h          |   6 +-
>  include/trace/events/f2fs.h           |   6 +-
>  mm/internal.h                         |   8 +-
>  mm/migrate.c                          |   2 +-
>  mm/readahead.c                        | 184 +++++++++++++++++---------
>  43 files changed, 474 insertions(+), 533 deletions(-)
> 
> 
> base-commit: 11a48a5a18c63fd7621bb050228cebf13566e4d8
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
