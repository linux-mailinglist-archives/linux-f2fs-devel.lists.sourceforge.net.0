Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD72A3D3603
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 10:02:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6q8N-0007Rd-Bx; Fri, 23 Jul 2021 08:02:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m6q8K-0007RJ-Tn
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 08:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7rAoDF3fAOZbFpbzqc2scTryUESl1sHx34d+olJe5wU=; b=XH+FG5yN4iyUgFig1WTEFxFk8G
 X720C6OKrEpBdOYpKOjp7CE/MoGoXjCbD1qHjoo6X02lROBgvA8hYLYEx4lzJGeYb3DxplCMiROy7
 U454vpdajYeaLBIDgim/9NLK/YV8d4riZoxkGsqIWeN0pYVWkRKP3Rwtcv1051EzE7ak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7rAoDF3fAOZbFpbzqc2scTryUESl1sHx34d+olJe5wU=; b=T
 uKdsakOm0/5elH4Ib/bKPT3fQwXWY36mwapsCHHvHWNYhzfkTqW00Q/nSL3+3tCfHXivXh1Bz4Nz1
 JMHfLdnrViNC101N/px4cc/b9tWwizQu9AKVYnr7AkbxitNCEhK8xFcCxczRqqPL61p5OgLFceU3e
 wjMXhdBELyP3QowA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6q89-0005fq-88
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 08:02:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6103860EBD;
 Fri, 23 Jul 2021 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627027312;
 bh=oOvAR2cpP4N+IlYWG7PQAEk7l4EUjRNyF8VQm9+XWm0=;
 h=From:To:Cc:Subject:Date:From;
 b=rGZ451b8BYlFUgtRqyQvN0bu/Jv2a4yopo6hwEgS1DDE5IV3TX+vwsryStWncHf0N
 kd4/A0MkoEsV7/CHQBK1IlpW6arLDIkeXx6Eb1DQ77w7teI4L9ucZ5ldaeGBwSuTOU
 KNhMKWzGUBVZZR6khT7Wa6aDXv02V309PDUxvqybh4lz8GpXc/FAAM2CrLlju+j2yx
 R7S3Jd3FXjEdJXuBWvLKXeyBK88VgT2UDjP0SrVhUYL/jrsnQ9JGTR61gQAL8djLaL
 JLUaUrTjiZDsb+K8+6F9IFTIlG3UnSFwMoBJBPTQo/K+pHhXCvhMP15aHXkUwjZSDW
 YJ+ZRn7XYRvJg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Fri, 23 Jul 2021 00:59:19 -0700
Message-Id: <20210723075921.166705-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
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
X-Headers-End: 1m6q89-0005fq-88
Subject: [f2fs-dev] [PATCH v2 0/2] f2fs: use iomap for direct I/O
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Satya Tangirala <satyaprateek2357@gmail.com>,
 Changheun Lee <nanich.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series makes f2fs use the iomap direct I/O implementation instead
of the fs/direct-io.c one.  In order to do this, it adds f2fs_iomap_ops,
since this is the first use of iomap in f2fs.

The iomap direct I/O implementation is more efficient than
fs/direct-io.c.  Switching to iomap also avoids the need to add new
features and optimizations to the old implementation; e.g., see
https://lore.kernel.org/r/20200710053406.GA25530@infradead.org and
https://lore.kernel.org/r/YKJBWClI7sUeABDs@infradead.org.

Patch 1 adds f2fs_iomap_ops, and patch 2 switches direct I/O reads and
writes to iomap.

Careful review is appreciated, as I'm not an expert in all areas here.

This series applies to commit 0de0db9b033a of f2fs.git#dev
(https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev).

Changed since v1:
   - Dropped the preparatory cleanups/fixes for f2fs_file_write_iter(),
     since they have been applied.
   - Merged the last three patches into one.
   - Implemented iomap_dio_ops::end_io() and switched to
     __iomap_dio_rw() to simplify updating of f2fs's in-flight DIO
     counters, as suggested by Christoph.

Eric Biggers (2):
  f2fs: implement iomap operations
  f2fs: use iomap for direct I/O

 fs/f2fs/Kconfig |   1 +
 fs/f2fs/data.c  | 260 +++++++++---------------------------
 fs/f2fs/f2fs.h  |  22 +--
 fs/f2fs/file.c  | 346 ++++++++++++++++++++++++++++++++++++++++++------
 4 files changed, 370 insertions(+), 259 deletions(-)


base-commit: 0de0db9b033af99f494c9ee4a2c9bac6456da1eb
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
