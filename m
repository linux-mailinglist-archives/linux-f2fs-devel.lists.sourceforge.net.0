Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 138B77888EB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 15:48:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZXAW-0004MZ-SK;
	Fri, 25 Aug 2023 13:48:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qZXAV-0004MK-Gw;
 Fri, 25 Aug 2023 13:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BpzfsfMiRxmg30OdFnKzv1mOgTevyt5wkPNcyneGwG0=; b=DW80PpJSI3VvfrLM8uCeTR1zC+
 lG/KL/yYw7mTC+DUSxpdg2u6aUkB46H6rfKD0MvXxQ+6Qf5KQkrIPWKRpNsIpywqCzwD1rsgw23oc
 DSZFo6sm2ueL90DfzbP0NN9C1NqjVMSz5efmMuo29lKcMSGDinawJoBMBevGQR52+fe4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BpzfsfMiRxmg30OdFnKzv1mOgTevyt5wkPNcyneGwG0=; b=FZMqyYPCSHOrUqsd53MBE6H+Ix
 ilsOGjcDg+F2lLZrNylkgEQuwzk9q+6PtDTrT4NB8gCyh6RrWMrDxFJ6Tc+QutF/L1ALpaDV3BzxP
 KYzIsQQ/yZl7YkbqXbwboKK7ohQ7oAry0M1Y6zH8dmW5DSkAAzfhytZOLnRV4bH/Y7T0=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZXAU-00FH87-T4; Fri, 25 Aug 2023 13:48:07 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 49AEC21F79;
 Fri, 25 Aug 2023 13:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1692971277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BpzfsfMiRxmg30OdFnKzv1mOgTevyt5wkPNcyneGwG0=;
 b=uohLnKnqtpENx2vCia+CF25VunAvqKNxW8Gl/JZPjm2522sG0QzHP89CKm9gvg5uhIQmJN
 WBEcUX07tygEsfRFeW0MDCmmX2lneinhEWFdq+jYTgqP+tDCYKowqEsMW88igvW28lrojs
 hfcd/30g2Ie/qrM4mt7e3dhBm3c9V28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1692971277;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BpzfsfMiRxmg30OdFnKzv1mOgTevyt5wkPNcyneGwG0=;
 b=avw/hNX+TPhBa6q/Pyjq6dsHiVTX81moNODEW9+kRWtkr4cKF/cxPXXUPquXV79uoK0IL4
 nSbq/d/haJGtPRAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 28033138F9;
 Fri, 25 Aug 2023 13:47:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UJRbCQ2x6GQZAwAAMHmgww
 (envelope-from <jack@suse.cz>); Fri, 25 Aug 2023 13:47:57 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id A432FA0774; Fri, 25 Aug 2023 15:47:56 +0200 (CEST)
Date: Fri, 25 Aug 2023 15:47:56 +0200
From: Jan Kara <jack@suse.cz>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20230825134756.o3wpq6bogndukn53@quack3>
References: <20230810171429.31759-1-jack@suse.cz>
 <20230825015843.GB95084@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825015843.GB95084@ZenIV>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 25-08-23 02:58:43, Al Viro wrote: > On Fri, Aug 11,
 2023 at 01:04:31PM +0200, Jan Kara wrote: > > Hello, > > > > this is a v2
 of the patch series which implements the idea of blkdev_get_by_*() [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1qZXAU-00FH87-T4
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
 linux-bcache@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
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

On Fri 25-08-23 02:58:43, Al Viro wrote:
> On Fri, Aug 11, 2023 at 01:04:31PM +0200, Jan Kara wrote:
> > Hello,
> > 
> > this is a v2 of the patch series which implements the idea of blkdev_get_by_*()
> > calls returning bdev_handle which is then passed to blkdev_put() [1]. This
> > makes the get and put calls for bdevs more obviously matching and allows us to
> > propagate context from get to put without having to modify all the users
> > (again!).  In particular I need to propagate used open flags to blkdev_put() to
> > be able count writeable opens and add support for blocking writes to mounted
> > block devices. I'll send that series separately.
> > 
> > The series is based on Christian's vfs tree as of yesterday as there is quite
> > some overlap. Patches have passed some reasonable testing - I've tested block
> > changes, md, dm, bcache, xfs, btrfs, ext4, swap. This obviously doesn't cover
> > everything so I'd like to ask respective maintainers to review / test their
> > changes. Thanks! I've pushed out the full branch to:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git bdev_handle
> > 
> > to ease review / testing.
> 
> Hmm...  Completely Insane Idea(tm): how about turning that thing inside out and
> having your bdev_open_by... return an actual opened struct file?
> 
> After all, we do that for sockets and pipes just fine and that's a whole lot
> hotter area.
> 
> Suppose we leave blkdev_open()/blkdev_release() as-is.  No need to mess with
> what we have for normal opened files for block devices.  And have block_open_by_dev()
> that would find bdev, etc., same yours does and shove it into anon file.
> 
> Paired with plain fput() - no need to bother with new primitives for closing.
> With a helper returning I_BDEV(bdev_file_inode(file)) to get from those to bdev.
> 
> NOTE: I'm not suggesting replacing ->s_bdev with struct file * if we do that -
> we want that value cached, obviously.  Just store both...
> 
> Not saying it's a good idea, but... might be interesting to look into.
> Comments?

I can see the appeal of not having to introduce the new bdev_handle type
and just using struct file which unifies in-kernel and userspace block
device opens. But I can see downsides too - the last fput() happening from
task work makes me a bit nervous whether it will not break something
somewhere with exclusive bdev opens. Getting from struct file to bdev is
somewhat harder but I guess a helper like F_BDEV() would solve that just
fine.

So besides my last fput() worry about I think this could work and would be
probably a bit nicer than what I have. But before going and redoing the whole
series let me gather some more feedback so that we don't go back and forth.
Christoph, Christian, Jens, any opinion?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
