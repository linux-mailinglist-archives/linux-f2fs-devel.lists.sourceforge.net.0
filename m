Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C63F9A4619
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2024 20:45:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t1ryQ-0006DZ-17;
	Fri, 18 Oct 2024 18:45:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t1ryO-0006DM-Eh
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 18:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eBPfVe/rC8PaQ8ghppBMGz7pzwnwxtuimKoKxiPHc8k=; b=KzVhxgYqdItqawFORK4jaxwiiN
 Yl6oHv6IInvUQ7HwVeDeC34NfRbhSrWb6A5D6UQxUQxqHpwyDeW+6NBo38uS1n46DjWiZqPw9C1sA
 ABOKaiCx8K6w7MI9hbHVzx+fQWbuQR1Z3W8jNyZlkQkpKi/RuSmuBqCFQ9ZwZW49PkJc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eBPfVe/rC8PaQ8ghppBMGz7pzwnwxtuimKoKxiPHc8k=; b=U
 coYuOdocwz38R68WV05EiuG85hcb0Fh/xNd1lEe5Wof/9gIshCUGK0gHl9azTKG6cHxqxvaZQfMqz
 c6G99qKfrgVEARqBSTxfQ2/lSVyWTEdi39Y5Lr9Y8XSaPuDINWqstgBOpHKgzQuQAMqsF3pr11qOn
 BzbKpByRiB0+DDLQ=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t1ryN-00013e-GN for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 18:45:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BE243A448F9;
 Fri, 18 Oct 2024 18:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14439C4CEC3;
 Fri, 18 Oct 2024 18:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729277104;
 bh=ezUq8Gu+1gxpe+LETiT3thtchxlc506pUFTtsAKJMHY=;
 h=From:To:Cc:Subject:Date:From;
 b=pCWm9W6j1rRPWi/RGVpopSxu3ME0YjjlmGkuaCHtilbMI1n5K/lgFXujKcxZnVOgP
 Z+vXZ0iwvbcZ5E4GN3qQ7nn2jZOliV130WPq95w6cfhKn1Nlv+iwaLQPy+lyPPM75O
 NdvkdEXUJURhHQ7+IVOPEtTDnu/CXYF81uv5ndOwn/itHHNFFZksshsRGq5Gu53Jvz
 GoTO+HvohehDrrO7b1/c1+gEpjy2Rgok0knackTkbYqgPkbe4Lhq3JVa3++EMzou/K
 YMtOpONL0Pmkhfzx9qOgs9EA3kJq3cvfdOM/S54m43F4DShItmMIsCucWQTupUAwTT
 fszVNEg8x4hGg==
To: dm-devel@lists.linux.dev
Date: Fri, 18 Oct 2024 11:43:35 -0700
Message-ID: <20241018184339.66601-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This series adds "metadata encryption" support to ext4 and
 f2fs via a new device-mapper target dm-default-key. dm-default-key encrypts
 all data on a block device that isn't already encrypted by the fi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t1ryN-00013e-GN
Subject: [f2fs-dev] [RFC PATCH 0/4] dm-default-key: target for filesystem
 metadata encryption
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
Cc: Israel Rukshin <israelr@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Mikulas Patocka <mpatocka@redhat.com>,
 Adrian Vovk <adrianvovk@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 linux-ext4@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series adds "metadata encryption" support to ext4 and f2fs via a
new device-mapper target dm-default-key.  dm-default-key encrypts all
data on a block device that isn't already encrypted by the filesystem.

Except for the passthrough support, dm-default-key is basically the same
as the proposed dm-inlinecrypt which omits that feature
(https://lore.kernel.org/dm-devel/20241016232748.134211-1-ebiggers@kernel.org/).

I am sending this out for reference, as dm-default-key (which Android
has been using for a while) hasn't previously been sent to the lists in
full, and there has been interest in it.  However, my current impression
is that this feature will need to be redesigned as a filesystem native
feature in order to make it upstream.  If that is indeed the case, then
IMO it would make sense to merge dm-inlinecrypt in the mean time instead
(or add its functionality to dm-crypt) so that anyone who just wants
"dm-crypt + inline encryption hardware" gets a solution for that.

Eric Biggers (4):
  block: export blk-crypto symbols required by dm-default-key
  block: add the bi_skip_dm_default_key flag
  dm-default-key: add target for filesystem metadata encryption
  ext4,f2fs: support metadata encryption via dm-default-key

 block/bio.c                 |   3 +
 block/blk-crypto-fallback.c |   2 +
 block/blk-crypto.c          |   3 +
 drivers/md/Kconfig          |  20 ++
 drivers/md/Makefile         |   1 +
 drivers/md/dm-default-key.c | 431 ++++++++++++++++++++++++++++++++++++
 fs/crypto/inline_crypt.c    |  14 +-
 fs/f2fs/data.c              |   6 +-
 include/linux/blk-crypto.h  |  36 +++
 include/linux/blk_types.h   |   3 +
 include/linux/fscrypt.h     |  14 ++
 11 files changed, 531 insertions(+), 2 deletions(-)
 create mode 100644 drivers/md/dm-default-key.c


base-commit: c964ced7726294d40913f2127c3f185a92cb4a41
-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
