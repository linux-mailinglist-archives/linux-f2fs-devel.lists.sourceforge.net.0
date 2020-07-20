Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9068E227477
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jul 2020 03:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xcLXFUUMgp7htsqf61QifpRm2vdZZEALnpwL1/U+Mi4=; b=gl3i9c205gVqPthSCWMwSReio
	Kl2xqnxtjCb1HmWzOAr1/UIxFC7cYqq6wh8HEZnRnpKrOV/fuOZl4/cGN+MRIH3RqNQwRs/arYAES
	wdTjOPFOe7hgJI80AdxFipRgtDXZZ8EvZQtdzgDDzzN/3wr3wdS3RDMS4cqXpfJTu1CMQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxgyC-0003Gz-Ql; Tue, 21 Jul 2020 01:21:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3zSoWXwYKAHoqYrwYremmejc.amk@flex--satyat.bounces.google.com>)
 id 1jxgyB-0003Gs-JN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 01:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E/vVSGidxRNqfgFvT7W0V9puYBqKI9SZ+5JR8j0m+58=; b=jNh6IhH6CiD4rIPD0tPGpLPGe
 wHRO6Q0120xoE6Ryas3wM1QvLKcrXMATbhsAKhBC32SP1kgiEsMWIlNUbCZbTnfEjrzO8LUX09Uj7
 bwF/AykQMyM9JKAE2ImXMDx7XPn8lzSqGQwpMwWiTgm2aQUXSfSjoWnFXt1cu7PFXAdJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E/vVSGidxRNqfgFvT7W0V9puYBqKI9SZ+5JR8j0m+58=; b=M6wZbeaLeMsR7TqL79u1DwFRz6
 9S5/1/dPXZqNXp9sd3bgi8GXuN9QEzkSnWf7Gv31B+mHjqxpQAimPvQbcGOxV3NjEyJjbcQ4xa58C
 veMUuoNre9YTMELuSmG5v6uo20RNn44ALY8TJU9ZaOvqxaBo/jRfj09BC2M6XYaiC1aI=;
Received: from mail-ua1-f74.google.com ([209.85.222.74])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxgyA-00ET9M-6k
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 01:21:23 +0000
Received: by mail-ua1-f74.google.com with SMTP id h10so3347421uar.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jul 2020 18:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=E/vVSGidxRNqfgFvT7W0V9puYBqKI9SZ+5JR8j0m+58=;
 b=g/MoPPQO9uYrVCFue0RQVPoXmBbud7mYzW1uO00zgttEFNcBugQhJLJ0C4bLk7QMvj
 kDC/xn5b/hdZ+iLXzsYk/gNFTa6oP4Iy0Kq0MDZZYT/+Rv7z0ImMqKnxNgcrPPK5ux/Q
 /2QYuvTrbSQaOoUT4k0leV1KIHgv/PMsBeUZonX73xVlOHRzBVBFi9AAc6DEsH+2oLpX
 RtCsnGrKjhiKmt+u0hNfDmT1HQkIhvm5y2ydBSWgsnZ5BWastbRHvVHFo3TUw3hYdRMw
 nOe1InbB5hOZ5z42QMPclDxIirMKAefHotGk5eRtZM4qjRJHULvd9dCL9vPpNut3JATv
 teLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=E/vVSGidxRNqfgFvT7W0V9puYBqKI9SZ+5JR8j0m+58=;
 b=qSz3n2mpVzw7s6HmzCx9WpSf1IroMGK9UgMS3aW2CoQklWuypGMnNEqWS938IWXufH
 d7Rb7796p0lY0uXa/KwMefpjugB2fiILX1irs6/1H4t3Y4AXQpC1JsSkEyrENSzS1Kwb
 kzPALVcX/wwWhaLinDJFiH4FPnYBMPcSfooTctj+5VYdRA6sCI0UG8dtnSVD3s18i43F
 f6GyZ5wWZaYqzfDgYxpPuA7lz0mpUv06bu4GUjM75u85SUZH5OnSkUhRBuWwytzb3a4Z
 jYSYoXjbCHNhf8fTMjm8Bwp0a9d1p5W4XBe6BBAW1l5aSRL66z6YWS2r7ug2S3DfbaNU
 nRBQ==
X-Gm-Message-State: AOAM531KV04YVjgIhZeJi05brXa/uX8us7SE1KVLagAnxqXeTAQBpUKl
 qprfoCYEsGHrXHAHR4BnE/yNt7bw62w=
X-Google-Smtp-Source: ABdhPJxp7mXopL0NljWOXr1p+y9+bz+KQoO/+c618p+nfllpGmix63TA/BESv20fd6MJMRipfMl8AeBqQ/w=
X-Received: by 2002:ad4:5a46:: with SMTP id ej6mr24289285qvb.52.1595288269050; 
 Mon, 20 Jul 2020 16:37:49 -0700 (PDT)
Date: Mon, 20 Jul 2020 23:37:36 +0000
In-Reply-To: <20200720233739.824943-1-satyat@google.com>
Message-Id: <20200720233739.824943-5-satyat@google.com>
Mime-Version: 1.0
References: <20200720233739.824943-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.2 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.74 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.74 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxgyA-00ET9M-6k
Subject: [f2fs-dev] [PATCH v4 4/7] ext4: support direct I/O with fscrypt
 using blk-crypto
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
Cc: linux-xfs@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Wire up ext4 with fscrypt direct I/O support. direct I/O with fscrypt is
only supported through blk-crypto (i.e. CONFIG_BLK_INLINE_ENCRYPTION must
have been enabled, the 'inlinecrypt' mount option must have been specified,
and either hardware inline encryption support must be present or
CONFIG_BLK_INLINE_ENCYRPTION_FALLBACK must have been enabled). Further,
direct I/O on encrypted files is only supported when I/O is aligned
to the filesystem block size (which is *not* necessarily the same as the
block device's block size).

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
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
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
