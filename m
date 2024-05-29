Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BDD8D312A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 May 2024 10:27:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCEeD-0007BC-61;
	Wed, 29 May 2024 08:27:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1sCEeA-0007B4-LA
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 08:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=08VUtF6vs2IDwxkcc8GeBUTqt+72/IILTddb1FnGDDw=; b=OS1fBplz8fZZzcdyXN8CEI50Xz
 zGZSXrh/wN83ouciR9YOD4UhOthPavIYGQrFSiT4YtHFcvmPL77itc8MFB/1C9lN64p4jMGrPeUo/
 xF9NnTl6M+b39pemYEFn4hlW//qY2YvxguGntPUwRzYIBlB7cJvaQnt7qDHJWKig7mtQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=08VUtF6vs2IDwxkcc8GeBUTqt+72/IILTddb1FnGDDw=; b=c
 pFw0cK6F+4Cuc2iCDdYhol3K98Y6dCEMj3WF3AMOPDAUztWHFpRmQ2j0NKED9gjPs+jnOwCV3lO0i
 YL/FC6fIa1Slo2SkTIumSTNhy1c62hQS/1Ek6tzjIvYX7smo8Y3BTaS8q+ScPij4TiQXHt5qk93Ud
 Pvy+Mqvm/88vFrU8=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCEe9-0008WU-US for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 08:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716971205;
 bh=8DvYsg/j4JRyj6ZyJVoopmP3oTEFO0NjYisKzyNxqSI=;
 h=From:To:Cc:Subject:Date:From;
 b=qh6rb3WPLPrJoI4vPSUcHSsfx4xXvHSNZE78X2QGYjPweOAkLp+9FK1WwovZCoNZR
 TGwMK4TPCngnbTlRB/taqO5ZaWl0ec/oJDJvyAU4FNF569nO5XE6A10S3qWdcsZjCw
 Q3fnc7G85Pm8X004BLEyY/JZdfXQo1QeplmvUHrosA3DXMtsqkpfrBk1HoYAMIzmqM
 Vih5bf1TNOzMRZkf2kunuQGXTt82Qv0PQLYWCcji0LqnVHIhjbOo1US9bimQDy99wi
 hQH52+ruIctn0Fd9np2EWN4zsjZltxr4bbD/RDHxGv4+Zh5TU5Zo0e0AYHZhMHOe1R
 og081qT8b8zQw==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C7FC5378000A;
 Wed, 29 May 2024 08:26:44 +0000 (UTC)
To: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, adilger.kernel@dilger.ca, tytso@mit.edu
Date: Wed, 29 May 2024 11:26:27 +0300
Message-Id: <20240529082634.141286-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, I am trying to respin the series here :
 https://www.spinics.net/lists/linux-ext4/msg85081.html
 I resent some of the v9 patches and got some reviews from Gabriel, I did
 changes as requested and here is v17. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [46.235.227.194 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [46.235.227.194 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sCEe9-0008WU-US
Subject: [f2fs-dev] [PATCH v17 0/7] Case insensitive cleanup for ext4/f2fs
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
From: Eugen Hristev via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: krisman@suse.de, brauner@kernel.org, jack@suse.cz, ebiggers@google.com,
 Eugen Hristev <eugen.hristev@collabora.com>, viro@zeniv.linux.org.uk,
 kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

I am trying to respin the series here :
https://www.spinics.net/lists/linux-ext4/msg85081.html

I resent some of the v9 patches and got some reviews from Gabriel,
I did changes as requested and here is v17.

Changes in v17:
- in patch 2/7 the case insensitive match helper, I modified the logic a bit,
memcmp params, and return errors properly, also removed patches for logging
errors as the message is now included in the helper itself.

Changes in v16:
- rewrote patch 2/9 without `match`
- changed to return value in generic_ci_match coming from utf8 compare only in
strict mode.
- changed f2fs_warn to *_ratelimited in 7/9
- removed the declaration of f2fs_cf_name_slab in recovery.c as it's no longer
needed.

Changes in v15:
- fix wrong check `ret<0` in 7/9
- fix memleak reintroduced in 8/9

Changes in v14:
- fix wrong kfree unchecked call
- changed the return code in 3/8

Changes in v13:
- removed stray wrong line in 2/8
- removed old R-b as it's too long since they were given
- removed check for null buff in 2/8
- added new patch `f2fs: Log error when lookup of encoded dentry fails` as suggested
- rebased on unicode.git for-next branch

Changes in v12:
- revert to v10 comparison with propagating the error code from utf comparison

Changes in v11:
- revert to the original v9 implementation for the comparison helper.

Changes in v10:
- reworked a bit the comparison helper to improve performance by
first performing the exact lookup.


* Original commit letter

The case-insensitive implementations in f2fs and ext4 have quite a bit
of duplicated code.  This series simplifies the ext4 version, with the
goal of extracting ext4_ci_compare into a helper library that can be
used by both filesystems.  It also reduces the clutter from many
codeguards for CONFIG_UNICODE; as requested by Linus, they are part of
the codeflow now.

While there, I noticed we can leverage the utf8 functions to detect
encoded names that are corrupted in the filesystem. Therefore, it also
adds an ext4 error on that scenario, to mark the filesystem as
corrupted.

This series survived passes of xfstests -g quick.

Gabriel Krisman Bertazi (7):
  ext4: Simplify the handling of cached casefolded names
  f2fs: Simplify the handling of cached casefolded names
  libfs: Introduce case-insensitive string comparison helper
  ext4: Reuse generic_ci_match for ci comparisons
  f2fs: Reuse generic_ci_match for ci comparisons
  ext4: Move CONFIG_UNICODE defguards into the code flow
  f2fs: Move CONFIG_UNICODE defguards into the code flow

 fs/ext4/crypto.c   |  10 +---
 fs/ext4/ext4.h     |  35 ++++++++-----
 fs/ext4/namei.c    | 126 +++++++++++++++------------------------------
 fs/ext4/super.c    |   4 +-
 fs/f2fs/dir.c      | 105 +++++++++++--------------------------
 fs/f2fs/f2fs.h     |  16 +++++-
 fs/f2fs/namei.c    |  10 ++--
 fs/f2fs/recovery.c |   9 +---
 fs/f2fs/super.c    |   8 +--
 fs/libfs.c         |  74 ++++++++++++++++++++++++++
 include/linux/fs.h |   4 ++
 11 files changed, 200 insertions(+), 201 deletions(-)

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
