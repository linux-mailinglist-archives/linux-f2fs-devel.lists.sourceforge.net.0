Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B66C7ACFB9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Sep 2023 07:59:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qkecj-00077r-RL;
	Mon, 25 Sep 2023 05:59:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qkech-00077T-5L
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Sep 2023 05:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fm6dXGrPDBuTURdFbveK8ISPbeQDLGxzkm602RumAQs=; b=B7Nxd35wTqx3ic1kk6NggWfj93
 w7ktQxeyolvoB5stMFzjprpo+/UNuL/ncuCusSxl+N7lGqpdhK67BQPBhKE/Yx21IlHPR8aof0PEN
 Gye2lEJOCNjUoYKpPOrWQAlFN5nDoHRsVX9Q3xFbDpM2HqaEcvRiTHnIiHsy2YI2eqt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fm6dXGrPDBuTURdFbveK8ISPbeQDLGxzkm602RumAQs=; b=D
 y1KUJSxoJoWqKhMB1u8bmdtpa8SsOCEQb8aGKT4+WunLffbixS97spNTzm+rvwdnECRINysmYTIkM
 SOLASMtjAq1Y+d1P20DMNyUdUPwQYoCTdqk4Cbwd7a0LQ1EGpTyBnPuT85wTHpQjVSaGEmCDelDwR
 noyIV+S3ZdcxeiW0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qkece-005UJj-GK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Sep 2023 05:59:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F16C7B80ADF;
 Mon, 25 Sep 2023 05:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E30AC433C7;
 Mon, 25 Sep 2023 05:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695621538;
 bh=tCCLwxvLEvFpLMK/KOG8gn3XG5X7DHq/Kv/q5swH83k=;
 h=From:To:Cc:Subject:Date:From;
 b=USnS67doJkAOwCvzzO4pxVWEqjaMKotK5QoJyyt8fjA0gw+S+R4xPcvpw24VnFDEF
 Ypg5ZAKGGE8kNlKVbBPl3VnLafVGwWh/V+sM3pAu1SOtB6b94Pv7m6R79glQrSo7AK
 9uvSZ0D6WCG1KR5dg+osBg4eDjkele/x3wGQO1HLWtjhs8ujnUtGRT9rFGVqZD1hOj
 IEYdXeCFex9RhZAoUvWTKKIr9BO7UHh/psJRUf+GzYK59rDq+33qVcTyKjZzzNkivS
 LTsx6CM+KNv5HHMxwe1olIcqIGIWpv2Uq96r8JhuKOVx7sP9iOVNuCz6b7G5cwotJS
 QCpKAf1h09yow==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 24 Sep 2023 22:54:46 -0700
Message-ID: <20230925055451.59499-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patchset adds support for configuring the granularity
 of file contents encryption (a.k.a. the "crypto data unit size") to be less
 than the filesystem block size on ext4 and f2fs. The main use cas [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
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
X-Headers-End: 1qkece-005UJj-GK
Subject: [f2fs-dev] [PATCH v3 0/5] fscrypt: add support for data_unit_size <
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
the filesystem block size on ext4 and f2fs.  The main use case for this
is to support inline crypto hardware that only supports a data unit size
that is less than the FS block size being used.  Another possible use
case is to support direct I/O on encrypted files without the FS block
alignment restriction.  Note that decreasing the crypto data unit size
decreases efficiency, so this feature should only be used when needed.

For full details, see patch 5 which adds the actual feature.  Patches
1-4 are preparatory patches.

I've written an xfstest that verifies that when a sub-block data unit
size is selected, the data on-disk is encrypted correctly with that data
unit size.  I'll be sending that out separately.  Other testing of this
patchset with xfstests has gone well, though it turns out that some
additional changes will be needed for a sub-block data unit size to work
with the IV_INO_LBLK_* encryption settings.  See patch 5 for details.
This patchset focuses on basic sub-block data unit size support first.

This patchset will cause some conflicts in the extent-based encryption
patches that the btrfs folks are working on, as both are touching file
contents encryption, but logically they are orthogonal features.

This patchset is based on v6.6-rc3.

Changed in v3:
  - Shortened 'legacy_key_prefix_for_backcompat' to 'legacy_key_prefix'
  - Other miscellaneous cleanups
  - Rebased onto v6.6-rc3

Changed in v2:
  - Rebased onto v6.6-rc1 and took into account CephFS's recent addition
    of support for fscrypt
  - Narrowed the focus somewhat by dropping the attempted support for
    IV_INO_LBLK_32 and clearly documenting what is considered out of
    scope for now
  - Other cleanups

Eric Biggers (5):
  fscrypt: make it clearer that key_prefix is deprecated
  fscrypt: make the bounce page pool opt-in instead of opt-out
  fscrypt: compute max_lblk_bits from s_maxbytes and block size
  fscrypt: replace get_ino_and_lblk_bits with just has_32bit_inodes
  fscrypt: support crypto data unit size less than filesystem block size

 Documentation/filesystems/fscrypt.rst | 117 ++++++++++++++------
 fs/ceph/crypto.c                      |   1 +
 fs/crypto/bio.c                       |  39 ++++---
 fs/crypto/crypto.c                    | 148 +++++++++++++++-----------
 fs/crypto/fscrypt_private.h           |  58 ++++++++--
 fs/crypto/inline_crypt.c              |  19 ++--
 fs/crypto/keysetup.c                  |   5 +
 fs/crypto/keysetup_v1.c               |   5 +-
 fs/crypto/policy.c                    |  73 +++++++++----
 fs/ext4/crypto.c                      |  13 +--
 fs/f2fs/super.c                       |  13 +--
 fs/ubifs/crypto.c                     |   3 +-
 include/linux/fscrypt.h               |  72 ++++++++-----
 include/uapi/linux/fscrypt.h          |   3 +-
 14 files changed, 364 insertions(+), 205 deletions(-)


base-commit: 6465e260f48790807eef06b583b38ca9789b6072
-- 
2.42.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
