Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5395F27E1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Oct 2022 05:32:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ofCBT-0006Sy-9a;
	Mon, 03 Oct 2022 03:31:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ofCBR-0006Ss-Re
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Oct 2022 03:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Q13q5gcwU2xViJrgGNtjpba8tcGjm3SGnnKom4fWdo=; b=iEvueJf1+lTMChnDJOqq25ViZk
 TGpmErFwDkP6KCfgD2zoH8svvVa62tDbc4OHXtin2/87mUfmqb22AUmETewBnAYWK3i6kwAUtJnHM
 S6RvH5Mf77unrEZITNffSnz70jGpi9JunOwt1qXXIsGx13qQuMXO4/sASgc9cwco1sEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2Q13q5gcwU2xViJrgGNtjpba8tcGjm3SGnnKom4fWdo=; b=d
 IXEdrBhjgmX5p1J8LQiscMH9nQrB1TwjksRYgvc+wBLTTjLTQnXFD35aMfysDPGSORwaBnNRVqR4E
 aigHGU6QFUJScK9NshiDrd1EAAYBLf8eNeGVoh6X6tn69o1SOJFkCf0Gcv2LKcrvLu3N30rmSd29s
 mrGZLqHgWcPCR2Lg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ofCBR-00AVuU-6k for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Oct 2022 03:31:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CAD0A60C2A;
 Mon,  3 Oct 2022 03:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C19C433C1;
 Mon,  3 Oct 2022 03:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664767911;
 bh=y35fnV1suzCrdYnC9ogHY7hnwYVGR7VG5Y9k9Bvj6Y4=;
 h=Date:From:To:Cc:Subject:From;
 b=aXP5wX8T+Tj8ZKfuf/V+xa7gVbK0pLGri+mgOnMuP/IlzoyXMTV3k4ILCuklR6mZM
 FlaX90HO752CwrDRAnB4OdepWaGdvPTCVgt95WYpqKZHk979DdoVvdD1ZFziKehmd9
 zheGJo2+IVxfZnix2V7pcEv8F/blcN0QtP0GI8MVxwJ0BbVEod0APOgnGLSwJuAqfa
 grfOZgNRUjbIJ0CbrqHwg688qD4Ra9NLOmyhI7gmYwD0mwlGlvrfDDyPwqGrvJ9plG
 qfMG4uxF+RUX0f63BuXtgjxCvoja9F4BNDjWRV5uCa8QPEwG2L/oQe7iX5WGEgXaqT
 ciwkakE9U+5Aw==
Date: Sun, 2 Oct 2022 20:31:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YzpXpalOcvwp+keu@quark>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The following changes since commit
 1c23f9e627a7b412978b4e852793c5e3c3efc555:
 Linux 6.0-rc2 (2022-08-21 17:32:54 -0700) are available in the Git repository
 at: Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ofCBR-00AVuU-6k
Subject: [f2fs-dev] [GIT PULL] STATX_DIOALIGN for 6.1
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/statx-dioalign-for-linus

for you to fetch changes up to 61a223df421f698c253143014cfd384255b3cf1e:

  xfs: support STATX_DIOALIGN (2022-09-11 19:47:12 -0500)

----------------------------------------------------------------

Make statx() support reporting direct I/O (DIO) alignment information.
This provides a generic interface for userspace programs to determine
whether a file supports DIO, and if so with what alignment restrictions.
Specifically, STATX_DIOALIGN works on block devices, and on regular
files when their containing filesystem has implemented support.

An interface like this has been requested for years, since the
conditions for when DIO is supported in Linux have gotten increasingly
complex over time.  Today, DIO support and alignment requirements can be
affected by various filesystem features such as multi-device support,
data journalling, inline data, encryption, verity, compression,
checkpoint disabling, log-structured mode, etc.  Further complicating
things, Linux v6.0 relaxed the traditional rule of DIO needing to be
aligned to the block device's logical block size; now user buffers (but
not file offsets) only need to be aligned to the DMA alignment.

The approach of uplifting the XFS specific ioctl XFS_IOC_DIOINFO was
discarded in favor of creating a clean new interface with statx().

For more information, see the individual commits and the man page update
https://lore.kernel.org/r/20220722074229.148925-1-ebiggers@kernel.org.

----------------------------------------------------------------
Eric Biggers (8):
      statx: add direct I/O alignment information
      vfs: support STATX_DIOALIGN on block devices
      fscrypt: change fscrypt_dio_supported() to prepare for STATX_DIOALIGN
      ext4: support STATX_DIOALIGN
      f2fs: move f2fs_force_buffered_io() into file.c
      f2fs: simplify f2fs_force_buffered_io()
      f2fs: support STATX_DIOALIGN
      xfs: support STATX_DIOALIGN

 block/bdev.c              | 23 ++++++++++++++++++++++
 fs/crypto/inline_crypt.c  | 49 +++++++++++++++++++++++------------------------
 fs/ext4/ext4.h            |  1 +
 fs/ext4/file.c            | 37 ++++++++++++++++++++++++-----------
 fs/ext4/inode.c           | 37 +++++++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h            | 40 --------------------------------------
 fs/f2fs/file.c            | 43 ++++++++++++++++++++++++++++++++++++++++-
 fs/stat.c                 | 14 ++++++++++++++
 fs/xfs/xfs_iops.c         | 10 ++++++++++
 include/linux/blkdev.h    |  4 ++++
 include/linux/fscrypt.h   |  7 ++-----
 include/linux/stat.h      |  2 ++
 include/uapi/linux/stat.h |  4 +++-
 13 files changed, 188 insertions(+), 83 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
