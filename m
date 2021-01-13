Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA4F2F4FF6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Jan 2021 17:30:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzj2J-0004DN-BK; Wed, 13 Jan 2021 16:30:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kzj2H-0004DG-MR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Jan 2021 16:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pt1h8qvYdsfAYt7mrYMQoVTKe4YPJL8RCtw6I9vKTRQ=; b=kEI1XXGpDefOKJlFClYF2HDuoI
 6QedNkThMMg5K6SJydZf2ktgxvXxVG+HgrnXF2EwUWv9HYoQyhpbh/NH994A5Ewbh3REkaN5/QD1O
 TufZbP2N34/V/1CdT4D9fuJ24ReVyx61Sph/3H+VK21TOfTtxY1YDpohM4fa5T+zLkes=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pt1h8qvYdsfAYt7mrYMQoVTKe4YPJL8RCtw6I9vKTRQ=; b=GvWvAbRqGvcGpjD5UsyHDLW/T5
 La7OL3TB0vgIRDSwe+aEcvxbC4+Fz80eIYZu+2Jw4VBzjKN1I1B/8fqCwcz6fkLhKAMn+PfCpdSx2
 /xG+sPiZ7n4uPqih6vbNHnt68J9VSplIIEc13aioZoPG6a3hTPK6wLHuwZLRff+Ro7/w=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzj2C-0021Cw-PX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Jan 2021 16:30:17 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69F31AD57;
 Wed, 13 Jan 2021 16:29:58 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1BACD1E08EE; Wed, 13 Jan 2021 17:29:58 +0100 (CET)
Date: Wed, 13 Jan 2021 17:29:58 +0100
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210113162957.GA26686@quack2.suse.cz>
References: <20210112190253.64307-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112190253.64307-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kzj2C-0021Cw-PX
Subject: Re: [f2fs-dev] [PATCH v3 00/11] lazytime fix and cleanups
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello!

On Tue 12-01-21 11:02:42, Eric Biggers wrote:
> Patch 1 fixes a bug in how __writeback_single_inode() handles lazytime
> expirations.  I originally reported this last year
> (https://lore.kernel.org/r/20200306004555.GB225345@gmail.com) because it
> causes the FS_IOC_REMOVE_ENCRYPTION_KEY ioctl to not work properly, as
> the bug causes inodes to remain dirty after a sync.
> 
> It also turns out that lazytime on XFS is partially broken because it
> doesn't actually write timestamps to disk after a sync() or after
> dirtytime_expire_interval.  This is fixed by the same fix.
> 
> This supersedes previously proposed fixes, including
> https://lore.kernel.org/r/20200307020043.60118-1-tytso@mit.edu and
> https://lore.kernel.org/r/20200325122825.1086872-3-hch@lst.de from last
> year (which had some issues and didn't fix the XFS bug), and v1 of this
> patchset which took a different approach
> (https://lore.kernel.org/r/20210105005452.92521-1-ebiggers@kernel.org).
> 
> Patches 2-11 then clean up various things related to lazytime and
> writeback, such as clarifying the semantics of ->dirty_inode() and the
> inode dirty flags, and improving comments.
> 
> This patchset applies to v5.11-rc2.

Thanks for the patches. I've picked the patches to my tree. I plan to push
patch 1/11 to Linus later this week, the rest of the cleanups will go to
him during the next merge window.

								Honza

> 
> Changed v2 => v3:
>   - Changed ext4 patch to add a helper function
>     inode_is_dirtytime_only() to include/linux/fs.h.
>   - Dropped XFS cleanup patch, as it can be sent/applied separately.
>   - Added Reviewed-by's.
> 
> Changed v1 => v2:
>   - Switched to the fix suggested by Jan Kara, and dropped the
>     patches which introduced ->lazytime_expired().
>   - Fixed bugs in the fat and ext4 patches.
>   - Added patch "fs: improve comments for writeback_single_inode()".
>   - Reordered the patches a bit.
>   - Added Reviewed-by's.
> 
> Eric Biggers (11):
>   fs: fix lazytime expiration handling in __writeback_single_inode()
>   fs: correctly document the inode dirty flags
>   fs: only specify I_DIRTY_TIME when needed in generic_update_time()
>   fat: only specify I_DIRTY_TIME when needed in fat_update_time()
>   fs: don't call ->dirty_inode for lazytime timestamp updates
>   fs: pass only I_DIRTY_INODE flags to ->dirty_inode
>   fs: clean up __mark_inode_dirty() a bit
>   fs: drop redundant check from __writeback_single_inode()
>   fs: improve comments for writeback_single_inode()
>   gfs2: don't worry about I_DIRTY_TIME in gfs2_fsync()
>   ext4: simplify i_state checks in __ext4_update_other_inode_time()
> 
>  Documentation/filesystems/vfs.rst |   5 +-
>  fs/ext4/inode.c                   |  20 +----
>  fs/f2fs/super.c                   |   3 -
>  fs/fat/misc.c                     |  23 +++---
>  fs/fs-writeback.c                 | 132 +++++++++++++++++-------------
>  fs/gfs2/file.c                    |   4 +-
>  fs/gfs2/super.c                   |   2 -
>  fs/inode.c                        |  38 +++++----
>  include/linux/fs.h                |  33 ++++++--
>  9 files changed, 146 insertions(+), 114 deletions(-)
> 
> 
> base-commit: e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
> -- 
> 2.30.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
