Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10028B2D305
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 06:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYlYzEf/iG0F3ZjpvHCmGZlXCzAj2vo8foFO3Y3GDJk=; b=eHgVIQoJflYeWwmezdjRcx+aLg
	xKEIUsJhcaTvvPdhg8xWyf/C+2hBOwNuZqGEz0kFoOvTeEkSAJ5yJvsLAvWli92u6ljr0EHzCiNT2
	FfRjLmKFzhPOm3jc3EnC5SveJcTW5TBid6mrAXUG2stcOmY23lUzCwcHE9aMNBgkRQg0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoaXF-0004c7-Gz;
	Wed, 20 Aug 2025 04:34:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bagasdotme@gmail.com>) id 1uoaXF-0004bz-1A
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 04:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CyKlYZwnzyrTJtobVTaGI66bJYC4L/kYAJqhoIFuK3I=; b=cQE4/wmikLgaaSM75LMFByp1R/
 Dp08syLGLStks8fGz9cfVKUIJ5v4Bd7zc5Nli5w2/ealAYPjvVtrY0fONiAlSxt5vtZf36DiAJPFE
 C1bn86kB8hYEDb+KGFRrIxbSGfDWQxuE6Z6DDzXeOX1nMij/DDRllRKtBnPOvsL+8tWs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CyKlYZwnzyrTJtobVTaGI66bJYC4L/kYAJqhoIFuK3I=; b=Q7Xm0gg3ZMx7FtayWb14W51Hpr
 HcTB+1ATKE+4hD3eNpjujcfZp3CTu5bnIzOC8nt1BEDLma+PjVJ7ZYS1GI59n6wqFIL6ZZBAt3XZp
 jjfkIXR1O2sQOM7WLl6iowgFwhpe9zXR4DY1ZfM5BY1mJOwBh3Jd18eJP4Bl0cxyZUjw=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoaXE-0006WI-Nx for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 04:34:52 +0000
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-76e2e89bebaso4464333b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Aug 2025 21:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755664482; x=1756269282; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CyKlYZwnzyrTJtobVTaGI66bJYC4L/kYAJqhoIFuK3I=;
 b=EKpEfRM6d3oRj6tJBs+qTOso3Nfhd+NTnL+ajL5deoR0X2kjLrjRmN6rEC4574l1af
 f486QWMVSkwH1MPpKxSj950gL3rq871BBEirgEvIHhlLIEbp7yHvhhHBNh7Tmpg/tt8g
 edRe4XaaCzQf0yzrxyb8RkThAAtuKxw2grPJbCm1YOjWNtbB5Wt8ZaX3oK9NVkqgfGWT
 eNDMIELjjYXSK3HrvUysAJwcA63q64tWK4HT9HmAAdcIOmWs+Y2K2K2sIwyp2SIATTge
 rfQANjpL4GgMqNIBcAvtuzjfp7KEt8eMnEdCiXqwrcU/U/gq1bU7mOJTu4J9MPkNEjgy
 Edjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755664482; x=1756269282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CyKlYZwnzyrTJtobVTaGI66bJYC4L/kYAJqhoIFuK3I=;
 b=QMNfCVJPEWnAkXieHq14Ioq/kvcFqEwylhqGojXeAaxlNd1H6/YJTlEadw6YI6Zid+
 4IbQUn3DBXAHCuNXeybKMa0bWAfeccAPp3SL1vo+KvbXbsJOrGxkeG3HVUDp/WyY6wva
 o9WMOEcNAXrFNIoIemtxVGj6zlgGXvBI0HgVzY4UP2GZtkTWDy8ZjySP3kX567bZr/bM
 msCISD+uQOmTuYK/gxTWilk9LzU0FKTEViTtNxya0t7Ty3Qog/JfZD1glqYJoL0Dych4
 1ysni9Sn4Rf6tN9EJeHaXkjfsIhrnkWIIdPNuOUqrFFLL72dAe03Y4aDM6GpAvQKWyGC
 BhTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSBqc1xbph92qRRnKH+iBDEcfF2VM6LBkip2h/WfZAX1XuDZnd78qHAuXG5PL6RG2guONyct1PDKhn0/+6SPHj@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwLYi7gSr/gXw5kn3fCPYeoR6QKLb1FWlKw4E/DhVYxQmRVaePD
 iHgl8msq03acUkcPKp2iXvWoSDZP02BVbZsnZIuz/H+tyb240lOsOk37
