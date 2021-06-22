Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4E43B00F0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jun 2021 12:05:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lvdHR-0005M2-E5; Tue, 22 Jun 2021 10:05:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1lvdHP-0005LX-CE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Jun 2021 10:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J3kbE7iH7QbzIIxkb82odwgZdE+ENBNes3YiuYmeOBM=; b=SSmRzZixTJC0zjE3x9wAqXHM7a
 lOxRNtivz4dVwWM/WKS6Upr8tHWRBANu0HG486lGmlzSND4+kazE5p/VZiuFWx6ZUW3QRxrGxcfat
 A0vWQxBjvaV5s3auZv2FzP/xb4CsmOerV1IQVC39lg10aGY+G9FqRsmv8PdxvblkEtkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=J3kbE7iH7QbzIIxkb82odwgZdE+ENBNes3YiuYmeOBM=; b=M
 5O1Kk3azbnvR7xCmKo4vSYDmJ2++k27NLdhX+yxvDVrIw+855upYTgw9Snm0KY7/jaUa535+3PHDR
 y6pCniZD00g2y6BgmgxTMovd+zC4Bm9iaY7n3sB7pqY4PZ2vhUIUX2jt7FLmzIU3GUTEMaiKA2T9J
 1X1ySEvaNWEoKGjg=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lvdHG-0002AP-Th
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Jun 2021 10:05:15 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 3EDF41FD45;
 Tue, 22 Jun 2021 10:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624356302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=J3kbE7iH7QbzIIxkb82odwgZdE+ENBNes3YiuYmeOBM=;
 b=dbZaYxuILiRaFr5eNjCKVx6KLWyV30rDu5zcZWDodg8k7DNY7SWjEZsUjnr5AvUkLeoYiS
 IHYg6a4F9HqAuNfp8iPFhDinfZYOmytz1WvpkmY7MT9VelJIw7Ly1l+rRfeoLeqtKNjjwd
 fwFvvGTBEW6Ey6AH3SgXEnY/VY7pGY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624356302;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=J3kbE7iH7QbzIIxkb82odwgZdE+ENBNes3YiuYmeOBM=;
 b=dJM0H9PJ8/7nbIk7JI1om+3Wij9R9egMfTmQEuWbdz7G7HypNCeGEN3y6FauKdmkzHQoxG
 XKOS4oqruWUet4Bg==
Received: from quack2.suse.cz (unknown [10.100.224.230])
 by relay2.suse.de (Postfix) with ESMTP id 308DEA3B8D;
 Tue, 22 Jun 2021 10:05:02 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 0FC951E1515; Tue, 22 Jun 2021 12:05:02 +0200 (CEST)
Date: Tue, 22 Jun 2021 12:05:02 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210622100502.GE14261@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lvdHG-0002AP-Th
Subject: [f2fs-dev] [GIT PULL] fs: Hole punch fixes
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
Cc: linux-cifs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

  Hello Darrick,

  here is a prepared pull request with the hole punch fixes:

git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git hole_punch_fixes_for_5.14-rc1

Top of the tree is a68454854cd9. The full shortlog is:

Jan Kara (13):
      mm: Fix comments mentioning i_mutex
      documentation: Sync file_operations members with reality
      mm: Protect operations adding pages to page cache with invalidate_lock
      mm: Add functions to lock invalidate_lock for two mappings
      ext4: Convert to use mapping->invalidate_lock
      ext2: Convert to using invalidate_lock
      xfs: Convert to use invalidate_lock
      xfs: Convert double locking of MMAPLOCK to use VFS helpers
      zonefs: Convert to using invalidate_lock
      f2fs: Convert to using invalidate_lock
      fuse: Convert to using invalidate_lock
      ceph: Fix race between hole punch and page fault
      cifs: Fix race between hole punch and page fault

Pavel Reichl (1):
      xfs: Refactor xfs_isilocked()

The diffstat is

 Documentation/filesystems/locking.rst |  77 +++++++++++++++-------
 fs/ceph/addr.c                        |   9 ++-
 fs/ceph/file.c                        |   2 +
 fs/cifs/smb2ops.c                     |   2 +
 fs/ext2/ext2.h                        |  11 ----
 fs/ext2/file.c                        |   7 +-
 fs/ext2/inode.c                       |  12 ++--
 fs/ext2/super.c                       |   3 -
 fs/ext4/ext4.h                        |  10 ---
 fs/ext4/extents.c                     |  25 +++----
 fs/ext4/file.c                        |  13 ++--
 fs/ext4/inode.c                       |  47 +++++--------
 fs/ext4/ioctl.c                       |   4 +-
 fs/ext4/super.c                       |  13 ++--
 fs/ext4/truncate.h                    |   8 ++-
 fs/f2fs/data.c                        |   4 +-
 fs/f2fs/f2fs.h                        |   1 -
 fs/f2fs/file.c                        |  62 +++++++++--------
 fs/f2fs/super.c                       |   1 -
 fs/fuse/dax.c                         |  50 +++++++-------
 fs/fuse/dir.c                         |  11 ++--
 fs/fuse/file.c                        |  10 +--
 fs/fuse/fuse_i.h                      |   7 --
 fs/fuse/inode.c                       |   1 -
 fs/inode.c                            |   2 +
 fs/xfs/xfs_bmap_util.c                |  15 +++--
 fs/xfs/xfs_file.c                     |  13 ++--
 fs/xfs/xfs_inode.c                    | 121 ++++++++++++++++++----------------
 fs/xfs/xfs_inode.h                    |   3 +-
 fs/xfs/xfs_super.c                    |   2 -
 fs/zonefs/super.c                     |  23 ++-----
 fs/zonefs/zonefs.h                    |   7 +-
 include/linux/fs.h                    |  39 +++++++++++
 mm/filemap.c                          | 113 ++++++++++++++++++++++++++-----
 mm/madvise.c                          |   2 +-
 mm/memory-failure.c                   |   2 +-
 mm/readahead.c                        |   2 +
 mm/rmap.c                             |  41 ++++++------
 mm/shmem.c                            |  20 +++---
 mm/truncate.c                         |   9 +--
 40 files changed, 453 insertions(+), 351 deletions(-)

							Thanks
								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
