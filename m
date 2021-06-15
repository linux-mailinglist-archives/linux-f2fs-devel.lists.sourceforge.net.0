Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CFA3A7A26
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jun 2021 11:18:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lt5DN-0004tq-Vz; Tue, 15 Jun 2021 09:18:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1lt5DJ-0004sO-SF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 09:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ve/8VdV5ATCd8gDlWB7j+8DY7mnfOpAFlUgroZwDEto=; b=RR7dPf/8yanprUtQ05cJVDKuun
 y3piVrFiDXKeeVxhpzUOVQ/gkaR552NiC48LWpAdqEf9PO3nOQbRbVNqfkmf9+gYLNHmiSEUowTq8
 9tH22VJF/62I3kRc4GLHRqaLGA430PceBYI7MYYKA1OW/zxab609CBCNFjS1DRgxijoY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ve/8VdV5ATCd8gDlWB7j+8DY7mnfOpAFlUgroZwDEto=; b=i
 AoKJjOFRD20wN/GAYciT42Ciieeznx7EcRagwFjdfErjo5MEeIDoDwPr5L6BCpobIy1QrN8ejTik9
 qSzbsmILRQp6hcvAVquEg7B5uPx7GhwsIZLRd+MXT+wsqwCP1VFzqdNFaccafLL9C9+qsfxbtG9hd
 7dM4xr1U0OSzcCLQ=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lt5DB-0001Hm-5M
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 09:18:29 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0B0F4219C1;
 Tue, 15 Jun 2021 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623748695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ve/8VdV5ATCd8gDlWB7j+8DY7mnfOpAFlUgroZwDEto=;
 b=pEvfs+MIdWGiL+79/LBEcUwyB/vGR9T8fYilFMpzFILeKheCjSOdm7S5Ui148U1KoQoQSy
 3T/4yyzdeFSRyZPYoqzzSdelLmgiENiW8IdiyNqDxWQrPyvdeYH/zxgq65AnECabWZEs0m
 Af2AoV2NiFrKRGYikCTbpuHeUChdhCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623748695;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ve/8VdV5ATCd8gDlWB7j+8DY7mnfOpAFlUgroZwDEto=;
 b=ZMzjwv+y2ToAmcAxn3/BkX9H6OfYOU63RLwcSgZ661rESH7ekChXILZ5Zb+pJ62mhbgRpM
 PY0tCz+eWLSO9rAg==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 58572A3B8A;
 Tue, 15 Jun 2021 09:18:14 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 20C051F2C88; Tue, 15 Jun 2021 11:18:14 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Tue, 15 Jun 2021 11:17:50 +0200
Message-Id: <20210615090844.6045-1-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4970; h=from:subject:message-id;
 bh=/sZ++c9xXAJeTuglXbv8ruz7LbfqLjU56wvnbCZ/6L0=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBgyHAdwkkXwSe7Dkt5sFq/HRSB1n3MRmc0+2hDWMSQ
 DQ6tVSOJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCYMhwHQAKCRCcnaoHP2RA2cgjB/
 92jqyXQZM9KaCgyXyl8ApDRJrJsxEZuAA1O2qua0wRVhnMBEiAhpMUKJG7cboL5Nvr1cNenxVTalp3
 /dq1p168pS/8bkPlnsaldwKfpCAZq5fC8QdNz+/u5oK9U+i32NVPHfSZd3cQDPDdzLEovoPq4jaU9r
 0ilefBWCXh5B317cK5JYIrG1okBRWTncncXjrIqYCqoK+EMpnPQrP7FiQIvc8HbrRPY/eI9BqGh4DF
 JjIIOvf58NezRRf3o8yXPHcrOCwdA6GZB5D5aFM+z2LttELmYw5W4WCMbwcDzhnSqMJTkJHOezSm70
 mE7r1Fq3rNj/RFLT+IXZh+mdYlIgsY
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
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
X-Headers-End: 1lt5DB-0001Hm-5M
Subject: [f2fs-dev] [PATCH 0/14 v8] fs: Hole punch vs page cache filling
 races
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
Cc: linux-cifs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

here is another version of my patches to address races between hole punching
and page cache filling functions for ext4 and other filesystems. The only
significant change since last time is simplification in xfs_isilocked()
suggested by Dave Chinner. So that needs final review and I'd also like to
have another pair of eyes on the mm changes in patch 3/14. Otherwise I think
the series is ready - Darrick agreed to take it through his tree.

