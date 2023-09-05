Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0CC791FD6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Sep 2023 03:04:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdKUm-0006kt-D3;
	Tue, 05 Sep 2023 01:04:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qdKUi-0006km-H6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Sep 2023 01:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l0i089WfSEO6qWAgM6q9BcorRXFU0U4kuBZtu2tzf5M=; b=Zmxtbl7JWrl7iakEiaIqdCOARm
 e0rp8woYDu0tLcZjrHQS709l/wV9eCaBdgA+8qMjAjW57WQNxpZ7VYG8FsZbgcKX0dIiBBwGz8W/C
 PyCXKPs6N7VjXH9IhF/y4s2yp0vrxZDrzxi5LrOLhWT+9lb/0qv1wHSv+t+m4oSBB8ag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=l0i089WfSEO6qWAgM6q9BcorRXFU0U4kuBZtu2tzf5M=; b=S
 jvr7T5D90LrhKKwX4K5Q9x0Ir+2bAC+D5a/8uoFmFjrtXsOJo/qBYdZl3jh42x9Mf84NGPOwR8e9C
 xpsQ57Y6/Z95BbSmj8dM/UhYUAZJb9B8L+y4ajreGE10rYua1CvdLUwUHmF7Rs1IszqSB0mNi6und
 xOMP1aTsRDBFLUFQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdKUf-00048u-RX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Sep 2023 01:04:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F1E3DCE0A2A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Sep 2023 01:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F2EC433C7;
 Tue,  5 Sep 2023 01:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693875866;
 bh=22KQJh++JdcILQbZl12E7tGyAtMvtw7vw8AFr0hHnnY=;
 h=From:To:Cc:Subject:Date:From;
 b=GWIzNOUiEAtOu+wFjqcn0IqP8smNxOh6FpGxSPeJe5GJp1EIm92geCeXV2OOQRX2v
 A6kONLiIwSrZw8ibpttCuP1p4WFIi0xzdub0XztvVwrJOzY2HQyNgG84DwrO+Claz7
 IbUtrTrxONyYe41ZtvEHQxjeQQcCD52pinHNEQ+dAdOfw3sMr+NIVq3aOWhMZKdg1u
 2AAvveu7BS8kwkSUCuqu2yDwZB+rzjalOPGndECxnL5WMkBnJ/G8PntUy5WzJ5kqKh
 Otioqez2Flk0Q+vcdBfnskrC3jk4hnkfg0+tI8ahglB5vusDwMew5/svqxY0Zz36rt
 ROYuuoWDyg01w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  4 Sep 2023 17:58:25 -0700
Message-ID: <20230905005830.365985-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Until now, fscrypt has always used the filesystem block size
 as the granularity of file contents encryption. Two scenarios have come up
 where a sub-block granularity of contents encryption would be us [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdKUf-00048u-RX
Subject: [f2fs-dev] [PATCH 0/5] fscrypt: add support for data_unit_size <
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Until now, fscrypt has always used the filesystem block size as the
granularity of file contents encryption.  Two scenarios have come up
where a sub-block granularity of contents encryption would be useful:

1. Inline encryption hardware that only supports a crypto data unit size
   that is less than the filesystem block size.

2. Support for direct I/O at a granularity less than the filesystem
   block size, for example at the block device's logical block size in
   order to match the traditional direct I/O alignment requirement.

(1) first came up with older eMMC inline crypto hardware that only
supports a crypto data unit size of 512 bytes.  That specific case
ultimately went away because all systems with that hardware continued
using out of tree code and never actually upgraded to the upstream
inline crypto framework.  But, now it's coming back in a new way: some
current UFS controllers only support a data unit size of 4096 bytes, and
there is a proposal to increase the filesystem block size to 16K.

(2) was discussed as a "nice to have" feature, though not essential,
when support for direct I/O on encrypted files was being upstreamed.

Still, the fact that this feature has come up several times does suggest
it would be wise to have available.  Therefore, this patchset implements
it by using one of the reserved bytes in fscrypt_policy_v2 to allow
users to select a sub-block data unit size.  Supported values are powers
of 2 between 512 bytes and the filesystem block size, inclusively.

Patch 1-4 are preparatory patches.  Patch 5 is the actual feature.

Testing and userspace support are still in progress; there may be bugs
in this patchset.  I just wanted to get this out early in case anyone
has feedback on the feature itself and its likely implementation.

Note: this is unrelated to the work on extent based encryption that is
ongoing by the btrfs folks.  This is basically an orthogonal feature.

This patchset is based on mainline commit 708283abf896dd48

Eric Biggers (5):
  fscrypt: make it extra clear that key_prefix is deprecated
  fscrypt: make the bounce page pool opt-in instead of opt-out
  fscrypt: use s_maxbytes instead of filesystem lblk_bits
  fscrypt: replace get_ino_and_lblk_bits with just has_32bit_inodes
  fscrypt: support crypto data unit size less than filesystem block size

 Documentation/filesystems/fscrypt.rst | 115 ++++++++++++++------
 fs/crypto/bio.c                       |  39 ++++---
 fs/crypto/crypto.c                    | 148 +++++++++++++++-----------
 fs/crypto/fscrypt_private.h           |  51 +++++++--
 fs/crypto/inline_crypt.c              |  46 ++++++--
 fs/crypto/keysetup.c                  |  21 +++-
 fs/crypto/keysetup_v1.c               |   5 +-
 fs/crypto/policy.c                    |  69 +++++++-----
 fs/ext4/crypto.c                      |  13 +--
 fs/f2fs/super.c                       |  13 +--
 fs/ubifs/crypto.c                     |   3 +-
 include/linux/fscrypt.h               |  71 +++++++-----
 include/uapi/linux/fscrypt.h          |   3 +-
 13 files changed, 385 insertions(+), 212 deletions(-)


base-commit: 708283abf896dd4853e673cc8cba70acaf9bf4ea
-- 
2.42.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
