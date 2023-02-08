Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C629F68E832
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Feb 2023 07:21:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pPdpx-0004Wh-P6;
	Wed, 08 Feb 2023 06:21:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pPdpw-0004Wb-Jg
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Feb 2023 06:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MqYxYy/10O8ajDOrdAwEik6sXY7Sd02v17Qa7W/viFk=; b=mPOXUa9/acO7FZDiLuvKnTR25A
 XVHhELKjvXij9O3Uhgsr8ncXC4yLbVd9oKccAd7MfHB0OUMMvGyyeMmlX/Ij1RFRNXmFRD4bf4q4v
 v3ZyuSUSPdOHMrMohVbE71abNWLWz6CBaL/DvmhULmQvqYGKLq/4d9sWbEcrRCpXdpRk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MqYxYy/10O8ajDOrdAwEik6sXY7Sd02v17Qa7W/viFk=; b=A
 1LvHixf+E/A1Ah61904wmZ0jiBkFNXBqPajvBiT/EjzBLyh2j4izHtCKpq/xWmghjsvnEmt1vJs12
 odk5wSqZSgrrXgUcsfPh9RueoFrz4gWi0YP89RX17JDcUZKaWKDgNqh5/BY9iysp424Lb1MBehbLb
 fvpild0YsA/I46rQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pPdpu-0008Qg-Et for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Feb 2023 06:21:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FFA4611BC;
 Wed,  8 Feb 2023 06:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D596C433EF;
 Wed,  8 Feb 2023 06:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675837294;
 bh=5/jCW9hCuDP1bPRnmDpSkCHU7uopSOqd4DhFBilNJRU=;
 h=From:To:Cc:Subject:Date:From;
 b=I8/gHZ3fzWa+jyUy6KyNSxroGCmJEfpCWfi01Wrqimo7Oqt3gpGOv01fKFG6/kLoJ
 1Rnd09J0j1RgQK9Le3OI12MScPZM4cbR3ftqtHaEfDcMkLvKaQMul+jEP0FH2INKn+
 58jvH9LKmqZ6J9YGH8BoYV+Y+h4mRNbPvf+UiMnBgotr85EPqODtNnXa4p8uCK8Fwy
 VkX8XeauE4V1sE8uVb15qARkYw7T84Se2mRDCv3hlgFDM6Jy1pdSW3ynrEPoZ3eWuw
 v3dMHo+r18cyKs9JCn04GN4PGAYMDiH4PzDGWz8aacPgzoNjtfGNYtcLTT+/t6ZhBX
 7isGFDAXEfaRg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue,  7 Feb 2023 22:21:02 -0800
Message-Id: <20230208062107.199831-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This series eliminates the call to fscrypt_destroy_keyring()
 from __put_super(), which is causing confusion because it looks like (but
 actually isn't) a sleep-in-atomic bug. See the thread "block: sle [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pPdpu-0008Qg-Et
Subject: [f2fs-dev] [PATCH 0/5] Add the test_dummy_encryption key on-demand
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series eliminates the call to fscrypt_destroy_keyring() from
__put_super(), which is causing confusion because it looks like (but
actually isn't) a sleep-in-atomic bug.  See the thread "block: sleeping
in atomic warnings", i.e.
https://lore.kernel.org/linux-fsdevel/CAHk-=wg6ohuyrmLJYTfEpDbp2Jwnef54gkcpZ3-BYgy4C6UxRQ@mail.gmail.com
and its responses.

To do this, this series makes it so that the key associated with the
"test_dummy_encryption" mount option is added on-demand when files are
accessed, instead of immediately when the filesystem is mounted.

I was going back and forth between this solution and instead having ext4
and f2fs call fscrypt_destroy_keyring() on ->fill_super failure.  (Or
using Linus's suggestion of adding the test dummy key as the very last
step of ->fill_super.)  It does seem ideal to add the key at mount time,
but I ended up going with this solution instead because it reduces the
number of things the individual filesystems have to handle.

Eric Biggers (5):
  fscrypt: add the test dummy encryption key on-demand
  ext4: stop calling fscrypt_add_test_dummy_key()
  f2fs: stop calling fscrypt_add_test_dummy_key()
  fs/super.c: stop calling fscrypt_destroy_keyring() from __put_super()
  fscrypt: clean up fscrypt_add_test_dummy_key()

 fs/crypto/fscrypt_private.h |  4 ++++
 fs/crypto/keyring.c         | 26 +++++++-------------------
 fs/crypto/keysetup.c        | 23 +++++++++++++++++++++--
 fs/crypto/policy.c          |  3 +--
 fs/ext4/super.c             | 13 +------------
 fs/f2fs/super.c             |  6 ------
 fs/super.c                  |  1 -
 include/linux/fscrypt.h     |  9 ---------
 8 files changed, 34 insertions(+), 51 deletions(-)


base-commit: 6d796c50f84ca79f1722bb131799e5a5710c4700
-- 
2.39.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
