Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A311433FB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jan 2020 23:34:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1itfcn-0001Z2-1X; Mon, 20 Jan 2020 22:34:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1itfcl-0001Yv-Qf
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jan 2020 22:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HcTJ4nsNh6Zk28YMD/D7fP8Rr//qaiQtBrVURmyipik=; b=czu8VJPUYNIbqmpYyoA/5AfUDI
 1GUQTGKXrvrw0UncK5edLDohO2X8Pw+vNYqt2daMSDa5AvBhuv1qmupoDWUT6T8CUZ5jYZ2vfVQE9
 ft2JBYZIuOT8wneeIXmfA68oyVobKAZEBnQmHlU0PhgJEYIU7n29NrVdhMmeOk9dV9JI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HcTJ4nsNh6Zk28YMD/D7fP8Rr//qaiQtBrVURmyipik=; b=i
 +nPEMCM5bzYya3foP/+j54MIVJuMEci+KZRpLvSqlg3ZUsEe0IXW7vnb25SjrpidmXVvB0pa6nXQP
 MV1wuafg26nZwLR7BQQ4wN3rbrMaVZd48LUV6hXYLI5XY3m04vLpjsxdIYLtHvPUFrnz5+174Ah5p
 2UscK9XptkVBaejA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1itfck-00FV77-HC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jan 2020 22:34:23 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5FBF217F4;
 Mon, 20 Jan 2020 22:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579559657;
 bh=xm885UhKFUwKfgBkYWfnG/AC3Rw6vyxcGdpz/w5UOxs=;
 h=From:To:Cc:Subject:Date:From;
 b=n9BG408GF/aokCw8EG9MBQ9hJw9mAgpR6LRC5KJXhFvrUD8dUEMcz1fPCmgxfOxnK
 FYltkiqo8UTJrZL597rrakuG7LCaY6g0rVjw3rHQFWyQaaJluloPm74WLLPuT+6kjF
 HwzLBOeRmONd/Z5cEVB5lRpaCnrKE0dDiJHJ32rU=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 20 Jan 2020 14:31:55 -0800
Message-Id: <20200120223201.241390-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1itfck-00FV77-HC
Subject: [f2fs-dev] [PATCH v5 0/6] fscrypt preparations for
 encryption+casefolding
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
Cc: Daniel Rosenberg <drosen@google.com>,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a cleaned up and fixed version of the fscrypt patches to prepare
for directories that are both encrypted and casefolded.

Patches 1-3 start deriving a SipHash key for the new dirhash method that
will be used by encrypted+casefolded directories.  To avoid unnecessary
overhead, we only do this if the directory is actually casefolded.

Patch 4 fixes a bug in UBIFS where it didn't gracefully handle invalid
hash values in fscrypt no-key names.  This is an existing bug, but the
new fscrypt no-key name format (patch 6) made it much easier to trigger;
it started being hit by 'kvm-xfstests -c ubifs -g encrypt'.

Patch 5 updates UBIFS to make it ready for the new fscrypt no-key name
format that always includes the dirhash.

Patch 6 modifies the fscrypt no-key names to always include the dirhash,
since with the new dirhash method the dirhash will no longer be
computable from the ciphertext filename without the key.  It also fixes
a longstanding issue where there could be collisions in the no-key
names, due to not using a proper cryptographic hash to abbreviate names.

For more information see the main patch series, which includes the
filesystem-specific changes:
https://lkml.kernel.org/linux-fscrypt/20200117214246.235591-1-drosen@google.com/T/#u

This applies to fscrypt.git#master.

Changed v4 => v5:
  - Fixed UBIFS encryption to work with the new no-key name format.

Daniel Rosenberg (3):
  fscrypt: don't allow v1 policies with casefolding
  fscrypt: derive dirhash key for casefolded directories
  fscrypt: improve format of no-key names

Eric Biggers (3):
  fscrypt: clarify what is meant by a per-file key
  ubifs: don't trigger assertion on invalid no-key filename
  ubifs: allow both hash and disk name to be provided in no-key names

 Documentation/filesystems/fscrypt.rst |  40 +++--
 fs/crypto/Kconfig                     |   1 +
 fs/crypto/fname.c                     | 239 ++++++++++++++++++++------
 fs/crypto/fscrypt_private.h           |  19 +-
 fs/crypto/hooks.c                     |  44 +++++
 fs/crypto/keysetup.c                  |  81 ++++++---
 fs/crypto/keysetup_v1.c               |   4 +-
 fs/crypto/policy.c                    |   7 +
 fs/inode.c                            |   3 +-
 fs/ubifs/dir.c                        |   6 +-
 fs/ubifs/journal.c                    |   4 +-
 fs/ubifs/key.h                        |   1 -
 include/linux/fscrypt.h               |  94 +++-------
 13 files changed, 365 insertions(+), 178 deletions(-)

-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
