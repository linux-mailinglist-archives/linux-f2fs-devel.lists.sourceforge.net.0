Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 631EFB2D30C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 06:35:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yf1U57aWl1soB1/loYp0Xr7VDNW+6BJr/G/CbE2Lryo=; b=WYI7dTVtlpKodsitBMHpc7qpYX
	sqFP0MOfrJpVHXeCE+wRQNM+Lhn1egbeqNz0KI69lndP8OR0DKbFwC2kOUBg+V5eHqjVhifqQP4kR
	J+Pl4U07CnuFCIA80XK2U3u4XfbcyYufq1EgqZA5xNQxjivlPXs0/VJ+wfke0neWDLBs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoaXH-0006ja-8Y;
	Wed, 20 Aug 2025 04:34:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bagasdotme@gmail.com>) id 1uoaXG-0006jR-MA
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 04:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yrt9mzNv9i8GrCA0dPeMmmg1/H4rSndrElHUIj4D/t4=; b=SagZjRtl8cGbkmdOQHlCYKzvlN
 vmB+aQidtqn+C5jUyO/SYpvQk3x7hI8jX6RCau0DCY7ZQb9UIl2iilFoCtY8x/1FkbQLOqy1XQ1Zd
 uCt6JR0VJyI4UbyeH6e29izkSN89LuExKprzTAgjzpVj4XAys6wOLkaBwOBjIEwuoIl0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yrt9mzNv9i8GrCA0dPeMmmg1/H4rSndrElHUIj4D/t4=; b=fVbT+XVaS+DJjfK5qCkkPXOlxx
 Ij2w2HuH44wncWsXA26TkLzMtHb0UJ4HtPowuQAwUC/4a9YvhYREu6Uv9oYI+7BrzS3V4197EhKz7
 XS1TZLpvHgkhzopMPiK0fOB8sxRnVlHZiHRu8TWVmxP1tMNYe2bnD7AA63LXAnGbnTYk=;
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoaXG-0006WK-BO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 04:34:54 +0000
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b4761f281a7so660413a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Aug 2025 21:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755664484; x=1756269284; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yrt9mzNv9i8GrCA0dPeMmmg1/H4rSndrElHUIj4D/t4=;
 b=jzc4bYMX3okrhvXVehDXYUypgE7FJvHh1ee5S57JCK1CfLD49c7jS9EMPkSIsfva1V
 2Mnui6nFpbKxxT8LV9s7+w3SvNTxSCb764OsGl9rSt/BVcVxd6+U5KvegJBDd9ybbinu
 bMKkOrDxOnrEypowifKdTycXI930+2nNUjAuX9TSDCb2HgxR1mK7D/0hP3LmqHHWxU1u
 k1Suw9RIHHFqUm3t5opS2IGD223kX6CVW95zCTUH0RZJBZ40jQkWONff+RSDUsYQGBut
 9Nxxt47RVwbqCWDH3DcdnvMAAAVYL5Lc6iayyrtRhGQgL/s+Y3qWh2BlvNiaWvuuh76s
 DWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755664484; x=1756269284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yrt9mzNv9i8GrCA0dPeMmmg1/H4rSndrElHUIj4D/t4=;
 b=T8DaqjvovS5lBdcAzkaLY6A3712rGv0SIRE+SGNUErDHstLVqQcYYsLON8gwSzhd8L
 Vm/6W2dYwOY1lAqPqwWS2ZvUSDY5823fw1ahFoe9Ste6lytYiEg3Km/gCeJc5QUgIErT
 a6tC5OXVXz7TVoTufsQiqBYx3DCZ6IUOonI49qSEXX8wyYxNwmW63qixYN+ldTCCboU8
 Kas4TKiWOxiC/FiepghH9n0RPWlpF2gO9kg9eIBewIzv8BG0lfn2k1HwCLL3A5OTOLKp
 mIr1sc2b1VD5+pi3K6Qf15o2ZxGWPBG6SXUECJ8kYXzyIrP3f9hHhSrwgu2HEhaXP9uQ
 g3oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmuSLpapmT+M6I/MGJkpAdNj/oRCdCgf0+sHqaj7pI88T5A6+KCN1a6yrRBboDEd+nnL8p4SClA90wOoFyPXwS@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzQKp0jYwBgGWsWTbkaJ+xSsCnVKUCYoo/5v7irU0VxQYE3VK2t
 ufw8Kt2/Lh9ebkGg2WheqsHFxdDEUEDWyM0NI1T2Em1P0LWpAf/oj+zbsGlRk/4Z
