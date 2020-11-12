Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3C62B128F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Nov 2020 00:16:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kdLpi-0003BT-Q9; Thu, 12 Nov 2020 23:16:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kdLph-0003BL-G6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 23:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mgnpl4oy6Exwg8X0Nv9GoGCpWZa7m5rh7fmrV0UeA+Q=; b=dvdNi/h8/atl44q/2nK7dOeBvz
 nisvSf8raGSpn3OcpUZ+U0TOlzpHpAA2Wv7aFGXi35Qd8hObetAHEux0GlE6MSYpASaxNbwyb8SaL
 fA9lkHKUlVFfidRl6sRpSyP1N1KSXjM1ZjkrnsaZSBjH7H3inV8aRHfB2W7RufPXq9xM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mgnpl4oy6Exwg8X0Nv9GoGCpWZa7m5rh7fmrV0UeA+Q=; b=b
 IkXBY3RO+K3iqOJ5kT+rjfmNVTxwvEaq4oxbWfzs5nTx4JqsrZzWzyUzneQY9VnuC9VYsvaGIGFuQ
 hwEpYQ/u74vte+4hhGSeJj0UodqESVDiZB0C1Av4ehx5deHGJtvzjiYH0cgvoi9YEggfV9quWHwno
 9yUS2g38/fraCCb0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kdLpb-001LRl-34
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 23:16:49 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 349C020B80;
 Thu, 12 Nov 2020 23:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605222992;
 bh=5CBboKzeplTZn92nfZnKQYbgmTlfqZIgtii4GyCvwZc=;
 h=Date:From:To:Cc:Subject:From;
 b=t7JqnwPqchlO+5f9VjAw6RLfBHPrw0zW7UgTwGnOMuzsXDLy/93klQV8HPwI+fEkB
 jJxiPUcdw27MGZvGx/R23U/+OavrojB30phAEedYNPIeODkK30Zw67JkHSGuRiCRlo
 jqW61uJnn1R7e+c+MlwDJvIIr6orzAKFgr4I0lx0=
Date: Thu, 12 Nov 2020 15:16:30 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <X63CTrVsH3WD+xcE@sol.localdomain>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kdLpb-001LRl-34
Subject: [f2fs-dev] [GIT PULL] another fscrypt fix for 5.10-rc4
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


The following changes since commit 92cfcd030e4b1de11a6b1edb0840e55c26332d31:

  fscrypt: remove reachable WARN in fscrypt_setup_iv_ino_lblk_32_key() (2020-11-06 09:48:55 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to d19d8d345eecd9247cbe6cbf27aef271bd88aba7:

  fscrypt: fix inline encryption not used on new files (2020-11-11 20:59:07 -0800)

----------------------------------------------------------------

Fix a regression where new files weren't using inline encryption when
they should be.

----------------------------------------------------------------
Eric Biggers (1):
      fscrypt: fix inline encryption not used on new files

 fs/crypto/inline_crypt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
