Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE4C27F6A7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Oct 2020 02:25:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kNmPp-000060-Pf; Thu, 01 Oct 2020 00:25:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kNmPo-00005q-WB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Oct 2020 00:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kRtxq8gJmfxz0mhUJuVNUHg5jinArg9Ff20MhJui8i4=; b=iCcbbjAY1uHGng51cAF6do7kiC
 m5LgvXD7jMjy43Ee+FUZl1BfC4DNqLxBgADM3NrqFzwlzDAc2tor/Xs9PsJkDRA0MznLEcNLBPkOm
 LrKdvC2MVnl/X7UufIj8/sVRh46b+FCQn5LVP2L8OBpRH0x/2tJJlhiQCBw4eVDuwk7M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kRtxq8gJmfxz0mhUJuVNUHg5jinArg9Ff20MhJui8i4=; b=Q
 cGaQRMxlehnFU42LosKlXbiCO5c4UKwhaJSMEpNBqon9lrTWBmOcJ4ULcxCBrmjjaokTz8VTbYwgc
 MXvWiZmb8hBGHukG+kPyvF2co/T1Z7IPSbpyaNUavo7aCJ8vdUP9TNx+SPj2RYvEAX8xnN9o6gY+g
 nKVZnH9LBoq2gSLw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kNmPn-00CB7p-Fb
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Oct 2020 00:25:44 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D37B7207C3;
 Thu,  1 Oct 2020 00:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601511931;
 bh=0ZXQunnvSZDQ/e9Aytg6MPPYrB6sjkc8ANjRO0l0B4g=;
 h=From:To:Cc:Subject:Date:From;
 b=ssk904+Yq8tSueatsyQZWHUra5Qgs4eCILMidgS/OG8v6WQV5RwTqQTyOF/olOt+u
 ZsYeBsmujJ3CGM7eby3AtVa9ELEwbNP9sn74ye54P0SFMeQposLtwNawu5Nxb5tr3B
 GOOmgHpO/fGFgIsB2sq0vc3siwUnQO6cEvP0uTqw=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Wed, 30 Sep 2020 17:25:02 -0700
Message-Id: <20201001002508.328866-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kNmPn-00CB7p-Fb
Subject: [f2fs-dev] [PATCH 0/5] xfstests: test f2fs compression+encryption
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add a test which verifies that encryption is done correctly when a file
on f2fs uses both compression and encryption at the same time.

Patches 1-4 add prerequisites for the test, while patch 5 adds the
actual test.  Patch 2 also fixes a bug which could cause the existing
test generic/602 to fail in extremely rare cases.  See the commit
messages for details.

The new test passes both with and without the inlinecrypt mount option.
It requires CONFIG_F2FS_FS_COMPRESSION=y.

I'd appreciate the f2fs developers taking a look.

Note, there is a quirk where the IVs in compressed files are off by one
from the "natural" values.  It's still secure, though it made the test
slightly harder to write.  I'm not sure how intentional this quirk was.

Eric Biggers (5):
  fscrypt-crypt-util: clean up parsing --block-size and --inode-number
  fscrypt-crypt-util: fix IV incrementing for --iv-ino-lblk-32
  fscrypt-crypt-util: add --block-number option
  common/f2fs: add _require_scratch_f2fs_compression()
  f2fs: verify ciphertext of compressed+encrypted file

 common/config            |   1 +
 common/f2fs              |  27 +++++
 src/fscrypt-crypt-util.c |  98 ++++++++++++------
 tests/f2fs/002           | 217 +++++++++++++++++++++++++++++++++++++++
 tests/f2fs/002.out       |  21 ++++
 tests/f2fs/group         |   1 +
 6 files changed, 334 insertions(+), 31 deletions(-)
 create mode 100644 common/f2fs
 create mode 100755 tests/f2fs/002
 create mode 100644 tests/f2fs/002.out

-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
