Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFD914227D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jan 2020 05:49:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1itOzz-0003cQ-G0; Mon, 20 Jan 2020 04:49:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1itOzv-0003bO-OP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jan 2020 04:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NcO65FZU7SLMz2DY7E8ZGHbJW5NThWb+Pg1HgZaDymg=; b=E/fiLnu4p0r53aXv7YoUZfdEMO
 QUbTSlTcrbboVcQLtqxRQkjuwSYbBnnAVfIYLmNhwDerDvLktMCCtEO2Pw1y1PTORrDSLqvJUau/s
 rojxMG3YvfGhdrWAcfHNk25/JASrB3PI71BXrLqz3pqo/8P7rjh2eHtE8QLj8e4cTC00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NcO65FZU7SLMz2DY7E8ZGHbJW5NThWb+Pg1HgZaDymg=; b=M
 eZSNqHoN5USc8rvzI0jLR0WBBktmszPtbtignmeEursie3NW/Dr31hFt0otuoxVqENJkDka3iJ6LL
 mcKKjKgVTKj3JOzU9oW3BZ6TVthjsm5DL8sqIawF4vSjBKJv1cOClZ0V9QzAw47Eehv5KtnVlJaIY
 ewyefaf3q9Fi2sp8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1itOzm-00EZzo-G4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jan 2020 04:49:11 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABBFE20684;
 Mon, 20 Jan 2020 04:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579495736;
 bh=Q7wJnp7QsNYnS0LU3C/JSOl8FKpk9+5t4Fs/69qFKaU=;
 h=From:To:Cc:Subject:Date:From;
 b=WWfWDdlTcogjcjQNU7ROuxO9HC011fHFtUPXK4hPXps9XoUf8wkg5rPYzIs0S+7R9
 Bm7MzTfJ66XlmhgQPPYFgppZoeT45/WoRsEp/8WF3PJpLBnRpY9f0bUJZpaV9aYp0P
 rPkd74JC+efpVynWmII+acK6DerXye6tMRIUVY6g=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 19 Jan 2020 20:43:57 -0800
Message-Id: <20200120044401.325453-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1itOzm-00EZzo-G4
Subject: [f2fs-dev] [PATCH v4 0/4] fscrypt preparations for
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a cleaned up version of the fscrypt patches to prepare for
directories that are both encrypted and casefolded.

Patches 1-3 start deriving a SipHash key for the new dirhash method that
will be used by encrypted+casefolded directories.  To avoid unnecessary
overhead, we only do this if the directory is actually casefolded.

Patch 4 modifies the fscrypt no-key names to always include the dirhash,
since with the new dirhash method the dirhash will no longer be
computable from the ciphertext filename without the key.  It also fixes
a longstanding issue where there could be collisions in the no-key
names, due to not using a proper cryptographic hash to abbreviate names.

For more information see the main patch series, which includes the
filesystem-specific changes:
https://lkml.kernel.org/linux-fscrypt/20200117214246.235591-1-drosen@google.com/T/#u

This applies to fscrypt.git#master.

Daniel Rosenberg (3):
  fscrypt: don't allow v1 policies with casefolding
  fscrypt: derive dirhash key for casefolded directories
  fscrypt: improve format of no-key names

Eric Biggers (1):
  fscrypt: clarify what is meant by a per-file key

 Documentation/filesystems/fscrypt.rst |  40 +++--
 fs/crypto/Kconfig                     |   1 +
 fs/crypto/fname.c                     | 239 ++++++++++++++++++++------
 fs/crypto/fscrypt_private.h           |  19 +-
 fs/crypto/hooks.c                     |  44 +++++
 fs/crypto/keysetup.c                  |  81 ++++++---
 fs/crypto/keysetup_v1.c               |   4 +-
 fs/crypto/policy.c                    |   7 +
 fs/inode.c                            |   3 +-
 include/linux/fscrypt.h               |  94 +++-------
 10 files changed, 360 insertions(+), 172 deletions(-)


base-commit: 2d8f7f119b0b2ce5e7ff0e8024b0763bf42b99c9
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
