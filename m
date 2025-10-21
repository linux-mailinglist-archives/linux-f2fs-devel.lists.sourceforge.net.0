Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B906ABF4EFC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 09:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LIvun+lRm/F60ibsVE31w9hP3PNkJZYAQp56XEsRmA4=; b=AE3gx7D8z+unPdV/b/X4X1OOpg
	Ozoxsu8T9/x+MjrpZIrPESI8sYU0xl9mdVBEIS0PlMkcobamruXS2JBCeb+wG88ynUUAzt4txrlyc
	yBr1990OokTOvr6TMiEHOw6OjFTCSkm0J4ypU3PmQNq/zKDyCPI1ZxjVrLeQb2F0EiSQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vB6jo-0002Fx-DR;
	Tue, 21 Oct 2025 07:24:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=382e81130=mngyadam@amazon.de>)
 id 1vB6jl-0002Fl-IK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4aKg8jaea9UUgjVGAZ9pvPl/2rw7Jg81FmzroUsdh8U=; b=F/1HwiH1kjNaUrSnaINthidtRF
 rJy9LRMZ5f0zGRE//Y+xUTv0IEGMr7jHuWXQnhTY1J6egEyMpABjlxlNma+5keY0XYj/jKpBZ0yvg
 b3UuENnUmwwJgHVhLPjtg0WhD4x1zufbPtaIhL4F/FR2dMiM1zdHI6D6nbVa1fk82wMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4aKg8jaea9UUgjVGAZ9pvPl/2rw7Jg81FmzroUsdh8U=; b=R
 b2v2NyLp2N40z+ZTPJgZbV+3wJGHVZD1ecxsmFJUXF88KbO7mE77/fNbN/ORa5PSDGCccCz7eyubu
 QAYi8q7E1MoLbivs2engahsFU07fyK+fd0hZZwKWaqy6X0xr3Bub7GJAvfkyJuSH7UVUDDG8yehqL
 uEZzmo96979vdvRI=;
Received: from fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 ([3.74.81.189]) by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vB6jk-0007Tj-9r for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
 t=1761031492; x=1792567492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4aKg8jaea9UUgjVGAZ9pvPl/2rw7Jg81FmzroUsdh8U=;
 b=JNMCXkmc4olDPbbC8wSr1tGfOT5wtsWNcc8QBgxiJ+tiqV9NeIlMaSW2
 UvnCPfUaCPGxmk0bgjkrmAYx6t8ypxWztSz4aiZ1RtNmSFpRqVscLaHgh
 pnwC82kiFhGZF1bhZxqcMdb2ohWX1zsDm2TFfyLLMfltZ7zP5ur3grem2
 FHC9vDRbNfvdauE8ZXkFTiecGwQioMORw56ocRsmQeOLq6QWXGxtSHPUP
 fRR/6mFwtXPSBg+yefv1SjfTxMkR+TS0zNEzctOFC0ozd5bQ39CYR1Kv7
 sY1SwWTwuZ83kGdhbuIiklZwwj951euF+Pal2mW0Z5sq7PY+ZXBk/RHmy w==;
X-CSE-ConnectionGUID: xhZ9wZyxSpmrCzcqqePl8A==
X-CSE-MsgGUID: 8WykqeV0SPuRFwAH0TlCVw==
X-IronPort-AV: E=Sophos;i="6.19,244,1754956800"; 
   d="scan'208";a="3934174"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
 by internal-fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:08:59 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:10631]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.15.22:2525]
 with esmtp (Farcaster)
 id 3750a0e3-50a3-4ee5-985b-1ddb7d86a82d; Tue, 21 Oct 2025 07:08:59 +0000 (UTC)
X-Farcaster-Flow-ID: 3750a0e3-50a3-4ee5-985b-1ddb7d86a82d
Received: from EX19D013EUB004.ant.amazon.com (10.252.51.92) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 21 Oct 2025 07:08:58 +0000
Received: from dev-dsk-mngyadam-1c-cb3f7548.eu-west-1.amazon.com
 (10.253.107.175) by EX19D013EUB004.ant.amazon.com (10.252.51.92) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Tue, 21 Oct 2025
 07:08:50 +0000
To: <stable@vger.kernel.org>
Date: Tue, 21 Oct 2025 09:03:35 +0200
Message-ID: <20251021070353.96705-2-mngyadam@amazon.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Originating-IP: [10.253.107.175]
X-ClientProxiedBy: EX19D037UWC004.ant.amazon.com (10.13.139.254) To
 EX19D013EUB004.ant.amazon.com (10.252.51.92)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This series aims to fix the CVE-2025-38073 for 6.1 LTS. Which
 is fixed by c0e473a0d226 ("block: fix race between set_blocksize and read
 paths"). This patch is built on top multiple refactors that wher [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vB6jk-0007Tj-9r
Subject: [f2fs-dev] [PATCH 6.1 0/8] Backporting CVE-2025-38073 fix patch
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
From: Mahmoud Adam via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mahmoud Adam <mngyadam@amazon.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, nagy@khwaternagy.com,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-nilfs@vger.kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Christoph Hellwig <hch@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, gregkh@linuxfoundation.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Anna
 Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series aims to fix the CVE-2025-38073 for 6.1 LTS. Which is fixed
by c0e473a0d226 ("block: fix race between set_blocksize and read
paths"). This patch is built on top multiple refactors that where
merged on 6.6. The needed dependecies are:

  - e003f74afbd2 ("filemap: add a kiocb_invalidate_pages helper")
  - c402a9a9430b ("filemap: add a kiocb_invalidate_post_direct_write
    helper")
  - 182c25e9c157 ("filemap: update ki_pos in generic_perform_write")
  - 44fff0fa08ec ("fs: factor out a direct_write_fallback helper")
  - 727cfe976758 ("block: open code __generic_file_write_iter for
    blkdev writes")

Also backport follow up fixes:
- fb881cd76045 ("nilfs2: fix deadlock warnings caused by lock
  dependency in init_nilfs()").
- 8287474aa5ff ("direct_write_fallback(): on error revert the ->ki_pos
  update from buffered write")

Thanks,
MNAdam

Al Viro (1):
  direct_write_fallback(): on error revert the ->ki_pos update from
    buffered write

Christoph Hellwig (5):
  filemap: add a kiocb_invalidate_pages helper
  filemap: add a kiocb_invalidate_post_direct_write helper
  filemap: update ki_pos in generic_perform_write
  fs: factor out a direct_write_fallback helper
  block: open code __generic_file_write_iter for blkdev writes

Darrick J. Wong (1):
  block: fix race between set_blocksize and read paths

Ryusuke Konishi (1):
  nilfs2: fix deadlock warnings caused by lock dependency in
    init_nilfs()

 block/bdev.c            |  17 +++++
 block/blk-zoned.c       |   5 +-
 block/fops.c            |  61 +++++++++++++++-
 block/ioctl.c           |   6 ++
 fs/ceph/file.c          |   2 -
 fs/direct-io.c          |  10 +--
 fs/ext4/file.c          |   9 +--
 fs/f2fs/file.c          |   1 -
 fs/iomap/direct-io.c    |  12 +---
 fs/libfs.c              |  42 +++++++++++
 fs/nfs/file.c           |   1 -
 fs/nilfs2/the_nilfs.c   |   3 -
 include/linux/fs.h      |   7 +-
 include/linux/pagemap.h |   2 +
 mm/filemap.c            | 154 +++++++++++++++++-----------------------
 15 files changed, 205 insertions(+), 127 deletions(-)

-- 
2.47.3




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
