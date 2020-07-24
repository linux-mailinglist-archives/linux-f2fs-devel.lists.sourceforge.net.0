Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2724D22CE1C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 20:45:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0iK5hE3Vs7/jxIjCKclNDfMiSfzjEUxnLURo8N97DbY=; b=liKici59oEyXWq9ITVbeFrAM5
	oS4L3J1LSVx18MJA0dcj6wTWMBXu2bHdUhZNggQnfc4j5gO7YxEE8mSJUj1z5VFq6kBsfZDrLZY1C
	MZcqhwhMtNgenYDBZ5purfz7eW6FTzFN6uNdX+XEzK1Coc+WnNOKF21gQmmoXCWqpEEKw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jz2hH-0003kJ-Uy; Fri, 24 Jul 2020 18:45:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3PCwbXwYKAAEtbuzbuhpphmf.dpn@flex--satyat.bounces.google.com>)
 id 1jz2hF-0003jH-Sa
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 18:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ak9b1MetrNwz8tkXgMNDeTUR8YoZBpQh5jjz0bYRY0M=; b=bgEDfl/aspv2GtNvAz0jVq3W3
 iv1+Om8jDcZutgVljLjT3Rvkv/1foG2JXKVMZI5ledS8/C2Uh65ySKzNsYtl9U+jutKQC3kHj/Zvu
 AweSbkTG9rwgcDOJowNPJf8bmOPa5dqhRzojf9vb07MWg+pYtu8EGiTQ9wRGevBxAvWDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ak9b1MetrNwz8tkXgMNDeTUR8YoZBpQh5jjz0bYRY0M=; b=kYdWPX853R1LlWTk6IcQfHmbz8
 uzZRL8LaK9AdTLa5waSiUY5cc4p6fVKslCFvZN76xzIj/3S3V5lCNlUmfAZ4/Q+++YdwtBrRx5CAH
 mV42qDc93ofhriE8jr77nzohc2u/JiS19GR2SiGFE4Vqm8XCi5SvX1rJmtgZrq2TM6iM=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jz2h7-00GEOZ-PF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 18:45:23 +0000
Received: by mail-yb1-f202.google.com with SMTP id 8so11468123ybc.23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Jul 2020 11:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ak9b1MetrNwz8tkXgMNDeTUR8YoZBpQh5jjz0bYRY0M=;
 b=ITpDF03zh4gAXQ80IgtXYXSVSudg/gU9rVN57XZQKro+oG5FczxsGGWDIk19KaZUlG
 Hkjz42c4BcWVc7yDHolMXgpncUUqKjalZEP7MuFByMe4pNel/xhE7ghREp4QClDZsKCO
 Ephfn9OUfGkQ4PQc3FpjFY9Q1OGvIPi/WWbgtYnXgbmI+ypPpmWm4E1cZWktwV5WV/Hk
 1r6DAzau+34Tj4JZDNQ+kk85DecV+mTqhpQFF3eVxMwgJIAB1/H/e1XTzvZ6sLHGhsNn
 MhBrQ+GdgjovyQoTISpziTf1X9MqGb/stJUXrK9lxtfQ2BpP77C5c3tsRK5M0QJCJHHC
 0gLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ak9b1MetrNwz8tkXgMNDeTUR8YoZBpQh5jjz0bYRY0M=;
 b=PADomI6K++n7uzxM3oY9nAd5q93lgtneCrLs7bl4ha0Ae3E52sZJXNS5pEGhc6Yrgm
 RCbCOMDhYs2hwGsCsEq+WqzjlXbZVLuEyLIMQUXtktcqKhYsEtNPy4+nyb1xbmfrf4zL
 IJIJXQHVcL0I2ZJEGOa6p23SrYjdDwJwqvNQwsmzCUWGT1keTlzwsTomYBDt7B/uhSV7
 ZSHEbR+7Q2qRyr8C8Y62zwgnpbKZx1x6s5kvWGTtR2jF5Tcs7a4yki/9TAGXw9Y54xWa
 I3PS8hGzwFZkZWesI3ukMoMzc+hxVMaU/bv+nMIj7sorT7L9kIADdDHhUfPHOnB4NSab
 kYKQ==
X-Gm-Message-State: AOAM532e74G9dPOOrW4SaHxhYdVOjz7PSfzX727uPOFwGcoUcLfcNp7b
 mU3QA5CYwksTDCGMLyPBCUTSOQ7bM3s=
X-Google-Smtp-Source: ABdhPJwseKqiZHZW7R0lAN2FfflJ1727vAQQkCjVmAbzoVzFBnjTpAAyolnIjYFGGURfVI9rNc5tdpoHwlY=
X-Received: by 2002:a25:2b89:: with SMTP id
 r131mr16541745ybr.131.1595616316063; 
 Fri, 24 Jul 2020 11:45:16 -0700 (PDT)
Date: Fri, 24 Jul 2020 18:45:00 +0000
In-Reply-To: <20200724184501.1651378-1-satyat@google.com>
Message-Id: <20200724184501.1651378-7-satyat@google.com>
Mime-Version: 1.0
References: <20200724184501.1651378-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jz2h7-00GEOZ-PF
Subject: [f2fs-dev] [PATCH v6 6/7] fscrypt: document inline encryption
 support
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
Cc: linux-xfs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Eric Biggers <ebiggers@google.com>, Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Update the fscrypt documentation file for inline encryption support.

Signed-off-by: Satya Tangirala <satyat@google.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/filesystems/fscrypt.rst | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 1a6ad6f736b5..423c5a0daf45 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -1204,6 +1204,18 @@ buffer.  Some filesystems, such as UBIFS, already use temporary
 buffers regardless of encryption.  Other filesystems, such as ext4 and
 F2FS, have to allocate bounce pages specially for encryption.
 
+Fscrypt is also able to use inline encryption hardware instead of the
+kernel crypto API for en/decryption of file contents.  When possible,
+and if directed to do so (by specifying the 'inlinecrypt' mount option
+for an ext4/F2FS filesystem), it adds encryption contexts to bios and
+uses blk-crypto to perform the en/decryption instead of making use of
+the above read/write path changes.  Of course, even if directed to
+make use of inline encryption, fscrypt will only be able to do so if
+either hardware inline encryption support is available for the
+selected encryption algorithm or CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK
+is selected.  If neither is the case, fscrypt will fall back to using
+the above mentioned read/write path changes for en/decryption.
+
 Filename hashing and encoding
 -----------------------------
 
@@ -1250,7 +1262,9 @@ Tests
 
 To test fscrypt, use xfstests, which is Linux's de facto standard
 filesystem test suite.  First, run all the tests in the "encrypt"
-group on the relevant filesystem(s).  For example, to test ext4 and
+group on the relevant filesystem(s).  One can also run the tests
+with the 'inlinecrypt' mount option to test the implementation for
+inline encryption support.  For example, to test ext4 and
 f2fs encryption using `kvm-xfstests
 <https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md>`_::
 
-- 
2.28.0.rc0.142.g3c755180ce-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
