Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C169547D8E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jun 2022 04:08:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o0ZVY-0004Zy-QV; Mon, 13 Jun 2022 02:08:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaoliu719@gmail.com>) id 1o0ZVX-0004Zs-8q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jun 2022 02:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+3pr9uOc2+xB/06ujAwee6065J1tqxQJUyenAY58NrY=; b=h0apeIgpwNVXVSkzDb+GoVvYHd
 sGw9meoKBwc8P/nysqOQlD9/RdgbR0N97zIl8Fiz6uLQSYWIRJT0CsP5UyfgcC+E90GQe78/A/3GY
 I4bVHbM6s+MzcJSdZt6HwJFNP5Js8v1LDBiUnBbSj6+/gVW5v79eWqmlIqev/3RpOi/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+3pr9uOc2+xB/06ujAwee6065J1tqxQJUyenAY58NrY=; b=f
 8lOQ/M4/63uX05IzftHWfh161Or9Gwp36nrREN4wzCBVnbAvvyEWW4lM+85cZs+ja7eUzNL671LsL
 vRyNEH8NeJlBFjBORYEmSplK7bmPwOfR8POFc5wxeAj6GBAnTI7t4NWcF9exgh/WGyV+iLYHWTdk5
 qVuj4dv8AuG+pbGY=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o0ZVR-0003QM-Cs
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jun 2022 02:08:47 +0000
Received: by mail-pj1-f51.google.com with SMTP id cx11so4378095pjb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Jun 2022 19:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+3pr9uOc2+xB/06ujAwee6065J1tqxQJUyenAY58NrY=;
 b=XLPFoFjeAFpIhjYc7RrxDgI1JQQcEA6qdwX654uAfMjDFJLTmESBCwnOMqHgfX0g+r
 LzgC/VYxpsUgjBFYHH/I2ubbNdEeHXZG4bthbrUpcX4Cr5QLW9Ck2zXqfROKCIO7acRO
 FS0lPxc74W/q+u0aFFyPk88zyg16grTaVKOTPLhEgQFjGvZLqY8jWCct0RCVIDvNk3jv
 9tK9vcKVcKvI1TG5775bl2f5zPxDNJqWzXzUrrypXsl/66d43PsN+pVO4tcI/2wKAmkX
 QbtmB0NDhE02JCksbm974cHWRJGr/6q8auFq+upwKRC4cqFimhRNeyQkIJdKXwEyj/yj
 UMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+3pr9uOc2+xB/06ujAwee6065J1tqxQJUyenAY58NrY=;
 b=oBdv1vAKSy9rRCcdoYTOMnSuKLSkFdVEoaF/MPCqluGoqRrotoD0lvvRhH/vWgi+Cn
 kAlycaDPkuE6MxmCFsZkm062S2l21pfTejdZ/Ahmq/HR0rSvqYEt+QkZEXd+Ss4/9H8u
 68KcQpTcd+Rxa8106NBsIIpn4elqsmtINYswwdEYjG+GCYrO7y58WRDioRzVdmknGGWD
 D8I6m7WFyA+Mi+ji8W3q9IJA8noaXTEWG1snY6vn5NwAjTpRJDCwzK7MwKpkPFpM+kwY
 hCdTenIKH0Qr1d+MWsWFs9IOcFEtsdFP1zPUsfyIQfCg36KVFrgrFeGSr+Ccmgsz6aUT
 JY4w==
X-Gm-Message-State: AOAM530pTTK10JRXciXNsmwIXkGh5EY2ZcgSLIL099NEGhne+9euZ3Ba
 Sk/u76l7TURZdb8t1JjAJaE/HEXD3HElGWEWlLQ=
X-Google-Smtp-Source: ABdhPJwk9edjXzK1cRjyu7FIFuyGFeOmiuXy87Jlhm5MaGBv8fbIwrnZBH1j3UjyOkQETO3j1+Y+tw==
X-Received: by 2002:a17:902:e8d6:b0:161:ea52:cd52 with SMTP id
 v22-20020a170902e8d600b00161ea52cd52mr55528700plg.71.1655086117029; 
 Sun, 12 Jun 2022 19:08:37 -0700 (PDT)
Received: from localhost.localdomain ([156.236.96.165])
 by smtp.gmail.com with ESMTPSA id
 l130-20020a633e88000000b003fdf49f161bsm4009285pga.21.2022.06.12.19.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 19:08:36 -0700 (PDT)
From: Chao Liu <chaoliu719@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Mon, 13 Jun 2022 10:08:00 +0800
Message-Id: <20220613020800.3379482-1-chaoliu719@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Chao Liu Since commit c61404153eb6 ("f2fs: introduce
 FI_COMPRESS_RELEASED instead of using IMMUTABLE bit"), we no longer use the
 IMMUTABLE bit to prevent writing data for compression. Let's correct the
 corresp [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [chaoliu719[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [chaoliu719[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.51 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o0ZVR-0003QM-Cs
Subject: [f2fs-dev] [PATCH v2] docs: filesystems: f2fs: fix description
 about compress ioctl
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
Cc: linux-doc@vger.kernel.org, Chao Liu <liuchao@coolpad.com>,
 linux-kernel@vger.kernel.org, Wayne Zhang <zhangwen@coolpad.com>,
 Yue Hu <huyue2@coolpad.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Liu <liuchao@coolpad.com>

Since commit c61404153eb6 ("f2fs: introduce FI_COMPRESS_RELEASED
instead of using IMMUTABLE bit"), we no longer use the IMMUTABLE
bit to prevent writing data for compression. Let's correct the
corresponding documentation.

BTW, this patch fixes some alignment issues in the compress
metadata layout.

Signed-off-by: Chao Liu <liuchao@coolpad.com>
---
v2:
- s/file size/filesize/
 Documentation/filesystems/f2fs.rst | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index ad8dc8c040a2..531b0f8a3946 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -818,10 +818,11 @@ Compression implementation
   Instead, the main goal is to reduce data writes to flash disk as much as
   possible, resulting in extending disk life time as well as relaxing IO
   congestion. Alternatively, we've added ioctl(F2FS_IOC_RELEASE_COMPRESS_BLOCKS)
-  interface to reclaim compressed space and show it to user after putting the
-  immutable bit. Immutable bit, after release, it doesn't allow writing/mmaping
-  on the file, until reserving compressed space via
-  ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS) or truncating filesize to zero.
+  interface to reclaim compressed space and show it to user after setting a
+  special flag to the inode. Once the compressed space is released, the flag
+  will block writing data to the file until either the compressed space is
+  reserved via ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS) or the filesize is
+  truncated to zero.
 
 Compress metadata layout::
 
@@ -830,12 +831,12 @@ Compress metadata layout::
 		| cluster 1 | cluster 2 | ......... | cluster N |
 		+-----------------------------------------------+
 		.           .                       .           .
-	.                       .                .                      .
+	  .                      .                .                      .
     .         Compressed Cluster       .        .        Normal Cluster            .
     +----------+---------+---------+---------+  +---------+---------+---------+---------+
     |compr flag| block 1 | block 2 | block 3 |  | block 1 | block 2 | block 3 | block 4 |
     +----------+---------+---------+---------+  +---------+---------+---------+---------+
-	    .                             .
+	       .                             .
 	    .                                           .
 	.                                                           .
 	+-------------+-------------+----------+----------------------------+
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
