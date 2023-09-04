Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D3C791C79
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Sep 2023 20:11:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdE2g-0003GB-Rj;
	Mon, 04 Sep 2023 18:11:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qdE2f-0003G5-Kk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 18:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kmfv1pf+LlrUXECFl22Y7F74qpbdpRAeBbonW5mPEPM=; b=M275QWXTgMymQ3W3wcjbT/TmPY
 Bz+ro7mecoQFWPya8Co0Vm4IaC+aT1adqH53F6aI3TRvicqJ9ot4eO5+NhOV/u/pAg+Zxfko0ipbn
 EYeY3KgPAMGd3HEvNtRzrlrx/T8+bMzflX6QVNpu+82PPiJH1t+e9yp2ah2DFK6zoleY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kmfv1pf+LlrUXECFl22Y7F74qpbdpRAeBbonW5mPEPM=; b=hnp7zYlq/YYFhX5UccKiIvjojn
 /qroD6NlzNqxTSxKx5nkQ9a1DnQi/NYRh8ZaAlIWeizx0+qTrRtQU/tLG04VVCe/+rNrUT0fCyLja
 29U5AIy4HsRhVP4KBWAboXSwkYBXmRCmTvtEQK2l3LUCtrMUh6StxPy+79UG5em+Nu/M=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdE2e-009VKo-J7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 18:11:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2F706B80EF2;
 Mon,  4 Sep 2023 18:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D11E1C433C9;
 Mon,  4 Sep 2023 18:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693851068;
 bh=r/KSGQSC2NTgHdn0OJxxPyQs5JUPuWZgLFSrloxRrHA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WY31BwYbsVaGAsAtOYrlZpg1KnLgAs5RHjbBmkE63X+qnTxnsbYUW9NjQiKOCOSGM
 35dAjc/16r8x9+4UIY1GQvYdcgSsF77G7M2umeI4achKQwD1r8kxyKpsMJDAeQKbTj
 u6bTnoPshfWTKPGcNpvjSFXZ9frMcmaQ0P9oEyxf+sCu7ki/Kd6jSbGw0PTGvlI3UD
 RA7tIDXWOm7Wp2tIjI5uMzknfLnXGn9YM9MyAad0LLRUPYtXYJ8QofSzgrkLH468um
 4pvwF6c7OW0hlvH9nqUhoyMV8I8+BpXY3iW5/itS6xyJ86O/cYKn3kkqQsfYzZub2B
 DuKDMXXQ3sPjg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B6BD6C0C3FD; Mon,  4 Sep 2023 18:11:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169385106874.19669.13506137748616735375.git-patchwork-notify@kernel.org>
Date: Mon, 04 Sep 2023 18:11:08 +0000
References: <20230424054926.26927-2-hch@lst.de>
In-Reply-To: <20230424054926.26927-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jens Axboe <axboe@kernel.dk>: On Mon, 24 Apr 2023 07:49:10 +0200 you wrote:
 > buffer_check_dirty_writeback is only used by the block device aops, > remove
 the export. > > Signed-off-by: Christoph Hellwig <hch@lst.de> > --- > fs/bu
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdE2e-009VKo-J7
Subject: Re: [f2fs-dev] [PATCH 01/17] fs: unexport
 buffer_check_dirty_writeback
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
Cc: axboe@kernel.dk, cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 miklos@szeredi.hu, djwong@kernel.org, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jens Axboe <axboe@kernel.dk>:

On Mon, 24 Apr 2023 07:49:10 +0200 you wrote:
> buffer_check_dirty_writeback is only used by the block device aops,
> remove the export.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/buffer.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,01/17] fs: unexport buffer_check_dirty_writeback
    (no matching commit)
  - [f2fs-dev,02/17] fs: remove the special !CONFIG_BLOCK def_blk_fops
    (no matching commit)
  - [f2fs-dev,03/17] fs: rename and move block_page_mkwrite_return
    (no matching commit)
  - [f2fs-dev,04/17] fs: remove emergency_thaw_bdev
    https://git.kernel.org/jaegeuk/f2fs/c/4a8b719f95c0
  - [f2fs-dev,05/17] filemap: update ki_pos in generic_perform_write
    (no matching commit)
  - [f2fs-dev,06/17] filemap: add a kiocb_write_and_wait helper
    (no matching commit)
  - [f2fs-dev,07/17] filemap: add a kiocb_invalidate_pages helper
    (no matching commit)
  - [f2fs-dev,08/17] filemap: add a kiocb_invalidate_post_write helper
    (no matching commit)
  - [f2fs-dev,09/17] fs: factor out a direct_write_fallback helper
    (no matching commit)
  - [f2fs-dev,10/17] iomap: use kiocb_write_and_wait and kiocb_invalidate_pages
    (no matching commit)
  - [f2fs-dev,11/17] iomap: assign current->backing_dev_info in iomap_file_buffered_write
    (no matching commit)
  - [f2fs-dev,12/17] fuse: use direct_write_fallback
    (no matching commit)
  - [f2fs-dev,13/17] block: don't plug in blkdev_write_iter
    (no matching commit)
  - [f2fs-dev,14/17] block: open code __generic_file_write_iter for blkdev writes
    (no matching commit)
  - [f2fs-dev,15/17] block: stop setting ->direct_IO
    (no matching commit)
  - [f2fs-dev,16/17] block: use iomap for writes to block devices
    (no matching commit)
  - [f2fs-dev,17/17] fs: add CONFIG_BUFFER_HEAD
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
