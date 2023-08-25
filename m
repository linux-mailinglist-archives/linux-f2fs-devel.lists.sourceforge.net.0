Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF23787D94
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 04:22:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZMSg-00052i-7a;
	Fri, 25 Aug 2023 02:22:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1qZMSd-00052U-FD;
 Fri, 25 Aug 2023 02:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GqmLor0hgV4H3x7IuvuyaB/m3hDiUm8Yzrd7b9keFg8=; b=jnvL2Pgg9puCOxYe3eYicT8U6B
 ZwayBISsE1dCu4H06U6lY5thvDMdzYlX4lBQ0fc4b4ZoIAL9fNzmU+zRrgO28zSla22PwUkhHmONI
 qgDm2jsOXBZ9UYeCBfAl/aRJruxywDtT5VlT76kgvKEbzk7J6+oipsXtEqkCeqxjsswY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GqmLor0hgV4H3x7IuvuyaB/m3hDiUm8Yzrd7b9keFg8=; b=WxvvC5h1RUp1PNQxw/U0fCovLZ
 loS9nifF6xOo8gEu+ohYfgmieov54Qv9QeqCVAcUol8S37JBRN8xV4n53WKGNyEV5JgSfdInVrRz2
 5j+kHvUSyo6hcXKKXyOZ3547JfBwxFnnRdqW0SLsHJDV+tOfYThZhBAFyBz6ctqvaszI=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZMSY-00Eo7Q-5o; Fri, 25 Aug 2023 02:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GqmLor0hgV4H3x7IuvuyaB/m3hDiUm8Yzrd7b9keFg8=; b=bxxlNJ96rsx4L2kKszQ8LF6ai5
 iNtBNOQ6lzvCMPjrA8d2B5SKpMA8ehWy3QlKX8FPouK+kPzVIEZKx+nUetaQRW5JSdDZgZ40B7sUp
 hz637OO4Su1eEUgn8Gl/dIA4NQM5w6cHamU5x0h4uc+j+8uZ5OMjiX5dOjWaEByfsbwcty7NjoKFy
 3XYbSKjy+5wYC+oyCRnyAV7fQupk+8Mu6cgtvaubPBjXdneuinMhpNkKRGbKhUYZMh2pnc+qlSq3t
 /phSE0e2tky2IO5H3c5MgeU2/J9SsgCPwQOsXy7U4/wxiV2850iLaIsQdHEKmyDTGxCmoecJk/YQG
 iXEtALAQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qZM5z-000dvR-0M; Fri, 25 Aug 2023 01:58:43 +0000
Date: Fri, 25 Aug 2023 02:58:43 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jan Kara <jack@suse.cz>
Message-ID: <20230825015843.GB95084@ZenIV>
References: <20230810171429.31759-1-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230810171429.31759-1-jack@suse.cz>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 11, 2023 at 01:04:31PM +0200, Jan Kara wrote:
 > Hello, > > this is a v2 of the patch series which implements the idea of
 blkdev_get_by_*() > calls returning bdev_handle which is then passe [...]
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qZMSY-00Eo7Q-5o
Subject: Re: [f2fs-dev] [PATCH v2 0/29] block: Make blkdev_get_by_*() return
 handle
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
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
 "Darrick J. Wong" <djwong@kernel.org>, linux-nvme@lists.infradead.org,
 Joseph Qi <joseph.qi@linux.alibaba.com>, dm-devel@redhat.com,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jack Wang <jinpu.wang@ionos.com>, Alasdair Kergon <agk@redhat.com>,
 drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
 Gao Xiang <xiang@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Kent Overstreet <kent.overstreet@gmail.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-pm@vger.kernel.org,
 Mike Snitzer <snitzer@kernel.org>, Joern Engel <joern@lazybastard.org>,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-mm@kvack.org, Song Liu <song@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, ocfs2-devel@oss.oracle.com,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 11, 2023 at 01:04:31PM +0200, Jan Kara wrote:
> Hello,
> 
> this is a v2 of the patch series which implements the idea of blkdev_get_by_*()
> calls returning bdev_handle which is then passed to blkdev_put() [1]. This
> makes the get and put calls for bdevs more obviously matching and allows us to
> propagate context from get to put without having to modify all the users
> (again!).  In particular I need to propagate used open flags to blkdev_put() to
> be able count writeable opens and add support for blocking writes to mounted
> block devices. I'll send that series separately.
> 
> The series is based on Christian's vfs tree as of yesterday as there is quite
> some overlap. Patches have passed some reasonable testing - I've tested block
> changes, md, dm, bcache, xfs, btrfs, ext4, swap. This obviously doesn't cover
> everything so I'd like to ask respective maintainers to review / test their
> changes. Thanks! I've pushed out the full branch to:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git bdev_handle
> 
> to ease review / testing.

Hmm...  Completely Insane Idea(tm): how about turning that thing inside out and
having your bdev_open_by... return an actual opened struct file?

After all, we do that for sockets and pipes just fine and that's a whole lot
hotter area.

Suppose we leave blkdev_open()/blkdev_release() as-is.  No need to mess with
what we have for normal opened files for block devices.  And have block_open_by_dev()
that would find bdev, etc., same yours does and shove it into anon file.

Paired with plain fput() - no need to bother with new primitives for closing.
With a helper returning I_BDEV(bdev_file_inode(file)) to get from those to bdev.

NOTE: I'm not suggesting replacing ->s_bdev with struct file * if we do that -
we want that value cached, obviously.  Just store both...

Not saying it's a good idea, but... might be interesting to look into.
Comments?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
