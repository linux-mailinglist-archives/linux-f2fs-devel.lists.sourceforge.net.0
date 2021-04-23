Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A255E36A6DA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Apr 2021 13:08:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lacd2-0004tZ-KS; Sun, 25 Apr 2021 11:08:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1lacEK-0003gQ-U3
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 10:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uoC2ATFCOLcEmQFF8QkW+7CWVutpXN/nRuR9B44tPPI=; b=GXkvr6+wIVfuj+9WFJg8SyX00h
 euaWTbdOSJ8E3+bGQ8z7OI7FUcRt0Weacygw40DVU1I4LvTAJstlKtcEk+Y6oAPoGlw2WoE7Hek6b
 qAQC4z+0B/mo/gs5on9BjTwrpOpgvWhnOu5ToQiTKdeP1ACfUsTt/tWs/4KrpH1PzxmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uoC2ATFCOLcEmQFF8QkW+7CWVutpXN/nRuR9B44tPPI=; b=B/wrRvCdwcToYLHag2zddPJuYz
 Twqvzh/XiEQ3Uh2PSPe1UD/AclGau/pzjUDFb2Lr1oOMy5I12YVr3gxmATqdg0oCbHHHftziJHaD3
 aY9sQ4bcDBkvy0vZfDpL2nejenW2CDyWrh1MXdlZ62YDG9sGEKZJP83niCLZa8NecZvc=;
Received: from mail110.syd.optusnet.com.au ([211.29.132.97])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1lacEF-0004oj-PK
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 10:43:13 +0000
Received: from dread.disaster.area (pa49-181-239-12.pa.nsw.optusnet.com.au
 [49.181.239.12])
 by mail110.syd.optusnet.com.au (Postfix) with ESMTPS id E1D4310BE4E;
 Sat, 24 Apr 2021 08:07:52 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1la3xn-004YOq-PH; Sat, 24 Apr 2021 08:07:51 +1000
Date: Sat, 24 Apr 2021 08:07:51 +1000
From: Dave Chinner <david@fromorbit.com>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210423220751.GB63242@dread.disaster.area>
References: <20210423171010.12-1-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423171010.12-1-jack@suse.cz>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=Tu+Yewfh c=1 sm=1 tr=0 cx=a_idp_f
 a=gO82wUwQTSpaJfP49aMSow==:117 a=gO82wUwQTSpaJfP49aMSow==:17
 a=kj9zAlcOel0A:10 a=3YhXtTcJ-WEA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=i0EeH86SAAAA:8 a=JF9118EUAAAA:8 a=yPCof4ZbAAAA:8 a=1XWaLZrsAAAA:8
 a=FP58Ms26AAAA:8 a=37rDS-QxAAAA:8 a=hGzw-44bAAAA:8 a=7-415B0cAAAA:8
 a=Aae5kKz94hHt9Mq2e2cA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=xVlTc564ipvMDusKsbsT:22 a=k1Nq6YrhK2t884LQW06G:22
 a=HvKuF1_PTVFglORKqfwH:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1lacEF-0004oj-PK
Subject: Re: [f2fs-dev] [PATCH 0/12 v4] fs: Hole punch vs page cache filling
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
 Ted Tso <tytso@mit.edu>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, Hugh Dickins <hughd@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Steve French <sfrench@samba.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jan,

In future, can you please use the same cc-list for the entire
patchset?

