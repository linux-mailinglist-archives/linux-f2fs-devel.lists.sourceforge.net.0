Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3458A749273
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 02:18:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHChZ-0003Eo-U9;
	Thu, 06 Jul 2023 00:18:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qHChW-0003CV-Gd
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lWSOns9Nx+XUiOTBZHHIbOm79s5VtAghUMfDNHx8Q2A=; b=MfZSMk4gcmP0zi6Oe/nQhXk9Yw
 qYfH6asUnlT69e7Urys89OaMlEdYcbhV3956t9MNCg4kGukfwC86RMYBoLMiJX/TGAhIEf5NszyTe
 8TXqthHEvHi9VCoG4CXExm+mC+bB9s5b36CaeyHd1bUDswFy3mNqaSpWEE70DlHyAyJ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lWSOns9Nx+XUiOTBZHHIbOm79s5VtAghUMfDNHx8Q2A=; b=Z
 +HfTW1jvnRhBpDhaQQcIM45AeOV+mlBBFxUWxzD5nBLnbUFblqpOYhK0yXltgK8EQPakV/z42Ng7m
 r8Xe6iDCl/p9YwoSi9w4F4/OUu406Ac5Kr+qdkHhU/TKV19o+Cn15hXzjrF6gQ+hHAlR1EIoP2yzC
 qOlJbfa09Wd2jPu4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHChR-0006GA-Oi for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48EB36178D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Jul 2023 00:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1BFFC433C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688602694;
 bh=IHR/wBEsNgWoBO0s1eLLSGOkrHiVqCo4I2d+aUzJBPs=;
 h=Subject:From:Date:To:From;
 b=C9ie77QJKB9Lg9WphkYWkY2tFccZ/k4Z2NnukkpYFKjPrHsv3pmHj/NJAtDJshqH0
 3QA228mbs4kmUyyYqUedUT3e3QnlUgNPv/rFooW9gZAoWpScAACzyKFOESANMeqsHl
 MgHO0BW4qirIroTf4G+TOB9Axv9ujWgwYS5MRI0fp+im1oN0qH0y0UWoIC0qQ6RH4D
 tNxgOtP6OB4TltQJHAZi8eZfgKMl26dLFUG03ZOCzRvizdTyz+xW8IYz1SCd3AUqAU
 vR9SipfAx/yr9dQn/23UWHbcVjRJ0uLq1wDEL6mqSQaYpWuf8AgiEtSeTQmSrcMZy/
 bvXnqOSSphbAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 88951C0C40E for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168860269448.29151.7314555898251097801.git-patchwork-summary@kernel.org>
Date: Thu, 06 Jul 2023 00:18:14 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,
 01/12] backing_dev:
 remove current->backing_dev_info Submitter: Christoph Hellwig <hch@lst.de>
 Committer: Andrew Morton <akpm@linux-foundation.org> Patchwork:
 https://patchwork.kerne [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHChR-0006GA-Oi
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: [f2fs-dev,01/12] backing_dev: remove current->backing_dev_info
  Submitter: Christoph Hellwig <hch@lst.de>
  Committer: Andrew Morton <akpm@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=753162
  Lore link: https://lore.kernel.org/r/20230601145904.1385409-2-hch@lst.de
    Patches: [f2fs-dev,01/12] backing_dev: remove current->backing_dev_info
             [f2fs-dev,02/12] iomap: update ki_pos a little later in iomap_dio_complete
             [f2fs-dev,03/12] filemap: update ki_pos in generic_perform_write
             [f2fs-dev,04/12] filemap: add a kiocb_write_and_wait helper
             [f2fs-dev,05/12] filemap: add a kiocb_invalidate_pages helper
             [f2fs-dev,06/12] filemap: add a kiocb_invalidate_post_direct_write helper
             [f2fs-dev,07/12] iomap: update ki_pos in iomap_file_buffered_write
             [f2fs-dev,08/12] iomap: use kiocb_write_and_wait and kiocb_invalidate_pages
             [f2fs-dev,09/12] fs: factor out a direct_write_fallback helper
             [f2fs-dev,10/12] fuse: update ki_pos in fuse_perform_write
             [f2fs-dev,11/12] fuse: drop redundant arguments to fuse_perform_write
             [f2fs-dev,12/12] fuse: use direct_write_fallback

