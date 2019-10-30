Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C2EA616
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2019 23:20:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPwKM-0004St-MV; Wed, 30 Oct 2019 22:20:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iPwKI-0004SQ-LG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 22:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LM48eP9E1pNdGWsAcEiW0KshrCCGwTeR7ddxCeXpmOs=; b=K8ZgAf5cw4PxIV4dM71VV3x+77
 u57+sIR1nfQPVKkcfVicVrUJ5cQxnGsx/Jo1mzPEG9GHpC2glhmTq+Q0xGIcuCOiZpuk2loU2rPHw
 zH5ID/dq45ooc/sKuh8MOqJzkP91IuFXaibNaWJ1psUz/bf13MUj0fxnISLMo8xoFygc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LM48eP9E1pNdGWsAcEiW0KshrCCGwTeR7ddxCeXpmOs=; b=T
 6dPIeMyxaZuLnCoRxyCA7Hkc/HKlBo1mIDuYq3Uc9imA+niFEM5/TNG2H+9xg4EE5dWP7xMkrSKEH
 Fz9uTxwZp/jfU0nsHOActjFvKrr+VY28ZghYtsK+kJUti9oO9fVn5FPS00opBlZqHW8y2ohzq0i62
 Ga8YwMIP7G/3HkHc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPwKC-00BYvi-4S
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 22:20:26 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CDC0420873;
 Wed, 30 Oct 2019 22:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572474013;
 bh=39tlinMi/mwa6K8bh+AvUrEqnvDUmchorz6iz1Vb2MI=;
 h=From:To:Cc:Subject:Date:From;
 b=dsqYm+NoUlZpxlsre8/ninHtAsLPpuA5GeG76ceKYSruhHR62LS0vHKwBN0Fvt84W
 qrMaQU64T9FsPIpaBXxnIAX/h1IFURq5gGBcOcZ6HOKl5zTKAebB/mlyH2hRJQ2vYP
 2zR6VBycETR8KzV2WlJR6qHxF7CCiOXHDBdNFllo=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 30 Oct 2019 15:19:15 -0700
Message-Id: <20191030221915.229858-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iPwKC-00BYvi-4S
Subject: [f2fs-dev] [PATCH] docs: fs-verity: document first supported kernel
 version
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

From: Eric Biggers <ebiggers@google.com>

I had meant to replace these TODOs with the actual version when applying
the patches, but forgot to do so.  Do it now.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fsverity.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index 3355377a2439..a95536b6443c 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -406,7 +406,7 @@ pages have been read into the pagecache.  (See `Verifying data`_.)
 ext4
 ----
 
-ext4 supports fs-verity since Linux TODO and e2fsprogs v1.45.2.
+ext4 supports fs-verity since Linux v5.4 and e2fsprogs v1.45.2.
 
 To create verity files on an ext4 filesystem, the filesystem must have
 been formatted with ``-O verity`` or had ``tune2fs -O verity`` run on
@@ -442,7 +442,7 @@ also only supports extent-based files.
 f2fs
 ----
 
-f2fs supports fs-verity since Linux TODO and f2fs-tools v1.11.0.
+f2fs supports fs-verity since Linux v5.4 and f2fs-tools v1.11.0.
 
 To create verity files on an f2fs filesystem, the filesystem must have
 been formatted with ``-O verity``.
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
