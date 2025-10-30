Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F143C1E747
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Oct 2025 06:47:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qgm3srT6m4IZ/zmIZIkMOrAd75Klzs/rNPJnCl1Yr3w=; b=DPZStaO8rBYxoimWWvOaJJSHcm
	y4rk69ZIuVPJ86yTGJl3xqH0t5Quxq+ykV9ti7bpGyLJyTXriK3At0ydyslKv+aTPCt0IRfVT6sAe
	TyV/laNoyAHtvadmdi+oDT1t80RwPxw9CTOAtOdaNT4gAyouIsAKIEna/Pa5QObSGqw0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vELV9-0000rt-Rn;
	Thu, 30 Oct 2025 05:47:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <32fsCaQsKACwRWIVVMKPQMVOWWOTM.KWU@flex--joannechien.bounces.google.com>)
 id 1vELV8-0000rh-QV for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Oct 2025 05:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5nSia/EkEjOq1PfGwKO1FOeTRUFNCvI3AbrOEQ1lnPc=; b=Nl6y2egU+NsyWV5H+V82khxl8l
 6yA38OnreWtXJXLlktvXNKMMLanG333dIR/TMzP+y6AJXGCYl/yvVlwE2MEU93JOnD8fuq5eTsJq5
 UYsDOdxwGy4Mt5i6wANZ0gtn31cFBD8jFMGAgL8eaRmn+fyj02M6vum5nJqDeVd/wLJI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5nSia/EkEjOq1PfGwKO1FOeTRUFNCvI3AbrOEQ1lnPc=; b=j
 W+8pGSg/0oIzWIycg4jMcBPsD8mg0t+9LciGXbJXw5nB/4s9MfmohPstQRSJ3bebOjzqTHyw/0MHg
 eCVx9Y3Skq0U/99Z6wsTElKcydKqW2TK3aEcrsOXfuXC+zc+iQh0GOmjKsUb01QOYklJoBnrs7yLp
 wQtIdNUnPwawV9+M=;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vELV9-0006xE-9K for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Oct 2025 05:47:11 +0000
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-32ec69d22b2so661644a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Oct 2025 22:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761803225; x=1762408025;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5nSia/EkEjOq1PfGwKO1FOeTRUFNCvI3AbrOEQ1lnPc=;
 b=l0xt2XlzAY3Fbr0BMm7oqd3gqH2b3njrujTIJbHM8SfrP8utIgLpKaV4KijGcDIYCR
 xeXW9iCqimiKFj8BKYm6F3uU/EHJOX4v7qj6Sz/H+3wTiPurtdFu8I7LkqzrNGjgFG2u
 my6ykIrzuvIiPlQoBuXelO4jKYwilzQddICXS+ayuECUVcFlq1WKwUgMm9G48bkj6MRb
 AekjIyU3HuEDES9qH1dU1JGg4Wiu+xPm4f4uUNzeLZ8iqR4Nu8m8dp01i0y7mT+9DxwB
 e7hly5aDOgZ/vxAWxnxPSMLXVlyHT96owP4YTrfdAnT9ffgbliUv4ZMmtysf8mXKlSAx
 vTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761803225; x=1762408025;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5nSia/EkEjOq1PfGwKO1FOeTRUFNCvI3AbrOEQ1lnPc=;
 b=AiS1EXWf4Nf2bcxV3Px8gS8A36zFMwIA/eQdHzbzIv9yKbC3vET2Vwib8ozsAqqd3+
 6ackfFowvfKPg79OyDIcaOz8TL8Et2EStLI2EDCSJ0m8S3Dr4NoR+4xobeIGUtDxbMpI
 hj5H2XD/venH7MzZ3gmsgccJMmMGfmddyvB2/j2zg9Jt2p3ATIuzjs+sxDPZRS5Kw2ZN
 XwcSjDdHZFc++W4EqV31/HZiN3CAzuqPN6DJChOk1jRSUBC+7qb5cToLv/DL9F/P7x9C
 tuhrYhkSRNGOQyWHUbaeP4B2hWB4HYlQklPxj6sf2FBsvcA/1/GBHQUluKJbRwCpZNgv
 B5NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSppNIkFuSvGuR5FQEmJBeDETvvVpXz3UduI17glqNf0fOBRZVqKIYtmJXyATHXPgZrKwQTtVW24d58Zhu8Anm@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyaCqyVe4o7qXzr/5i6PsftNr5qSgblBTHe9z4z/6wftiMkf+zc
 q1WNrl9Ez2IgEvHIZab5/7S94NqEbnrIfeluZ5wkgFPiyGtTY1o86NtNJppNj9kebil3Ci+qjB6
 FGIOfAjA5dDpzF3YDcyyMcBQhIQ==
X-Google-Smtp-Source: AGHT+IHEs1oYAPW+Nqb69swABbBSDxauRlgHBigamCQlZkyY/7LcZgCc2+Q5Oki8i+hQFYOXic3py2MMhD0vZsiOGA==
X-Received: from pjbnm10.prod.google.com ([2002:a17:90b:19ca:b0:32e:d644:b829])
 (user=joannechien job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4c85:b0:33b:e034:c1c0 with SMTP id
 98e67ed59e1d1-3404c45284cmr2349460a91.23.1761803225587; 
 Wed, 29 Oct 2025 22:47:05 -0700 (PDT)
Date: Thu, 30 Oct 2025 05:45:40 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030054540.278518-1-joannechien@google.com>
To: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently,
 the created files are filled with 0. When filesystem
 level compression is used, they take up much less space than expected. So
 the final fallocate does not show an error. The created files are filled
 by /dev/urandom instead to ensure they are not compressed. This way the files
 take up the same space whether compression is used or not. 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.73 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vELV9-0006xE-9K
Subject: [f2fs-dev] [PATCH v2] f2fs/011: use random data to avoid file
 compression
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
From: Joanne Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Joanne Chang <joannechien@google.com>
Cc: Joanne Chang <joannechien@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently, the created files are filled with 0. When filesystem level
compression is used, they take up much less space than expected. So
the final fallocate does not show an error.

The created files are filled by /dev/urandom instead to ensure they
are not compressed. This way the files take up the same space whether
compression is used or not.

Signed-off-by: Joanne Chang <joannechien@google.com>
---
v2:
- changed dd to $XFS_IO_PROG as suggested by Chao Yu

 tests/f2fs/011 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/f2fs/011 b/tests/f2fs/011
index c21cb586..07c94d8c 100755
--- a/tests/f2fs/011
+++ b/tests/f2fs/011
@@ -36,7 +36,7 @@ pinfile=$SCRATCH_MNT/file
 
 # simulate fragment status in f2fs
 for ((i=0;i<256;i++)) do
-	$XFS_IO_PROG -f -c "pwrite 0 1m" $SCRATCH_MNT/$i >>$seqres.full
+	$XFS_IO_PROG -f -c "pwrite -i /dev/urandom 0 1m" $SCRATCH_MNT/$i >>$seqres.full
 done
 sync
 
-- 
2.51.1.930.gacf6e81ea2-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
