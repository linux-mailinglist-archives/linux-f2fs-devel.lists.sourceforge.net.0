Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 632A11981B9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Mar 2020 18:54:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jIxfu-00028H-E3; Mon, 30 Mar 2020 16:54:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jIxft-00028A-UE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Mar 2020 16:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CGgKniLUHWXVXc3oolt27ZHUtCo/KIwKd9ogbtepeCY=; b=cJ7yWae8SDJ3svL2Z+pS5O4o81
 udQUp+7iLmsexr6xoJ9tppNSTk1mvZZdNPt9IGV6pbOK/HrpaCOmMUE0bs0vmA0h986jLH34LAM6h
 X73TwZLiM9atqJVtK2uNNf/RRQ4u0oj3YKgH82uf0x7kQt90gEFT1sznFWbz8NTxDrgQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CGgKniLUHWXVXc3oolt27ZHUtCo/KIwKd9ogbtepeCY=; b=E
 0OlXMQQt/j6CN3cK/MSypMk9Iuiq0HEIo0QGWa2JI3QgBiMds58en+PJ9ptsMbiztDNqQtvmCHzrR
 Rn4b4TsfgVERn4yhjOFSR96sp72AMNVPM3ri/kYTW4RdbZVd/OyumSNxv4p0zw1ftbFHr9i/hotqw
 aoUkZebL+pkhndW0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jIxfr-001doc-5z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Mar 2020 16:54:09 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BEF82072E;
 Mon, 30 Mar 2020 16:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585587240;
 bh=j/ppsQG0leh5vH+RTE+F7A3zvmhx3HDCWWopSVH2uDQ=;
 h=Date:From:To:Cc:Subject:From;
 b=M/wdnXbyHUTJv5ngtkxL30OP3/Kuj4H/2XLXZMGrhRmQHk4kBf8kUv4xIehJ2WNAi
 RYGO4xyaxQ0k6rkp1d/w6AkdnbU3iITZGeIBWDU4aBLtglq2LUaNtRCnK+4ktYJsaH
 Et7KNGgLmKcCwRBMlzckx0KzqoHRi1/YU5977jgo=
Date: Mon, 30 Mar 2020 09:53:59 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200330165359.GA1895@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.5 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jIxfr-001doc-5z
Subject: [f2fs-dev] [GIT PULL] fscrypt updates for 5.7
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

The following changes since commit 98d54f81e36ba3bf92172791eba5ca5bd813989b:

  Linux 5.6-rc4 (2020-03-01 16:38:46 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 861261f2a9cc488c845fc214d9035f7a11094591:

  ubifs: wire up FS_IOC_GET_ENCRYPTION_NONCE (2020-03-19 21:57:06 -0700)

----------------------------------------------------------------

Add an ioctl FS_IOC_GET_ENCRYPTION_NONCE which retrieves a file's
encryption nonce.  This makes it easier to write automated tests which
verify that fscrypt is doing the encryption correctly.

----------------------------------------------------------------
Eric Biggers (4):
      fscrypt: add FS_IOC_GET_ENCRYPTION_NONCE ioctl
      ext4: wire up FS_IOC_GET_ENCRYPTION_NONCE
      f2fs: wire up FS_IOC_GET_ENCRYPTION_NONCE
      ubifs: wire up FS_IOC_GET_ENCRYPTION_NONCE

 Documentation/filesystems/fscrypt.rst | 11 +++++++++++
 fs/crypto/fscrypt_private.h           | 20 ++++++++++++++++++++
 fs/crypto/keysetup.c                  | 16 ++--------------
 fs/crypto/policy.c                    | 21 ++++++++++++++++++++-
 fs/ext4/ioctl.c                       |  6 ++++++
 fs/f2fs/file.c                        | 11 +++++++++++
 fs/ubifs/ioctl.c                      |  4 ++++
 include/linux/fscrypt.h               |  6 ++++++
 include/uapi/linux/fscrypt.h          |  1 +
 9 files changed, 81 insertions(+), 15 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
