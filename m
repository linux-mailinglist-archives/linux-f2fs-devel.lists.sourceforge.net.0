Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C06132FF86A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jan 2021 00:06:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=is1QNjyDpKhh+66nfH6LBbhf5ODWMK16GZ773OuElA8=; b=RLNUS424jOFGEG1e2uKiJ+3Fp
	OTotFYRqTuF7HqagWo667DPpZoAnCiXZ2ofu+nchONxLyLSPuXfssiUi6WFCi86VbCOCwsjn2rA1W
	eJDeOf4qXvaSjtA33GQU+oWyn1QeQocINgBwcZepWQYq1Xrf1a/c82831Udm2Qv8tXs5Q=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2j28-0005j3-3D; Thu, 21 Jan 2021 23:06:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3WggKYAYKAJkL3MR3M9HH9E7.5HF@flex--satyat.bounces.google.com>)
 id 1l2j1y-0005eh-62
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CZMyGWlKFZQTRektdrF/slvssAIzMQGtBohXi2xlJZo=; b=hxPJ28JG9FaHy7+WU8Xz/CPPI
 tcOnCskv+pilOX2VCgsKBmTtvZxUCmx7iSMTH7E43mhz/Cz0rGLfEkmnJfFV7RDmeuOfBwWX+wKX/
 Kf2x9DNkRedvDo4GscQAILsqRjAbQAbhS8MCiZMJsNYUTtWVMvFZCLhuNeNbT5y50T4ZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CZMyGWlKFZQTRektdrF/slvssAIzMQGtBohXi2xlJZo=; b=X0LIhv8UTmtyUUEZkcSfZsb1Fr
 GsxlSoEHxlj0T54tCOSGh1S6LqQQ3W5TQFjWWOqs/bG/iLqfkBl9Oln+vmzTsVK8HdilUV9rcfDoC
 AyGLog4/fAfysfeubJVay5GC/ngzuj22UtxlAwWnzSnuOTKX2rInaLRrHVGEgjyPaRTQ=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2izn-006HhU-CD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:04:13 +0000
Received: by mail-yb1-f201.google.com with SMTP id b131so3705818ybc.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Jan 2021 15:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=CZMyGWlKFZQTRektdrF/slvssAIzMQGtBohXi2xlJZo=;
 b=rrCQEqKVW1ZDhW4+xC0fjbzkbeY/JM71fiwBKXHsmFH4bwE2GxtDFk+U88/SUhdZrf
 m7wzzh7s3pqKnNjd10foCZJDNdK/vkuuRpPD69ujIVZe3eifyns8biUA8hZoFwPNKnDb
 Ba3v3G79vllZnXC34ggan7U2sUksnH545H+f+6bih9NuBbW12SjTSwsWplttdtVyg536
 GP0pN9LaqdE82PHlByUSvgve2pSMZuoQ6XfZu6yXARBBw+19h3asuK13j5tmK1ncQkcY
 r6k+aHDCwUHG8X/Lo9Rh9plI3yOEJxIzYYGPgdsvlhvIGQPysaEunA99fEdDpORoP0Ww
 T1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=CZMyGWlKFZQTRektdrF/slvssAIzMQGtBohXi2xlJZo=;
 b=VW9mHkMae9Sjc3kQpkourrmpjxdlhNi8zB0J8k25kk3xzDeMRGUy8RUSxCD+DyiyiV
 Vn+VyJiUM72YsIEwDn/0NEuhPKmjR2IH2KdWqpJyLyHBksz1fDvdMqfKmh/WXhI+HGWW
 SmX8xEiLo1c3LmjJxtArKm9ebiW2PjzBmqsLUQ/uhSn5cnV8nGLtY/STtnsB0i98n6YA
 aau59faMpYB+x/CZJTJofCLEnS3wKMBjMlzgRPTzhGli9L579WsYySMhIFK0YpzvSrZZ
 dTE8Tv/0tRT3WqlzaLKjVYNGaEpxF0Qd5Q9FvuAPxcSNpVEyReqeXfx58d4RHghSSScJ
 yu9g==
X-Gm-Message-State: AOAM533z40Y2d5g/Qh8t2YcEfyvCQkueU6MidMeOF1VFj2gx2AlJgxwy
 YJOhcrJ/JRiMYtdlC8GnYd5/6RSbaPo=
X-Google-Smtp-Source: ABdhPJwB0G5OeVzx657WHRwvKU6JZee+AtLxAL7APPuuacdYF8k9c5jXPavHspxiawBp2gvtwJK1mN7H78c=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a25:61c2:: with SMTP id
 v185mr2563181ybb.378.1611270234438; 
 Thu, 21 Jan 2021 15:03:54 -0800 (PST)
Date: Thu, 21 Jan 2021 23:03:36 +0000
In-Reply-To: <20210121230336.1373726-1-satyat@google.com>
Message-Id: <20210121230336.1373726-9-satyat@google.com>
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
 trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1l2izn-006HhU-CD
Subject: [f2fs-dev] [PATCH v8 8/8] fscrypt: update documentation for direct
 I/O support
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

Update fscrypt documentation to reflect the addition of direct I/O support
and document the necessary conditions for direct I/O on encrypted files.

Signed-off-by: Satya Tangirala <satyat@google.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/filesystems/fscrypt.rst | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 44b67ebd6e40..c0c1747fa2fb 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -1047,8 +1047,10 @@ astute users may notice some differences in behavior:
   may be used to overwrite the source files but isn't guaranteed to be
   effective on all filesystems and storage devices.
 
-- Direct I/O is not supported on encrypted files.  Attempts to use
-  direct I/O on such files will fall back to buffered I/O.
+- Direct I/O is supported on encrypted files only under some
+  circumstances (see `Direct I/O support`_ for details). When these
+  circumstances are not met, attempts to use direct I/O on encrypted
+  files will fall back to buffered I/O.
 
 - The fallocate operations FALLOC_FL_COLLAPSE_RANGE and
   FALLOC_FL_INSERT_RANGE are not supported on encrypted files and will
@@ -1121,6 +1123,21 @@ It is not currently possible to backup and restore encrypted files
 without the encryption key.  This would require special APIs which
 have not yet been implemented.
 
+Direct I/O support
+==================
+
+Direct I/O on encrypted files is supported through blk-crypto. In
+particular, this means the kernel must have CONFIG_BLK_INLINE_ENCRYPTION
+enabled, the filesystem must have had the 'inlinecrypt' mount option
+specified, and either hardware inline encryption must be present, or
+CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK must have been enabled. Further,
+the starting position in the file and the length of any I/O must be aligned
+to the filesystem block size (*not* necessarily the same as the block
+device's block size). If any of these conditions isn't met, attempts to do
+direct I/O on an encrypted file will fall back to buffered I/O. However,
+there aren't any additional requirements on user buffer alignment (apart
+from those already present when using direct I/O on unencrypted files).
+
 Encryption policy enforcement
 =============================
 
-- 
2.30.0.280.ga3ce27912f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
