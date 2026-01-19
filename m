Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA938D39E5A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 07:23:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IwLIhFa/hRwuQMzIS4nK1vgQU5HB8eI+FY+lRBIuu5Y=; b=ly5poUUe4ds3IS96Kq+UBEwCfx
	+xslo4dZK0J8wODlGpsje0oMPWkgyWT1m7X+MbxbcnCnQBfTXeEh8A4vInCXh3tkws883UT4OSF1t
	fGgRsCh1HjM55SHeVg/ahHT6DwJpOAaud/HmZ6qYpiYShBvwldd6GXasInEgUCiftCJ0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhifO-0000cR-NO;
	Mon, 19 Jan 2026 06:23:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+f4f5ba1b7319529cbc9c+8184+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vhifM-0000cJ-SU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 06:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g1gUM1qUSn4H3JQ9fYis1PYTtD3a+GOXK7bkV07wamk=; b=UUS/ruubdtPEwkplf4NPA8TUjt
 nvq9Do93ffTIorDDNeEsr+umL4DM0E5ZR6fZNGaVQsY30ZR4pOfjH64qIWGcDkVFpgnOyRI9FFT3h
 T4C9h0NBcVCDDmbfV+2yemUda7lM6ji4lPWyP+Y5iPeXc7w4OMAdzjBhT2kKzC2x06uE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=g1gUM1qUSn4H3JQ9fYis1PYTtD3a+GOXK7bkV07wamk=; b=M
 H5xoKpWQOtekjiGkKiwgSA1g+3VdoPacRgTAQXcZvzS+uk4BwkLYdcr4XubpqYJFmLVT+chaoMShX
 nLRJvELynUU4Ifjcp2LBk89EGozTgk8MZhzsFEzSFJkejyyyvg1XLTFeRDyABW7Vvc/c6kBMnawFR
 Z3C3nZTcToMox4CY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhifM-0006fN-1G for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 06:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=g1gUM1qUSn4H3JQ9fYis1PYTtD3a+GOXK7bkV07wamk=; b=uv+zEQZWbbt2YUP/gixE//7H64
 dNgrrLieQtPM6kJp1hnWdwgiX1QtJdSg3ftE7FT+d3dNKBOIvZ93Ajp7JzHjwDmfyz9zCya2vi1Nw
 rcaHQAgw4PcByMpAdw1NDFgWx1xCV0+Nvlv9OAspFHj+P0fhfqV7JvN1d3vuIELhDHl2TwijEucfw
 g2LsrRR7FqINItaLtBXxPcr10EtiBJewvDKhVUTsLiMBXyTx2QeY6sqC+bBGXvU8D6oXjx2KddHCz
 134IDuIXGsl8GIda/IcsASMmIwC94E7i9fBVw6GsNreGPgQdJOJaRX8KfmfdWoIdgPDUTgCoC+iTv
 PZu3zjwg==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vhifB-00000001Ona-0jyL; Mon, 19 Jan 2026 06:22:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 19 Jan 2026 07:22:41 +0100
Message-ID: <20260119062250.3998674-1-hch@lst.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, this series has a hodge podge of fsverity enhances
 that I looked into as part of the review of the xfs fsverity support series.
 The first three patches call fsverity code from VFS code instead of requiring
 a lot of boilerplate in the file systems. The first fixes a bug in btrfs
 as part of that, as btrfs was missing a check. An [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vhifM-0006fN-1G
Subject: [f2fs-dev] fsverity optimzations and speedups
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

this series has a hodge podge of fsverity enhances that I looked into as
part of the review of the xfs fsverity support series.

The first three patches call fsverity code from VFS code instead of
requiring a lot of boilerplate in the file systems.  The first fixes a
bug in btrfs as part of that, as btrfs was missing a check.  An xfstests
test case for this will be sent separately.

Patch 4 removes the need to have a pointer to the fsverity_info in the
inode structure and uses a global resizable hash table instead.

Patch 5 passes down the struct file in the write path.

Patch 6 optimizes the fsvvrity read path by kicking off readahead for the
fsverity hashes from the data read submission context, which in my
simply testing showed huge benefits for sequential reads using dd.
I haven't been able to get fio to run on a preallocated fio file, but
I expect random read benefits would be significantly better than that
still.

Diffstat:
 fs/attr.c                    |   12 +++
 fs/btrfs/btrfs_inode.h       |    4 -
 fs/btrfs/file.c              |    6 -
 fs/btrfs/inode.c             |   13 ---
 fs/btrfs/verity.c            |   11 +--
 fs/ext4/ext4.h               |    4 -
 fs/ext4/file.c               |    4 -
 fs/ext4/inode.c              |    4 -
 fs/ext4/readpage.c           |    4 +
 fs/ext4/super.c              |    4 -
 fs/ext4/verity.c             |   34 ++++-----
 fs/f2fs/data.c               |    4 +
 fs/f2fs/f2fs.h               |    3 
 fs/f2fs/file.c               |    8 --
 fs/f2fs/inode.c              |    1 
 fs/f2fs/super.c              |    3 
 fs/f2fs/verity.c             |   34 ++++-----
 fs/inode.c                   |    9 ++
 fs/open.c                    |    8 +-
 fs/verity/enable.c           |   39 ++++++-----
 fs/verity/fsverity_private.h |   17 ++--
 fs/verity/open.c             |   90 ++++++++++++++-----------
 fs/verity/read_metadata.c    |   10 +-
 fs/verity/verify.c           |   98 +++++++++++++++++++--------
 include/linux/fsverity.h     |  152 +++++++++----------------------------------
 25 files changed, 262 insertions(+), 314 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
