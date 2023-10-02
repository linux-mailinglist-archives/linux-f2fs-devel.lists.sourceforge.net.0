Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB157B4CFA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Oct 2023 09:57:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qnDoN-0007R5-BW;
	Mon, 02 Oct 2023 07:57:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qnDoL-0007Qs-5E;
 Mon, 02 Oct 2023 07:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HRtvvsbDRmaIGA2qlEwuFNnN4SG9to1RwhMyTnDS1Ek=; b=RboY2lYKE0Xa0BDYe3H/Dttv9x
 3XGqe02UKIDi9SwLxpYNNigGfJwNbXrRx0e9INtX/11SNYQuX0OFmudXYYhHAArpI1BDUxFNbgLkl
 Ig+AOaujJYDuzjzMzqQCFOZBhvk9AgVa7amjPAa82AOIC2JL/r2KodaMMoerEhzrqZLo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HRtvvsbDRmaIGA2qlEwuFNnN4SG9to1RwhMyTnDS1Ek=; b=L5D7G61HnJO0vVjwbQUEzb/IaV
 X4H/mdJX2/jO7qukK6xOmN75aLosTTpX2mkxz+9ufLCS6/ti0YHTQiEcB3B5aT+aNkZsS4Zc/4daa
 DZUDzjkd7sh3pLI6mBn5Qf1tQ64i+QhEg6DxeK4q9sjCW1VxRDgeOxYcEMYCwaitTTOU=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qnDoF-0006jF-KM; Mon, 02 Oct 2023 07:57:47 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB8121F459;
 Mon,  2 Oct 2023 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1696233452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HRtvvsbDRmaIGA2qlEwuFNnN4SG9to1RwhMyTnDS1Ek=;
 b=AelUG9FSlQyUcQTA9I9qRJmPzMA6mvk2OLx4Qv2PacqmgU2FkeI54uQfwuwk8GDISDrHf1
 K6okkr5Yua+jK8r2TTOukY7745vay4e4z1caiTsHAigkH18O5VWdMY9s+0PKMe8/Ta1ITc
 H4lySULw9TgNQsjwAFd513U/tj8Iifc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1696233452;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HRtvvsbDRmaIGA2qlEwuFNnN4SG9to1RwhMyTnDS1Ek=;
 b=4yX5F6ZD5YaXQ1SgLuHClpbWfxc1xKg7esoSW59wSh/oO7HSeTROmd590v4TgEevJu81R5
 RAceDQWhH8NjA0AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 83FA513434;
 Mon,  2 Oct 2023 07:57:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JLsgIOx3GmUuEgAAMHmgww
 (envelope-from <jack@suse.cz>); Mon, 02 Oct 2023 07:57:32 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 27D44A07C9; Mon,  2 Oct 2023 09:57:32 +0200 (CEST)
