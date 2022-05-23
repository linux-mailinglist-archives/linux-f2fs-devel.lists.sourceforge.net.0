Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7575A5309D2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 May 2022 09:08:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nt2Ak-0000TO-VF; Mon, 23 May 2022 07:08:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nt2Aj-0000TH-ML
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 May 2022 07:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R+zFfjC0l/X4IkbiXrFS14R2DRtCxcCnKuHqkaW19Xc=; b=MpMBkOf6SCi96v5my2RCBI0NYE
 yHT4fhQlLLx7cJfB7qPiERV8yemzLfSpnGNxdqK2vc+ST0uqda1Z+dkkcqBWCAEmDctMpTcPf5sSU
 6+JMhsrcyEkwRE5D399yDezBo6dwQxkjdMAx2PBLgYfa9m35RObhwH59/LFlYPtzDmFY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=R+zFfjC0l/X4IkbiXrFS14R2DRtCxcCnKuHqkaW19Xc=; b=N
 /3/EeyZG8H/GRU8bMpGZZI5rRIO+PGPtnMJ/wmNPnvoeieoaHbLdeQCOrD7dbAsj7UcULa6iyjG9n
 2/z+zDsL5RSI4V/hraSmE6wMemAuo1YwdK5RuK5ejGibTIUOnOOgXn+wPXZZGL1y2EJhhB3hGwsNz
 FpYjhYSN+v9ra15k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nt2Ah-001yCm-F5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 May 2022 07:08:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C161D611BB;
 Mon, 23 May 2022 07:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4775C385A9;
 Mon, 23 May 2022 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653289673;
 bh=hdwEg4ZhM324vxQXS0bV+GABy7LdsT+hi9juPKa4LYM=;
 h=Date:From:To:Cc:Subject:From;
 b=Hv1ZewV5rrt82CTBH3ka/CyAsOJFk2s7vSWR+pYA5dTCAr3bgcPvRT+ysVO4Y3wqm
 sPAznzO3uOWGDrxGeH0y34f2P0RwqZRPfuoriNxhfbmLFAioSzIRBPb9Ug//48eukM
 YgQvVSqHWznxnJONdWqSGk9Pza3YnxcTxOa5DX3ID5Ke2zHQq9Qha3RiFUCAqGoaI1
 w78SHOPmTRb2000Gbqj5LaM6h8oAsc5Drdl+k4+PfYj4vrVTMxJMM36NEmVRgEKuFu
 EpPlgFj+KX+U0lJOBbq/cbS4qPbzfD2PABa1IOY4GZ0Vvxf6k80y7GjEa2YIFj20iw
 wi6Xf9R1rsyrQ==
Date: Mon, 23 May 2022 00:07:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Yosyx2FYZOIOWs9g@sol.localdomain>
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
 ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e:
 Linux 5.18-rc2 (2022-04-10 14:21:36 -1000) are available in the Git repository
 at: Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nt2Ah-001yCm-F5
Subject: [f2fs-dev] [GIT PULL] fscrypt updates for 5.19
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

The following changes since commit ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e:

  Linux 5.18-rc2 (2022-04-10 14:21:36 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 218d921b581eadf312c8ef0e09113b111f104eeb:

  fscrypt: add new helper functions for test_dummy_encryption (2022-05-09 16:18:54 -0700)

----------------------------------------------------------------

Some cleanups for fs/crypto/:

- Split up the misleadingly-named FS_CRYPTO_BLOCK_SIZE constant.

- Consistently report the encryption implementation that is being used.

- Add helper functions for the test_dummy_encryption mount option that
  work properly with the new mount API.  ext4 and f2fs will use these.

----------------------------------------------------------------
Eric Biggers (4):
      fscrypt: split up FS_CRYPTO_BLOCK_SIZE
      fscrypt: log when starting to use inline encryption
      fscrypt: factor out fscrypt_policy_to_key_spec()
      fscrypt: add new helper functions for test_dummy_encryption

 fs/crypto/crypto.c          |  10 ++--
 fs/crypto/fname.c           |  11 +++-
 fs/crypto/fscrypt_private.h |  10 +++-
 fs/crypto/inline_crypt.c    |  33 ++++++++++-
 fs/crypto/keyring.c         |  64 +++++++++++++++++----
 fs/crypto/keysetup.c        |  22 ++------
 fs/crypto/policy.c          | 132 ++++++++++++++++++++++++++------------------
 fs/ubifs/ubifs.h            |   2 +-
 include/linux/fscrypt.h     |  51 ++++++++++++++++-
 9 files changed, 238 insertions(+), 97 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