Out of all filesystem supporting hole punching, only GFS2 and OCFS2 remain
unresolved. GFS2 people are working on their own solution (cluster locking is
involved), OCFS2 has even bigger issues (maintainers informed, looking into
it).

Once this series lands, I'd like to actually make sure all calls to
truncate_inode_pages() happen under mapping->invalidate_lock, add the assert
and then we can also get rid of i_size checks in some places (truncate can
use the same serialization scheme as hole punch). But that step is mostly
a cleanup so I'd like to get these functional fixes in first.

Note that the first patch of the series is already in mm tree but I'm
submitting it here so that the series applies to Linus' tree cleanly.

Changes since v7:
* Rebased on top of 5.13-rc6
* Added some reviewed-by tags
* Simplified xfs_isilocked() changes as Dave Chinner suggested
* Minor documentation formulation improvements

Changes since v6:
* Added some reviewed-by tags
* Added wrapper for taking invalidate_lock similar to inode_lock
* Renamed wrappers for taking invalidate_lock for two inodes
* Added xfs patch to make xfs_isilocked() work better even without lockdep
* Some minor documentation fixes

Changes since v5:
* Added some reviewed-by tags
* Added functions for locking two mappings and using them from XFS where needed
* Some minor code style & comment fixes

Changes since v4:
* Rebased onto 5.13-rc1
* Removed shmfs conversion patches
* Fixed up zonefs changelog
* Fixed up XFS comments
* Added patch fixing up definition of file_operations in Documentation/vfs/
* Updated documentation and comments to explain invalidate_lock is used also
  to prevent changes through memory mappings to existing pages for some VFS
  operations.

Changes since v3:
* Renamed and moved lock to struct address_space
* Added conversions of tmpfs, ceph, cifs, fuse, f2fs
* Fixed error handling path in filemap_read()
* Removed .page_mkwrite() cleanup from the series for now

Changes since v2:
* Added documentation and comments regarding lock ordering and how the lock is
  supposed to be used
* Added conversions of ext2, xfs, zonefs
* Added patch removing i_mapping_sem protection from .page_mkwrite handlers

Changes since v1:
* Moved to using inode->i_mapping_sem instead of aops handler to acquire
  appropriate lock

---
Motivation:

Amir has reported [1] a that ext4 has a potential issues when reads can race
with hole punching possibly exposing stale data from freed blocks or even
corrupting filesystem when stale mapping data gets used for writeout. The
problem is that during hole punching, new page cache pages can get instantiated
and block mapping from the looked up in a punched range after
truncate_inode_pages() has run but before the filesystem removes blocks from
the file. In principle any filesystem implementing hole punching thus needs to
implement a mechanism to block instantiating page cache pages during hole
punching to avoid this race. This is further complicated by the fact that there
are multiple places that can instantiate pages in page cache.  We can have
regular read(2) or page fault doing this but fadvise(2) or madvise(2) can also
result in reading in page cache pages through force_page_cache_readahead().

There are couple of ways how to fix this. First way (currently implemented by
XFS) is to protect read(2) and *advise(2) calls with i_rwsem so that they are
serialized with hole punching. This is easy to do but as a result all reads
would then be serialized with writes and thus mixed read-write workloads suffer
heavily on ext4. Thus this series introduces inode->i_mapping_sem and uses it
when creating new pages in the page cache and looking up their corresponding
block mapping. We also replace EXT4_I(inode)->i_mmap_sem with this new rwsem
which provides necessary serialization with hole punching for ext4.

								Honza

[1] https://lore.kernel.org/linux-fsdevel/CAOQ4uxjQNmxqmtA_VbYW0Su9rKRk2zobJmahcyeaEVOFKVQ5dw@mail.gmail.com/

Previous versions:
Link: https://lore.kernel.org/linux-fsdevel/20210208163918.7871-1-jack@suse.cz/
Link: https://lore.kernel.org/r/20210413105205.3093-1-jack@suse.cz
Link: https://lore.kernel.org/r/20210423171010.12-1-jack@suse.cz
Link: https://lore.kernel.org/r/20210512101639.22278-1-jack@suse.cz
Link: https://lore.kernel.org/r/20210525125652.20457-1-jack@suse.cz
Link: https://lore.kernel.org/r/20210607144631.8717-1-jack@suse.cz


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
