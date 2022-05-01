Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C8A5161F9
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 May 2022 07:13:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nl1tJ-0001Up-Pp; Sun, 01 May 2022 05:13:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nl1tH-0001UN-E6
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 May 2022 05:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6BmiW2OCNeX7cl61x4k4MzVIVJWZ9kKhnQk5cBd5l6M=; b=ZpQg9EgYR2TCEs0FVpfucIljtV
 UWYjLFzZqNr/3uWmVyw3hRBkOsFJ/D/MKafbKfq3DKnDG3bnyIulsB+mYwUkgItaP5Bwxtw6DFW8C
 DBHHxKmgznXTGOD26/Kby2WwZlOP+xSt8Y5uoLIAKJ8IUL0cwF4hNMG7YBsTWae0t1ko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6BmiW2OCNeX7cl61x4k4MzVIVJWZ9kKhnQk5cBd5l6M=; b=f
 MpVY0CAhQIWdJKmUQIy8LbD+MsObw3OwjwZRkloftIUTDSe3xcb9s5hr6xTX4TRJkCUtt67skEImS
 qv4TTXmG0QSm+QYno9Akv9cJ7drLaT7eeJpe1BEcIC5bpwK7LbAQCmDaXnVTQvcScRthD7SrUFlwl
 RKhypjvw3vN4fR8I=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nl1tE-00FPcg-LV
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 May 2022 05:13:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5798B80CB4;
 Sun,  1 May 2022 05:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5C6C385A9;
 Sun,  1 May 2022 05:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651381966;
 bh=lyQVprEqofKA88ZqVyvAxgyulhSJmHuioX9oIOz5/Ho=;
 h=From:To:Cc:Subject:Date:From;
 b=D94sKXm1Ewdq61DUBjxojjZ5SeyesoqsXYzRu4w+7EGm+Q8ardsu/GSFUx/C++uA9
 WnBJXaJwyeH+Yc4Fe4pABwFQIglRcjdSwATubs0u8Hp9f/LYSk3wHA7YFZCoAZzvwO
 Wwv8zBRN1B4FhHvF+poq2FHm4UzyVVzmQp4heMOMbG5iuCmUbIBzo3ShwpF++d3z0D
 UFE/oJXvfivQN5yIEDmgRp++MvKag34kkleDWovEHiTW1hCVBkLXYhKqHAn142SANW
 K0C3O4JIZ5A6GquQnQQP6NphvplYaSvIeNct/0Qrq2LdE6GFGI2SjkjLSIuQ91ZY9M
 yqByXPrFDl6EA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 30 Apr 2022 22:08:50 -0700
Message-Id: <20220501050857.538984-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This series cleans up and fixes the way that ext4 and f2fs
 handle the test_dummy_encryption mount option: - Patches 1-2 make
 test_dummy_encryption
 consistently require that the 'encrypt' feature flag already be enabled and
 that CONFIG_FS_ENCRYPTION be enabled. Note, this will cause xfstest ext4/053
 to sta [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nl1tE-00FPcg-LV
Subject: [f2fs-dev] [PATCH v2 0/7] test_dummy_encryption fixes and cleanups
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
Cc: Jeff Layton <jlayton@kernel.org>, Lukas Czerner <lczerner@redhat.com>,
 Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series cleans up and fixes the way that ext4 and f2fs handle the
test_dummy_encryption mount option:

- Patches 1-2 make test_dummy_encryption consistently require that the
  'encrypt' feature flag already be enabled and that
  CONFIG_FS_ENCRYPTION be enabled.  Note, this will cause xfstest
  ext4/053 to start failing; my xfstests patch "ext4/053: update the
  test_dummy_encryption tests" will fix that.

- Patches 3-7 replace the fscrypt_set_test_dummy_encryption() helper
  function with new functions that work properly with the new mount API,
  by splitting up the parsing, checking, and applying steps.  These fix
  bugs that were introduced when ext4 started using the new mount API.

We can either take all these patches through the fscrypt tree, or we can
take them in multiple cycles as follows:

    1. patch 1 via ext4, patch 2 via f2fs, patch 3-4 via fscrypt
    2. patch 5 via ext4, patch 6 via f2fs
    3. patch 7 via fscrypt

Ted and Jaegeuk, let me know what you prefer.

Changed v1 => v2:
    - Added patches 2-7
    - Also reject test_dummy_encryption when !CONFIG_FS_ENCRYPTION

Eric Biggers (7):
  ext4: only allow test_dummy_encryption when supported
  f2fs: reject test_dummy_encryption when !CONFIG_FS_ENCRYPTION
  fscrypt: factor out fscrypt_policy_to_key_spec()
  fscrypt: add new helper functions for test_dummy_encryption
  ext4: fix up test_dummy_encryption handling for new mount API
  f2fs: use the updated test_dummy_encryption helper functions
  fscrypt: remove fscrypt_set_test_dummy_encryption()

 fs/crypto/fscrypt_private.h |   6 +-
 fs/crypto/keyring.c         |  64 +++++++++++---
 fs/crypto/keysetup.c        |  20 +----
 fs/crypto/policy.c          | 121 +++++++++++++------------
 fs/ext4/ext4.h              |   6 --
 fs/ext4/super.c             | 172 ++++++++++++++++++++----------------
 fs/f2fs/super.c             |  28 ++++--
 include/linux/fscrypt.h     |  41 ++++++++-
 8 files changed, 280 insertions(+), 178 deletions(-)


base-commit: 8013d1d3d2e33236dee13a133fba49ad55045e79
-- 
2.36.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
