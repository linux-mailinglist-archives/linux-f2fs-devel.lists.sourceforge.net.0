Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E5B77BFD1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 20:29:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVcK5-0004be-1n;
	Mon, 14 Aug 2023 18:29:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qVcK3-0004bY-Pl
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 18:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rkCnp4KOoLwAbXnFYftAgei+R6f5fxGMthYg+FOfHlw=; b=ALBMF6TW8Tzrqbw/9tVSE0Z9Oz
 q1Frm9jQuA3VZb1iYOFpe1s8BG6ew/Ge/Fd0ifnjVfs94OUS+QebOI8gGfokcb37nOBELMoJWko6i
 +9ZGyMjJF/iDjlygmf3xLEQGj6O7uWx/MMMk43euZPqmd+szY7nM6Zn0Pd3Iv4Nho9CM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rkCnp4KOoLwAbXnFYftAgei+R6f5fxGMthYg+FOfHlw=; b=c
 bRdJaXibQbNvcTr/4024JMN9CpC9jOnCGRPsWpAVv9UkEjOnHVAIiXV3hQL+ghv1UdLVxuztIerzt
 uUzW8iJYHbXMKffu/JKlJ4Mma17A6HNkMdiR+SS3RfCzU+TJDQcJOKW+Zdc58IoxhsgQLNliZ8tEO
 bq6pfePX4zpSBMpA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVcJy-0007zd-GI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 18:29:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF24D63FC8;
 Mon, 14 Aug 2023 18:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5FEC433C8;
 Mon, 14 Aug 2023 18:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692037776;
 bh=uVYR89LUMO78W0VjDkqutMqUi2s1NDJcRATsUgnL4s0=;
 h=From:To:Cc:Subject:Date:From;
 b=ZwvgHI6vwkmlHBBx4WcXoMviO24OlBy7Z5cuSa+qxtYZOp878FhM3EK9pO7T355Dh
 SCXTJUF5wK/mC50r3jun/n5+2gEuTgixGwlJocA2kptuuld1sDDNm0EKfoTRdAusEg
 Yn+vGGEIx1hv3qbCr7msdkNvYLNe+KQJef6USeD+TOlXyG6JocFHyyI4i7f+KmszTS
 8qBYH25ngGeEeuaE9XLcN0co1wKA6WF4Eh7oNF5KHxphMeg/WUinY82m9TF3xT5s5N
 JNPccRxQoOftx6FW6v24sf8aTwCibDK7SL2nbezyI8MSqRBFmmkXqrAz2O6k6Oxkor
 ToYEhz9Q5YY4g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-ext4@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>
Date: Mon, 14 Aug 2023 11:29:00 -0700
Message-ID: <20230814182903.37267-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This series makes unexpected casefold flags on inodes be
 consistently
 rejected early on so that additional validation isn't needed later on during
 random filesystem operations. For additional context, [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qVcJy-0007zd-GI
Subject: [f2fs-dev] [PATCH 0/3] Simplify rejection of unexpected casefold
 inode flag
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
Cc: linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series makes unexpected casefold flags on inodes be consistently
rejected early on so that additional validation isn't needed later on
during random filesystem operations.  For additional context, refer to
the discussion on patch 1 of
https://lore.kernel.org/linux-fsdevel/20230812004146.30980-1-krisman@suse.de/T/#u

Applies to v6.5-rc6

Eric Biggers (3):
  ext4: reject casefold inode flag without casefold feature
  ext4: remove redundant checks of s_encoding
  libfs: remove redundant checks of s_encoding

 fs/ext4/hash.c  |  2 +-
 fs/ext4/inode.c |  5 ++++-
 fs/ext4/namei.c |  6 +++---
 fs/libfs.c      | 14 ++------------
 4 files changed, 10 insertions(+), 17 deletions(-)


base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
