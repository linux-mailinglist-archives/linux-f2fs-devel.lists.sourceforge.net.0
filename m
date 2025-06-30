Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48980AEE5AB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jun 2025 19:24:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ujaHt8saqVzoEQgffwSdDZC5EOG1BcV6rP61Ra50uuI=; b=TFzNAkw681N0if+jjlByBCmFh2
	lP3/tKSHaECrqlHUpN2Laxy6EqGl9AfudyhUSKs3ononkYu8pGRl2L51Ac57lOxtiP+PX1PHpIa+w
	pvs0+tAYsp0NfzDrmwLaiMLG5lrW3e23/afaylNqs5Xlxjo5OXdiAr9WvJyeULrrtN1I=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWIEv-0007wZ-Ll;
	Mon, 30 Jun 2025 17:24:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uWIEt-0007wS-Sg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 17:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yQAv8cM0l0mTxDkHsZ/IaYm3X9qJp26A6tXCfMKcNqM=; b=GdnWbM0ahM8VslsSEHTt5+rUyE
 Ih4FF1OsudGslxkUlwRkvDoxAu6/pgcVjliLBDhA6itb6xv7dyYwbLkGFJVWksaNYUqQRWNdRgqHC
 y0dz4QN2cpgq8JBwSxRIuvuYezjQRxtjnRrXtz6S48OGW3BEKLwTBnlTig5s8EbHyiHE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yQAv8cM0l0mTxDkHsZ/IaYm3X9qJp26A6tXCfMKcNqM=; b=V
 A8nLx2m81J4zhwnnl8FqNdHO40SDyJxTgbju5adUh6oLEg8xNq5OVqHAzIFOPKPs/m9sA2ROIwybU
 cF4/X/TpkBuAHUIXkfllOdPbQlK90vY2AtWPjFC6ESjTCc6ZA9ChwA2HEgNuLg4oEkmPDItrpwdck
 5H5saJF4fKA+HnAg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWIEt-0005oe-Br for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 17:24:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF7E15C6460;
 Mon, 30 Jun 2025 17:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0F1C4CEE3;
 Mon, 30 Jun 2025 17:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751304248;
 bh=2ss1z+u5lNz4mtpxqOkRg3/823azXS0wN/bTXoBHKxY=;
 h=From:To:Cc:Subject:Date:From;
 b=s+dvIOd6tblfiP+FP5N3YqoXcALT9orqIV2/EdJGByixJ+wy2EpolTgjDbQiQBNdC
 /041gDK/TVoafEDYTGqo/lw91xjV+QIB+hAsyWJK9MOaE7M+vryw0pzRgN7ZWHrq2D
 fcBnjz2YShIC0Giw0nfbbtQxtontWDOyc9pLKIe4I71FKF4PZ4WPvS6uczM3wQ2q4j
 pTzaZYjRj98jZg06wWJouMvOpUpGVJhvH0/0USGnxgQCypu1sAr4/nAu5nd8M+aLpi
 Htk4dm8mQa2CX5FwFpXNOo+P8P5oMwjgZzVze8wdYacN3J2xnCRFfxQn1aKShmLCje
 3mdc0OzLVjbaA==
To: fsverity@lists.linux.dev
Date: Mon, 30 Jun 2025 10:22:22 -0700
Message-ID: <20250630172224.46909-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This series, including all its prerequisites,
 is also available at: git fetch
 https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
 fsverity-libcrypto-v1 This series makes fs/verity/ use the SHA-2 library
 API instead of the old-school crypto API. This is simpler and more efficient.
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWIEt-0005oe-Br
Subject: [f2fs-dev] [PATCH 0/2] Convert fs/verity/ to use SHA-2 library API
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 linux-ext4@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series, including all its prerequisites, is also available at:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git fsverity-libcrypto-v1

This series makes fs/verity/ use the SHA-2 library API instead of the
old-school crypto API.  This is simpler and more efficient.

This depends on my SHA-2 library improvements for 6.17 (many patches),
so this patchset might need to wait until 6.18.  But I'm also thinking
about just basing the fsverity tree on libcrypto-next for 6.17.

Eric Biggers (2):
  lib/crypto: hash_info: Move hash_info.c into lib/crypto/
  fsverity: Switch from crypto_shash to SHA-2 library

 Documentation/filesystems/fsverity.rst |   3 +-
 crypto/Kconfig                         |   3 -
 crypto/Makefile                        |   1 -
 fs/verity/Kconfig                      |   6 +-
 fs/verity/enable.c                     |   8 +-
 fs/verity/fsverity_private.h           |  24 +--
 fs/verity/hash_algs.c                  | 194 +++++++++----------------
 fs/verity/open.c                       |  36 ++---
 fs/verity/verify.c                     |   7 +-
 lib/crypto/Kconfig                     |   3 +
 lib/crypto/Makefile                    |   2 +
 {crypto => lib/crypto}/hash_info.c     |   0
 12 files changed, 107 insertions(+), 180 deletions(-)
 rename {crypto => lib/crypto}/hash_info.c (100%)

-- 
2.50.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
