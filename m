Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DA33C9FF7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jul 2021 15:46:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m41h2-0006tm-9a; Thu, 15 Jul 2021 13:46:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1m41bi-0005mz-Us
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Jul 2021 13:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lxjF3CK86ui5KcZJwykR/wqqB4lbFmoClZkkZRdrozc=; b=WRndQtmGw1iGRunARpRWVrBKE2
 YcRuhWxK65gR3FrWXB1sS2JoGUpScpCW6gYiFzf+5qXzzJNVptTAmztGjrDlSGt2nWh7SNU9hNszr
 +YBFImZVT86rGrYKiYHYDk1vQ+5OOnJHxcEz9k4yIaZik8KNMgocQw1BWyfn6wzowBDM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lxjF3CK86ui5KcZJwykR/wqqB4lbFmoClZkkZRdrozc=; b=S
 K0IXq20rAn3/uobKr5p6nz5kaqXw7ax8+bXecnRRa+0509ZNJKuidFhbWLznPnh3rtqCOgUEEirCV
 w4vKLyWQzywLigOJsvaXIT1WD/VzgHrQ5DvJToV4o6XH6rRvAlboXtX4h79q9a6ujJELC3XiYYl6P
 A5TFNWwxEFEtAn4Y=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m41ba-00075Y-Vq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Jul 2021 13:40:54 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 53C3822873;
 Thu, 15 Jul 2021 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626356433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lxjF3CK86ui5KcZJwykR/wqqB4lbFmoClZkkZRdrozc=;
 b=tg3bRjUxFItKFHpdlpE7B/m38hYOUzxOi4SEdeTQmthrsZCazil++ZvmKJzpyOKkxa7Dhw
 GPz+0MaE+S3TZVywYcmdwKfHbYS6Jw+ad4gbMeficIQHASlw+3ORkSwKTa71H3zBx4rQVh
 tXcfk1ZJUWn5TJ8ewREZOmXQLPql74c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626356433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lxjF3CK86ui5KcZJwykR/wqqB4lbFmoClZkkZRdrozc=;
 b=wTOMhpBplkuIlFDeRrsW7sXoii8oim3lBZ5jvccZLVOuhLfqyA4xuvPelqkeu7MA7G3qtt
 jB8dqyD+EqWNf9AQ==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 353C0A3B8D;
 Thu, 15 Jul 2021 13:40:33 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id F2BED1E0BF2; Thu, 15 Jul 2021 15:40:32 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Thu, 15 Jul 2021 15:40:10 +0200
Message-Id: <20210715133202.5975-1-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5333; h=from:subject:message-id;
 bh=jCrTAGnr259IEeyAdWvovg97ESIubovJM4MlOpJvksM=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBg8Dq7Pd1N3dpzBZZXUe8nwWltlvGlPdzFYk/Lx8q9
 pxoyqOaJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCYPA6uwAKCRCcnaoHP2RA2bTiB/
 sFgFq1rmJVC0lYvYbWNvx359nYpqcc/f/xZ3cyvfKDtWDp1ZN+wTonGovtY+NHusgnP1HyPjIzHVO1
 ZVzv6y9F7dKZjwzEoJrRoLCzZk+t2RywbqDD3SIhW9O5+arg1GomalCV19fbYsKSlK5INuu9fsuxr3
 H/MAaDzp22g25nqlAvEBDtFb9siGQMhIREXhGoW6k2bisvXZVO8yTFkKabqmCs1YBKJjIm1/sJgU4f
 3sGVPh/PAWItuW2w+ljKZHlqFc/321A+gEln8hAWnqg96fG3n9du1ZgPEUhptjDdViFbRLi1YVav4f
 rVXXywXhqZLTRnU/U1CObhJccDuMSK
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
X-Headers-End: 1m41ba-00075Y-Vq
Subject: [f2fs-dev] [PATCH 0/14 v10] fs: Hole punch vs page cache filling
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
Cc: linux-xfs@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-cifs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Jan Kara <jack@suse.cz>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

here is another version of my patches to address races between hole punching
and page cache filling functions for ext4 and other filesystems. The only
change since the last time is a small cleanup applied to changes of
filemap_fault() in patch 3/14 based on Christoph's & Darrick's feedback (thanks
guys!).  Darrick, Christoph, is the patch fine now?

Out of all filesystem supporting hole punching, only GFS2 and OCFS2 remain
unresolved. GFS2 people are working on their own solution (cluster locking is
involved), OCFS2 has even bigger issues (maintainers informed, looking into
it).

Once this series lands, I'd like to actually make sure all calls to
truncate_inode_pages() happen under mapping->invalidate_lock, add the assert
and then we can also get rid of i_size checks in some places (truncate can
use the same serialization scheme as hole punch). But that step is mostly
a cleanup so I'd like to get these functional fixes in first.

The series can be also pulled from:
git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git hole_punch_fixes

Changes since v9:
* Cleaned up filemap_fault() to be more readable based on review feedback

Changes since v8:
* Rebased on top of 5.14-rc1
* Fixed up conflict in f2fs
* Modified filemap_fault() to acquire invalidate lock only when creating page
  in the page cache or loading it from the disk
* Added some reviewed-by's

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
Link: http://lore.kernel.org/r/20210615090844.6045-1-jack@suse.cz # v8
Link: http://lore.kernel.org/r/20210712163901.29514-1-jack@suse.cz # v9


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
