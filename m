Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5148379FE15
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Sep 2023 10:15:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qghVE-0006xO-IL;
	Thu, 14 Sep 2023 08:15:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qghVA-0006xH-85
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Sep 2023 08:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MvSRlFmK/zPM3FOTQFTgYjFNwr/XUhqE92UhtlyGHXg=; b=Ra4blB2dZttXmRvu9cwzDp+PuQ
 nG2TFz5+TMBgTS7SsNg9OAUY6efPPEPyWFFLrgajK9vPetAl7UZX9pcKF1/uSy02wvQVQkZ0g+eH5
 muD3/CqxbZBQ1u0N/7eJ3FcHCS8RGRY1jClq3dSd5G9stzVZac+2pnQ3/Ki3uTC38cOA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MvSRlFmK/zPM3FOTQFTgYjFNwr/XUhqE92UhtlyGHXg=; b=Q
 884k0t6rc1CUtoSE0IHZsePMK1bairaxvjInWqrYQGx4QfvxIKy46GRfvg8Tw+0NozGe7Rq9P6YqJ
 O/6Yce/3XVu7bm2vzSlpXn5reFukAK2wsTVtIKqatHHg+CkRha3dvwNr1qgYqzsCv46ndncT9zoao
 J3Lpj8Ajr5cBd2oM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qghV3-0002dd-1d for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Sep 2023 08:15:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F05A0B82815;
 Thu, 14 Sep 2023 08:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E8AC433C7;
 Thu, 14 Sep 2023 08:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694679289;
 bh=O/fQUB0thzVERyyDJ+e34tB6NXJCmxw8lXP18CaGKeo=;
 h=From:To:Cc:Subject:Date:From;
 b=XXUmuSFI3jaRP/IM3nQ4JnvyjNh2qAOhASwCfGN1IJc6eJjrXLpDuCg/3ZRK0XZIj
 PFpUjNSLaAuzaHdHX3KqjtWOGoOw1pqq7H1hX2lo3clUMJ3Hq5Q+RZY621FubejTSP
 Dh2Z62Cf+OwrRofnkyC/mnCGfrVcW82/pgXrN5vRE9sZCwRAPBDRIgbVnSW1AscKx0
 qnVUR+TBx4/yQhJ4uusXzvx8wg1uyXcrRP8jIXgrEbf3eBb2dChUkeuEIJ3i44gnGV
 dn/WYBhiU/WVI/fHFm4KWMQ+n7wCAX7LZDacnTqVfOvr354VtPtV1r2ZSb96qVxwNz
 efUYIl8JOfimg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu, 14 Sep 2023 01:12:50 -0700
Message-ID: <20230914081255.193502-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patchset adds support for configuring the granularity
 of file contents encryption (a.k.a. the "crypto data unit size") to be less
 than the filesystem block size. The main use case for this is to [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qghV3-0002dd-1d
Subject: [f2fs-dev] [PATCH v2 0/5] fscrypt: add support for data_unit_size <
 fs_block_size
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patchset adds support for configuring the granularity of file
contents encryption (a.k.a. the "crypto data unit size") to be less than
the filesystem block size.  The main use case for this is to support
inline crypto hardware that only supports a data unit size that is less
than the FS block size being used.  Another possible use case is to
support direct I/O on encrypted files without the FS block alignment
restriction.  Note that decreasing the crypto data unit size decreases
efficiency, so this feature should only be used when necessary.

For full details, see patch 5 which adds the actual feature.  Patches
1-4 are preparatory patches.

I've written an xfstest that verifies that when a sub-block data unit
size is selected, the data on-disk is encrypted correctly with that data
unit size.  I'll be sending that out separately.  Other testing of this
patchset with xfstests has gone well, though it turns out a sub-block
data unit size doesn't really work with IV_INO_LBLK_* yet (see patch 5).

This patchset will cause some conflicts in the extent-based encryption
patches that the btrfs folks are working on, as both are touching file
contents encryption, but logically they are orthogonal features.

This patchset is based on v6.6-rc1.

Changed in v2:
  - Rebased onto v6.6-rc1 and took into account CephFS's recent addition
    of support for fscrypt
  - Narrowed the focus somewhat by dropping the attempted support for
    IV_INO_LBLK_32 and clearly documenting what is considered out of
    scope for now
  - Other cleanups

Eric Biggers (5):
  fscrypt: make it extra clear that key_prefix is deprecated
  fscrypt: make the bounce page pool opt-in instead of opt-out
  fscrypt: use s_maxbytes instead of filesystem lblk_bits
  fscrypt: replace get_ino_and_lblk_bits with just has_32bit_inodes
  fscrypt: support crypto data unit size less than filesystem block size

 Documentation/filesystems/fscrypt.rst | 116 ++++++++++++++------
 fs/ceph/crypto.c                      |   1 +
 fs/crypto/bio.c                       |  39 ++++---
 fs/crypto/crypto.c                    | 148 +++++++++++++++-----------
 fs/crypto/fscrypt_private.h           |  55 ++++++++--
 fs/crypto/inline_crypt.c              |  25 +++--
 fs/crypto/keysetup.c                  |   3 +
 fs/crypto/keysetup_v1.c               |   5 +-
 fs/crypto/policy.c                    |  75 ++++++++-----
 fs/ext4/crypto.c                      |  13 +--
 fs/f2fs/super.c                       |  13 +--
 fs/ubifs/crypto.c                     |   3 +-
 include/linux/fscrypt.h               |  71 +++++++-----
 include/uapi/linux/fscrypt.h          |   3 +-
 14 files changed, 364 insertions(+), 206 deletions(-)


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.42.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
