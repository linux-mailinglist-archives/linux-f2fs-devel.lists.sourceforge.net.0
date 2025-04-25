Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA07AA9BC8E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Apr 2025 03:56:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u88J4-0001dj-PN;
	Fri, 25 Apr 2025 01:56:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <devnull@nl6720.me>) id 1u88Is-0001dT-4N
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Apr 2025 01:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G2d3C43MCjHpzpYqLV0qT/f0FcY3if/WiMz2izLI6oo=; b=jpLSIOuvS5I+L395F7R1QXyKmQ
 JfrCuYAqLD89AU3Eaj6XPfpdtJG56t3908Y5aJq/fNHbAtD+OdmqFSJ6ZinnAEaCgTZBTwywxSxa9
 Q1em2M/1TulV2ZzpDomcK3IHp0jjgt/dNHIOSa9sBCURh1RIyX99leE0faws8mUBnB/g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G2d3C43MCjHpzpYqLV0qT/f0FcY3if/WiMz2izLI6oo=; b=F
 e68a909va7wP53V0unvlVXXjiM4oZUtLgcPvlqBk508KZBJ04dObBorhIT1NKT3g3ztanG6TPIRkA
 wJQOfCVTmVXVfuLmvcaGWdOdw6JjV9FqPT/nIoPR/6M9ZvYFd5Ehc6jgXobMYA0a/t6XMdshQBrnY
 BH0WjC1jdNV5vSmU=;
Received: from dane.soverin.net ([185.233.34.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u88Ib-00085t-DC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Apr 2025 01:56:34 +0000
Received: from smtp.soverin.net (unknown [10.10.4.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by dane.soverin.net (Postfix) with ESMTPS id 4ZkFny4qPfz17y2;
 Fri, 25 Apr 2025 01:37:26 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [10.10.4.100]) by
 soverin.net (Postfix) with ESMTPSA id 4ZkFnx5zZCzHP; 
 Fri, 25 Apr 2025 01:37:25 +0000 (UTC)
Authentication-Results: smtp.soverin.net; dkim=pass (2048-bit key;
 unprotected) header.d=nl6720.me header.i=@nl6720.me header.a=rsa-sha256
 header.s=soverin1 header.b=LnGMOok1; dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nl6720.me; s=soverin1; 
 t=1745545046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=G2d3C43MCjHpzpYqLV0qT/f0FcY3if/WiMz2izLI6oo=;
 b=LnGMOok1Dg5oSAY/wFFtlP89x8rM3PsJRmzIJ1Q7wVFNlKhjAq3WkW1IBiwQMhIC9bgwCl
 MesKij89kH1bfgt7SbCvlfhiHDvagu8Y3N9GhG91vpoCfxpE0+598zks2dYwBQ6UTiyxWf
 4OI4HU5Q6Fd20Q9ZkEQwAZiF/1ZZmyg6LfN1UUtjzr/uJ37VlKjV7Bexd+etTTaLxfF/lA
 WulKJYF28a2EKQNVur59ocZh0bKjdBA5aX3vhd+6iIydcvPbfPsRBhQyG5pNYj5yvw80C0
 9xoemZ2zc/XTOj6eHJ5KvDRApMyehZfp/sdh5XUX6slHjA93YNkGLj7O8Negzw==
X-CM-Analysis: v=2.4 cv=I7afRMgg c=1 sm=1 tr=0 ts=680ae756
 a=gDLi7OiDnwTL5vi9sMxOwA==:117 a=gDLi7OiDnwTL5vi9sMxOwA==:17
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=NEAV23lmAAAA:8 a=n3qDh285BG_6IK3oIecA:9
 a=u4TTkWy4iRif133gqW0v:22
X-CM-Envelope: MS4xfI+OWgVRtxbC+EGiqtq/RhZlSlfvG9+kHzV0tC31ZRT/xHlcHKf6ZnavIXyBn/DZbLpda/C/6z5ehOOCTV6JkMuFVNxOG6MhIDD7v+KRMjDEnuySND4t
 3Qk0doFOUR8QcyCXSbaNlWcpA0P5CfDkl66QuI5gxztcaLfLBmRwzXjFI+tnVjF0kz4DoBrQQgqMrYyJL7fm7te1HKwhEWPoBkIEf6CTk0UPvnj1AoFb9wBT
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 25 Apr 2025 04:36:23 +0300
Message-ID: <20250425013623.918150-1-devnull@nl6720.me>
MIME-Version: 1.0
X-Spampanel-Class: ham
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Some drives operate in "512e" configuration with their
 logical
 block size set to 512 bytes for legacy compatibility reasons while providing
 a more optimal 4096 byte value as the physical block size. Since the physical
 block size is the smallest unit a physical storage device can write atomically,
 prefer it over the logical block size. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [185.233.34.11 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [185.233.34.11 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [185.233.34.11 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1u88Ib-00085t-DC
Subject: [f2fs-dev] [PATCH] f2fs-tools: prefer physical over logical block
 size
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
From: nl6720 via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: nl6720 <devnull@nl6720.me>
Cc: nl6720 <devnull@nl6720.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Some drives operate in "512e" configuration with their logical block
size set to 512 bytes for legacy compatibility reasons while providing
a more optimal 4096 byte value as the physical block size.

Since the physical block size is the smallest unit a physical storage
device can write atomically, prefer it over the logical block size.

Closes: https://github.com/jaegeuk/f2fs-tools/issues/29

Signed-off-by: nl6720 <devnull@nl6720.me>
---
 lib/libf2fs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index d2579d76a5c7eaf141dc8aad11c176eeadabad83..040ea4bc87288fa075cb4bf51df08b9db28a65b3 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -933,10 +933,15 @@ void get_kernel_uname_version(__u8 *version)
 #define BLKSSZGET	_IO(0x12,104)
 #endif
 
+#if defined(__linux__) && defined(_IO) && !defined(BLKPBSZGET)
+#define BLKPBSZGET	_IO(0x12,123)
+#endif
+
 #if defined(__APPLE__)
 #include <sys/disk.h>
 #define BLKGETSIZE	DKIOCGETBLOCKCOUNT
 #define BLKSSZGET	DKIOCGETBLOCKCOUNT
+#define BLKPBSZGET	DKIOCGETBLOCKCOUNT
 #endif /* APPLE_DARWIN */
 
 #ifndef _WIN32
@@ -1050,8 +1055,8 @@ int get_device_info(int i)
 	} else if (S_ISREG(stat_buf->st_mode)) {
 		dev->total_sectors = stat_buf->st_size / dev->sector_size;
 	} else if (S_ISBLK(stat_buf->st_mode)) {
-#ifdef BLKSSZGET
-		if (ioctl(fd, BLKSSZGET, &sector_size) < 0)
+#if defined(BLKPBSZGET) && defined(BLKSSZGET)
+		if ((ioctl(fd, BLKPBSZGET, &sector_size) < 0) && (ioctl(fd, BLKSSZGET, &sector_size) < 0))
 			MSG(0, "\tError: Using the default sector size\n");
 		else if (dev->sector_size < sector_size)
 			dev->sector_size = sector_size;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
