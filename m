Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 848023CB8E9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jul 2021 16:41:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4P1L-0002em-RA; Fri, 16 Jul 2021 14:40:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m4P1K-0002ef-7p
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QTASHhvGc6vVu+JzCK6Z7g31D7AQVeOUVsaDS5m5zGs=; b=TXjn25SXxPxnrW4/8YmNIA9ihM
 irCbRVwMg7AGy04NPwv5YmJcAHxyvc7ZwHHxQn3/k9qam6K8sezeI/6X0E5HhZ+TXB5/E35emje3r
 lbDs8stFZTpEG0+gZ0lWk5zecujVZ4aIURakA6fMir4zo/Qj0rpnBDp474bMQ5rjQr/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QTASHhvGc6vVu+JzCK6Z7g31D7AQVeOUVsaDS5m5zGs=; b=m
 9anyo3HA7sW7CPJa4AUf45gp56Qt2XUOoGv039oXiaqHqbE/cv294/6GxwwSWX0V1jqEM0qui5VTz
 KWQF0Y3onAfUlfN9aM5ViJI/ZPaI41RRSJwWokCiIhcNtWDTFYVDBGU/yKjbds6rE0+9pBjgorIOK
 1V81SZegO2eU/0jY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4P1I-0004dx-Tz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:40:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE4D3613AF;
 Fri, 16 Jul 2021 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626446442;
 bh=7TQ2wZS0o8rjARGf+YyE3LnEc8JXm7RWnWlgvVpHFQg=;
 h=From:To:Cc:Subject:Date:From;
 b=k0VWFJo3KwWNfUem7TO3aDtwyb9j6dkN+3TTCvFk7rKAri7TjWyW6iHXIneGPXQaC
 MBJFcqLytNz4Dsp//LiCCz9ULWPcKbd/qLWH3YKn/EGQV7sweVjBWLJor6w/3gGWg2
 +/b4dZrcIsGCd0L67vYfg3RnUZvZV82d3zU7AB6Kv80xG01WOtPH2idOsUNYmC57ir
 M4OFWToanQQ1UaB+t6BdYLUSG1qHfMxEkFFDmINkNoJ+h7ISXQ3nW6Sfn33BLjE/Sq
 DU9HEJ77uKQcyJ49jeQjlATWQ2iODCq7TX3NkwrFleGe1reU5lcLpgrTDSk15tTY9p
 g1R6yoPQmwmZw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Fri, 16 Jul 2021 09:39:10 -0500
Message-Id: <20210716143919.44373-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m4P1I-0004dx-Tz
Subject: [f2fs-dev] [PATCH 0/9] f2fs: use iomap for direct I/O
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

This series makes f2fs implement direct I/O using iomap_dio_rw() instead
of __blockdev_direct_IO().  In order to do this, it adds f2fs_iomap_ops,
since this is the first use of iomap in f2fs.

The iomap direct I/O implementation is more efficient than the
fs/direct-io.c implementation.  Switching to iomap also avoids the need
to add new features and optimizations to the old implementation.  E.g.,
see https://lore.kernel.org/r/20200710053406.GA25530@infradead.org and
https://lore.kernel.org/r/YKJBWClI7sUeABDs@infradead.org.

In general, this series preserves existing f2fs behavior (such as the
conditions for falling back to buffered I/O) and is only an
implementation change.

Patches 1-5 contain cleanups and fixes for f2fs_file_write_iter().
Patch 6 adds f2fs_iomap_ops, patch 7 and 8 switch direct I/O reads and
writes to iomap, and patch 9 removes obsoleted code.

Careful review is appreciated, as I'm not an expert in all areas here.

This series has been tested with xfstests by running 'gce-xfstests -c
f2fs -g auto -X generic/017' with and without this series; no
regressions were seen.  (Some tests fail both before and after.
generic/017 hangs both before and after, so it had to be excluded.)

This series applies to v5.14-rc1.

Eric Biggers (9):
  f2fs: make f2fs_write_failed() take struct inode
  f2fs: remove allow_outplace_dio()
  f2fs: rework write preallocations
  f2fs: reduce indentation in f2fs_file_write_iter()
  f2fs: fix the f2fs_file_write_iter tracepoint
  f2fs: implement iomap operations
  f2fs: use iomap for direct I/O reads
  f2fs: use iomap for direct I/O writes
  f2fs: remove f2fs_direct_IO()

 fs/f2fs/Kconfig             |   1 +
 fs/f2fs/data.c              | 286 +++++++------------------
 fs/f2fs/f2fs.h              |  29 +--
 fs/f2fs/file.c              | 416 +++++++++++++++++++++++++++++-------
 include/trace/events/f2fs.h |  12 +-
 5 files changed, 421 insertions(+), 323 deletions(-)


base-commit: e73f0f0ee7541171d89f2e2491130c7771ba58d3
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
