Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F19F3D3169
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 03:52:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6kMp-0004pN-VF; Fri, 23 Jul 2021 01:52:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m6kMo-0004pD-C5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 01:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A65beS4JXUYlPHrYbyfXEa22bq9Y8ieWNVimOMdFqaw=; b=clhcABZNkRGLAwvL2DutArfFhU
 7D5DlCEZRBcmfy9F4ZusRXUMVuDJR0SzEWaSydSqFHH+f31821JuoZ1aW1McBHu7ri1LX9bMFTmiZ
 mU5WzCV8Plpeo2/45i7yExM31T7bLzpwMt+otASUr1//j8u9/ZZuact+6XgItzag3S0I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A65beS4JXUYlPHrYbyfXEa22bq9Y8ieWNVimOMdFqaw=; b=doM8l1Es5mQlU6AoeMF+H9nsZS
 F3wsMXX3GZh3EZGPAgb6uzWph2IyayXKvY8l3b+WZyOaNl/eD7u/GoHfTCj7gVJAW981z1oupKDzW
 IkTFJF5yciqiWt7ZMXkU4at55WoDQLhrjs4IqpG4eTPgM2TGJI1qyWRWHyRmvm4JBDso=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6kMn-0007Zv-4M
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 01:52:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D60160E9A;
 Fri, 23 Jul 2021 01:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627005154;
 bh=dubo8niTm2fAph2AV70T+l7jUyaRlEBWVCODXsuymHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c8rOmcNFq6dVUMpNu9SxM6DzJMyst3LN3ufi73N+zsM7d12ZgHatlfR7cgZ/fy0i6
 UkMx1ZSt2deeQV/WhcR3DmQ1tFmA88bh+/5HsYEUO0L/tKgbq4e6h1vdz6cHl6Sg4Y
 UByeKuoFIh2LBpzC40H7E8cedR/pY8VLEbmWPQajXI5cJU7TbYNSb5fEfWRIAOXCu5
 4B4AtgfcgElSc+jmbP1Ru4A9jvHlT+sEvOXG1Up4bKSCww3RphljdQeES5GWl9h401
 Mi+4O0r6VI4rlaFlY/bu7iGQtLRd/rXRLsqJzof8eGgNg1u8d843jzSDIm9nAlr/Ev
 cJqgvM0mTz49Q==
Date: Thu, 22 Jul 2021 18:52:33 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YPog4SDY3nNC78sK@sol.localdomain>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-7-ebiggers@kernel.org>
 <YPU+3inGclUtcSpJ@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPU+3inGclUtcSpJ@infradead.org>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6kMn-0007Zv-4M
Subject: Re: [f2fs-dev] [PATCH 6/9] f2fs: implement iomap operations
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Christoph,

On Mon, Jul 19, 2021 at 10:59:10AM +0200, Christoph Hellwig wrote:
> On Fri, Jul 16, 2021 at 09:39:16AM -0500, Eric Biggers wrote:
> > +static blk_qc_t f2fs_dio_submit_bio(struct inode *inode, struct iomap *iomap,
> > +				    struct bio *bio, loff_t file_offset)
> > +{
> > +	struct f2fs_private_dio *dio;
> > +	bool write = (bio_op(bio) == REQ_OP_WRITE);
> > +
> > +	dio = f2fs_kzalloc(F2FS_I_SB(inode),
> > +			sizeof(struct f2fs_private_dio), GFP_NOFS);
> > +	if (!dio)
> > +		goto out;
> > +
> > +	dio->inode = inode;
> > +	dio->orig_end_io = bio->bi_end_io;
> > +	dio->orig_private = bio->bi_private;
> > +	dio->write = write;
> > +
> > +	bio->bi_end_io = f2fs_dio_end_io;
> > +	bio->bi_private = dio;
> > +
> > +	inc_page_count(F2FS_I_SB(inode),
> > +			write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
> > +
> > +	return submit_bio(bio);
> 
> I don't think there is any need for this mess.  The F2FS_DIO_WRITE /
> F2FS_DIO_READ counts are only used to check if there is any inflight
> I/O at all.  So instead we can increment them once before calling
> iomap_dio_rw, and decrement them in ->end_io or for a failure/noop
> exit from iomap_dio_rw.  Untested patch below.  Note that all this
> would be much simpler to review if the last three patches were folded
> into a single one.
> 

I am trying to do this, but unfortunately I don't see a way to make it work
correctly in all cases.

The main problem is that when iomap_dio_rw() returns an error (other than
-EIOCBQUEUED), there is no way to know whether ->end_io() has been called or
not.  This is because iomap_dio_rw() can fail either early, before "starting"
the I/O (in which case ->end_io() won't have been called), or later, after
"starting" the I/O (in which case ->end_io() will have been called).  Note that
this can't be worked around by checking whether the iov_iter has been advanced
or not, since a failure could occur between "starting" the I/O and the iov_iter
being advanced for the first time.

Would you be receptive to adding a ->begin_io() callback to struct iomap_dio_ops
in order to allow filesystems to maintain counters like this?

Either way, given the problem here, I think I should leave this out of the
initial conversion and just do a dumb translation of the existing f2fs logic to
start with, like I have in this patch.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
