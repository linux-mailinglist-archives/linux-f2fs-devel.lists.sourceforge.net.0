Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7979659AFDF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 21:11:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPTsT-0006pa-86;
	Sat, 20 Aug 2022 19:11:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oPTsR-0006pO-KS
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Aug 2022 19:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hjq/9MnObc3Z8XhrXl896s6OXlEJ+vn+xSGaklbo2jY=; b=EziZqfdXUS9Z1MVv9P4V1YMOrk
 qWqaK+fU18gHMrHjfUqtAtkIV0yL01BNUIsAQn+1lxzB9AeceKR7VAQTyXrClsKc2IdPenla6SSWG
 H43AtsQ9H9gVKDRRRCjL6IbLm/Tyv1zRts1F2HeDN8yEV8p3enPpuipf6ZjxVHj7La8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Hjq/9MnObc3Z8XhrXl896s6OXlEJ+vn+xSGaklbo2jY=; b=T
 KfXLtQYtVTmHLzMXJWxifxfQUymQCk6mRkGGwCuUy1PpiWIOFOx1NPGhtHQamF5GvJQM2JoL2OYGC
 o05NNeXJF9nZOZKvFx/+XZY2HTK21YJ+6mrg/8n1lNZRxeZpWDu9tGc9MKxr3OKaAhTLg3JSnMCIW
 fV9dKIa/sbjgrLig=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPTsA-0006P7-J9 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Aug 2022 19:11:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97081B80AAD;
 Sat, 20 Aug 2022 19:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202FAC433C1;
 Sat, 20 Aug 2022 19:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661022649;
 bh=uNUb1M7CCQXGOxGrsYBQxCVkKEk2ADvQo+VwUlJ9jHQ=;
 h=From:To:Cc:Subject:Date:From;
 b=KzQ/lWHqSAiLkeoOQivxT89bOTDFv6C+41BHNiWuwaeSsE3Wsmfr4ybvTY+i7MKm6
 kIC5kqNNUqyXGGprcbKIiXbJA51rNHvFYmRwj4qRXACUqb63yhId9WPe1l3A2aI/Fj
 sTOTyORCQFdc61zxLhl3CHOBrdMjqJweKKfqlcbUA0pUebdKH7hswnkUEkzN/VhDnT
 a0gZ5Rh713lZrWZPzgqDnTB1CW8g0CpwwPGx6zZS7HaQv5e9gsg/f9GFOmpm6UwJJJ
 uVzRE8d4PvzS2DgzPHFMeAIUrbsZhZE1+hmQ1uXMh7dS2CSQr/xM9+y5I5FFL8GnGX
 dbb8hI9LPdRAA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sat, 20 Aug 2022 12:02:08 -0700
Message-Id: <20220820190210.169734-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This series reworks the filesystem-level keyring to not use
 the keyrings subsystem as part of its internal implementation (except for
 ->mk_users, which remains unchanged for now). This fixes several i [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oPTsA-0006P7-J9
Subject: [f2fs-dev] [PATCH v2 0/2] fscrypt: rework filesystem-level keyring
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

This series reworks the filesystem-level keyring to not use the keyrings
subsystem as part of its internal implementation (except for ->mk_users,
which remains unchanged for now).  This fixes several issues, described
in the first patch.  This is also a prerequisite for removing the direct
use of struct request_queue from filesystem code, as discussed at
https://lore.kernel.org/linux-fscrypt/20220721125929.1866403-1-hch@lst.de/T/#u

Changed v1 => v2:
    - Don't compare uninitialized bytes of struct fscrypt_key_specifier
    - Don't use refcount_dec_and_lock() unnecessarily
    - Other minor cleanups

Eric Biggers (2):
  fscrypt: stop using keyrings subsystem for fscrypt_master_key
  fscrypt: stop holding extra request_queue references

 fs/crypto/fscrypt_private.h |  74 ++++--
 fs/crypto/hooks.c           |  10 +-
 fs/crypto/inline_crypt.c    |  83 +++---
 fs/crypto/keyring.c         | 495 +++++++++++++++++++-----------------
 fs/crypto/keysetup.c        |  89 +++----
 fs/crypto/keysetup_v1.c     |   4 +-
 fs/crypto/policy.c          |   8 +-
 fs/super.c                  |   2 +-
 include/linux/fs.h          |   2 +-
 include/linux/fscrypt.h     |   4 +-
 10 files changed, 406 insertions(+), 365 deletions(-)


base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.37.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
