Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 534DC827AD5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jan 2024 23:48:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rMyPz-0003O1-Tt;
	Mon, 08 Jan 2024 22:48:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rMyPy-0003Nv-M8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jan 2024 22:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6KoFGi8XOsRwCgGrL+XpmXfjfrorAQmlqPYI3hLAJj4=; b=UV3RhWfLHyZwFRj67+/TVyEsYy
 JSUJcotD5PxwntPkDUEm9oye7OaEB6TBam3rsMxnBLSiXrxLsW1B2opLJJSr85UQAJAYNPnLtvqZt
 13pzrt2fVCd4OClBkEKRh2NPbEBZYEk7hk/bZjLZMQq6IhWuNBDSDPbJ5Z36HptOATd8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6KoFGi8XOsRwCgGrL+XpmXfjfrorAQmlqPYI3hLAJj4=; b=m
 6DPmpAe+0V99do4jBeLimR11Euqxo2ygzYKiVrABwEFoZT5bFC6AT4RhjsN/Tuu+K75oWkVgyptDC
 HWMo4L3zOUEJYhoG/Qlr4K2Ru9Nn2qeaAONW/9hCnRAsW6a3T7PMFiTNtq+HeoW95jfJVQZjpNCfa
 IUVoz0OugUov8EA4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rMyPy-0005wu-Gs for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jan 2024 22:48:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5F386B818FE;
 Mon,  8 Jan 2024 22:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B9DC433C7;
 Mon,  8 Jan 2024 22:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704754093;
 bh=2dn01Ck7l9ZSNneq0vNQpDyByDGDn8pwsyKXUDoZh+8=;
 h=Date:From:To:Cc:Subject:From;
 b=j++Ya042narb+knTvJOY2epSK5WKovJhRVG8Vi6o/sRSdUtMt03nYFrJPl/JiagIK
 XLOncxosj2WCkpcULAnF+5nVHvt9tiBLog7bT1m0n8uo6E+MN8Mug9n0x1z4k5yDNO
 KnZYEFGTjv/+BNxk3e5t9SlipKhl6o1q7A/EJEbfq4ELeL7kqZYj90HCkwKmoLCuu0
 0dYrM+MRnywQumVZ4/vnaJFxNC0/3jQPIdGJAkm/lb2ErmkQKPkS46D2U7+M+3hNT1
 OyRQbRWQomXojWRZbHa0peIv5gnuKNCXDj57bwOh7XpA70E4eJeFYHL/Ec8CHHDlEH
 xPsI2ZYxYZCWg==
Date: Mon, 8 Jan 2024 14:48:11 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20240108224811.GA94550@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The following changes since commit
 33cc938e65a98f1d29d0a18403dbbee050dcad9a:
 Linux 6.7-rc4 (2023-12-03 18:52:56 +0900) are available in the Git repository
 at: Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rMyPy-0005wu-Gs
Subject: [f2fs-dev] [GIT PULL] fscrypt updates for 6.8
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit 33cc938e65a98f1d29d0a18403dbbee050dcad9a:

  Linux 6.7-rc4 (2023-12-03 18:52:56 +0900)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/linux.git tags/fscrypt-for-linus

for you to fetch changes up to 2a0e85719892a1d63f8f287563e2c1778a77879e:

  fs: move fscrypt keyring destruction to after ->put_super (2023-12-27 21:56:01 -0600)

----------------------------------------------------------------

Adjust the timing of the fscrypt keyring destruction, to prepare for
btrfs's fscrypt support. Also document that CephFS supports fscrypt now.

----------------------------------------------------------------
Eric Biggers (4):
      fscrypt.rst: update definition of struct fscrypt_context_v2
      fscrypt: update comment for do_remove_key()
      fscrypt: document that CephFS supports fscrypt now
      f2fs: move release of block devices to after kill_block_super()

Josef Bacik (1):
      fs: move fscrypt keyring destruction to after ->put_super

 Documentation/filesystems/fscrypt.rst | 21 +++++++++++----------
 fs/crypto/Kconfig                     |  2 +-
 fs/crypto/keyring.c                   |  6 +++---
 fs/f2fs/super.c                       | 13 ++++++++-----
 fs/super.c                            | 12 ++++++------
 5 files changed, 29 insertions(+), 25 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