X-Gm-Gg: ASbGnctxxniIDtXifB9/XU4g2xpdCuo+6gNj8QZJgnUbNv8wn5VXBfgonoeevA9KP9b
 1XXw+tJOGlUz2afhnop7I4vaqKI866dEWqsIhJ006hgaCC9ZfvE+iN8/GH5oJRtsU3j3B//XDRo
 dqMBJGFU0fhbpo492lPBkb4c38R+gZ/iwGC/kNF1e72vJuv81KsygqkGyQCyaP62jjfmiJI+YTw
 l5Nt3xCWUP6JBK4zu4csyh0PEjuGjQJPVHY9zkoop1R0zFvRfTbIIBAVpLmKh7LiZoBFD7q2pt3
 NgJrbwb4OQnb+RWHK3bV/3FQ3Z3T+2KvKht0ZSTTDOvO0g8jYx4sxTrbRoOgO2B0Jfx3rQTYvXk
 pVZst4rQO4DY4a5FRsqqlDQ==
X-Google-Smtp-Source: AGHT+IFoO+aW2FNquc4nftkyJudwML7Au6CjGFNuS72S7hftyJIUJSX6dF3jYDiBLuVRPRWnryJwNg==
X-Received: by 2002:a05:6a00:85a9:b0:74d:f997:1b45 with SMTP id
 d2e1a72fcca58-76e8dc80626mr2056170b3a.8.1755664481907; 
 Tue, 19 Aug 2025 21:34:41 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d4f77fdsm3979674b3a.66.2025.08.19.21.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 21:34:39 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 2030442DCF34; Wed, 20 Aug 2025 11:34:34 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux F2FS <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 20 Aug 2025 11:34:27 +0700
Message-ID: <20250820043432.22509-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820043432.22509-1-bagasdotme@gmail.com>
References: <20250820043432.22509-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071; i=bagasdotme@gmail.com;
 h=from:subject; bh=qm3G9ju8uPlL4X0b7erdGuQwywlcIsY7m9cduvwOOnY=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlL/bdNjZkbP+W9nk2ud9G+gKONF/hk/jiU1G8r233+Y
 NfCyJW5HaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZiIiiAjwzfuH1r6p2vYXq8x
 nLO2pECm1+5L6PbruamX9kjfmCIz/S8jw2t154CHGjOtDv1b+XTRZ8bkRVVnGR+rqeq8aHBYu1z
 jOhMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: errors=%s subtable is shown in htmldocs output as
 long-running
 paragraph instead due to missing separator from its previous paragraph. Add
 it. Fixes: b62e71be2110 ("f2fs: support errors=remount-ro|continue|panic
 mountoption") Signed-off-by: Bagas Sanjaya ---
 Documentation/filesystems/f2fs.rst
 | 1 + 1 file changed, 1 insertion(+) 
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
 [209.85.210.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uoaXE-0006WI-Nx
Subject: [f2fs-dev] [PATCH 1/6] Documentation: f2fs: Separate errors mode
 subtable
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

errors=%s subtable is shown in htmldocs output as long-running paragraph
instead due to missing separator from its previous paragraph. Add it.

Fixes: b62e71be2110 ("f2fs: support errors=remount-ro|continue|panic mountoption")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/f2fs.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index e5bb89452aff29..203631566a2c58 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -357,6 +357,7 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
 			 panic immediately, continue without doing anything, and remount
 			 the partition in read-only mode. By default it uses "continue"
 			 mode.
+
 			 ====================== =============== =============== ========
 			 mode			continue	remount-ro	panic
 			 ====================== =============== =============== ========
-- 
An old man doll... just what I always wanted! - Clara



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
