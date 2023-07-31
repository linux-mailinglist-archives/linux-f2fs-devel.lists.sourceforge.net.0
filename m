Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF6A769463
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Jul 2023 13:14:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qQQqc-00078A-RA;
	Mon, 31 Jul 2023 11:13:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+ff51347a1c0b75c11ce8+7281+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1qQQqY-00077N-Bo; Mon, 31 Jul 2023 11:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0eXexdRtzvf9o3AbbzOynMU9Oogrhvp6ybx0nEPZW1E=; b=J4WrY+eOk0YuRT0n5BTOrwx+V+
 R0754rU+BfwWPU+ZED1lN9s9Pp0m5QJx/2FF9HGQsJjFDFNejzb+i0Adem6bxuQx9u2OqPZ5Jl/UW
 +svUMS5nFmFhIPrEVo36zFffGtkAM4mS2uAh/8QPeGoIaIt5JzT03oHC33YrwKFP8P6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0eXexdRtzvf9o3AbbzOynMU9Oogrhvp6ybx0nEPZW1E=; b=ZrigEbHNLDalMmXXo/nSksLP4I
 9U5B1jdMODkdvo5v4n/4gpu4IP/Ln461jgspKSO+lcVJpJEskBQumCM6as3/hvL1DJ9Ikye2GF+ZO
 Qrk56Pj2uddEyqZOTRYDEDGVsME0q3o0XCHAtnUjuy1xdiKOKI7byBVDnRZAUCQjdiSo=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qQQqV-0001lu-PH; Mon, 31 Jul 2023 11:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0eXexdRtzvf9o3AbbzOynMU9Oogrhvp6ybx0nEPZW1E=; b=vK1v9C4DYLEBKbiWf/PpEfbUOr
 ea0tKbtUfw+UjBx/HoPf26wPnlNR3k7A4MsVaVkdar3OIBATfQ3zHFcbH8P9ZuG4qU9LC9N5j1WXI
 1jFOwZPN5LFjM5C6XYSxyg6PIhoZ/4h6jEiKtDOt40sVd4EspDmE/0Bc3dDQT8tEqCoRhRKLz9maX
 raBlJVeHQO4UUZTV20wa+PJqkvDnQQ8hd7GU+O68QfUa/DM2K0gl+HVXCe6+FZ5xjes5Du5sz8UQy
 x/J/fQpupjKK/pfw7RVGPayWpw0xq+T79S7uS7ZMWJxaSbk7Su09Zyo3FaLXxQsJmvK1X6hzoRb5N
 /XYneCLA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qQQpx-00FIz8-1F; Mon, 31 Jul 2023 11:13:17 +0000
Date: Mon, 31 Jul 2023 04:13:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <ZMeXTUUyrOnaxGNG@infradead.org>
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
 <ZKbgAG5OoHVyUKOG@infradead.org>
 <CAJpMwyiUcw+mH0sZa8f8UJsaSZ7NSE65s2gZDEia+pASyP_gJQ@mail.gmail.com>
 <20230731105034.43skhi5ubze563c3@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230731105034.43skhi5ubze563c3@quack3>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jul 31, 2023 at 12:50:34PM +0200, Jan Kara wrote:
 > I think the bdev_handle name is fine for the struct. After all it is >
 equivalent
 of an open handle for the block device so IMHO bdev_handle [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qQQqV-0001lu-PH
Subject: Re: [f2fs-dev] [PATCH 01/32] block: Provide blkdev_get_handle_*
 functions
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
 target-devel@vger.kernel.org, Haris Iqbal <haris.iqbal@ionos.com>,
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
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-mm@kvack.org, Song Liu <song@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, ocfs2-devel@oss.oracle.com,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 31, 2023 at 12:50:34PM +0200, Jan Kara wrote:
> I think the bdev_handle name is fine for the struct. After all it is
> equivalent of an open handle for the block device so IMHO bdev_handle
> captures that better than bdev_ctx.

Agreed.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
