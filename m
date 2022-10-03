Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB135F27BF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Oct 2022 05:00:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ofBge-0001Jb-ES;
	Mon, 03 Oct 2022 03:00:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ofBgc-0001JV-FM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Oct 2022 03:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dCyFyDraRMAYPZU/j98J1hObiwHXhMjTUoZnQyk80hM=; b=SE25+HKhhpTnegM9mOCYOFT1GN
 DI/80OFL5QKnIgUi2uj4ZB2YMHar396zsfUGNQ8xkJXAU2cGAx+fHMVWXpaEESjtA75bLntcNZFg+
 bwRWQyYh5/HCtbhujUlrmg7v1iSq1ljgKepankMI44iKuYp3yBwrX87Ye2n3eQeq49pE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dCyFyDraRMAYPZU/j98J1hObiwHXhMjTUoZnQyk80hM=; b=E
 XKhFNcI7uG8527WYJ21ILHJ7aOJID1DuwMJDq7M1GQIFVrGqoiEhhzcgGlmehfO7S+Gr3hBuLGDW0
 VHpOc2uNrmpk2U/jTobZhvWohCta6TG43NgONRE4St5564QpBzq4quQn3P/gC5OE2ojdbpzqE77qB
 Gu1CyjHfHLz2nHyE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ofBgm-0003aI-VR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Oct 2022 03:00:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 01C22CE0A4C;
 Mon,  3 Oct 2022 03:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D313FC433C1;
 Mon,  3 Oct 2022 03:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664766005;
 bh=JYBkVcaOXXe8vI72bVILJ80jmdMXI/PWcJhDdaOi1eo=;
 h=Date:From:To:Cc:Subject:From;
 b=Jf7WrTz0W2FFkAao26q5gpx54IiqqroOtfgzWpihbzU7Sq4Ta6O1quMFAwmrRyIJj
 7cjy6UwRwYaU/s4xNs06a8Bgoy0YgBC7oRpvR57AtYAhifsSmOisRXC/WDND8ahLCD
 DgF/CImCdGe0u7BATfHZ44SZOzj6V/J+Ot165m1K9dLdeIvWC2++wm8Vx+KkmP67UH
 Pchqhs/MIGYE6Uxe8C0KWfeXi5O/rQ7KUVYW4G5/kdo0ZI/SkDKNQVEoGdHb5D7eYt
 krVNBQc5Q5o6BNX9gOvyQzJUrQpps65LW/A1kUXqnk+Fo4wtwPN0u+aJFkjDXv2B2j
 Ccx4+R6MJsswA==
Date: Sun, 2 Oct 2022 20:00:03 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YzpQMx1FiZp/PsM3@quark>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The following changes since commit
 1c23f9e627a7b412978b4e852793c5e3c3efc555:
 Linux 6.0-rc2 (2022-08-21 17:32:54 -0700) are available in the Git repository
 at: Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ofBgm-0003aI-VR
Subject: [f2fs-dev] [GIT PULL] fscrypt updates for 6.1
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
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 0e91fc1e0f5c70ce575451103ec66c2ec21f1a6e:

  fscrypt: work on block_devices instead of request_queues (2022-09-21 20:33:06 -0700)

----------------------------------------------------------------

This release contains some implementation changes, but no new features:

- Rework the implementation of the fscrypt filesystem-level keyring to
  not be as tightly coupled to the keyrings subsystem.  This resolves
  several issues.

- Eliminate most direct uses of struct request_queue from fs/crypto/,
  since struct request_queue is considered to be a block layer
  implementation detail.

- Stop using the PG_error flag to track decryption failures.  This is a
  prerequisite for freeing up PG_error for other uses.

----------------------------------------------------------------
Christoph Hellwig (1):
      fscrypt: work on block_devices instead of request_queues

Eric Biggers (4):
      fscrypt: remove fscrypt_set_test_dummy_encryption()
      fscrypt: stop using PG_error to track error status
      fscrypt: stop using keyrings subsystem for fscrypt_master_key
      fscrypt: stop holding extra request_queue references

 fs/crypto/bio.c             |  16 +-
 fs/crypto/fscrypt_private.h |  82 +++++---
 fs/crypto/hooks.c           |  10 +-
 fs/crypto/inline_crypt.c    | 147 +++++++------
 fs/crypto/keyring.c         | 495 ++++++++++++++++++++++++--------------------
 fs/crypto/keysetup.c        |  89 ++++----
 fs/crypto/keysetup_v1.c     |   4 +-
 fs/crypto/policy.c          |  21 +-
 fs/ext4/readpage.c          |  10 +-
 fs/f2fs/data.c              |  18 +-
 fs/f2fs/super.c             |  24 +--
 fs/super.c                  |   2 +-
 include/linux/fs.h          |   2 +-
 include/linux/fscrypt.h     |  32 ++-
 14 files changed, 495 insertions(+), 457 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
