Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B369B22308A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jul 2020 03:41:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xcLXFUUMgp7htsqf61QifpRm2vdZZEALnpwL1/U+Mi4=; b=Dyb6ghdmBRv61PChc1CrKk3cd
	4wMekNA69xgd+e0gwsoEvUGHy5zBL+mBFtmAXX2H2U68DNwD/Q2LyWMtw1sm84ubTT4ytyPY5LRb1
	FA3bnFI4NB0eCR2gWpNExwpa0WNTexSdnciGYFGtIdWXf27wVXMb8MSsCXmaTOBelP/Eo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jwFNS-0002iH-UN; Fri, 17 Jul 2020 01:41:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3ZAARXwYKAKcZHafHaNVVNSL.JVT@flex--satyat.bounces.google.com>)
 id 1jwFNR-0002i9-HV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 01:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E/vVSGidxRNqfgFvT7W0V9puYBqKI9SZ+5JR8j0m+58=; b=dx2eCW0ErzsEmi+SPb18e0zBn
 nEMY/Nvw+qVewj3sONn5xnX9ymt/2gQoaTCybd/0Ty9PMOyAMyy/eqNUa39sqvjKrOJWxPOHjDvKd
 5o+oGW7REq8LIZU6epCyj4u3TSa3mg/isqVaboYzs51viBX8cOVryXAlEmEV3/QfqVV7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E/vVSGidxRNqfgFvT7W0V9puYBqKI9SZ+5JR8j0m+58=; b=ZnwZ2bNKm9yo3LzQR3PcGp1W0m
 qPlhXLqQoRct6hZy8XHqiX7xmANxPZDeJy+kDogJ3k693GiYd1/jxO/gJL/Fx605Y0GWesLBtAhHz
 S37AqyurU38LQ3UuwRI3l7adNSbw8Tvvs+IyfWSzSluQATs86RWaVGv9Zk0UmXMCO7To=;
Received: from mail-io1-f74.google.com ([209.85.166.74])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jwFNQ-00BLpW-AJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 01:41:29 +0000
Received: by mail-io1-f74.google.com with SMTP id l1so5224200ioh.18
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jul 2020 18:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=E/vVSGidxRNqfgFvT7W0V9puYBqKI9SZ+5JR8j0m+58=;
 b=ZcYDTvcfLLpu/jhtpmOZTX1yip7PM/LKW+mqaazTmFRD19tgdynOHn3dvFmYrGW/EU
 3OGE6491fFJOHWChT38oVFGgJgqcZ1z9qC05QU8JraayXUwgfZmczmipgbR37elMel8Z
 zNb7TYC+lWvWJJ6SnDNsPiAtosseBQpBY7N1qfVzLHJNWx+JNLHhks/B90rtrKlzTw2Q
 QdJ4Rgwpk7ZYwleZwGq00b+zq66rjpmtFE10TZhsYG25d9JTk8G6JQVQC1rLY+/3pY2o
 8blcSeqgKqhLSzrKduWn3JF/DTEgh0C9d7W/d32ySDrix8TvV4yJXo/ftZgek76k0P/c
 Y1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=E/vVSGidxRNqfgFvT7W0V9puYBqKI9SZ+5JR8j0m+58=;
 b=eOVORbhHEiitntRNy/owhKkG4tDE/y9Rf4lmJpyrHrg5WBbiJ2Zqshkp7UMuqhWy3x
 qPrOc+VThiZuHwzMzQIL4IIqqTKPndHxhwKaQQMAX6yvnQ/NI0J5Ys3ZjPshK/PNrBT+
 0mACL+LT44znsLB9QUqmD/8EMo1TDSEWAWYpEuKkZMIQCHB6Z8/0z8Kxgt4MdJ5O2JH6
 k6F+ojGz8MZo2ZbP96u6L5rNSbi5KP9cfG6KEf2WS0cApDmMfLVwQzs0s7mAFklChHdb
 bRJVsd6wHzixPoqgDuXeSoOwr7TyivFyOYi2Vl0SYS6dlzBNnEu8s60JS01uP71scEC+
 Ybpg==
X-Gm-Message-State: AOAM530T1l9dojjvoCia35j9jx3S8SizNILb6g2WvG/SBpm11dOzgjX5
 y9g9MeeYMUY+nR+69Sqsvkd/RlVWnk4=
X-Google-Smtp-Source: ABdhPJxblkVinfK9/GjEu/MeJLy/xcw1zo2TEXIQwGlWkq0fWav4MrbEVMKPE2WnLaQ1sWXSffDb1SKbb/Q=
X-Received: by 2002:a63:225d:: with SMTP id t29mr6933840pgm.374.1594949732647; 
 Thu, 16 Jul 2020 18:35:32 -0700 (PDT)
Date: Fri, 17 Jul 2020 01:35:15 +0000
In-Reply-To: <20200717013518.59219-1-satyat@google.com>
Message-Id: <20200717013518.59219-5-satyat@google.com>
Mime-Version: 1.0
References: <20200717013518.59219-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.74 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwFNQ-00BLpW-AJ
Subject: [f2fs-dev] [PATCH v2 4/7] ext4: support direct I/O with fscrypt
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
