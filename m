Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7A69D4F6B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Nov 2024 16:08:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tE8mj-0003Uj-Qx;
	Thu, 21 Nov 2024 15:07:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nl6720@gmail.com>) id 1tE8mi-0003Ub-EW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 15:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IV8MocwhgUweSnPyTRMwe27g//dxAIWma/iSEUERtQg=; b=Tz7SIbkT4oO5dl8J3nq+HXUVIP
 oAIbS30zbg0rFsJTE0Kdx2CGxNmiqA6NKZ5Cq6YTZS+lfO/hqKnl9yfDYHNaHNVa9EEbFW3B18QCR
 NMgXA9+WCbxIUX9EBOuyxfP8PBwtZFbCVUcTBe3Tilxd5i7pOUkwmId3zYmmw8Pw26j4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IV8MocwhgUweSnPyTRMwe27g//dxAIWma/iSEUERtQg=; b=Y
 TpmkbzUSG5Wzs2p5VA+yirFcJZ14ZhtFpsIKHe34ywVkMXIpoLCyIFVK6DI41DRLMtq4W9EMshHkR
 KiQ+APbLBiC/bl0X+hYPZZkOKsu4L8QRaC23S9RyXxtbX43unVoNXSs+GRYQVAbNM5zNTtfArKuqc
 1420AWpaKDO62kFs=;
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tE8mh-0006rn-QQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 15:07:56 +0000
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53da4ff4d7fso2205835e87.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Nov 2024 07:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732201664; x=1732806464; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IV8MocwhgUweSnPyTRMwe27g//dxAIWma/iSEUERtQg=;
 b=bFpSVPhLmGwC5ijR3UkZVxoz9WzAraWVpWkKJ7LrbE0fY+WUB6N8NkibJysq+dPCqH
 PbMk+5YZC6ZXBAREJsVcvSjvmmTYW3n3/fbgeI3MP4OQvlPEYWy2x4cSDJ9qPlTvYfrl
 6g/nf7jg/9JiY2K1r7EgdmBvqKcHT1NhLMyQtaKucht4q3Lgggxak0vUWchB3QpunylI
 YkNLcGuvKBaWPofR30nivL0+uXStmX5p0cJhCRnqzPrjj+pYAAFs4LmXr0fYcytpw+qa
 6iGXrsUe2Fv8m2j1Ro5dtEDTEZOhXUkFN0h0idsNQNzMiVtrYIALTYvdDFkLygJvfRI8
 zOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732201664; x=1732806464;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IV8MocwhgUweSnPyTRMwe27g//dxAIWma/iSEUERtQg=;
 b=jFXYzNxm8KTohbz3ZadBF+UdqySZjSBEUoNrZKcpUWp/ve7onk8bhgwTGlnfN7VRno
 LZk7fp8mo+zqkG6PWDAGMoLnDZMucaBCn+q07L9KvL1TRp2ithff4TpOsluJpQtqFfNX
 pTOSK8/HLt56KtDDBi8BV0+zAU0f+TPiYSARJ2J7lmPnInO+kkJvDLi0Xct1/VL1W8U4
 t89I1SmcMvkZDBfclQIZ1O1WXp5cTp0C/RRg5DyGPNs2y4ZC/fCopipyVdoORquHNyoM
 S5tDbG2KyCp2p5bD0BNKj7wPsMYgjQIuE8JSBYPXJLsQdtxWH0kwQs2+xl4g0jQXtPyY
 AlPw==
X-Gm-Message-State: AOJu0YwNFesDWeKgt/6dovz6NvBHSa8JxPitNHgJH/UAwprTysCLdWNM
 PjoBLC0Azgx94+60Bx34t9N/gD1OqRo7uBVRhvtFbdhlYaAMaQR/r8TG/s4O
X-Gm-Gg: ASbGncssJVjgRsGXEkQ5dabH9x+rD+wT2loX+ak2JVLXUVIYOjkLzizf5ENiudjzkTD
 mTTqDivmUN1Y2s2GawscZ2ojfVrf2xCs6QTd6TUvNnamn89LFEzy6v+KrA9DGLod9ZmJW55bXvN
 TmJUoIqueGwPc7Zb4N18E0qEwDgZKDGFMX7m9HTN2iOH85TjIHj1pOTmQEJbV547yC7j7bRINCf
 cbBVFWEr9sIHvG/rPKe3nAxYovySA4TCCcMhONX2NG3Mhc/Tp8opJcqGNlwc4Zp
X-Google-Smtp-Source: AGHT+IEm8OseioKfSwF6RFuOdQL3pQSCzmdhphDAuowNpGhH6Nu/GuKvwHgMSDN0CTmkX5F9Vc10+A==
X-Received: by 2002:a05:6512:3d22:b0:53d:c4a3:c0a0 with SMTP id
 2adb3069b0e04-53dc6183052mr1196746e87.18.1732201661895; 
 Thu, 21 Nov 2024 07:07:41 -0800 (PST)
Received: from nl6720 (balticom-231-46.balticom.lv. [83.99.231.46])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff698515afsm18801961fa.17.2024.11.21.07.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 07:07:41 -0800 (PST)
From: nl6720 <nl6720@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 21 Nov 2024 17:06:23 +0200
Message-ID: <20241121150623.156534-1-nl6720@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
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
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [nl6720[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.167.41 listed in sa-accredit.habeas.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [nl6720[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.167.41 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.41 listed in list.dnswl.org]
X-Headers-End: 1tE8mh-0006rn-QQ
Subject: [f2fs-dev] [PATCH 1/1] f2fs-tools: prefer physical over logical
 block size
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
Cc: nl6720 <nl6720@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Some drives operate in "512e" configuration with their logical block
size set to 512 bytes for legacy compatibility reasons while providing
a more optimal 4096 byte value as the physical block size.

Since the physical block size is the smallest unit a physical storage
device can write atomically, prefer it over the logical block size.

Closes: https://github.com/jaegeuk/f2fs-tools/issues/29

Signed-off-by: nl6720 <nl6720@gmail.com>
---
 lib/libf2fs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index ecd22d4e6a5cab515b86e4d1f606b3aaa2672072..7903861f952f38334f88fc3b72422b7665c00b54 100644
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
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