Series: [f2fs-dev,01/30] block: also call ->open for incremental partition opens
  Submitter: Christoph Hellwig <hch@lst.de>
  Committer: Jens Axboe <axboe@kernel.dk>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=755281
  Lore link: https://lore.kernel.org/r/20230608110258.189493-2-hch@lst.de
    Patches: [f2fs-dev,01/30] block: also call ->open for incremental partition opens
             [f2fs-dev,02/30] cdrom: remove the unused bdev argument to cdrom_open
             [f2fs-dev,03/30] cdrom: remove the unused mode argument to cdrom_ioctl
             [f2fs-dev,04/30] cdrom: remove the unused cdrom_close_write release code
             [f2fs-dev,05/30] cdrom: track if a cdrom_device_info was opened for data
             [f2fs-dev,06/30] cdrom: remove the unused mode argument to cdrom_release
             [f2fs-dev,07/30] block: pass a gendisk on bdev_check_media_change
             [f2fs-dev,08/30] block: pass a gendisk to ->open
             [f2fs-dev,09/30] block: remove the unused mode argument to ->release
             [f2fs-dev,10/30] block: rename blkdev_close to blkdev_release
             [f2fs-dev,11/30] swsusp: don't pass a stack address to blkdev_get_by_path
             [f2fs-dev,12/30] bcache: don't pass a stack address to blkdev_get_by_path
             [f2fs-dev,13/30] rnbd-srv: don't pass a holder for non-exclusive blkdev_get_by_path
             [f2fs-dev,14/30] btrfs: don't pass a holder for non-exclusive blkdev_get_by_path
             [f2fs-dev,15/30] block: use the holder as indication for exclusive opens
             [f2fs-dev,16/30] block: add a sb_open_mode helper
             [f2fs-dev,17/30] fs: remove sb->s_mode
             [f2fs-dev,18/30] scsi: replace the fmode_t argument to scsi_cmd_allowed with a simple bool
             [f2fs-dev,19/30] scsi: replace the fmode_t argument to scsi_ioctl with a simple bool
             [f2fs-dev,20/30] scsi: replace the fmode_t argument to ->sg_io_fn with a simple bool
             [f2fs-dev,21/30] nvme: replace the fmode_t argument to the nvme ioctl handlers with a simple bool
             [f2fs-dev,22/30] mtd: block: use a simple bool to track open for write
             [f2fs-dev,23/30] rnbd-srv: replace sess->open_flags with a "bool readonly"
             [f2fs-dev,24/30] ubd: remove commented out code in ubd_open
             [f2fs-dev,25/30] block: move a few internal definitions out of blkdev.h
             [f2fs-dev,26/30] block: remove unused fmode_t arguments from ioctl handlers
             [f2fs-dev,27/30] block: replace fmode_t with a block-specific type for block open flags
             [f2fs-dev,28/30] block: always use I_BDEV on file->f_mapping->host to find the bdev
             [f2fs-dev,29/30] block: store the holder in file->private_data
             [f2fs-dev,30/30] fs: remove the now unused FMODE_* flags

Series: [f2fs-dev,01/17] fs: unexport buffer_check_dirty_writeback
  Submitter: Christoph Hellwig <hch@lst.de>
  Committer: Christian Brauner <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=742589
  Lore link: https://lore.kernel.org/r/20230424054926.26927-2-hch@lst.de
    Patches: [f2fs-dev,01/17] fs: unexport buffer_check_dirty_writeback
             [f2fs-dev,02/17] fs: remove the special !CONFIG_BLOCK def_blk_fops
             [f2fs-dev,06/17] filemap: add a kiocb_write_and_wait helper
             [f2fs-dev,07/17] filemap: add a kiocb_invalidate_pages helper
             [f2fs-dev,13/17] block: don't plug in blkdev_write_iter

Series: [f2fs-dev,01/13] iomap: update ki_pos a little later in iomap_dio_complete
  Submitter: Christoph Hellwig <hch@lst.de>
  Committer: Andrew Morton <akpm@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=749185
  Lore link: https://lore.kernel.org/r/20230519093521.133226-2-hch@lst.de
    Patches: [f2fs-dev,01/13] iomap: update ki_pos a little later in iomap_dio_complete
             [f2fs-dev,04/13] filemap: add a kiocb_write_and_wait helper
             [f2fs-dev,05/13] filemap: add a kiocb_invalidate_pages helper
             [f2fs-dev,09/13] iomap: use kiocb_write_and_wait and kiocb_invalidate_pages

Patch: None
  Submitter: David Howells <dhowells@redhat.com>
  Committer: Jens Axboe <axboe@kernel.dk>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=749500
  Lore link: https://lore.kernel.org/r/20230520000049.2226926-20-dhowells@redhat.com

Patch: None
  Submitter: David Howells <dhowells@redhat.com>
  Committer: Jens Axboe <axboe@kernel.dk>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=749786
  Lore link: https://lore.kernel.org/r/20230522135018.2742245-20-dhowells@redhat.com

Patch: [f2fs-dev,v2] fsverity: use shash API instead of ahash API
  Submitter: Eric Biggers <ebiggers@kernel.org>
  Committer: Eric Biggers <ebiggers@google.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=747847
  Lore link: https://lore.kernel.org/r/20230516052306.99600-1-ebiggers@kernel.org

Series: fs: Fix directory corruption when moving directories
  Submitter: Jan Kara <jack@suse.cz>
  Committer: Christian Brauner <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=753052
  Lore link: https://lore.kernel.org/r/20230601104525.27897-1-jack@suse.cz
    Patches: [f2fs-dev,v2,1/6] ext4: Remove ext4 locking of moved directory
             [f2fs-dev,v2,2/6] Revert "udf: Protect rename against modification of moved directory"
             [f2fs-dev,v2,3/6] Revert "f2fs: fix potential corruption when moving a directory"
             [f2fs-dev,v2,5/6] fs: Lock moved directories

Patch: [f2fs-dev,GIT,PULL] f2fs update for 6.5
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=762798
  Lore link: https://lore.kernel.org/r/ZKWuP6+mGdW/W0/P@google.com


Total patches: 59

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