X-Gm-Gg: ASbGncv1IkwyxKUMOqwRbMF8/bOI1XovMbQT9JGAK+s4RivvJQTSz70VjgzckjiKfvk
 LGDQubCxfm3Gx9gdgsgawFycFIm8NzrM6xTit0PfwidDlEQ6vRY+nNQtruf9QGc9TqLD4TX6Hct
 i94b0+i/Sq8y3Pv7LvQ8yVQfIFRxIswEVv7yQOk5l0lsrF52Sa+L1q6jlEfyoXQtJhnoeASWNOH
 P0Iu90pBfOiA/YcxRahl3NlAvXids1e6k0KgVxfGtEf2N7cKb5+ApQDl9pmLSUAnJyovY15JUdq
 KxN38tBwQDmeT/nhXw9fa3f6thMWDXXnoo14Q65tI9Ip0hg5K0loftjeikMvCPIdKHQJxttOYjR
 JmUkL4zpw6CBD3Y6ViQcxzQ==
X-Google-Smtp-Source: AGHT+IHmG2KaV5A2aZ+HZ0hd/iIQlBfy8Y7PhJWbQKKu/KBlbqqPeeGfMzIvzJzs95XaL9C1UF7FwA==
X-Received: by 2002:a17:902:e888:b0:240:48f4:40f7 with SMTP id
 d9443c01a7336-245ef25c5d0mr21276695ad.39.1755664483587; 
 Tue, 19 Aug 2025 21:34:43 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed35d511sm13326175ad.50.2025.08.19.21.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 21:34:42 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id C031F401648F; Wed, 20 Aug 2025 11:34:35 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux F2FS <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 20 Aug 2025 11:34:31 +0700
Message-ID: <20250820043432.22509-6-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820043432.22509-1-bagasdotme@gmail.com>
References: <20250820043432.22509-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604; i=bagasdotme@gmail.com;
 h=from:subject; bh=ibncyX6wSsvhMtT2VwbkV775dioY/Q+yZ3LZy0Dg3GY=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlL/bcVvJ8Sftu1OEZAMV79w8GUjQ/V/ff2bdFmzHgQf
 /hbe+KFjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAExEh5nhf35QhtqrOO49DkWM
 c2U2uYjePVz5o2fFluL19jGLj528KMbwvzJnWuLKsDv8Mm4crYF3b3t+ci1V/xXZk7GcvdKW07O
 eFQA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Indent description text so that compression_mode numbered
 list gets rendered as such in htmldocs output. Signed-off-by: Bagas Sanjaya
 --- Documentation/filesystems/f2fs.rst | 14 ++++++++------ 1 file changed,
 8 insertions(+), 6 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [bagasdotme(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uoaXG-0006WK-BO
Subject: [f2fs-dev] [PATCH 5/6] Documentation: f2fs: Indent compression_mode
 option list
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

Indent description text so that compression_mode numbered list gets
rendered as such in htmldocs output.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/f2fs.rst | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 0f9472ae62f2cb..146511d63b684e 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -922,14 +922,16 @@ compression enabled files (refer to "Compression implementation" section for how
 enable compression on a regular inode).
 
 1) compress_mode=fs
-This is the default option. f2fs does automatic compression in the writeback of the
-compression enabled files.
+
+   This is the default option. f2fs does automatic compression in the writeback of the
+   compression enabled files.
 
 2) compress_mode=user
-This disables the automatic compression and gives the user discretion of choosing the
-target file and the timing. The user can do manual compression/decompression on the
-compression enabled files using F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE
-ioctls like the below.
+
+   This disables the automatic compression and gives the user discretion of choosing the
+   target file and the timing. The user can do manual compression/decompression on the
+   compression enabled files using F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE
+   ioctls like the below.
 
 To decompress a file::
 
-- 
An old man doll... just what I always wanted! - Clara



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
