Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28075B2D308
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 06:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEryeyb8WsfhIWIOK+UoD99hd4BFca7gj6CX3vshyC8=; b=DWxE2erBoIY9l9xKKL3j0Lzf0H
	IAU5ctRbLs2kVdBBvAC5xKw+TYWc64bOwMmNDhaO2jix+aoMiXV2HGIIfF0uf6ymZ3/iHYC+JQ3oO
	D13T4MlWttUatpqDe9Oa4dB8LzcKhgYfRoSHqIL0Ph6Z4wzd5PjM7DRPXgaI7Svu3GQU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoaXF-0007dm-Ka;
	Wed, 20 Aug 2025 04:34:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bagasdotme@gmail.com>) id 1uoaXE-0007dZ-88
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 04:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1hdzCk77MP3wx+nUo2C99H0YrbUbbbgXAPHawwUGevU=; b=SzKgI3VHL/0zA3QXhP73GNT7MO
 xQzGYN4IuwstZQ8WQN44VHaFm7Vjgj/t3M+2d5m7iRvpKhr2MoNOWKi7ix6lcCmMC+lvusV99HN11
 ueLT/M/ERE2nZ147zsaL7SR243Ez1bmyQ1vOPIfRdjscBBj8cZeThlW3AshxoWRVRerc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1hdzCk77MP3wx+nUo2C99H0YrbUbbbgXAPHawwUGevU=; b=DrpQxo3t6GPNjX9D/ajbMwSgw0
 vsPwpDIgO41fBnl4jG34Nnr8WMxAsmKoNWj6Wfu5JH0YQJKijsXalq9EqdjCj2GzaEeY7tQhcVJFf
 PprMfYCpJ4XQNe/QumA4gMvKBg5PecfrtdroBVA4pqHdDNf7H4CIPr6/TioFZnpW6cEQ=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoaXE-0006WH-EO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 04:34:52 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-32326bd4f4dso513026a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Aug 2025 21:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755664482; x=1756269282; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1hdzCk77MP3wx+nUo2C99H0YrbUbbbgXAPHawwUGevU=;
 b=iQbbfeDRPQfSiUEU1BB7bhW1L6ooK3YdJf9rx7T+Uw86Q75gY+9jsYdifd20BdFeIX
 CKI2FyODsHEUKSudKXnFkexdHmWil9WAsNgcWNTedhzTZL8MGCWxHHtlJKYq2Q8JDzKm
 aCOA8ngUaztDXquyAHr/oPtFmKJy88dbiZlIktQAFAWoanO57Gj05llHTU1aq1+KJxr0
 Dr276o75zXMcp9eNXil+8fnKkW7cyhxkwUjJ9LLPNtcxD6o0U6AP6XtaxnR/jR4CYQKy
 EBsSIBRFWOvIgMNtyiHOYSm6ww59p9FffxVa3VD8EJjUC8ahxcN5KUthUK5nIjjmfL7l
 up6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755664482; x=1756269282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1hdzCk77MP3wx+nUo2C99H0YrbUbbbgXAPHawwUGevU=;
 b=eOuSSa28YsnxLQSSP0IprXeLoHYKQkNofD86p4f1r2W8iD7UzmFRa3Lbah7sJ4qbLo
 UW9Umlq+4WstUmdmYU60qTai/4QCLeAbqkHExtiuxhMbP8EeF6RB9f2d6dYqGWj7Po1A
 7oMilqyo4RtoVBOqewNa8XrlWZoMMZr+v3qGwxlWHW1U/bdrUjl/q72gEI9DnEVFnUSg
 Ed6gIob93H8GdzmnJwkDIE+xbd+BP6fAOgrqBHh+Lfnyf+cRpmZaTvUcSZiWT6Urp+Xg
 KkApxnJGaZLa/mx0V14f9TjSnGCvwTSR60yGStMaKyMNFDVpHoYvABgv34tu26Y/UVoH
 ks+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+PlPLkI7lQLLn3Lg/rfdtDDK8mhQMvGLJWoMD3e4HCFnduvCB5sS8iLIyCrW4KIfDqap4Pc6DwhuPME6iz3xM@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxxn9r4fZU2KiCl1wIj91C0jo+ceyWyok43vk0+Y44kJyHyhvc2
 ca1iTPEiWI0ShesRTb8J3AmVT1oE4vQDDRWWVmFOis64mgsyYEbBZerf
