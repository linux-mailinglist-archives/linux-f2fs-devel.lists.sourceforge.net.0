Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CA01D0324
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2020 01:36:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYeRf-0006mD-TL; Tue, 12 May 2020 23:36:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jYeRe-0006ly-F0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 May 2020 23:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CtunamWNpifi9QtBcgSnG6mzwregi6ruKz6ib5uJh8Y=; b=HdQjHB0nGT0aacHM6AMvd0xYBi
 igV7MWPn8T4d7xk6J6ePHiSjpLEgNnI5mEKpDwaFh9BUBhIz7C5F11T86sksk15TGFi3r1b+FlXHg
 M/KmkgSPfigr/2grWPdHEw4PiKoaQ9D30FOP7EX9JAUu/V+hGQokJkK+1ajUSAlg0+XI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CtunamWNpifi9QtBcgSnG6mzwregi6ruKz6ib5uJh8Y=; b=a
 L1cZBGp5wWi6Pm+am04/V8ECHhw9MnwHvhHJuqCDnlrhWTNxUaw9DdGr2tYbyaGJ/sA8xfWW52WxB
 l4kfhE+R6GpOdAqHvrLTNtYW4/R7dKbH4LgBNzSUltok2htodABHT43sj5MRMjkXG7UAtohOtNv1K
 ne/YllmZlHMlpDd4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYeRa-003ujL-WF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 May 2020 23:36:18 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 81FBD206F5;
 Tue, 12 May 2020 23:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589326567;
 bh=dUF4crkDJeVEpBzU47y9vojUlDTZiw0M+TOOvUz27To=;
 h=From:To:Cc:Subject:Date:From;
 b=afRq1cf5WfvzrPj28yGvgevWspYFNzgMZQgKcHyFYPR8VWWT/lmrfs0Qp0W4OBWac
 VPkSZMBGDAbKBltNqjKetKmJv4TN8MLM5nhsjla7Jv8NNrCEVVt7hnOExK3PBlq32H
 17Vq4/E4jU5X1pEAbWPA2sr/YRHRMuavi6kFLBuE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 12 May 2020 16:32:47 -0700
Message-Id: <20200512233251.118314-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jYeRa-003ujL-WF
Subject: [f2fs-dev] [PATCH 0/4] fscrypt: make '-o test_dummy_encryption'
 support v2 policies
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

v1 encryption policies are deprecated in favor of v2, and some new
features (e.g. encryption+casefolding) are only being added for v2.

As a result, the "test_dummy_encryption" mount option (which is used for
encryption I/O testing with xfstests) needs to support v2 policies.

Therefore, this patchset adds support for specifying
"test_dummy_encryption=v2" (or "test_dummy_encryption=v1").
To make this possible, it reworks the way the test_dummy_encryption
mount option is handled to make it more flexible than a flag, and to
automatically add the test dummy key to the filesystem's keyring.

Patch 4 additionally changes the default to "v2".

This patchset applies to v5.7-rc4.

Eric Biggers (4):
  linux/parser.h: add include guards
  fscrypt: add fscrypt_add_test_dummy_key()
  fscrypt: support test_dummy_encryption=v2
  fscrypt: make test_dummy_encryption use v2 by default

 Documentation/filesystems/f2fs.rst |   6 +-
 fs/crypto/fscrypt_private.h        |   3 +
 fs/crypto/keyring.c                | 117 +++++++++++++++++----------
 fs/crypto/keysetup.c               |  15 ++--
 fs/crypto/policy.c                 | 125 +++++++++++++++++++++++++++++
 fs/ext4/ext4.h                     |   7 +-
 fs/ext4/super.c                    |  68 ++++++++++++----
 fs/f2fs/f2fs.h                     |   4 +-
 fs/f2fs/super.c                    |  85 ++++++++++++++------
 include/linux/fscrypt.h            |  52 ++++++++++--
 include/linux/parser.h             |   5 +-
 11 files changed, 383 insertions(+), 104 deletions(-)

-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
