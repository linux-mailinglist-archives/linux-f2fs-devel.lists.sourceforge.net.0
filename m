Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D1081F0D3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Dec 2023 18:17:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rIXXL-0007Ef-Ol;
	Wed, 27 Dec 2023 17:17:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rIXXJ-0007EV-6n
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Dec 2023 17:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uT5/dMxywzCe9BnFVdiHrPgQlnEjZC1pras5S0T2eV4=; b=ai+3NDMUyMPh1sxjb59cVj87Oo
 K4/K5Q7rGVtO78oX4XUzRWYzIkP9PxCd3G3cjk13uBN8oLVbVhkR1fILhTtJzfMsJeshiAF4fqKbS
 lwDE2zJEy7BJiGTSetfGACv/5GQKpwR5byQFGUgwPCaIOkN0EdmcwQ1EFAPFYgGpUwPo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uT5/dMxywzCe9BnFVdiHrPgQlnEjZC1pras5S0T2eV4=; b=C
 gcijXPYlzi4CgpN+W5nHolrAXK9Qeu/hoabeK+c4vCZ//zEtyQXCSI8bustP9bG/5dpc3F6xEhE3a
 wzV5UCGGlbCWcILeCZdLgx1JC2TQJQuWA4v785ikgzJM9R+PHLfzv5KjDWhO8xdrQx0fsCovNJDQT
 iayM/ZqIbT6NF+OQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rIXXI-0003N9-8E for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Dec 2023 17:17:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 308BACE129A;
 Wed, 27 Dec 2023 17:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142FBC433C7;
 Wed, 27 Dec 2023 17:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703697441;
 bh=sVWMX+bfKbpj+wN2Tqsk9pRNhX9g1Y9VDLF6ogCKIBc=;
 h=From:To:Cc:Subject:Date:From;
 b=JMposGQlfLgWKnwk0tei8OPpwATRoex/30SSzdm5BSZfMukmRFesc8v/HL53j5lJ3
 5ygHH92sLb6OfeJbOPDaG013CS2haUxW4zBWw4XX4xMNKyxu5FEWVLfswqtvUVvcK/
 rHj2PCY+kawWDNfJ9O2YHPgL+wLljBglBU+FDidNjy3WgqzlckuJ+vikyPItsbQH3m
 Bo3rimbhgnN3k7m+NNiS+dNXAPLxvPufL79li3Je7TNXy079S6n08njYHjeBBYTYzN
 VxAWJnDIHgNXQFMMLf+EndFo44HQCNRlsnptjCRoSn2wwHlQZbsJ/GWr7Cij58+b9g
 JdErdSfPipYWg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 27 Dec 2023 11:14:27 -0600
Message-ID: <20231227171429.9223-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This series moves the fscrypt keyring destruction to after
 ->put_super, as this will be needed by the btrfs fscrypt support. To make
 this possible, it also changes f2fs to release its block devices af [...]
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rIXXI-0003N9-8E
Subject: [f2fs-dev] [PATCH v2 0/2] Move fscrypt keyring destruction to after
 ->put_super
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
Cc: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Josef Bacik <josef@toxicpanda.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series moves the fscrypt keyring destruction to after ->put_super,
as this will be needed by the btrfs fscrypt support.  To make this
possible, it also changes f2fs to release its block devices after
generic_shutdown_super() rather than before.

This supersedes "[PATCH] fscrypt: move the call to
fscrypt_destroy_keyring() into ->put_super()"
(https://lore.kernel.org/linux-fscrypt/20231206001325.13676-1-ebiggers@kernel.org/T/#u)

Changed in v2:
- Added a comment to f2fs patch.
- Dropped btrfs patch from series; it will go in separately.
- Added some Reviewed-bys.

Eric Biggers (1):
  f2fs: move release of block devices to after kill_block_super()

Josef Bacik (1):
  fs: move fscrypt keyring destruction to after ->put_super

 fs/f2fs/super.c | 13 ++++++++-----
 fs/super.c      | 12 ++++++------
 2 files changed, 14 insertions(+), 11 deletions(-)


base-commit: fbafc3e621c3f4ded43720fdb1d6ce1728ec664e
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
