Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 500EF1CE3C1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2020 21:17:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYDvh-0005wR-4a; Mon, 11 May 2020 19:17:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jYDuy-0005uU-2C
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 19:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qLtc/qekpU/VtzAuOABP9riGCV9eOohsOW2MglSLArY=; b=mLKQdutc1yVse8Qn31SqHA34Ws
 t3ihsoFLFwRIf6Xrh26243b9VWP5Zi2bzEd7SbOk38W9l4xqx6iQ5H7FdPF2V6s0jdV0+DHPkNRdE
 YF5poI+f8PJ7VUHnKv/toc9/OXl0fqGwnMDMx4HIFNkbyYuXIZVzEq8QSovNUvmQub7Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qLtc/qekpU/VtzAuOABP9riGCV9eOohsOW2MglSLArY=; b=f
 qKLd0G9I714RyIn47xPznIHgr6cOPv3Sq/XMLeKPZck4PtPihm8myWljVylfM8R2UBX1A/9dIernF
 sj25DhW5/RZpwCrPZmdRm5WT5+UXqYgpLLUyN5Yzn0xZY4kFxkF0F/TX08GA5fJ0nJgrJyefswvZc
 8qYV3FzqnbXcYn+U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYDus-009al2-5a
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 19:16:48 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50247206E6;
 Mon, 11 May 2020 19:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589224596;
 bh=tBesqsTZnw0kx/Akr2tFasAZ+I+4QbG0o21sc6BMcfI=;
 h=From:To:Cc:Subject:Date:From;
 b=XamP3kJWjE2sYmlIKlfYZ56Lg+nYobrBaj0d1gSAiulPa2bvLPDDqmh/sSDGbGpLU
 vFTnSRrn/7/w8sF0ijX1uMCF4Lg6sMQ1q+TGXP+yPKXEbeNQ5n/qcqSRPBRxD+5xRi
 VGrijh9MkSub8sMxCvRQnCXatalBjz/FQio+FoP8=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 11 May 2020 12:13:55 -0700
Message-Id: <20200511191358.53096-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYDus-009al2-5a
Subject: [f2fs-dev] [PATCH 0/3] fscrypt: misc cleanups
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In fs/crypto/ and fscrypt.h, fix all kerneldoc warnings, and fix some
coding style inconsistencies in function declarations.

Eric Biggers (3):
  fscrypt: fix all kerneldoc warnings
  fscrypt: name all function parameters
  fscrypt: remove unnecessary extern keywords

 fs/crypto/crypto.c          |   9 +-
 fs/crypto/fname.c           |  52 +++++++++---
 fs/crypto/fscrypt_private.h |  88 +++++++++----------
 fs/crypto/hooks.c           |   4 +-
 fs/crypto/keysetup.c        |   9 +-
 fs/crypto/policy.c          |  19 ++++-
 include/linux/fscrypt.h     | 165 ++++++++++++++++++------------------
 7 files changed, 193 insertions(+), 153 deletions(-)

-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