The stuff that has hit the XFS list (where I'm replying from)
doesn't give me any context as to what the core changes are that
allow XFS to be changed, so I can't review them in isolation.

I've got to spend time now reconstructing the patchset into a single
series because the delivery has been spread across three different
mailing lists and so hit 3 different procmail filters.  I'll comment
on the patches once I've reconstructed the series and read through
it as a whole...

/me considers the way people use "cc" tags in git commits for
including mailing lists on individual patches actively harmful.
Unless the recipient is subscribed to all the mailing lists the
patchset was CC'd to, they can't easily find the bits of the
patchset that didn't arrive in their mail box. Individual mailing
lists should receive entire patchsets for review, not random,
individual, context free patches. 

And, FWIW, cc'ing the cover letter to all the mailing lists is not
good enough. Being able to see the code change as a whole is what
matters for review, not the cover letter...

Cheers,

Dave.

On Fri, Apr 23, 2021 at 07:29:29PM +0200, Jan Kara wrote:
> Hello,
> 
> here is another version of my patches to address races between hole punching
> and page cache filling functions for ext4 and other filesystems. I think
> we are coming close to a complete solution so I've removed the RFC tag from
> the subject. I went through all filesystems supporting hole punching and
> converted them from their private locks to a generic one (usually fixing the
> race ext4 had as a side effect). I also found out ceph & cifs didn't have
> any protection from the hole punch vs page fault race either so I've added
> appropriate protections there. Open are still GFS2 and OCFS2 filesystems.
> GFS2 actually avoids the race but is prone to deadlocks (acquires the same lock
> both above and below mmap_sem), OCFS2 locking seems kind of hosed and some
> read, write, and hole punch paths are not properly serialized possibly leading
> to fs corruption. Both issues are non-trivial so respective fs maintainers
> have to deal with those (I've informed them and problems were generally
> confirmed). Anyway, for all the other filesystem this kind of race should
> be closed.
> 
> As a next step, I'd like to actually make sure all calls to
> truncate_inode_pages() happen under mapping->invalidate_lock, add the assert
> and then we can also get rid of i_size checks in some places (truncate can
> use the same serialization scheme as hole punch). But that step is mostly
> a cleanup so I'd like to get these functional fixes in first.
> 
> Changes since v3:
> * Renamed and moved lock to struct address_space
> * Added conversions of tmpfs, ceph, cifs, fuse, f2fs
> * Fixed error handling path in filemap_read()
> * Removed .page_mkwrite() cleanup from the series for now
> 
> Changes since v2:
> * Added documentation and comments regarding lock ordering and how the lock is
>   supposed to be used
> * Added conversions of ext2, xfs, zonefs
> * Added patch removing i_mapping_sem protection from .page_mkwrite handlers
> 
> Changes since v1:
> * Moved to using inode->i_mapping_sem instead of aops handler to acquire
>   appropriate lock
> 
> ---
> Motivation:
> 
> Amir has reported [1] a that ext4 has a potential issues when reads can race
> with hole punching possibly exposing stale data from freed blocks or even
> corrupting filesystem when stale mapping data gets used for writeout. The
> problem is that during hole punching, new page cache pages can get instantiated
> and block mapping from the looked up in a punched range after
> truncate_inode_pages() has run but before the filesystem removes blocks from
> the file. In principle any filesystem implementing hole punching thus needs to
> implement a mechanism to block instantiating page cache pages during hole
> punching to avoid this race. This is further complicated by the fact that there
> are multiple places that can instantiate pages in page cache.  We can have
> regular read(2) or page fault doing this but fadvise(2) or madvise(2) can also
> result in reading in page cache pages through force_page_cache_readahead().
> 
> There are couple of ways how to fix this. First way (currently implemented by
> XFS) is to protect read(2) and *advise(2) calls with i_rwsem so that they are
> serialized with hole punching. This is easy to do but as a result all reads
> would then be serialized with writes and thus mixed read-write workloads suffer
> heavily on ext4. Thus this series introduces inode->i_mapping_sem and uses it
> when creating new pages in the page cache and looking up their corresponding
> block mapping. We also replace EXT4_I(inode)->i_mmap_sem with this new rwsem
> which provides necessary serialization with hole punching for ext4.
> 
> 								Honza
> 
> [1] https://lore.kernel.org/linux-fsdevel/CAOQ4uxjQNmxqmtA_VbYW0Su9rKRk2zobJmahcyeaEVOFKVQ5dw@mail.gmail.com/
> 
> Previous versions:
> Link: https://lore.kernel.org/linux-fsdevel/20210208163918.7871-1-jack@suse.cz/
> Link: http://lore.kernel.org/r/20210413105205.3093-1-jack@suse.cz
> 
> CC: ceph-devel@vger.kernel.org
> CC: Chao Yu <yuchao0@huawei.com>
> CC: Damien Le Moal <damien.lemoal@wdc.com>
> CC: "Darrick J. Wong" <darrick.wong@oracle.com>
> CC: Hugh Dickins <hughd@google.com>
> CC: Jaegeuk Kim <jaegeuk@kernel.org>
> CC: Jeff Layton <jlayton@kernel.org>
> CC: Johannes Thumshirn <jth@kernel.org>
> CC: linux-cifs@vger.kernel.org
> CC: <linux-ext4@vger.kernel.org>
> CC: linux-f2fs-devel@lists.sourceforge.net
> CC: <linux-fsdevel@vger.kernel.org>
> CC: <linux-mm@kvack.org>
> CC: <linux-xfs@vger.kernel.org>
> CC: Miklos Szeredi <miklos@szeredi.hu>
> CC: Steve French <sfrench@samba.org>
> CC: Ted Tso <tytso@mit.edu>
> 

-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
