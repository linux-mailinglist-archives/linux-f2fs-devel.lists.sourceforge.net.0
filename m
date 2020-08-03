Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A391623A004
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Aug 2020 09:07:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k2UZZ-00040R-85; Mon, 03 Aug 2020 07:07:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1k2UZX-00040C-Ss
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Aug 2020 07:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JE/bjv59204fZDKjaSdaso2nvOH1Cya+6rI1EIoVdGY=; b=hgOeoQfCuRoBAfFdJeGpd4Mu8a
 r6EFFA0kSS7NjrteZTvcSuYwmUJqvMnWaRXz5/1XhTaMLhQDYqoBZxF/ou7bP6z3zB6fSlcp3mgTp
 RWsJJJdOvgmGuo4KcPstfqQ/y6Jc2Qoa1XpqyLtCZht4wIK5u6vgCg/d0JXsxjf46vOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JE/bjv59204fZDKjaSdaso2nvOH1Cya+6rI1EIoVdGY=; b=O
 GXihkC6b/RbQHrvGcJmLHYHhdBirNljc1e1sMtO81iMhq64eYytz+T4fFV5oDqAJGO4KUdRZybBjP
 rs+sjZuEvHcPCqXqQbKYxLLpzCMYtmPbErrAFNtj2BffydyOIEmofneOSueLW3k92Z0S0Fn5OFdW9
 qgLccEe+ToRUVzQ4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k2UZW-0015nX-ML
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Aug 2020 07:07:47 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EFF3206D7;
 Mon,  3 Aug 2020 07:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596438451;
 bh=aStiuzKTnTOpXn5Co7qVE8vcvrnMgBKSnzbqQOzxF20=;
 h=Date:From:To:Cc:Subject:From;
 b=BcCsL8zea7GPg2m/ieqZwlovtsHdky30BYHF1wuu7BqV4ZLnuN4Y6xM4zgUDhKE9m
 zuomvzHyJEr0qY7zJIYNH3OXXfF9GfCSC8/wPWAcNNDKZBmx9V1Mzki1ejys2l52/t
 j5CBsAf22nHPs7w0TDYpAHMQttavHk+Fy3DViY5g=
Date: Mon, 3 Aug 2020 00:07:30 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200803070730.GB24480@sol.localdomain>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k2UZW-0015nX-ML
Subject: [f2fs-dev] [GIT PULL] fsverity updates for 5.9
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

The following changes since commit ba47d845d715a010f7b51f6f89bae32845e6acb7:

  Linux 5.8-rc6 (2020-07-19 15:41:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fsverity-for-linus

for you to fetch changes up to f3db0bed458314a835ccef5ccb130270c5b2cf04:

  fs-verity: use smp_load_acquire() for ->i_verity_info (2020-07-21 16:02:41 -0700)

----------------------------------------------------------------

One fix for fs/verity/ to strengthen a memory barrier which might be too
weak.  This mirrors a similar fix in fs/crypto/.

----------------------------------------------------------------
Eric Biggers (1):
      fs-verity: use smp_load_acquire() for ->i_verity_info

 fs/verity/open.c         | 15 ++++++++++++---
 include/linux/fsverity.h |  9 +++++++--
 2 files changed, 19 insertions(+), 5 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
