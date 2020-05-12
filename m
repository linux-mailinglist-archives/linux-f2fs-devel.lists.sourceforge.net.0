Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D14821D0327
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2020 01:36:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYeRr-0004Cc-L9; Tue, 12 May 2020 23:36:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jYeRq-0004CU-Ao
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 May 2020 23:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xPAmbSoxIOy5C36TqONnnkf67F2CgVAVwY7LbiPaGGg=; b=bULIppPl090GCgfX8ro49E78ju
 FfZhkxw3qb37hZleGO/xRfoGs8eWYdH5pq3NX8vzh4PPV95DTnQioNt3tsveFYpgpQ3fpOgVjHIUp
 d7lI3dA2NbBOLVlo2+vSVFfz7BVsTHDIfWV7GsnikoGUTTgjb9AU1PJXzDrn5QnFjVLE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xPAmbSoxIOy5C36TqONnnkf67F2CgVAVwY7LbiPaGGg=; b=XLkRJu05Smq2/Y8ddxU3fdinc/
 6H90b9R6Axp5AAJnOLCW1FCl2d8dmKut8d4JhvqEh+f/7inWqgU3QhBlvc+nXInLisvVGXPDiRRIr
 jZ210NmApO5pQnoEPQPDGesFcHd+MxOT1OfMTSFCjLK6xg01mp9qnHTwLg1tihBdMUwE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYeRl-00C3kI-3p
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 May 2020 23:36:30 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CF1723129;
 Tue, 12 May 2020 23:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589326570;
 bh=BMIktPcgJbdPblvIseR4lM4hwfbtMoRDGR8MWk2qSuA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JZUdY+nHskjaq8Rsyn8OOMyKPHfjHj9JfV6Acwi+Pma0bvRssHQzAdfIvl+EIT/Dy
 +psLT83lyG4cNCQ7eI5/F4O3Yasm/+j3M7hxHcDOmv+55sx1xtHVwfWgMmbYPEx7/v
 zAV3sSEE8wyJr+mJq0JhLATesRFun5o3llaIdmxc=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 12 May 2020 16:32:51 -0700
Message-Id: <20200512233251.118314-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512233251.118314-1-ebiggers@kernel.org>
References: <20200512233251.118314-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jYeRl-00C3kI-3p
Subject: [f2fs-dev] [PATCH 4/4] fscrypt: make test_dummy_encryption use v2
 by default
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Since v1 encryption policies are deprecated, make test_dummy_encryption
test v2 policies by default.

Note that this causes ext4/023 and ext4/028 to start failing due to
known bugs in those tests (see previous commit).

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/policy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index ca0ee337c9627f..cb7fd8f7f0eca1 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -632,7 +632,7 @@ int fscrypt_set_test_dummy_encryption(struct super_block *sb,
 				      const substring_t *arg,
 				      struct fscrypt_dummy_context *dummy_ctx)
 {
-	const char *argstr = "v1";
+	const char *argstr = "v2";
 	const char *argstr_to_free = NULL;
 	struct fscrypt_key_specifier key_spec = { 0 };
 	int version;
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
