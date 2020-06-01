Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF13D1E9E39
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jun 2020 08:29:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jfdwl-0000fa-Ht; Mon, 01 Jun 2020 06:29:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jfdwj-0000fT-K3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 06:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9CrelIKhU2WsHtcqAmdjOBwwQgXN6pj2sQxqZlQx4ZA=; b=HHx2sbtwEfXWCLztguqrmmGTqw
 KrLZay8m9ZmMoNQ+8UvX7TUjnlFHhAujAk9Wgbv34FTC74K0NmzyDUndX2o7HsmScfXUCyZDJTU0y
 RNzvO5X7bPLsOoXzctVUYYj/MfQNv4B4CmFHBxn9ohlVOXuBVt14TFuq+ykxdLwaK+Kc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9CrelIKhU2WsHtcqAmdjOBwwQgXN6pj2sQxqZlQx4ZA=; b=I
 WDzIXj1LnPsTv1HFI0qzLPh9lwLKOkTZBdEyzA9xgZkjkrb1Bawkqo64/tPfsw9aBeD+WmYmSMcuI
 rJ4yMnc5H0MqIZndu/yH6l3LiLXdf0fu2NvTW/BsEluFhN/MTtqpx+Iolxo1R4kwXXCGHxm/4vsQe
 KqZQLv2zFDJvghCE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jfdwf-0067J6-57
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 06:29:17 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 984C62074B;
 Mon,  1 Jun 2020 06:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590992942;
 bh=1+HgUI0i7fD04WdwIoS+2wnOjK8xL00OVCgY/EpDx+k=;
 h=Date:From:To:Cc:Subject:From;
 b=MVHaz8NKfknh3A0lNcT3nJFyTOEe5L8m03Pcsrk9fJegee57FJh4GsxGwfBuXsCt7
 EEKaPXfr+/SBUG57z7bDRJTyN066lYEVel0r9o+D6IPFtwiHAcxXa3ETpYnJ1/RY+O
 EAFX2wU0xM9B3cxEdLcx07R/QyByhcXKANim49yM=
Date: Sun, 31 May 2020 23:28:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200601062848.GA11054@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfdwf-0067J6-57
Subject: [f2fs-dev] [GIT PULL] fscrypt updates for 5.8
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

The following changes since commit 2ef96a5bb12be62ef75b5828c0aab838ebb29cb8:

  Linux 5.7-rc5 (2020-05-10 15:16:58 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to e3b1078bedd323df343894a27eb3b3c34944dfd1:

  fscrypt: add support for IV_INO_LBLK_32 policies (2020-05-19 09:34:18 -0700)

----------------------------------------------------------------

- Add the IV_INO_LBLK_32 encryption policy flag which modifies the
  encryption to be optimized for eMMC inline encryption hardware.

- Make the test_dummy_encryption mount option for ext4 and f2fs support
  v2 encryption policies.

- Fix kerneldoc warnings and some coding style inconsistencies.

There will be merge conflicts with the ext4 and f2fs trees due to the
test_dummy_encryption change, but the resolutions are straightforward.

----------------------------------------------------------------
Eric Biggers (8):
      fscrypt: fix all kerneldoc warnings
      fscrypt: name all function parameters
      fscrypt: remove unnecessary extern keywords
      linux/parser.h: add include guards
      fscrypt: add fscrypt_add_test_dummy_key()
      fscrypt: support test_dummy_encryption=v2
      fscrypt: make test_dummy_encryption use v2 by default
      fscrypt: add support for IV_INO_LBLK_32 policies

 Documentation/filesystems/f2fs.rst    |   6 +-
 Documentation/filesystems/fscrypt.rst |  33 +++++-
 fs/crypto/crypto.c                    |  15 ++-
 fs/crypto/fname.c                     |  52 ++++++---
 fs/crypto/fscrypt_private.h           | 111 +++++++++---------
 fs/crypto/hooks.c                     |   4 +-
 fs/crypto/keyring.c                   | 122 ++++++++++++-------
 fs/crypto/keysetup.c                  | 109 ++++++++++++-----
 fs/crypto/policy.c                    | 195 ++++++++++++++++++++++++++++---
 fs/ext4/ext4.h                        |   7 +-
 fs/ext4/super.c                       |  68 ++++++++---
 fs/ext4/sysfs.c                       |   2 +
 fs/f2fs/f2fs.h                        |   4 +-
 fs/f2fs/super.c                       |  85 ++++++++++----
 fs/f2fs/sysfs.c                       |   4 +
 include/linux/fscrypt.h               | 214 ++++++++++++++++++++--------------
 include/linux/parser.h                |   5 +-
 include/uapi/linux/fscrypt.h          |   3 +-
 18 files changed, 737 insertions(+), 302 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
