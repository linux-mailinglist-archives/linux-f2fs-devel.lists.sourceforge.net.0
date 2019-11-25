Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4B61087FA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 05:41:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZ6Bs-0005dl-MB; Mon, 25 Nov 2019 04:41:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iZ6Br-0005dQ-Jp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 04:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pc7pbHfLpljb/NUnKnWKvJbqw6juz/SDUplAOmLffyY=; b=V8WvvnG7GvMUf2PvaEiCWdK3XZ
 BCY/eP67pRCWiRUjBKbsNGvqap1WEaB/PE+61mgZKQM5SomX4VnXe/DSxLoAC5Y7PMYcyau9pAEgw
 ILwaIwly8L0RE0+cVCywB4DJE7dTyNThi9wRxK6xUiLYeN42Sh2QMSYinRwLdcvmJA9Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pc7pbHfLpljb/NUnKnWKvJbqw6juz/SDUplAOmLffyY=; b=B
 MqV7AT+PDt1yOwuZWucTYTlfjS/0IZDEgJQMFuXHFbVLiXcsCyIx3Pcr0lxcrQ48PPIx7VXS4ZL7K
 NkOOjfC/l+f87ZQ/3dKons92XkS5kiUYMkMsEYIInE/8o9Xx20yGIEeb1Gs9OC8z/99Ugn9VUGWMm
 Ys5H3yw6L2a4ZNqs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZ6Bq-00D05d-B9
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 04:41:35 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B40B52071A;
 Mon, 25 Nov 2019 04:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574656884;
 bh=9h1w2qtMHzyhRb2apJD57n+fyg2uYaxC4b4cjzeRMlw=;
 h=Date:From:To:Cc:Subject:From;
 b=Tll3maaU/bz0aycxUJHNcQn/Ild1MGKfxRKmm9EgU1xzWiFVLNpmMk3JJz11CDAyL
 S/u4L35s7MUodpnyagLojBopI5S/fYQSGwSV89q/gUEcxE/1KQwVhPTelQFj+z2/5S
 y0UChR6e6WnlF8TaNOeXQYfjEe1TK7zmi+ht5pm8=
Date: Sun, 24 Nov 2019 20:41:22 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20191125044122.GA9817@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.6 (/)
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
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iZ6Bq-00D05d-B9
Subject: [f2fs-dev] [GIT PULL] fscrypt updates for 5.5
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
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit 7d194c2100ad2a6dded545887d02754948ca5241:

  Linux 5.4-rc4 (2019-10-20 15:56:22 -0400)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 0eee17e3322625b87ce5fa631bda16562a8dc494:

  f2fs: add support for IV_INO_LBLK_64 encryption policies (2019-11-06 12:34:42 -0800)

----------------------------------------------------------------

- Add the IV_INO_LBLK_64 encryption policy flag which modifies the
  encryption to be optimized for UFS inline encryption hardware.

- For AES-128-CBC, use the crypto API's implementation of ESSIV (which
  was added in 5.4) rather than doing ESSIV manually.

- A few other cleanups.

----------------------------------------------------------------
Eric Biggers (8):
      fscrypt: invoke crypto API for ESSIV handling
      fscrypt: remove struct fscrypt_ctx
      fscrypt: zeroize fscrypt_info before freeing
      docs: ioctl-number: document fscrypt ioctl numbers
      fscrypt: avoid data race on fscrypt_mode::logged_impl_name
      fscrypt: add support for IV_INO_LBLK_64 policies
      ext4: add support for IV_INO_LBLK_64 encryption policies
      f2fs: add support for IV_INO_LBLK_64 encryption policies

 Documentation/filesystems/fscrypt.rst |  68 +++++++++------
 Documentation/ioctl/ioctl-number.rst  |   1 +
 fs/crypto/bio.c                       |  29 +------
 fs/crypto/crypto.c                    | 124 ++++----------------------
 fs/crypto/fscrypt_private.h           |  25 +++---
 fs/crypto/keyring.c                   |   6 +-
 fs/crypto/keysetup.c                  | 158 ++++++++++------------------------
 fs/crypto/keysetup_v1.c               |   4 -
 fs/crypto/policy.c                    |  41 ++++++++-
 fs/ext4/ext4.h                        |   2 +
 fs/ext4/super.c                       |  14 +++
 fs/f2fs/super.c                       |  26 ++++--
 include/linux/fscrypt.h               |  35 +-------
 include/uapi/linux/fscrypt.h          |   3 +-
 14 files changed, 208 insertions(+), 328 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
