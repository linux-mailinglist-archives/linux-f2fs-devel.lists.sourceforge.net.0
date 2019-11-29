Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B87B10D839
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Nov 2019 17:06:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iainE-0004Zy-OB; Fri, 29 Nov 2019 16:06:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dsterba@suse.cz>) id 1iainC-0004Zm-Lv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 16:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1k7oM0qBcllks454F/KNdtl7e1u3OVfJMc0/hzpqd3k=; b=Eud/W5gMrx88xZmG2KsBsBW82O
 hC5x6Mp5/RoqPjLZu33jeare6TfeAB1Px6sehz0V/y5MwLwHxyRGLGbdWPlNLmX4KD5xEp1j2yucf
 lTrMRFZzWvvCYTtuyG+norHaELfrntfO9bsCHwGbugYFmhvJyUA++f3GqRWWMTo6WEEI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1k7oM0qBcllks454F/KNdtl7e1u3OVfJMc0/hzpqd3k=; b=a3lxBM9ETPMnau8UGqSlILHQsX
 hqqIQmS24LDkJqUn0myKClUCq9yCJFQkNxxqNn8JL839OLGVRE5RFKlhNdVZmucJO1cHuEOuBKp/1
 d5ThQRFSPRQYsFTzWpa1R9PfDAqPxXXHS64mHsm058OuguhMN9r04E5HEG1VBHynwsDI=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iainA-00HZrY-Qd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 16:06:50 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 33C2FAD05;
 Fri, 29 Nov 2019 16:06:41 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 3D30CDA7D9; Fri, 29 Nov 2019 17:06:35 +0100 (CET)
Date: Fri, 29 Nov 2019 17:06:34 +0100
From: David Sterba <dsterba@suse.cz>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20191129160634.GM2734@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Andreas Gruenbacher <agruenba@redhat.com>,
 Christoph Hellwig <hch@infradead.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jeff Layton <jlayton@kernel.org>, Sage Weil <sage@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 linux-btrfs@vger.kernel.org
References: <20191129142045.7215-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129142045.7215-1-agruenba@redhat.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iainA-00HZrY-Qd
Subject: Re: [f2fs-dev] [PATCH v2] fs: Fix page_mkwrite off-by-one errors
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
Reply-To: dsterba@suse.cz
Cc: Adrian Hunter <adrian.hunter@intel.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Artem Bityutskiy <dedekind1@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 29, 2019 at 03:20:45PM +0100, Andreas Gruenbacher wrote:
> The check in block_page_mkwrite meant to determine whether an offset is
> within the inode size is off by one.  This bug has spread to
> iomap_page_mkwrite and to several filesystems (ubifs, ext4, f2fs, ceph).
> To fix that, introduce a new page_mkwrite_check_truncate helper that
> checks for truncate and computes the bytes in the page up to EOF, and
> use that helper in the above mentioned filesystems and in btrfs.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> 
> ---
> 
> This patch has a trivial conflict with commit "iomap: Fix overflow in
> iomap_page_mkwrite" in Darrick's iomap pull request for 5.5:
> 
>   https://lore.kernel.org/lkml/20191125190907.GN6219@magnolia/
> ---
>  fs/btrfs/inode.c        | 15 ++++-----------

For the btrfs part

Acked-by: David Sterba <dsterba@suse.com>

and reviewed that the change is equivalent.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
