Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5EAC3792
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 May 2025 03:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:To:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VXBL9BzFCIv3BWs4LwPWRvRJkXTDWZ/T0Te4KM5N96w=; b=TjzJQw0hoh+310dzmrmsKZpOKs
	AQT4bcX+QCdnQ2wOwzp8hU4vH7i8HLbO7VcNN+1NdR3iKC+k4xx796itflPzls+9M9eaIUm3UHkal
	Xw/30YeLMLXmAsp9pzSDV0U6Za+dS2GwltNAd0jmXeIsyCxQlNYZbFlgj/Qxzh2FDwBk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uJMOj-0005Sw-L4;
	Mon, 26 May 2025 01:13:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uJMOi-0005Sg-LI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 May 2025 01:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N9etUYBRzjBrPzdU5/qi44rNjtXHUryAFIJtTtMYwk8=; b=IAR16Qbefd96W+i37u0WlUdFHC
 UyNR1Dg6QL5q+7/mAOAG9onXwFSoQ8fPARjYbrGAB0ho0ltsPploL6FTRAb4/MMFZ+3ZXG2O9FleY
 PyhFt+85C1G3U23xL5xw9hvtuvDc78Unvs5ZkAgGuziI+87N5akhfUluVdjAnML2Ga7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=N9etUYBRzjBrPzdU5/qi44rNjtXHUryAFIJtTtMYwk8=; b=Y
 tdH/MbYijbisBiXv2X/Nzp8V1PRt7a1qrDmCJ5scuqinXr2Ji81+LrbfY5LP3eaEEX/142sQIIHRc
 lDxDuSDLLGnFnOyNDw7shM3mZL0G58/zCy4aac8p/M0bRL9cGla76/MjTg30wkg6ZSA3JSBx6DuTd
 robMD2S63/UtWpK8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uJMO8-00019j-PH for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 May 2025 01:13:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1970D61126;
 Mon, 26 May 2025 01:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAE8C4CEEA;
 Mon, 26 May 2025 01:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748221933;
 bh=Hdf+EjjTXZohy7wvzsrbiXVv91he59uK5ObP7uvDCFk=;
 h=Date:From:To:Cc:Subject:From;
 b=SBqZdmJ/v5YNWL0MNAgOodpQ2MPdxMHNJh21PffomPOdBJBGshC4LaqDUttDtg+Nc
 rqmN8p4KcWg7TelM/WUzeRiJ2LunogRlcyMsBf/cZabuk5QS4SdL/H6YhaMb4CbNqp
 sHo9Gs16plVIVnKnzJIuk/51Ik81S7c+uX52VWLkYkSYS0YRB76AwZRcQFXlJj01Rq
 EvhH8DTaDknnbQ/AYw8pUJg9txdtqkljBXDzxcalfkriV3T43aeOn//DPCo0H9y0Ub
 m+A1TFazvRqku8RhSKOp/Wt8wiYOpmzouI6lt/mqNWqYwDbta28a6Xs8ybB+BFXR/6
 0/sFt6PAX/s7w==
Date: Sun, 25 May 2025 18:11:59 -0700
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20250526011159.GA23241@sol>
MIME-Version: 1.0
Content-Disposition: inline
X-Headers-End: 1uJMO8-00019j-PH
Subject: [f2fs-dev] [GIT PULL] fscrypt update for 6.16
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/linux.git tags/fscrypt-for-linus

for you to fetch changes up to c07d3aede2b26830ee63f64d8326f6a87dee3a6d:

  fscrypt: add support for hardware-wrapped keys (2025-04-08 19:32:11 -0700)

----------------------------------------------------------------

Add support for "hardware-wrapped inline encryption keys" to fscrypt.
When enabled on supported platforms, this feature protects file contents
keys from certain attacks, such as cold boot attacks.

This feature uses the block layer support for wrapped keys which was
merged in 6.15.  Wrapped key support has existed out-of-tree in Android
for a long time, and it's finally ready for upstream now that there is a
platform on which it works end-to-end with upstream.  Specifically,
it works on the Qualcomm SM8650 HDK, using the Qualcomm ICE (Inline
Crypto Engine) and HWKM (Hardware Key Manager).  The corresponding
driver support is included in the SCSI tree for 6.16.  Validation for
this feature includes two new tests that were already merged into
xfstests (generic/368 and generic/369).

----------------------------------------------------------------
Eric Biggers (1):
      fscrypt: add support for hardware-wrapped keys

 Documentation/filesystems/fscrypt.rst | 187 +++++++++++++++++++++++++++-------
 fs/crypto/fscrypt_private.h           |  75 ++++++++++++--
 fs/crypto/hkdf.c                      |   4 +-
 fs/crypto/inline_crypt.c              |  44 ++++++--
 fs/crypto/keyring.c                   | 132 +++++++++++++++++-------
 fs/crypto/keysetup.c                  |  63 ++++++++++--
 fs/crypto/keysetup_v1.c               |   4 +-
 include/uapi/linux/fscrypt.h          |   6 +-
 8 files changed, 410 insertions(+), 105 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