X-Gm-Gg: ASbGncv+fFinBXhbcgHvuYZgw2vVkE+wR79WUZNkfAqEpV9scovHIgIu3b1qGWJlWIh
 P0vnF7rjljJrlS/XCTEHm/ZpXk77Mgq5cA867ci2HBZbQ1vc32UC5ojcT+htOFq5aXLqHlpnb1R
 eLdevvYsiiFG4VewOA8hILEHOfWmigAeEinjBN1vAJVViezQJVDpZIRD1sOvbg07p1LPzjxmOml
 exLrZ1WcD726obarWGQygpdvXN1wx67iMhU+pCyPur4H5Mh49+JJN7av9LZHBOoL58B5UvfuHCq
 l+MgngFQ4YV+iLGFCUmLiw1dlzAQCAdNeQ/JPy8IxWT6NPjeKE2OXaajROr/TaOfdFISMFhGHiQ
 0OnlsEq7d4BCqM9aFz/JECA==
X-Google-Smtp-Source: AGHT+IFTBnYvJdFNjUjbHaO8K9ArV262MbVxRpC7WHVNKKM82f8tJt+j5pADxmY6u0U0ZYYHiq2leg==
X-Received: by 2002:a17:90b:5247:b0:321:c9cf:deaa with SMTP id
 98e67ed59e1d1-324d356c5f9mr5988168a91.17.1755664481545; 
 Tue, 19 Aug 2025 21:34:41 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324e254c74fsm861928a91.13.2025.08.19.21.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 21:34:38 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id B56EA436C401; Wed, 20 Aug 2025 11:34:35 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux F2FS <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 20 Aug 2025 11:34:30 +0700
