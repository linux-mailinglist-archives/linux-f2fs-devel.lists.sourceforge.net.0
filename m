Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D58DB2FF873
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jan 2021 00:09:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KKJFCOZfZ8UVBO5jmf6LXMa6FfmuYHwV4Ukihb0xRmA=; b=Fl2Stz1GuneqWXbAEXeNB9+oU
	Z+35DnTFS0Cb8E5gln6EFz02kXQz3vGdkOiaxQwNKIFVZ5WtHlQw//QuSL1NKyuzH0mqy0nw4EE8t
	7o2Sg6GAEU5jQZEJi8KudTMv1Cxw8wO2jp5BWXObMHy+R4MkqGwU3fJc5dl6hDgSgcvkc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2j4k-0005rm-IQ; Thu, 21 Jan 2021 23:09:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3VggKYAYKAJUHzINzI5DD5A3.1DB@flex--satyat.bounces.google.com>)
 id 1l2j4j-0005rc-V2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:09:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9aiKVbqQYlPIThgTQ82dzvRvheXuBHM9UbbX1NZZwXQ=; b=STuBK//AEYkVsuCwn6n8iSMsq
 NPfdRMJRpAp/6uVDODvqqoFKbLPXITUmJEta613rUcLpqXhapB5/o4IBjJCmL9pgzkSl0fQqY1lYN
 IsR2z3OGd1G+l86Kes9/ump2Eqj12IdCcoypE40PYsA7flJ+Uj5nHQfAATpeEPvA7Tco0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9aiKVbqQYlPIThgTQ82dzvRvheXuBHM9UbbX1NZZwXQ=; b=EB0UQEzJaLDx7NaOODThmvvYgy
 4v8BWLF3N/Ixwe2W7IWh2w/6ffGDGil8ZchULZSMJESAaUN+r9yA0oUK0wGwHcoMBHYQocNMQxoQB
 tXJp6DLv3CEt4ur13cby62S6UXDBaJPoBO+uAN3qHwmrIvOuiL4h1vvmRsBbgI8UdBgY=;
Received: from mail-qv1-f74.google.com ([209.85.219.74])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2j4b-006NNQ-Oc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:09:13 +0000
Received: by mail-qv1-f74.google.com with SMTP id f7so2557990qvr.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Jan 2021 15:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=9aiKVbqQYlPIThgTQ82dzvRvheXuBHM9UbbX1NZZwXQ=;
 b=PDwCDzUeRrtiDbzP8R+ZzFNkDbG94q487W93Pzf3+343mIFOYQTDkuNfSKH3Njmgwk
 Y1YPBbC6QmPRr4Alpg0Kx5Fm+v1IdyCTm0Yg+e6vqeauAts8m3c9NJ8uXTDII+85pRDd
 2zUYu2cZLlMKY7g0UyvFFR98CJuJd0CliHcYVfg1y0sE3TBQVxqi4Mn51kTipxxQG9lG
 SAQqsDMxW+8p4X4CfWdq2yc9jdOF0n7jVQ9JmayBBNV1rw54mgpTduxHdebVkhVQO2xM
 HGr4GC96GJ5HXmQ+RoPWclxW98DPjcCU93GdDJbQ7hQnKT4gdwYR/sa5P6nZIJsn4WW3
 1bXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9aiKVbqQYlPIThgTQ82dzvRvheXuBHM9UbbX1NZZwXQ=;
 b=iSIlkA1PsF5hIoqj3l8JEKek2Q8LridsIUQlPXZINsqlOLneZm/3a9272gNx84OsSU
 yhGWrfQ6tIhiO2JWyeRkb7SNo55bxD1K2fSVaqkWnWhW4Mnq4WI+n6Yqyxovsblv7L1+
 E7aIH2D1+JXYFzmOxGcRLQxeMo4MnADeA91OClD2b4EYPpPCwknbZXmPJEEzc6m5UZ5F
 YINV4hyy1k5hkBbqxZcVBRijKAsOIxsbBsu3Zq8xeCJOxKtqEepmPME17ZPHyeVUJqgg
 Kz3/cV2+SUvA0s6RfGo3b/He9Rl953gpuXnQmOx7Ujy9JYr/Z2A+0acqUO1v9JaoAFiN
 MOyg==
X-Gm-Message-State: AOAM530WWUCZO7lwCOvpc2oglIGVJQAGiha+UZ9t0jcZUbWA5uqcCgBT
 6IYBPkb8VeO8ak2GkZ+x7SLlulfps5U=
X-Google-Smtp-Source: ABdhPJwXyycuFLMhL7lKL1NWCjYBJKBgLzmFW+8+TaABQDqzzJuvNirg4GTlA554HwKIFpRGe7RJFJ2TUyQ=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a62:37c7:0:b029:1aa:22ea:537d with SMTP id
 e190-20020a6237c70000b02901aa22ea537dmr1803778pfa.56.1611270230981; Thu, 21
 Jan 2021 15:03:50 -0800 (PST)
Date: Thu, 21 Jan 2021 23:03:34 +0000
In-Reply-To: <20210121230336.1373726-1-satyat@google.com>
Message-Id: <20210121230336.1373726-7-satyat@google.com>
Mime-Version: 1.0
References: <20210121230336.1373726-1-satyat@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.74 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.74 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1l2j4b-006NNQ-Oc
Subject: [f2fs-dev] [PATCH v8 6/8] ext4: support direct I/O with fscrypt
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
Cc: linux-block@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Wire up ext4 with fscrypt direct I/O support. Direct I/O with fscrypt is
only supported through blk-crypto (i.e. CONFIG_BLK_INLINE_ENCRYPTION must
have been enabled, the 'inlinecrypt' mount option must have been specified,
and either hardware inline encryption support must be present or
CONFIG_BLK_INLINE_ENCYRPTION_FALLBACK must have been enabled). Further,
direct I/O on encrypted files is only supported when the *length* of the
I/O is aligned to the filesystem block size (which is *not* necessarily the
same as the block device's block size).

fscrypt_limit_io_blocks() is called before setting up the iomap to ensure
that the blocks of each bio that iomap will submit will have contiguous
DUNs. Note that fscrypt_limit_io_blocks() is normally a no-op, as normally
the DUNs simply increment along with the logical blocks. But it's needed
to handle an edge case in one of the fscrypt IV generation methods.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
Acked-by: Theodore Ts'o <tytso@mit.edu>
---
 fs/ext4/file.c  | 10 ++++++----
 fs/ext4/inode.c |  7 +++++++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 349b27f0dda0..77681ba5e6cc 100644
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
@@ -495,7 +497,7 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	}
 
 	/* Fallback to buffered I/O if the inode does not support direct I/O. */
-	if (!ext4_dio_supported(inode)) {
+	if (!ext4_dio_supported(iocb, from)) {
 		if (ilock_shared)
 			inode_unlock_shared(inode);
 		else
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index c173c8405856..e5407699ce92 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3482,6 +3482,13 @@ static int ext4_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if (ret < 0)
 		return ret;
 out:
+	/*
+	 * When inline encryption is enabled, sometimes I/O to an encrypted file
+	 * has to be broken up to guarantee DUN contiguity. Handle this by
+	 * limiting the length of the mapping returned.
+	 */
+	map.m_len = fscrypt_limit_io_blocks(inode, map.m_lblk, map.m_len);
+
 	ext4_set_iomap(inode, iomap, &map, offset, length);
 
 	return 0;
-- 
2.30.0.280.ga3ce27912f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
