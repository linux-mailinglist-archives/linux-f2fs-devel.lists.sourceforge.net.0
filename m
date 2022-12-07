Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A7B645B2E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Dec 2022 14:42:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2ugv-0007on-Ox;
	Wed, 07 Dec 2022 13:42:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <colin.i.king@gmail.com>) id 1p2ugs-0007oa-TA
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Dec 2022 13:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TMF2QTzrIEhAvcCRAKAyrDjyFw5YI3dtgKin010Drxo=; b=KN2EkD2lnVgwfnnN3KPdLjzTEA
 QKciXb3BVhh33qPa3FdzXOwIzri9j3bGrdHToOo0XGY7hqe+NRqJbAWpkVnV18MZiP1wroAp/6HcT
 5xZOK4ScVSmbyAYhvFsyepnzLeGa/LgKZZ89kRxesYYEShzs42e4kDGWe5iUbeutUJjY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TMF2QTzrIEhAvcCRAKAyrDjyFw5YI3dtgKin010Drxo=; b=Q
 /L0ZgHMIzM/tmuMyywaU/YYz/85Y3majU1H9YHal2yMCJ0Aq07unNG9s49ElOJaUUxxHNci1Sdab7
 xysglSnKo3Zn/uTnic84cBkwDDuJxb2zZzH2wUXW5X+5dBpkCIz7+IXAld9t32EQQCUtWy+rIa3cY
 PWNvQDOTd6c/J3Lg=;
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p2ugr-00982F-26 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Dec 2022 13:42:26 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 n9-20020a05600c3b8900b003d0944dba41so1080760wms.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Dec 2022 05:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TMF2QTzrIEhAvcCRAKAyrDjyFw5YI3dtgKin010Drxo=;
 b=Nsh4hYm51nfI+1na0IvpRbqgwiNwOvz4fAxaQwLeZ95GKOCHayKqMTikL/f9snt+oC
 /jcD6T1WMloKlEF6hJAZetIXhp40cHFYS10PCx9rru0I3gaZKG01LOBqS22GQYi8q05O
 2m9c750Py1YavUiyPHAn43ykX6B2Y3YKkXZnfncWAoPrSMqjSSQlevISHXHSih8aHjhp
 kM0BhLS0xIsI3fEy0hsOMLZNwjtMQqbLe0r2gkRJv7Nzq2cUi8mo63lcFRtlaaxNcl2F
 PtBCe27d6EavPdmShqny6TwH4G46ifmbeF30VWCn7qbF3Lmwxs0Ij1a0lKC8YkwquwyN
 YHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TMF2QTzrIEhAvcCRAKAyrDjyFw5YI3dtgKin010Drxo=;
 b=tHpFBW8yy83ZVtNnr5mI/S2wTjNPw0PqFQnHgBEf5kfC3Te0fUBSsuy2htmxU6xEfG
 7pfKSmYmxqI9fBRdPgADO144SHT6ucrIZBY7zO3fN/I/+JhSyrSA6BJW3CvhzpJG0T27
 hn7Bapye491V1sBe4Et2jU+wTGUBuUqA15D/+fCHEdHMaMite4qHB2/ZNOnV6gtVNR3Y
 kSBgMaMMAoU+mD3qkDk/7Yj4zR3x4PiQv6Xlg3tZOy/vDgSRIbBVZszP2m+LB7I47VpR
 hHOlchqNLp+NtfG3rXodW+jzW4p6/Ps5KS2bcXgrHNVOamA/PruSO7MRrtYk4RT6FTf0
 flnQ==
X-Gm-Message-State: ANoB5pk0lC0vaO7K+XIbxW6fc1Bnx0uETFBy39tusOgxHJ7JTsfzd98J
 WsLklUlidRn4FeSdI8L/scQ=
X-Google-Smtp-Source: AA0mqf4v7NhxFM6ADBnyGnt437t6imDkbPXjJcoZTc+HXGyF5bCElcmBD8N2fTCKcX6IrxbPqGMliA==
X-Received: by 2002:a05:600c:1c04:b0:3cf:ecdb:bcb7 with SMTP id
 j4-20020a05600c1c0400b003cfecdbbcb7mr63835767wms.180.1670420538472; 
 Wed, 07 Dec 2022 05:42:18 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 m31-20020a05600c3b1f00b003d1e3b1624dsm2075515wms.2.2022.12.07.05.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 05:42:18 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  7 Dec 2022 13:42:17 +0000
Message-Id: <20221207134217.2325189-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There is a spelling mistake in a label name. Fix it.
 Signed-off-by:
 Colin Ian King --- fs/f2fs/super.c | 4 ++-- 1 file changed, 2 insertions(+),
 2 deletions(-) diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c index
 79bf1faf4161..7a9fa1a5baa2
 100644 --- a/fs/f2fs/super.c +++ b/fs/f2fs/super.c @@ -4709,7 +4709,7 @@
 static int __init init_f2fs_fs(void) goto free_ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [colin.i.king[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.47 listed in list.dnswl.org]
X-Headers-End: 1p2ugr-00982F-26
Subject: [f2fs-dev] [PATCH] f2fs: Fix spelling mistake in label:
 free_bio_enrty_cache -> free_bio_entry_cache
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There is a spelling mistake in a label name. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/f2fs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 79bf1faf4161..7a9fa1a5baa2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4709,7 +4709,7 @@ static int __init init_f2fs_fs(void)
 		goto free_iostat;
 	err = f2fs_init_bioset();
 	if (err)
-		goto free_bio_enrty_cache;
+		goto free_bio_entry_cache;
 	err = f2fs_init_compress_mempool();
 	if (err)
 		goto free_bioset;
@@ -4726,7 +4726,7 @@ static int __init init_f2fs_fs(void)
 	f2fs_destroy_compress_mempool();
 free_bioset:
 	f2fs_destroy_bioset();
-free_bio_enrty_cache:
+free_bio_entry_cache:
 	f2fs_destroy_bio_entry_cache();
 free_iostat:
 	f2fs_destroy_iostat_processing();
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
