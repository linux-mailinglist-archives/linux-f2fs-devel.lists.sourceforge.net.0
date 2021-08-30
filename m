Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C772C3FBB69
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Aug 2021 20:06:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mKlfd-0002nW-9M; Mon, 30 Aug 2021 18:06:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1mKlfc-0002nJ-Ex
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Aug 2021 18:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tWIszcsmXuVTe3RPHiQIxYMneQLLyUwkPcqxQ3FIDpI=; b=XDNbR7Em/MIb8G6M8jgZElOrUj
 /8xwcJpmGfeKCE397KT8Zl79FBHKM3qGOknDMvlC+dMUyIMiL3MDFrpiq1B4L2TY2feLP3wnH2Z3/
 snUfg1AL5iAanObL1RfSW67rxal6swS2O9+7PqIf89l3MZB2lVYRI3OT7DPX0Phjxjvg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tWIszcsmXuVTe3RPHiQIxYMneQLLyUwkPcqxQ3FIDpI=; b=V
 XjRY4YfAegiDxpzK1LStLPLAVS/KB/XxVqLUMPf4H3a/zSHtzSBjlt7Sl/KnLjhESreAGEpbxVW5W
 zw01SE9s/bFAydn0uqskoYeJ79cmR708z8LOMAqC7wxYlRdcksMJZgI07iqTK2TP4rPdYRxukqha4
 Q49dGqvVXYbVhEbk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mKlfX-0000nh-JZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Aug 2021 18:06:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E01B160F5B;
 Mon, 30 Aug 2021 16:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630342039;
 bh=/ZbEAxvBW5ig7WPYzIG6ftbGUGoR7j4+CJT1CyKUAgE=;
 h=Date:From:To:Cc:Subject:From;
 b=pPqSREqxmcM2xCHL9kODFPILmxDGalIsKDmDe4jGEPsUozDmh+ruX/O/LmhFODtxt
 VIYvEwC66svykfXl46dTWe79Ys9le0rVp8NZQw7+j4+oAkLtIeqaBDdNerIXmXcYy2
 DL1OPRMOsyyZ2q+lnCE7aOMpGrtF1gToEk+RLJeAnoj92vfbhp0ATxlcesE0t4ukna
 UCMbyhEXzp4HW4Eeddf/2PerQXND5kpqT+osxua6VBfYadx7WWHEOBZqSUV18dXwku
 NgpMAbi14Mi2x+cqbjH7Q8Ol9FNwDAMOZ5wOFyU3Kl+CO6fH5m7N17PykROLOlsM3a
 try7iQyJi19Lg==
Date: Mon, 30 Aug 2021 09:47:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YS0LlXIhvZc4r5Vt@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
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
X-Headers-End: 1mKlfX-0000nh-JZ
Subject: [f2fs-dev] [GIT PULL] fscrypt updates for 5.15
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
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit ff1176468d368232b684f75e82563369208bc371:

  Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 38ef66b05cfa3560323344a0b3e09e583f1eb974:

  fscrypt: document struct fscrypt_operations (2021-07-28 21:40:36 -0700)

----------------------------------------------------------------

Some small fixes and cleanups for fs/crypto/:

- Fix ->getattr() for ext4, f2fs, and ubifs to report the correct
  st_size for encrypted symlinks.

- Use base64url instead of a custom Base64 variant.

- Document struct fscrypt_operations.

----------------------------------------------------------------
Eric Biggers (7):
      fscrypt: add fscrypt_symlink_getattr() for computing st_size
      ext4: report correct st_size for encrypted symlinks
      f2fs: report correct st_size for encrypted symlinks
      ubifs: report correct st_size for encrypted symlinks
      fscrypt: remove mention of symlink st_size quirk from documentation
      fscrypt: align Base64 encoding with RFC 4648 base64url
      fscrypt: document struct fscrypt_operations

 Documentation/filesystems/fscrypt.rst |  15 ++---
 fs/crypto/fname.c                     | 106 +++++++++++++++++++------------
 fs/crypto/hooks.c                     |  44 +++++++++++++
 fs/ext4/symlink.c                     |  12 +++-
 fs/f2fs/namei.c                       |  12 +++-
 fs/ubifs/file.c                       |  13 +++-
 include/linux/fscrypt.h               | 116 ++++++++++++++++++++++++++++++++--
 7 files changed, 260 insertions(+), 58 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
