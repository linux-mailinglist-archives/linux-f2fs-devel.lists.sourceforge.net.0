Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D654273D5A5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jun 2023 03:54:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDbR7-0001sb-AK;
	Mon, 26 Jun 2023 01:54:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qDbR1-0001sU-BG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 01:54:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PImh4XpOZ93mAqOYIAY9QVGvJxWUH5kRKmo0vXGr3dQ=; b=O0PzJAeKhd8cIoiVTOM3kYwvOV
 kVEt0E12HQZ3r0xcv2jIdHrafR5HgtDRvnUvXN4YUIQqAFhevLDDMBMl565j/UUpISskS6A9tgZI5
 xAIVV9zXKYk6flYjCMQZSSBs3R0NzXEOkY97VvVBPiGjGVsIjCu9huqOpvwFGIWBpEBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PImh4XpOZ93mAqOYIAY9QVGvJxWUH5kRKmo0vXGr3dQ=; b=j
 W5rW8Px3lQo6PWv152uBD2LXZmYEZfeaHXuFy9Y2Ls7PRRCecddrLSMqh5n6Y99GH7Lh8TzjXcw4r
 JTgInJmnfZxhJ8hRthI9EZd3hMKhto9ZN8Un3CIJsOwQXZBESG8D3HMAUDjwzhpIYypaPOfTjySCx
 4yzKBGSXr8rDajyQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qDbQw-00EV9i-Q2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 01:54:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6759B60C07;
 Mon, 26 Jun 2023 01:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93038C433C0;
 Mon, 26 Jun 2023 01:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687744456;
 bh=5oeqP+MWXjh5TRebKQMUswKua+sGjBsaB33i76j0bxo=;
 h=Date:From:To:Cc:Subject:From;
 b=f6LGIex6z5K0RASvaouow8y8XMHsFXoUr7TZ2cVN0jTQhZ5CbZsJSJjkPCK82EaXb
 WHfnKAp5TSnsepIqO1p3s1SAmJiku6aewaNrrd87VPbThmmT/S4Ga01IoS9OjHJE20
 B09EP3Cz4HjqEmXElkhJYpdF4Jqe8u7PXQ1pMvxTa/05AdzLs4jvhT8Rb1yFzGsq2U
 7mBc9xEZTHIDlv+nXA0qT+x/WEWAnFQiD+5AzmtJ9OX4B/+/eox2gxUj/O0jY3Ga6u
 9g7sm5ShVE5ovqJDmng6IGODDnQIWY567sJ5ydCm5DMuhMP0bA131SUwh4MGJNFNTU
 FuhaSQE4Vft2Q==
Date: Sun, 25 Jun 2023 18:54:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20230626015415.GB1024@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The following changes since commit
 f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6:
 Linux 6.4-rc2 (2023-05-14 12:51:40 -0700) are available in the Git repository
 at: Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qDbQw-00EV9i-Q2
Subject: [f2fs-dev] [GIT PULL] fsverity updates for 6.5
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
Cc: fsverity@lists.linux.dev, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Alexander Larsson <alexl@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6:

  Linux 6.4-rc2 (2023-05-14 12:51:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus

for you to fetch changes up to 672d6ef4c775cfcd2e00172e23df34e77e495e85:

  fsverity: improve documentation for builtin signature support (2023-06-20 22:47:55 -0700)

----------------------------------------------------------------

Several updates for fs/verity/:

- Do all hashing with the shash API instead of with the ahash API.  This
  simplifies the code and reduces API overhead.  It should also make
  things slightly easier for XFS's upcoming support for fsverity.  It
  does drop fsverity's support for off-CPU hash accelerators, but that
  support was incomplete and not known to be used.

- Update and export fsverity_get_digest() so that it's ready for
  overlayfs's upcoming support for fsverity checking of lowerdata.

- Improve the documentation for builtin signature support.

- Fix a bug in the large folio support.

----------------------------------------------------------------
Eric Biggers (6):
      fsverity: use shash API instead of ahash API
      fsverity: constify fsverity_hash_alg
      fsverity: don't use bio_first_page_all() in fsverity_verify_bio()
      fsverity: simplify error handling in verify_data_block()
      fsverity: rework fsverity_get_digest() again
      fsverity: improve documentation for builtin signature support

 Documentation/filesystems/fsverity.rst | 192 +++++++++++++++++++++------------
 fs/verity/Kconfig                      |  16 +--
 fs/verity/enable.c                     |  21 ++--
 fs/verity/fsverity_private.h           |  23 ++--
 fs/verity/hash_algs.c                  | 139 +++++-------------------
 fs/verity/measure.c                    |  37 +++++--
 fs/verity/open.c                       |  12 +--
 fs/verity/read_metadata.c              |   4 +-
 fs/verity/signature.c                  |   8 ++
 fs/verity/verify.c                     | 164 +++++++++++-----------------
 include/linux/fsverity.h               |  14 ++-
 security/integrity/ima/ima_api.c       |  31 +++---
 12 files changed, 299 insertions(+), 362 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
