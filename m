Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DAF21A810
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jul 2020 21:48:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AZCg3NKsW3LNZHIxHL0tbVasnX7mIeomS9RvFrqnPRo=; b=YE347tnE6TNF7Th5n23H/1lux
	v5/tjFHY1TvseqfkWvmTFVGlqCNqj+S2q9zDU0dLO9LqFIS6TLi4lr5m6mFSndTRUK5tp0pOY4t8R
	Vzld7qSYyTyM9RvT8mYrKCPFZkTOGYbGo+W2/uZySgtP2UpNgSIf4XjzgGmCiRaFhOvXQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtcWi-0007tW-0k; Thu, 09 Jul 2020 19:48:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3cnQHXwYKAHcnVotVobjjbgZ.Xjh@flex--satyat.bounces.google.com>)
 id 1jtcWf-0007tM-F5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 19:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rwbjEFtn1GWMpUE4S/kWQzWtXcP4lb72aoJySrvCSqw=; b=f1B9NQmokqT+mMFiB6Km0VVW3
 RTVzJhUPfrg2Ac1+OqebyYNtI3Rsy/AVBT++XMAsJ0RccraYevltmu4+kWW8E4FbZIs7pdmgj2C75
 bSwPZmWGWE0KN/nA93Zv9nwTG+uEHwDCm9uRt2dx/UbiZ/QMLRrD7bFIoK5hY8QZnE0Hk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rwbjEFtn1GWMpUE4S/kWQzWtXcP4lb72aoJySrvCSqw=; b=O9GCkc4X9OZdQOAJGATiDEaSBk
 Z5vaa6A/G8uhaT/O20ZygcicJJ3Ra1pBMEQonbzXOIKRXRT+U47pPV1SwjtcreHojgS0FFSWZGoOv
 N/LS2AmdAnkHFHrNyg8KXQNp5gX4YWpDquXpWE0I6vGK+LaHdDp2rHfD0w/6jcGYFKVk=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtcWe-001DCk-7D
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 19:48:09 +0000
Received: by mail-yb1-f201.google.com with SMTP id r17so4091031ybj.22
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Jul 2020 12:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=rwbjEFtn1GWMpUE4S/kWQzWtXcP4lb72aoJySrvCSqw=;
 b=Ni3dskATOxYJ3Tcou/e65RLNqvkujfDEqEt8oCq4+JTTsuIx3HbTN0WrZ9IycRBL/O
 TJL2j7H0gJ5dCFtN9P528A9cSXAEEFM9S/d3qQ39Blq6q6GXsqpcsUuQxmLEnMSc01Ct
 IzXeUSJ4rafu5s+r01Of1jOoVwyRm/EY4m32sYcxbDTWtfWKK3J5R+N3r/qbdUdvnwoo
 k/9hbVc5Xo59Cbat+Kl6P2i5mS9X0PdbksquM3NIC/nnSiK39eepPvZwPiAmftVMoD9H
 1pescv+NQm6GgJGb1DJMeV28SVU4y756tuYAb5GrroFxPRMzWFeqjuqEB5PaD41tHPWV
 rpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=rwbjEFtn1GWMpUE4S/kWQzWtXcP4lb72aoJySrvCSqw=;
 b=MetRTovejwk6BiLnlUHTeJ/4PXAZxIR8cwVPaguM0g3wnmJoY2G6KgwO7TPGfnp6me
 Wr8LKIttzhqkvrgn2na4xCsExAe2I7WPLWhUCkc7wGGwxRBb4XDpxLXy5uYHvrvavqt8
 BksMoukO2Y5DAZm2AEzlqtFlEEEtlMmp4pZP6k8cX1J+IYzwgXYI/3eCfVp0oN11GtnI
 HVij/cwkhoA6nT8qarcoqh6hicvequbZzMqrNWPvo5ONPv12vu6/H37fKuLvCb369Tj+
 Hu489XED+PU31P8Zquf4MId+BLV8cC1AjD/pVVXJQPeq7Hm8V42OQwyICK3ljAUgWOzs
 qE8A==
X-Gm-Message-State: AOAM531IsIxQErAtQXZoGcP9eZrYp6KyNpPQ1qA9mV4gGDbFeMxgwKrY
 nyHimwxydKJb9rHYebKwvifm+nABVvw=
X-Google-Smtp-Source: ABdhPJx3NvWhZ+XQotweCss427Fvg18zXF043v/X5vRII5O4su0czV7qo/Ra6b6aKypDdPmHsc2gJLC2uUs=
X-Received: by 2002:a25:5d5:: with SMTP id 204mr99009732ybf.24.1594324082481; 
 Thu, 09 Jul 2020 12:48:02 -0700 (PDT)
Date: Thu,  9 Jul 2020 19:47:50 +0000
In-Reply-To: <20200709194751.2579207-1-satyat@google.com>
Message-Id: <20200709194751.2579207-5-satyat@google.com>
Mime-Version: 1.0
References: <20200709194751.2579207-1-satyat@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtcWe-001DCk-7D
Subject: [f2fs-dev] [PATCH 4/5] ext4: support direct I/O with fscrypt using
 blk-crypto
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Wire up ext4 with fscrypt direct I/O support.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/ext4/file.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 2a01e31a032c..d534f72675d9 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -36,9 +36,11 @@
 #include "acl.h"
 #include "truncate.h"
 
-static bool ext4_dio_supported(struct inode *inode)
+static bool ext4_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
 {
-	if (IS_ENABLED(CONFIG_FS_ENCRYPTION) && IS_ENCRYPTED(inode))
+	struct inode *inode = file_inode(iocb->ki_filp);
+
+	if (!fscrypt_dio_supported(iocb, iter))
 		return false;
 	if (fsverity_active(inode))
 		return false;
@@ -61,7 +63,7 @@ static ssize_t ext4_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		inode_lock_shared(inode);
 	}
 
-	if (!ext4_dio_supported(inode)) {
+	if (!ext4_dio_supported(iocb, to)) {
 		inode_unlock_shared(inode);
 		/*
 		 * Fallback to buffered I/O if the operation being performed on
@@ -490,7 +492,7 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	}
 
 	/* Fallback to buffered I/O if the inode does not support direct I/O. */
-	if (!ext4_dio_supported(inode)) {
+	if (!ext4_dio_supported(iocb, from)) {
 		if (ilock_shared)
 			inode_unlock_shared(inode);
 		else
-- 
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