Message-ID: <20250820043432.22509-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820043432.22509-1-bagasdotme@gmail.com>
References: <20250820043432.22509-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3599; i=bagasdotme@gmail.com;
 h=from:subject; bh=IE+YVmONe8+OmcHFwhNiUC5Y6aV43BEeC0O3nKJgnVQ=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlL/bddebbG9/ziyqP3fGvffJbs/bXswLpFM7df/b7v8
 PeEVZ7BIR2lLAxiXAyyYooskxL5mk7vMhK50L7WEWYOKxPIEAYuTgGYyNFHDL/ZkiSCqtefvZDm
 pOvybic3c5Hzuo2Lj+zZxHrGLa3+6nlThv9Rh5r/zYzY+uZzWtOXYyWhO95vWRWcbF0kfW3Tl/p
 1S5ZyAAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Compression mode code and device aliasing shell snippets are
 shown in htmldocs output as long-running paragraph instead. Wrap them. Fixes:
 602a16d58e9a ("f2fs: add compress_mode mount option") Fixes: 128d333f0dff
 ("f2fs: introduce device aliasing file") Signed-off-by: Bagas Sanjaya ---
 Documentation/filesystems/f2fs.rst | 58 +++ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [bagasdotme(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uoaXE-0006WH-EO
Subject: [f2fs-dev] [PATCH 4/6] Documentation: f2fs: Wrap snippets in
 literal code blocks
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
Cc: Daeho Jeong <daehojeong@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Yangtao Li <frank.li@vivo.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Yuanye Ma <yuanye.ma20@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Compression mode code and device aliasing shell snippets are shown
in htmldocs output as long-running paragraph instead. Wrap them.

Fixes: 602a16d58e9a ("f2fs: add compress_mode mount option")
Fixes: 128d333f0dff ("f2fs: introduce device aliasing file")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/f2fs.rst | 58 +++++++++++++++---------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 85e015b712c2e1..0f9472ae62f2cb 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -931,15 +931,15 @@ target file and the timing. The user can do manual compression/decompression on
 compression enabled files using F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE
 ioctls like the below.
 
-To decompress a file,
+To decompress a file::
 
-fd = open(filename, O_WRONLY, 0);
-ret = ioctl(fd, F2FS_IOC_DECOMPRESS_FILE);
+  fd = open(filename, O_WRONLY, 0);
+  ret = ioctl(fd, F2FS_IOC_DECOMPRESS_FILE);
 
-To compress a file,
+To compress a file::
 
-fd = open(filename, O_WRONLY, 0);
-ret = ioctl(fd, F2FS_IOC_COMPRESS_FILE);
+  fd = open(filename, O_WRONLY, 0);
+  ret = ioctl(fd, F2FS_IOC_COMPRESS_FILE);
 
 NVMe Zoned Namespace devices
 ----------------------------
@@ -969,32 +969,32 @@ reserved and used by another filesystem or for different purposes. Once that
 external usage is complete, the device aliasing file can be deleted, releasing
 the reserved space back to F2FS for its own use.
 
-<use-case>
+.. code-block::
 
-# ls /dev/vd*
-/dev/vdb (32GB) /dev/vdc (32GB)
-# mkfs.ext4 /dev/vdc
-# mkfs.f2fs -c /dev/vdc@vdc.file /dev/vdb
-# mount /dev/vdb /mnt/f2fs
-# ls -l /mnt/f2fs
-vdc.file
-# df -h
-/dev/vdb                            64G   33G   32G  52% /mnt/f2fs
+   # ls /dev/vd*
+   /dev/vdb (32GB) /dev/vdc (32GB)
+   # mkfs.ext4 /dev/vdc
+   # mkfs.f2fs -c /dev/vdc@vdc.file /dev/vdb
+   # mount /dev/vdb /mnt/f2fs
+   # ls -l /mnt/f2fs
+   vdc.file
+   # df -h
+   /dev/vdb                            64G   33G   32G  52% /mnt/f2fs
 
-# mount -o loop /dev/vdc /mnt/ext4
-# df -h
-/dev/vdb                            64G   33G   32G  52% /mnt/f2fs
-/dev/loop7                          32G   24K   30G   1% /mnt/ext4
-# umount /mnt/ext4
+   # mount -o loop /dev/vdc /mnt/ext4
+   # df -h
+   /dev/vdb                            64G   33G   32G  52% /mnt/f2fs
+   /dev/loop7                          32G   24K   30G   1% /mnt/ext4
+   # umount /mnt/ext4
 
-# f2fs_io getflags /mnt/f2fs/vdc.file
-get a flag on /mnt/f2fs/vdc.file ret=0, flags=nocow(pinned),immutable
-# f2fs_io setflags noimmutable /mnt/f2fs/vdc.file
-get a flag on noimmutable ret=0, flags=800010
-set a flag on /mnt/f2fs/vdc.file ret=0, flags=noimmutable
-# rm /mnt/f2fs/vdc.file
-# df -h
-/dev/vdb                            64G  753M   64G   2% /mnt/f2fs
+   # f2fs_io getflags /mnt/f2fs/vdc.file
+   get a flag on /mnt/f2fs/vdc.file ret=0, flags=nocow(pinned),immutable
+   # f2fs_io setflags noimmutable /mnt/f2fs/vdc.file
+   get a flag on noimmutable ret=0, flags=800010
+   set a flag on /mnt/f2fs/vdc.file ret=0, flags=noimmutable
+   # rm /mnt/f2fs/vdc.file
+   # df -h
+   /dev/vdb                            64G  753M   64G   2% /mnt/f2fs
 
 So, the key idea is, user can do any file operations on /dev/vdc, and
 reclaim the space after the use, while the space is counted as /data.
-- 
An old man doll... just what I always wanted! - Clara



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
