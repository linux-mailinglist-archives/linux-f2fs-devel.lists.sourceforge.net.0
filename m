Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AD13938DC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 May 2021 00:59:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lmOxo-00041K-73; Thu, 27 May 2021 22:58:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lmOxm-000414-K9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 May 2021 22:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QTDtw4CB7baAoCLRAIeO+jHV4FpiTudBqJ0pazqfceU=; b=Ns+SqGlDuSlYZJhKr+XNvWMTRl
 l+/RS+FqdjisbMMh75fm3wPeLEiEKDkFTj5153tUPU0N+9LorOM/C1nRZ6h7cG7E5j4odFUCkTBZd
 TtENOmOhw9IVOnpiM4dgGNBpJolWKzzIpNiw9RrbY5GrqSe8xUCDhmbiWg6xIXgWFsqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QTDtw4CB7baAoCLRAIeO+jHV4FpiTudBqJ0pazqfceU=; b=d
 emCVCiXmKQw4I5N/L/w25Jgo/hQI3zOp+lAYbACIA/0aAI5fgQDrXoFEed+jsKIEwED75ig680zsB
 B85GVAOH2fL2y5IMoxO70t6V8FPN2ZWD2GUsON6mS9tsAs6NWHJSZFTlh5k0y2C8Y4FMQBZEEVGD/
 RJVDM1wA8jQ/9hgg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lmOxb-000BdA-6X
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 May 2021 22:58:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3324613B4;
 Thu, 27 May 2021 22:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622156308;
 bh=88+eV716DIdAR5tUqch1HNXLPldwfov0uEMbNQcqzSk=;
 h=From:To:Cc:Subject:Date:From;
 b=USUAUQjUtNWzqcudS3yex3pfLJhCHJxn96LN10teB1uRolUdbFXqmYtAIhr5fZwVA
 ydfAB/sAiwJZiJYP4mh+/NEhElElpFks/CCzimQypgzsvb2wM9zLCYRYhawT2aZHSw
 YKeByIJ7ToHN4hJsxZssdSBwe/YrTkR1XfbC9hb6wBnq001G2B4U3+rHLDHB2u+REG
 4YTCve+HKoYqbBeVbT4kYn8kKkEJrnvsO1I/C+3rp6W7//306k4Vd8CYoUuGSd6dVx
 kALocVvXzUfJtzHWuZ+Zn0rOu3WcOxfmSWx0fOCnHfqkpROnbPbOUQDGugMtsZW5NU
 iPaRCYmERRmtw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu, 27 May 2021 15:55:25 -0700
Message-Id: <20210527225525.2365513-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lmOxb-000BdA-6X
Subject: [f2fs-dev] [PATCH] fscrypt: fix derivation of SipHash keys on big
 endian CPUs
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
Cc: linux-ext4@vger.kernel.org, stable@vger.kernel.org,
 Daniel Rosenberg <drosen@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Typically, the cryptographic APIs that fscrypt uses take keys as byte
arrays, which avoids endianness issues.  However, siphash_key_t is an
exception.  It is defined as 'u64 key[2];', i.e. the 128-bit key is
expected to be given directly as two 64-bit words in CPU endianness.

fscrypt_derive_dirhash_key() forgot to take this into account.
Therefore, the SipHash keys used to index encrypted+casefolded
directories differ on big endian vs. little endian platforms.
This makes such directories non-portable between these platforms.

Fix this by always using the little endian order.  This is a breaking
change for big endian platforms, but this should be fine in practice
since the encrypt+casefold support isn't known to actually be used on
any big endian platforms yet.

Fixes: aa408f835d02 ("fscrypt: derive dirhash key for casefolded directories")
Cc: <stable@vger.kernel.org> # v5.6+
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/keysetup.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 261293fb7097..4d98377c07a7 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -221,6 +221,16 @@ int fscrypt_derive_dirhash_key(struct fscrypt_info *ci,
 				  sizeof(ci->ci_dirhash_key));
 	if (err)
 		return err;
+
+	/*
+	 * The SipHash APIs expect the key as a pair of 64-bit words, not as a
+	 * byte array.  Make sure to use a consistent endianness.
+	 */
+	BUILD_BUG_ON(sizeof(ci->ci_dirhash_key) != 16);
+	BUILD_BUG_ON(ARRAY_SIZE(ci->ci_dirhash_key.key) != 2);
+	le64_to_cpus(&ci->ci_dirhash_key.key[0]);
+	le64_to_cpus(&ci->ci_dirhash_key.key[1]);
+
 	ci->ci_dirhash_key_initialized = true;
 	return 0;
 }
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
