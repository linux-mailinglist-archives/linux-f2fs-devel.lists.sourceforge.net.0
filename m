Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A654D3B9C91
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jul 2021 08:55:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lzD4y-0007jl-4v; Fri, 02 Jul 2021 06:55:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lzD4p-0007jR-HF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 06:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9LzP3+lxRRBVQonHgS7VVulwJb/vPpVRfwfqivhYpXQ=; b=lP7/zsyGZNpBkEaTWnp3MHLZlE
 kE4Ocj9YmoNwlW2g1/by4mMogPEqtu6fkkrc3PaCARjK9sOyquLLmElnmcsL3Qyv5UjhBbYf2p+lX
 u6w3aOwj0P0e4d6/DZTlErOSrl0Z/Fpv6Pjr3pHY/E68kGdKN87jyeJr0r9a21VWeGL0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9LzP3+lxRRBVQonHgS7VVulwJb/vPpVRfwfqivhYpXQ=; b=B
 CnEYhvxaOk9sa/Rea2tbVZ64bqARRPlg7dP8sR3NXjNzc18Wxr+OTvrRoZ2ZkNJAbCbtDoWLlTRzJ
 JfQ5G/Bl7qQ+FDevvlgA95/NSEyb59Q+ghXPRAlkOQDaqhwHF8EqTYchvZTWxsRcza+MHQ4Nna41n
 9/37/xUkpnWjAY3c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lzD4m-0004OJ-Vi
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 06:55:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2A7A613F0;
 Fri,  2 Jul 2021 06:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625208890;
 bh=2YEFNbCIRo9WHTdZ5XW0VKfk2fnVjJ1mVF7axmh20i4=;
 h=From:To:Cc:Subject:Date:From;
 b=hb2Z+thtoOA3Ut1D51UPw7NUY4/SDw+9ssqTVt7RSJrQ+PeUpckBpHqKThBKweN5k
 lbd26NukQBtGrzVQZR0VApGV+hAOe4pbrKCoHqnOFYlvvNHWI6lLZN1slkg9znK7QA
 PBWSIug3OcJx+ZYgHrfHDhJdMgqiEO97WuKXOGiLuCN5iUglvtfoBmTj4ieI5MLW3G
 tp1fPywkkq9ZrOOj+xHVwcAFrOPXsgTGtWc0z7yMxtSeDXSWq4rpTGKc1p0Bg2NawI
 OZWUn6F3LZrJuKBLEGWrDr3IwEyl6nIznqGrYnLPez8t9ykzve/FQxDyZEnZaiODQk
 aT+b5KyTtBu6Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu,  1 Jul 2021 23:53:45 -0700
Message-Id: <20210702065350.209646-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lzD4m-0004OJ-Vi
Subject: [f2fs-dev] [PATCH 0/5] fscrypt: report correct st_size for
 encrypted symlinks
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
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series makes the stat() family of syscalls start reporting the
correct size for encrypted symlinks.

See patch 1 for a detailed explanation of the problem and solution.

Patch 1 adds a helper function that computes the correct size for an
encrypted symlink.  Patches 2-4 make the filesystems with fscrypt
support use it, and patch 5 updates the documentation.

This series applies to mainline commit 3dbdb38e2869.

Eric Biggers (5):
  fscrypt: add fscrypt_symlink_getattr() for computing st_size
  ext4: report correct st_size for encrypted symlinks
  f2fs: report correct st_size for encrypted symlinks
  ubifs: report correct st_size for encrypted symlinks
  fscrypt: remove mention of symlink st_size quirk from documentation

 Documentation/filesystems/fscrypt.rst |  5 ---
 fs/crypto/hooks.c                     | 44 +++++++++++++++++++++++++++
 fs/ext4/symlink.c                     | 12 +++++++-
 fs/f2fs/namei.c                       | 12 +++++++-
 fs/ubifs/file.c                       | 13 +++++++-
 include/linux/fscrypt.h               |  7 +++++
 6 files changed, 85 insertions(+), 8 deletions(-)


base-commit: 3dbdb38e286903ec220aaf1fb29a8d94297da246
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
