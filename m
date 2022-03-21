Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4854E1FA2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Mar 2022 05:50:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWA0F-0000gW-4X; Mon, 21 Mar 2022 04:50:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nWA0D-0000gJ-VF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Mar 2022 04:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6/UXHk26E68JeJB01APNzmALkD5Gt1Kxa1aRAjJ/izw=; b=TMT3x6gNvXLPg1TdORY95PD8u3
 7QHKc0x5wnGehY2OxYTabhPDBvmqOCakmWkSgBKbrZ3OgZRtBSMJe6qMwhalQvulLY9vo5p9MZ/+i
 CphCLUsE0Lnr8wdC1OHnxoWwViMoe7ALOjVDENeqsF0ZBzWOxpLrQbdB3N3K4ZmqSVic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6/UXHk26E68JeJB01APNzmALkD5Gt1Kxa1aRAjJ/izw=; b=K
 ee7NxDytXU7pe+vOU5aKU8QvkZYFQr745aVOHihZipSfoelf2/Q0+RpwBLXiiEu9EHzQ93lQtjaxv
 2lIFAAfWKHfirwrooVpiHixrqQQrNRpDL0s4RAoAHCIKPpLUL4Hzj5Ka1IQe3V9uCGSt2gQWJkTaU
 u0ToiesX07D40+pE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nWA07-005aqh-22
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Mar 2022 04:50:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F46A60C1C;
 Mon, 21 Mar 2022 04:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB4DC340E8;
 Mon, 21 Mar 2022 04:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647838230;
 bh=wAeBu2wVEWNd56Ntd/skPbNlVoTIPyziMX0Vn/MA9BE=;
 h=Date:From:To:Cc:Subject:From;
 b=PO07ElUgyX0HLnjM792j3I+Uw0JgvpqFcopDw0zvhkuC3iEtN6NYedGVXsJmrOJGL
 GlY+u5zmAtw9ZOFXPU7JcCzFPsg4bo7yjJXHfaSTbbHxp94tjGWx3KSbgDS7UJC69H
 GGOd+ez+2utQX8K6bSmoqOxjcBDqhzl8ldgmmjCM2/KWfUN3I1WCUQ7n4uI/o7OvzC
 oloms+pm4cJHKP5fohcQIhjZIEJp+M1lSD0s3wjieppaehu1R+UMdmXsoc9Q2b7OZM
 UUUn2i+j2+J6toQPzD/HJnCeMsyDelDjJBffo/oQv1SI6TXqgiTh40xtlWqR7eWEGv
 zl/XViTJPIcHQ==
Date: Sun, 20 Mar 2022 21:50:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YjgEC8Nw9PDmdY0O@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The following changes since commit
 dfd42facf1e4ada021b939b4e19c935dcdd55566:
 Linux 5.17-rc3 (2022-02-06 12:20:50 -0800) are available in the Git repository
 at: Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nWA07-005aqh-22
Subject: [f2fs-dev] [GIT PULL] fscrypt updates for 5.18
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

The following changes since commit dfd42facf1e4ada021b939b4e19c935dcdd55566:

  Linux 5.17-rc3 (2022-02-06 12:20:50 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to cdaa1b1941f667814300799ddb74f3079517cd5a:

  fscrypt: update documentation for direct I/O support (2022-02-08 11:02:18 -0800)

----------------------------------------------------------------

Add support for direct I/O on encrypted files when blk-crypto (inline
encryption) is being used for file contents encryption.

There will be a merge conflict with the block pull request in
fs/iomap/direct-io.c, due to some bio interface cleanups.  The merge
resolution is straightforward and can be found in linux-next.

----------------------------------------------------------------
Eric Biggers (5):
      fscrypt: add functions for direct I/O support
      iomap: support direct I/O with fscrypt using blk-crypto
      ext4: support direct I/O with fscrypt using blk-crypto
      f2fs: support direct I/O with fscrypt using blk-crypto
      fscrypt: update documentation for direct I/O support

 Documentation/filesystems/fscrypt.rst | 25 +++++++++-
 fs/crypto/crypto.c                    |  8 +++
 fs/crypto/inline_crypt.c              | 93 +++++++++++++++++++++++++++++++++++
 fs/ext4/file.c                        | 10 ++--
 fs/ext4/inode.c                       |  7 +++
 fs/f2fs/data.c                        |  7 +++
 fs/f2fs/f2fs.h                        |  6 ++-
 fs/iomap/direct-io.c                  |  6 +++
 include/linux/fscrypt.h               | 18 +++++++
 9 files changed, 173 insertions(+), 7 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
