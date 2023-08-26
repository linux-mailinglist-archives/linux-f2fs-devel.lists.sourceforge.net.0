Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4400578935F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Aug 2023 04:29:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZj3J-0003Yr-65;
	Sat, 26 Aug 2023 02:29:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1qZj3H-0003Yd-U6;
 Sat, 26 Aug 2023 02:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kRz17k12DLtH5ptlx3fiiancvtShyoQwDvuAAOUED4Y=; b=RUj3D3g1rMvZg9deBGHzQ2kPXB
 3Yw5MhAGQ4fth7Mqy08wuOsqp4JR1d2dkNymNPw90YU35ZyFeHvLP080kcHnpjrDcPZsCrYQn+Tw8
 08QUBhmu4qbztyhwkhe8tqRChiZgpwVEEcocDF1wxIoHVGFdcpcuWU6ozA3sjk8A1UuQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kRz17k12DLtH5ptlx3fiiancvtShyoQwDvuAAOUED4Y=; b=eAhGt/AASeVUcQUASvvNqx/VgW
 DdS8zvi8eqAncxxCRvAmBeXggXZStJizSF/R5FxSGwVBeYmkkEMxTNzjRvt6jL66ZVu4ULTLRuhxs
 jYnpMhxYvLMPoFQy3dHCnE8hXZaT05slNFMi1LAEQ8zmX+5SnwVvmRgBz44zoL32YaUk=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZj3E-0005DF-EV; Sat, 26 Aug 2023 02:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kRz17k12DLtH5ptlx3fiiancvtShyoQwDvuAAOUED4Y=; b=mPm/qZCa7MWW4zdrpIjhXYeIS6
 8cbIgOvCf/9Y6gIxhhuc7MbOClbX1o3H4gTlXLJmOpOyil1pufLmdD8oxm6VhlxB4x6C/OQmKz1OC
 9Sg7eN60e8HGn0pn/DtWEZ2zi7uHlJyyQNolWeGdXQEgqn78/62UYsbUB8gsUgOw68YkPTd36+fo0
 kPzizyM3mKJ55bukbV99w6F1Yx4exn0ELF0EHA2mn4TEClpd2hjjcTiwEbEGv+vsWkEq4IC7ejHjR
 rO8uE9/3ipL5VpLJjGdd7WJssIdQ5Tj/z+j2E3fQDWI0Qb9TMLDhfRhfBXk5sw2QK4rJI42xn3tDe
 SBJa1VHw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qZj2i-0010QB-1S; Sat, 26 Aug 2023 02:28:52 +0000
Date: Sat, 26 Aug 2023 03:28:52 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jan Kara <jack@suse.cz>
Message-ID: <20230826022852.GO3390869@ZenIV>
References: <20230810171429.31759-1-jack@suse.cz>
 <20230825015843.GB95084@ZenIV>
 <20230825134756.o3wpq6bogndukn53@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825134756.o3wpq6bogndukn53@quack3>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 25, 2023 at 03:47:56PM +0200, Jan Kara wrote:
 > I can see the appeal of not having to introduce the new bdev_handle type
 > and just using struct file which unifies in-kernel and userspace block
 > device opens. But I can see downsides too - the la [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qZj3E-0005DF-EV
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

On Fri, Aug 25, 2023 at 03:47:56PM +0200, Jan Kara wrote:

> I can see the appeal of not having to introduce the new bdev_handle type
> and just using struct file which unifies in-kernel and userspace block
> device opens. But I can see downsides too - the last fput() happening from
> task work makes me a bit nervous whether it will not break something
> somewhere with exclusive bdev opens. Getting from struct file to bdev is
> somewhat harder but I guess a helper like F_BDEV() would solve that just
> fine.
> 
> So besides my last fput() worry about I think this could work and would be
> probably a bit nicer than what I have. But before going and redoing the whole
> series let me gather some more feedback so that we don't go back and forth.
> Christoph, Christian, Jens, any opinion?

Redoing is not an issue - it can be done on top of your series just
as well.  Async behaviour of fput() might be, but...  need to look
through the actual users; for a lot of them it's perfectly fine.

FWIW, from a cursory look there appears to be a missing primitive: take
an opened bdev (or bdev_handle, with your variant, or opened file if we
go that way eventually) and claim it.

I mean, look at claim_swapfile() for example:
                p->bdev = blkdev_get_by_dev(inode->i_rdev,
                                   FMODE_READ | FMODE_WRITE | FMODE_EXCL, p);
                if (IS_ERR(p->bdev)) {
                        error = PTR_ERR(p->bdev);
                        p->bdev = NULL;
                        return error;
                }
                p->old_block_size = block_size(p->bdev);
                error = set_blocksize(p->bdev, PAGE_SIZE);
                if (error < 0)
                        return error;
we already have the file opened, and we keep it opened all the way until
the swapoff(2); here we have noticed that it's a block device and we
	* open the fucker again (by device number), this time claiming
it with our swap_info_struct as holder, to be closed at swapoff(2) time
(just before we close the file)
	* flip the block size to PAGE_SIZE, to be reverted at swapoff(2)
time That really looks like it ought to be
	* take the opened file, see that it's a block device
	* try to claim it with that holder
	* on success, flip the block size
with close_filp() in the swapoff(2) (or failure exit path in swapon(2))
doing what it would've done for an O_EXCL opened block device.
The only difference from O_EXCL userland open is that here we would
end up with holder pointing not to struct file in question, but to our
swap_info_struct.  It will do the right thing.

This extra open is entirely due to "well, we need to claim it and the
primitive that does that happens to be tied to opening"; feels rather
counter-intuitive.

For that matter, we could add an explicit "unclaim" primitive - might
be easier to follow.  That would add another example where that could
be used - in blkdev_bszset() we have an opened block device (it's an
ioctl, after all), we want to change block size and we *really* don't
want to have that happen under a mounted filesystem.  So if it's not
opened exclusive, we do a temporary exclusive open of own and act on
that instead.   Might as well go for a temporary claim...

BTW, what happens if two threads call ioctl(fd, BLKBSZSET, &n)
for the same descriptor that happens to have been opened O_EXCL?
Without O_EXCL they would've been unable to claim the sucker at the same
time - the holder we are using is the address of a function argument,
i.e. something that points to kernel stack of the caller.  Those would
conflict and we either get set_blocksize() calls fully serialized, or
one of the callers would eat -EBUSY.  Not so in "opened with O_EXCL"
case - they can very well overlap and IIRC set_blocksize() does *not*
expect that kind of crap...  It's all under CAP_SYS_ADMIN, so it's not
as if it was a meaningful security hole anyway, but it does look fishy.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
