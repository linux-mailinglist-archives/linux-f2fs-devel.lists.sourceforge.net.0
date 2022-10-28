Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 246A4611D93
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Oct 2022 00:48:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooY8x-0004OM-TT;
	Fri, 28 Oct 2022 22:48:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ooY8v-0004O6-T7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 22:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SscYugZJ1BO2XiRVumEKauGSVdn0VvqusfkJqvC/OLY=; b=EpBP3Fcl+siVvPtawnT42nYpk0
 cCB8JYXohrGhExdA6eecP6zC8ZU16eHM9nIktoT3VM0oAL6gn+9k5VFdtfzEYt/xaiFQYJ7KH72uG
 BVqlUkyHfRVeMb/uyC/oq/w/0WHvGxLEsztiGo8S1qAxX6rkUZpcpmXb4iSm/cx34wOI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SscYugZJ1BO2XiRVumEKauGSVdn0VvqusfkJqvC/OLY=; b=H
 mF300LhYljVjv5rLEYKdOMl/IiusisI8D85q4OhPPoBzhJHICQ4NsDu4q3fJaasJaak8Eilpr4BBE
 M91BVP7uI2cLHuzGxTZZzEl8D6SpGUjr1uEQAnOg1UA0NyDrILhlUCIAyXgAVFT1DMD2yMgwmwi3v
 2/uLujWqGA3EeZEs=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooY8s-0007GH-Cg for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 22:48:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E6FEBCE2E9E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Oct 2022 22:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8C6C433D6;
 Fri, 28 Oct 2022 22:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666997265;
 bh=4Gis4J6FInfcpasgqe1VktNVUDifHwCLxkhJxJDfYg8=;
 h=From:To:Cc:Subject:Date:From;
 b=Tw4NUWnK6m8OaUTrRHH905TS9LfG6I9nYNG0Jz3Uwr35Q4LdLMKMs0hb76xKH7hUw
 iArYiH+CVoeUAmZthSWPhlWnJUbHrZchEbvc9FmGtPQPMGTgMKvqmGvnLVSLhShpBx
 cD08RgkjZqPlkfrUwHJ+XK5wBpnsqJnjS/97vyQQwn8z/ucBccm12lX2mOWcQRfBXu
 WpIB/tX9t5N9/KpVA3U8usMiE7H60bhctbfQ2tsHguU9frpYL8hZlu/P7jo0qnvOH/
 w0yqFmOfrREE0MYc95OfB4zZfV10TbZbgNcGKqIjAe9XMbgmcIj2dWNipIvi0tBMbP
 u51kmtmDq6UUg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 28 Oct 2022 15:45:33 -0700
Message-Id: <20221028224539.171818-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: [This patchset applies to v6.1-rc2 + my other patch
 https://lore.kernel.org/r/20221028175807.55495-1-ebiggers@kernel.org.
 You can get everything from tag "fsverity-non4k-v1" of https://git.kernel.org/
 [...] Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooY8s-0007GH-Cg
Subject: [f2fs-dev] [PATCH 0/6] fsverity: support for non-4K pages
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[This patchset applies to v6.1-rc2 + my other patch
 https://lore.kernel.org/r/20221028175807.55495-1-ebiggers@kernel.org.
 You can get everything from tag "fsverity-non4k-v1" of
 https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git]

Currently, filesystems (ext4, f2fs, and btrfs) only support fsverity
when the Merkle tree block size, filesystem block size, and page size
are all the same.  In practice that means 4K, since increasing the page
size, e.g. to 16K, forces the Merkle tree block size and filesystem
block size to be increased accordingly.  That can be impractical; for
one, users want the same file signatures to work on all systems.

Therefore, this patchset reduces the coupling between these sizes.

First, patches 1-4 allow the Merkle tree block size to be less than the
page size or filesystem block size, provided that it's not larger than
either one.  This involves, among other things, changing the way that
fs/verity/verify.c tracks which hash blocks have been verified.

Second, patches 5-6 makes ext4 support fsverity when the filesystem
block size is less than the page size.  Note, f2fs doesn't need similar
changes because f2fs always assumes that the filesystem block size and
page size are the same anyway.  I haven't looked into btrfs yet.

I've tested this patchset with changes to the verity tests in xfstests.
I'll be sending out these xfstests changes separately.

Eric Biggers (6):
  fsverity: support verification with tree block size < PAGE_SIZE
  fsverity: support enabling with tree block size < PAGE_SIZE
  ext4: simplify ext4_readpage_limit()
  f2fs: simplify f2fs_readpage_limit()
  fs/buffer.c: support fsverity in block_read_full_folio()
  ext4: allow verity with fs block size < PAGE_SIZE

 Documentation/filesystems/fsverity.rst |  76 +++---
 fs/buffer.c                            |  66 ++++-
 fs/ext4/readpage.c                     |   3 +-
 fs/ext4/super.c                        |   5 -
 fs/f2fs/data.c                         |   3 +-
 fs/verity/enable.c                     | 268 ++++++++++----------
 fs/verity/fsverity_private.h           |  17 +-
 fs/verity/hash_algs.c                  |  48 ++--
 fs/verity/open.c                       | 101 ++++++--
 fs/verity/verify.c                     | 325 +++++++++++++++++--------
 include/linux/fsverity.h               |  14 +-
 11 files changed, 575 insertions(+), 351 deletions(-)

-- 
2.38.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
