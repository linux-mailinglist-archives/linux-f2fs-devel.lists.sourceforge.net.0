Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DFB5309D7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 May 2022 09:10:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nt2Cx-0001no-11; Mon, 23 May 2022 07:10:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nt2Cv-0001nf-Kh
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 May 2022 07:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xY8gmrp5Xeq7Jurz6+lr98a4Rb0XBS27sAdTzofgBEc=; b=QSpX5h3ZM5L22QdstGJBMoe/Tk
 Hc6sGyWh2hKX38IFdu/qqkJ0cxZnEUY4TitnMe+Pf7WywuPYCg86umUSK2PZLmzw82pDFRkorEcLt
 hQ2hTFHCaI3M9lJxdI9xH/tXWcHbF27DiI3fCFG5dw/x8VchmTSIwNC4FeWcdLb/S6v4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xY8gmrp5Xeq7Jurz6+lr98a4Rb0XBS27sAdTzofgBEc=; b=W
 ZXhgj9R6/jDCRegOetL0nqTwFK1sE1myA1r4P1RkTupgG9P/sXa59iHucG9Afxh9dL+Q6WBUgAVxU
 UBQEIC3VBnzgQ9TdtSvVUhYUj4GdO1B3yaJtoHxdI7jUNAzqxriaqLb2LUrzU0JwC1MTBrDlotLsN
 0hcy42vjejc0CRYw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nt2Cv-001yN6-6c
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 May 2022 07:10:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C0D2B80F03;
 Mon, 23 May 2022 07:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8469C385A9;
 Mon, 23 May 2022 07:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653289816;
 bh=IAOOiC06hudRZNZSQ1tFtrdnEBH2mP9eJjRcKNb1ZFo=;
 h=Date:From:To:Cc:Subject:From;
 b=WTN7gamih7ocrr+IWwuOXn2dQwM32MoBNyoo6fsBOuIBeQ2w9BaMC3dPEzJHx8h5c
 T0V9xFB5Hd5qFsxHNbiYYkPXoEBYddEZNttYTAxzCkCL4kHHrhZ8QU2T512xw8zvL/
 5DSWJJJWLubg5J/jNfg18086HakZKQHOreZQKx4k4Iawl24fccWAgB2ppbB31aG82u
 hT8I8WXyDf0pXmJRCU9YGtxz4lh/gQx+d/nJ2MHry9G/rsLQbqOkxPBSu9VA5/h8nl
 bUASg6m+iflTREnbQWwbbsVB9XAS3uutXWismc8+mkiCWhjoh+JhFPZbZwslhzO+6V
 YfHYrEVkEL84w==
Date: Mon, 23 May 2022 00:10:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YoszVvtG55xJnUJ6@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The following changes since commit
 42226c989789d8da4af1de0c31070c96726d990c:
 Linux 5.18-rc7 (2022-05-15 18:08:58 -0700) are available in the Git repository
 at: Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nt2Cv-001yN6-6c
Subject: [f2fs-dev] [GIT PULL] fsverity updates for 5.19
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

The following changes since commit 42226c989789d8da4af1de0c31070c96726d990c:

  Linux 5.18-rc7 (2022-05-15 18:08:58 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fsverity-for-linus

for you to fetch changes up to e6af1bb07704b53bad7771db1b05ee17abad11cb:

  fs-verity: Use struct_size() helper in enable_verity() (2022-05-19 09:53:33 -0700)

----------------------------------------------------------------

A couple small cleanups for fs/verity/.

----------------------------------------------------------------
Zhang Jianhua (2):
      fs-verity: remove unused parameter desc_size in fsverity_create_info()
      fs-verity: Use struct_size() helper in enable_verity()

 fs/verity/enable.c           |  4 ++--
 fs/verity/fsverity_private.h |  6 ++----
 fs/verity/open.c             | 12 ++++--------
 fs/verity/read_metadata.c    |  5 ++---
 4 files changed, 10 insertions(+), 17 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
