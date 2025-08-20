Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDACDB2D30A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 06:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=og8FILklSuHnixX/CNLF+QStZGByyxV6UeCf+2N5LyA=; b=V7FCzSptu+/l2ColhNSRnR/2nx
	LynfT1F/eDKINjmd5Bb0DjrlpjT++fuLqQVtw+3yjP3ym97xTdmSPsR0IKWiBix3CA6EmZh7fyQw7
	kZbmMeWiEsqjoalnXxp9bZv+BieyM3kUZH2Mwe2XAsnE0K9B9M1sAeffoYu94sqa0g9U=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoaXI-0003zv-IS;
	Wed, 20 Aug 2025 04:34:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bagasdotme@gmail.com>) id 1uoaXH-0003zl-43
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 04:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r2IA2P+n6dJDRzMxIzjKYVRIxsfdKmslhVEOaLQ+T/Q=; b=fPTR7eWjckdx9/Zc+POrJzF2UE
 SkR67HcoVVs+hibFrsdSS0Q6B1EpSyvmJ81AcREfVLnEi68w20Qgw59jee9p8nWKu7Q+qiW7eMQer
 qLMsCRGEwCpncmFiG3wyzt39kk2+SbO3hF3Ld+pkQMyQxH5pQqYhxYf5WimTawDHvNx4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r2IA2P+n6dJDRzMxIzjKYVRIxsfdKmslhVEOaLQ+T/Q=; b=PemTiVsIQuZMQsZOjl2O0xXdfi
 n+u6+Onawno30uyu4aXwbx6aYlRRzYbFjMJg7XyLqeOuqGBpRZb0HInexJPsZh0nHfkQDfrSmgr6B
 s0KyeOfozKSyC0DQkdZFTsNOmkiAW1uv+tB9znOl+1oI7ygs6to+Ihhwqd8Rpc92AKYM=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoaXG-0006WL-Pr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 04:34:55 +0000
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b4761f281a7so660417a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Aug 2025 21:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755664484; x=1756269284; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r2IA2P+n6dJDRzMxIzjKYVRIxsfdKmslhVEOaLQ+T/Q=;
 b=HIwZL9g9Czw5CCKeoBQ0AxF1gHSxX2ERdEzznSGxzW3FtkobYzCk6mJ/fDIV4fKLSm
 zoWlwLioFuH5MYnhJPuYO8OG1N1IZ8+8bKP5aGgR8GKc9NixAVCEeNy/ET4l5PlPnHRQ
 XhyS++oCpr40waDSpTSMNsYpB7GNkz2N2Sc0A8GnkE5HvqeJ45rEN6EiFsU4327KZvWY
 SQ3nw9wqQbTSjPPQ4IVsxJpKrsOE0Cwgki1Fxu6clUyM/fCB6Z+p4/s1z2gDbalXgAYc
 zsZJDvbAZmamiw1523wEgVycx0PhDuFXT6tlo5frpusVJ/2EX3NfEl+Ub9/qkycgt/CE
 Ulvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755664484; x=1756269284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r2IA2P+n6dJDRzMxIzjKYVRIxsfdKmslhVEOaLQ+T/Q=;
 b=ZolLKai/tymksdQYim4UPhLDNjOWHw36sq1nHj312OzkAmjDYxbvq7Vq40s1M5fhNU
 pMWveDHW+C2/X4bjhtz/MO42CFaACfa4Cov+U0OmLNlDeTBbpY5yh8J/ApSEpXnNNmhg
 q8RNXfuyUv1MH7IRbtG5p+bhI9/uxW6JTePteNRnz3QdkqFKP0xPsV0tZ6OTc2EHH8bh
 AHkLbEpwCY3zm8Z1goeOTtoFGLwEfIYMrEHRW/+nX97to+3q3v58p9XMIhU4tQgYGqmJ
 ZaWOTSKPhLWBHzKseeXhrriMiw5dhjyiLykvr6W7cVbkovsvJbxjjseHJAgzDpBz1ZZO
 txGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOrAK10oD3sWCI//zNs148+Lp5TVum03/FvsT81/Mt7fl78iPFbe2kpXUWPe3fGS5nlwtlxbbX1ewwwc4/AS+B@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy14ynWbWJiGeaAxIb2GC4xWQCSDYz7VPTFyLwjaeC4HXjEzH+j
 Y8wuj7x/OLZ7slMMNoTifqCRdFB4m+wPhpB4HqaFmjDHfy18/s5sn9ij
