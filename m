Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1822036A9A7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Apr 2021 00:19:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lan6P-0002aB-II; Sun, 25 Apr 2021 22:19:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+6d1c93c1a75a356425b5+6454+infradead.org+hch@casper.srs.infradead.org>)
 id 1lan6O-0002a3-3K
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 22:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QyglVt+EWc9B423iJYSDhdV5d15kNgjcPs3aWvxtgoI=; b=fjWoNXgj2oRpwZ+BJyPJcAqzs0
 B+v8No0j8zmUJlmEZlMdIMfT64flRKs+FIi/BrKDT9bcHaCRfsHAdVA/2+XyRm/bszvCwGWrTLOXo
 /2E0SF6XPlDwk/C3B/vvcd3MSEk+HLiGArh2X6iBibhjE0iYAUI78mbKN5O7zeb9JixY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QyglVt+EWc9B423iJYSDhdV5d15kNgjcPs3aWvxtgoI=; b=isme3SFmxJ18no3iqkG3v3EFf8
 7pjSP9RuMpELVhd7zHRPWlPf/LddP0cm4Daw480x7bbPdaNvS+hPFXhgYJANdDHt2DwOxOX2nhHV6
 F8R2B9oWI1lsNJYEHR9jz8hcM2m/t12dxHZUQwk/3LGdGy0hz74DVEA7hZPDHadzMVfw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lan6K-008ute-6k
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 22:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QyglVt+EWc9B423iJYSDhdV5d15kNgjcPs3aWvxtgoI=; b=aHlXZ3V/yaWD2pxpPq5I0n6dDZ
 yNafLRHE8BYroDdjfFeAJvURT0QqJwwn1gmhDSXR6UmKK0GXxirKe4rP7HqYsZj9m6H9YNQKeVb8X
 uDm7xYTZj0xWEQhUee1Z4RBRfwvDtuPZwri81YxoXvrhThD620UKYFPx7tbgUDflg22k2uhoPI6/8
 hej5S8jyxVnqw426XX9t9SoQWvwFB18HL0n92Qogffo2EI4zhKZ1SI35/VWKmBEBF8++oWCwebAwy
 ykt6ttQXOkkmFA+yEjEbNocdTCA1vbpuaANDgDvatn3fHY3bgxY/gTG7hXZgoLkpwoJegNNYEbtsX
 asNKYtMg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1laBVs-002nBm-F5; Sat, 24 Apr 2021 06:11:33 +0000
Date: Sat, 24 Apr 2021 07:11:32 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210424061132.GA665596@infradead.org>
References: <20210423171010.12-1-jack@suse.cz>
 <20210423220751.GB63242@dread.disaster.area>
 <20210423235149.GE235567@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423235149.GE235567@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lan6K-008ute-6k
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-cifs@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, Jan Kara <jack@suse.cz>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Hugh Dickins <hughd@google.com>,
 linux-ext4@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-fsdevel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Steve French <sfrench@samba.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Apr 24, 2021 at 12:51:49AM +0100, Matthew Wilcox wrote:
> On Sat, Apr 24, 2021 at 08:07:51AM +1000, Dave Chinner wrote:
> > I've got to spend time now reconstructing the patchset into a single
> > series because the delivery has been spread across three different
> > mailing lists and so hit 3 different procmail filters.  I'll comment
> > on the patches once I've reconstructed the series and read through
> > it as a whole...
> 
> $ b4 mbox 20210423171010.12-1-jack@suse.cz
> Looking up https://lore.kernel.org/r/20210423171010.12-1-jack%40suse.cz
> Grabbing thread from lore.kernel.org/ceph-devel
> 6 messages in the thread
> Saved ./20210423171010.12-1-jack@suse.cz.mbx

Yikes.  Just send them damn mails.  Or switch the lists to NNTP, but
don't let the people who are reviewing your patches do stupid work
with weird tools.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
