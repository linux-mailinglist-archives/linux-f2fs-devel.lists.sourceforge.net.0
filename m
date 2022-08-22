Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C228C59C81A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Aug 2022 21:09:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQCnu-0003P9-Ig;
	Mon, 22 Aug 2022 19:09:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oQCnY-0003Oi-2L
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Aug 2022 19:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A8j5s+vDbA8saaVOoFjeQcS9bmFwFmOZeLHnjU1o2Uk=; b=O79WnYTrMBoMDEbKZB7E2qST2X
 aWEE7Dr81WiFnpU3JC6rcgLjWNjqdzN6tRTtHiihLraz6UWKK5hNmaJw+jM/Pw7/UlRcKN96I2sX1
 uRU2W7YbYnzb20q4O0igbM6+HnuMr7n8X1VIFXQg8ApAJZwLQ8AEGSKX/HDdXmR+AtbQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=A8j5s+vDbA8saaVOoFjeQcS9bmFwFmOZeLHnjU1o2Uk=; b=O
 A4fGX/H0graWo3u9s1SNBYtzhPjYqEsNL07bcHDdZ/GRe4vgN3aJ5TDhFlkpABkOKogUYUVCF33YV
 XFq8XoJRi0kRTfZUO3kUZywSU9qhIUnw0AfHIgD5mIiIYDIFD8YWFavMAY3XFHhfYTUjqCfecrqZ8
 KApQBZ+RUQU7+k6Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oQCnT-00DRya-QL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Aug 2022 19:09:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F70A611D9;
 Mon, 22 Aug 2022 19:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDA6C433D7;
 Mon, 22 Aug 2022 19:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661195350;
 bh=WWCjwf+JxkZw6WU1iL1hmp/k5Wm7uGOBx3r+Y2H6l1Y=;
 h=From:To:Cc:Subject:Date:From;
 b=mnLUtKYQ+K0xS88by5TxE4Sr1PYVXcwBR2AyrI6v3NsyYaqFjcCvaY2qPRMNd93EW
 CLNY3vCy+qq3Unkhhi1WLrbq94ni40doG9rjTPMRReXQOuo2+hjpjWU9QAUtkfu0pZ
 WQl4XcZ8U/uMRTJ4fxjjUY1KuwqrH8tghMr1kZUARVjknalAiLdEMMbGTn14oIhTsE
 GDYOuxv5G1modgBVW/a760YFTqaXKWzub0sBO/yBjPAMzO3YTm/lPJgDdquf3r51Cb
 8+VF6noBrzCVwHOaXI+HcjfIAvuJYMZP9rkTmPRHN+Fk93mqqR3lQaJpj/yoko0dWS
 S4eO1KMCDkLBg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 22 Aug 2022 12:08:09 -0700
Message-Id: <20220822190812.54581-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Patch 1 of this series reworks the fscrypt filesystem-level
 keyring to not use the keyrings subsystem as part of its internal
 implementation
 (except for ->mk_users, which remains unchanged for now). T [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oQCnT-00DRya-QL
Subject: [f2fs-dev] [PATCH v3 0/3] fscrypt: rework keyring and stop using
 request_queue
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
Cc: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Patch 1 of this series reworks the fscrypt filesystem-level keyring to
not use the keyrings subsystem as part of its internal implementation
(except for ->mk_users, which remains unchanged for now).  This fixes
several issues, described in the patch itself.  This is also a
prerequisite for eliminating the direct use of struct request_queue from
filesystem code, as discussed at
https://lore.kernel.org/linux-fscrypt/20220721125929.1866403-1-hch@lst.de/T/#u

Patches 2-3 eliminate the direct uses of struct request_queue from
fs/crypto/ that don't require block layer changes.  (The remaining uses
will be eliminated later by changing some of the blk-crypto functions.)

Changed in v3:
    - Added patch "fscrypt: work on block_devices instead of request_queues"

Changed in v2:
    - Don't compare uninitialized bytes of struct fscrypt_key_specifier
    - Don't use refcount_dec_and_lock() unnecessarily
    - Other minor cleanups

Christoph Hellwig (1):
  fscrypt: work on block_devices instead of request_queues

Eric Biggers (2):
  fscrypt: stop using keyrings subsystem for fscrypt_master_key
  fscrypt: stop holding extra request_queue references

 fs/crypto/fscrypt_private.h |  74 ++++--
 fs/crypto/hooks.c           |  10 +-
 fs/crypto/inline_crypt.c    | 150 ++++++-----
 fs/crypto/keyring.c         | 495 +++++++++++++++++++-----------------
 fs/crypto/keysetup.c        |  89 +++----
 fs/crypto/keysetup_v1.c     |   4 +-
 fs/crypto/policy.c          |   8 +-
 fs/f2fs/super.c             |  24 +-
 fs/super.c                  |   2 +-
 include/linux/fs.h          |   2 +-
 include/linux/fscrypt.h     |  25 +-
 11 files changed, 462 insertions(+), 421 deletions(-)


base-commit: 1c23f9e627a7b412978b4e852793c5e3c3efc555
-- 
2.37.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