X-Gm-Gg: ASbGncsg2Ku8cDTdrdQzT1wOp+mgJp/gbnB+yd6+a1miTxtFC17MoK6hn4vAicIJ1cP
 b7wzz5r6j2AJsZtmz7wfhu6SQ4ddNO8r/5kEp9u4jN0qkeC1WbcZPxyWeND+gw22pPFEjdmqUb/
 WoIt25P5onOtpXuesWgbaipiwXbl8e11GME6pgkJB8e7oS0BK2c4JROZA14ccjRj8nbGA3XwdP5
 Im1fTXDzxMMvJr37/ON07/yopUgScSBQQUWxZPIwPUaybt+A1mtpEl+rJWOdFwW7+nZKUvHShAj
 oOnyotRm5i72B70z6a8aP2DGd6mc92Or8havLMjviQnMsQtQE2sxIw61jWnPCCzihDF9ZLYRodu
 5fslFQ62+emNfrlX4qHokWw==
X-Google-Smtp-Source: AGHT+IFG0K6eJJ/ikjKEya3Hr6JFvroPTkyOpwyDpaD3ZIA3UUuA5xAdu4TqJAiZpI+4uf/BR4ZPCQ==
X-Received: by 2002:a17:902:dac7:b0:243:11e3:a760 with SMTP id
 d9443c01a7336-245ef14bf85mr15494885ad.16.1755664483956; 
 Tue, 19 Aug 2025 21:34:43 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed35abfdsm13342545ad.41.2025.08.19.21.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 21:34:42 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id D87434401D41; Wed, 20 Aug 2025 11:34:35 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux F2FS <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 20 Aug 2025 11:34:32 +0700
Message-ID: <20250820043432.22509-7-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820043432.22509-1-bagasdotme@gmail.com>
References: <20250820043432.22509-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1215; i=bagasdotme@gmail.com;
 h=from:subject; bh=yQk+lQK1CQWqJS13FZep4quP8Zh4Ybk1JXSluoOwpDo=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlL/bf1cOctSpnyQUfGsUBlxRuuGQEtwlr2hWfS7hz8s
 Tbd/dG/jlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEyEv5eRYSnDavfFO+xu57M9
 sNTz8TPqZTlWliqw/MNH3uD3gtcvKTMyrDE+l8t34u9LC4tJ50vmr1rZrNUo+2dilU2C+lW175a
 sXAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  "What is F2FS" is rather a mistitle for the whole f2fs docs, 
 as it implies the overview section (before "Background and design issues"
 section) and the docs covers beyond that: from mount options to f [...] 
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
 [209.85.215.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uoaXG-0006WL-Pr
Subject: [f2fs-dev] [PATCH 6/6] Documentation: f2fs: Reword title
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

"What is F2FS" is rather a mistitle for the whole f2fs docs, as it
implies the overview section (before "Background and design issues"
section) and the docs covers beyond that: from mount options to
filesystem implementation details.

Retitle and add explicit overview section.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/f2fs.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 146511d63b684e..10504f774e1dff 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -1,8 +1,11 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-==========================================
-WHAT IS Flash-Friendly File System (F2FS)?
-==========================================
+=================================
+Flash-Friendly File System (F2FS)
+=================================
+
+Overview
+========
 
 NAND flash memory-based storage devices, such as SSD, eMMC, and SD cards, have
 been equipped on a variety systems ranging from mobile to server systems. Since
-- 
An old man doll... just what I always wanted! - Clara



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
