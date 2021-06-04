Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9723339C29E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jun 2021 23:39:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nzzHa8X3p9MsP9PeEmGHEQzk/maYIg2KMg+QcugoyYU=; b=atJ7vZUM8ATq/VJp7O2RKXJ2c
	b93Zr3GpdtAAixGyFhgc07xJUV034SZg4EaCeTarEyvCEfbIogYKYYZQhcnRbXeJqRHyApvVlXsbZ
	TnKmyXWyNetASCWKI8rhS05fWl4RE/Bz2GHa8NcA4kv6sgo38RzyYsYUGrVRloi2Mcx5E=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lpHXc-0005Jk-0y; Fri, 04 Jun 2021 21:39:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <3g5a6YAYKAKYYGZeGZMUUMRK.IUS@flex--satyat.bounces.google.com>)
 id 1lpHXY-0005JW-RB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 21:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H6v2kY5YMxOOHLcLSDdX+aEzIdLNYM1I0EjO3txeols=; b=gG85hsubbDyQfKMV9sQ21M2nL
 QlH0Eg0Kh6lu/IKQKNFiaae0p0ejLEPPPF+iBIVADvIxrglpta+h0nyzu4aGIXqbqwOfw57lHRKwv
 hncg74OM5x4Xcp6g78bs2o6ktEoYVbs6pRZVVP3nWicSSxU1wczu4+I0J2u8C4bk/qtqU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H6v2kY5YMxOOHLcLSDdX+aEzIdLNYM1I0EjO3txeols=; b=HO0xfUj5XgEftrq98kc1PWJy4b
 7Ab1D82MVS5+ETIZw1Gh7FPJxxDNFCyx7LTkapQmsrKwXwG8C1TuO6FLZGXdsrckFYEY+93xQ1xl/
 T71wu3SOGxPdBKmmmLIPat+6SbX9Q4H3gIFrdi9h6CSevNoB/lEzyzZkli7s8OtkzIDU=;
Received: from mail-vs1-f73.google.com ([209.85.217.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lpHXQ-00AsXw-Oi
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 21:39:42 +0000
Received: by mail-vs1-f73.google.com with SMTP id
 v15-20020a67c00f0000b029023607a23f3dso3473656vsi.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Jun 2021 14:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=H6v2kY5YMxOOHLcLSDdX+aEzIdLNYM1I0EjO3txeols=;
 b=v1jZNkJYmY3AfKMvuvpfH3JJQcdV29JlvKaiWzw7Pj5dPY3hbHoKohjT3M1SqQ5FFz
 G/tUkYjzmPiXLBY61CpYrnU7ZI7tvTpp2CBXGHl/LyoFPLLKRvPxUy+N+cPRdapDxLeC
 Z8Eh4SoflqHue1COLbTamqv01t/mA8CE1LJwQOBgEgyAryAOTaY7MJlPrjluNTGeAint
 /gc5P2jZaZ3YZjQRytNEvbbEzCD+sJ/qkVZK7oysVmpkIMUsp5TFiGLVJL+HI3o0vFAa
 ewZH43cN3mTTq1bKsTBmIoWlxjxTnjXv2d97I3HYY+lA+lAakvigohnk7CHOmQBQGEy1
 o3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=H6v2kY5YMxOOHLcLSDdX+aEzIdLNYM1I0EjO3txeols=;
 b=QoWVSxwe2mcKBn1EVlEKVKujGDaTB8/ODL2ellX6HuZtkbP5josiV0Jjacew+mY8Kb
 eF2g4Tt3Sk/DADGXz3ETcvq/qCMKW+cDvboqu0K+EpwXqxlJs096m409Uwv54mOXLhXX
 Te7N4I00uMV+dMAa7YwoNIaJARFZcPLoX03dUAsolXXlaYcms9cQ6W3muHrF+uCOiRyT
 u/Z9xJ0JELek9EKq1DeQfi0+foItiW7TwgXZtMXViOkoUJ39NnArPVf5BX76i7uejtKu
 MqlkKPFz889v9NTvadBoejQfZ9ruZTsSSSyaZfJsVK5z9PIsussq9pV0cp/X/qgZ9w22
 htmw==
X-Gm-Message-State: AOAM532ZsAFTookXJXSPLI0kUrmzCvUGo0TSpIKJmuG8MBoGj3O+5j2Y
 I/4YIE2BXkawy9qKFv2/OUSxmqRlmqU=
X-Google-Smtp-Source: ABdhPJw2OZI8kOjDJIkhSAHFElaeOr1IGaH93bDYTIxiQQ+b217XZW3IqkglpAxk3/foE4UT4038CtgtNRs=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a17:902:6acb:b029:fc:4d8c:cfba with SMTP id
 i11-20020a1709026acbb02900fc4d8ccfbamr6249435plt.29.1622840963331; Fri, 04
 Jun 2021 14:09:23 -0700 (PDT)
Date: Fri,  4 Jun 2021 21:09:06 +0000
In-Reply-To: <20210604210908.2105870-1-satyat@google.com>
Message-Id: <20210604210908.2105870-8-satyat@google.com>
Mime-Version: 1.0
References: <20210604210908.2105870-1-satyat@google.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.73 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.73 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1lpHXQ-00AsXw-Oi
Subject: [f2fs-dev] [PATCH v9 7/9] ext4: support direct I/O with fscrypt
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
index 816dedcbd541..a2898a496c4e 100644
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
@@ -511,7 +513,7 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	}
 
 	/* Fallback to buffered I/O if the inode does not support direct I/O. */
-	if (!ext4_dio_supported(inode)) {
+	if (!ext4_dio_supported(iocb, from)) {
 		if (ilock_shared)
 			inode_unlock_shared(inode);
 		else
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index fe6045a46599..fe8006efb5ef 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3481,6 +3481,13 @@ static int ext4_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
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
2.32.0.rc1.229.g3e70b5a671-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