Date: Mon, 2 Oct 2023 09:57:32 +0200
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20231002075732.4c5oslpabrmw3niz@quack3>
References: <20230818123232.2269-1-jack@suse.cz>
 <20230927-prahlen-reintreten-93706074e58d@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230927-prahlen-reintreten-93706074e58d@brauner>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 27-09-23 18:21:19, Christian Brauner wrote: > On Wed, 
 27 Sep 2023 11:34:07 +0200, Jan Kara wrote: > > Create struct bdev_handle
 that contains all parameters that need to be > > passed to blkdev [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qnDoF-0006jF-KM
Subject: Re: [f2fs-dev] [PATCH v4 0/29] block: Make blkdev_get_by_*() return
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
 Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-nvme@lists.infradead.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Jack Wang <jinpu.wang@ionos.com>,
 Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
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

On Wed 27-09-23 18:21:19, Christian Brauner wrote:
> On Wed, 27 Sep 2023 11:34:07 +0200, Jan Kara wrote:
> > Create struct bdev_handle that contains all parameters that need to be
> > passed to blkdev_put() and provide bdev_open_* functions that return
> > this structure instead of plain bdev pointer. This will eventually allow
> > us to pass one more argument to blkdev_put() (renamed to bdev_release())
> > without too much hassle.
> > 
> > 
> > [...]
> 
> > to ease review / testing. Christian, can you pull the patches to your tree
> > to get some exposure in linux-next as well? Thanks!
> 
> Yep. So I did it slighly differently. I pulled in the btrfs prereqs and
> then applied your series on top of it so we get all the Link: tags right.
> I'm running tests right now. Please double-check.

Thanks for picking patches up! I've checked the branch and it looks good to
me. 

								Honza

> 
> ---
> 
> Applied to the vfs.super branch of the vfs/vfs.git tree.
> Patches in the vfs.super branch should appear in linux-next soon.
> 
> Please report any outstanding bugs that were missed during review in a
> new review to the original patch series allowing us to drop it.
> 
> It's encouraged to provide Acked-bys and Reviewed-bys even though the
> patch has now been applied. If possible patch trailers will be updated.
> 
> Note that commit hashes shown below are subject to change due to rebase,
> trailer updates or similar. If in doubt, please check the listed branch.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
> branch: vfs.super
> 
> [01/29] block: Provide bdev_open_* functions
>        https://git.kernel.org/vfs/vfs/c/b7c828aa0b3c
> [02/29] block: Use bdev_open_by_dev() in blkdev_open()
>         https://git.kernel.org/vfs/vfs/c/d4e36f27b45a
> [03/29] block: Use bdev_open_by_dev() in disk_scan_partitions() and blkdev_bszset()
>         https://git.kernel.org/vfs/vfs/c/5f9bd6764c7a
> [04/29] drdb: Convert to use bdev_open_by_path()
>         https://git.kernel.org/vfs/vfs/c/0220ca8e443d
> [05/29] pktcdvd: Convert to bdev_open_by_dev()
>         https://git.kernel.org/vfs/vfs/c/7af10b889789
> [06/29] rnbd-srv: Convert to use bdev_open_by_path()
>         https://git.kernel.org/vfs/vfs/c/3d27892a4be7
> [07/29] xen/blkback: Convert to bdev_open_by_dev()
>         https://git.kernel.org/vfs/vfs/c/26afb0ed10b3
> [08/29] zram: Convert to use bdev_open_by_dev()
>         https://git.kernel.org/vfs/vfs/c/efc8e3f4c6dc
> [09/29] bcache: Convert to bdev_open_by_path()
>         https://git.kernel.org/vfs/vfs/c/dc893f51d24a
> [10/29] dm: Convert to bdev_open_by_dev()
>         https://git.kernel.org/vfs/vfs/c/80c2267c6d07
> [11/29] md: Convert to bdev_open_by_dev()
>         https://git.kernel.org/vfs/vfs/c/15db36126ca6
> [12/29] mtd: block2mtd: Convert to bdev_open_by_dev/path()
>         https://git.kernel.org/vfs/vfs/c/4c27234bf3ce
> [13/29] nvmet: Convert to bdev_open_by_path()
>         https://git.kernel.org/vfs/vfs/c/70cffddcc300
> [14/29] s390/dasd: Convert to bdev_open_by_path()
>         https://git.kernel.org/vfs/vfs/c/5581d03457f8
> [15/29] scsi: target: Convert to bdev_open_by_path()
>         https://git.kernel.org/vfs/vfs/c/43de7d844d47
> [16/29] PM: hibernate: Convert to bdev_open_by_dev()
>         https://git.kernel.org/vfs/vfs/c/105ea4a2fd18
> [17/29] PM: hibernate: Drop unused snapshot_test argument
>         https://git.kernel.org/vfs/vfs/c/b589a66e3688
> [18/29] mm/swap: Convert to use bdev_open_by_dev()
>         https://git.kernel.org/vfs/vfs/c/615af8e29233
> [19/29] fs: Convert to bdev_open_by_dev()
>         https://git.kernel.org/vfs/vfs/c/5173192bcfe6
> [20/29] btrfs: Convert to bdev_open_by_path()
>         https://git.kernel.org/vfs/vfs/c/8cf64782764f
> [21/29] erofs: Convert to use bdev_open_by_path()
>         https://git.kernel.org/vfs/vfs/c/4d41880bf249
> [22/29] ext4: Convert to bdev_open_by_dev()
>         https://git.kernel.org/vfs/vfs/c/f7507612395e
> [23/29] f2fs: Convert to bdev_open_by_dev/path()
>         https://git.kernel.org/vfs/vfs/c/d9ff8e3b6498
> [24/29] jfs: Convert to bdev_open_by_dev()
>         https://git.kernel.org/vfs/vfs/c/459dc6376338
> [25/29] nfs/blocklayout: Convert to use bdev_open_by_dev/path()
>         https://git.kernel.org/vfs/vfs/c/5b1df9a40929
> [26/29] ocfs2: Convert to use bdev_open_by_dev()
>         https://git.kernel.org/vfs/vfs/c/b6b95acbd943
> [27/29] reiserfs: Convert to bdev_open_by_dev/path()
>         https://git.kernel.org/vfs/vfs/c/7e3615ff6119
> [28/29] xfs: Convert to bdev_open_by_path()
>         https://git.kernel.org/vfs/vfs/c/176ccb99e207
> [29/29] block: Remove blkdev_get_by_*() functions
>         https://git.kernel.org/vfs/vfs/c/953863a5a2ff
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
