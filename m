Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F31717730
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 08:53:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4Fhd-0003B2-Vv;
	Wed, 31 May 2023 06:53:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <korotkov.maxim.s@gmail.com>) id 1q4FhU-0003Aj-8V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 06:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r8G94B0l6YiUFpst3Rc9YK5wRXcyf24e+TTlFUFtvpY=; b=hgZL+XyY1wJMQfK0XCt3hsRJ/h
 51M2sDskiwfyzh4pV/tr8yC9lMGXk3MuxU9UBJQ9O9PIYvTQjZYe255ePHO1MjKQRWSH3ApjtqzEz
 KoerlwIP9HEsKmaJc2i2cr3HYRnk5nw51Bg2i5APAfWUBkTQ4AGdHYJ2bxLruVPLO/xU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=r8G94B0l6YiUFpst3Rc9YK5wRXcyf24e+TTlFUFtvpY=; b=K
 c8iiZKC0h012Dx0SXz2cHA6Icxf8JIbOC2hDH6KLVa1pFQdjKTLgIX85IPB2WI6Km2x2MevdQ+zqO
 O2yAbg4X3MgQfI1se+B6RKAGYRBVzsdpkfCnDJe9o+B/rzjzqQUd6SOq4z1qpLXiV3ll8pIc2FMLo
 rmLdoNmxVaauBnIo=;
Received: from mail-lf1-f45.google.com ([209.85.167.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4FhQ-007CGM-D9 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 06:52:52 +0000
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4eed764a10cso5839958e87.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 May 2023 23:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685515958; x=1688107958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r8G94B0l6YiUFpst3Rc9YK5wRXcyf24e+TTlFUFtvpY=;
 b=IHT0njQwug9BmShOTsr9Sy9DvsjkV63eB4KzHf+wHcbb1Jn8rhoLL4fPlez/GEX4Hc
 P+UGCc/1PVIaGeuP3wsdxueKyr4eJFDJ3HH2vMK5XOOPm+Pw5mgSkpz4XjsM3cy++geD
 tkj8wzwbEMPyZjrxjpKm59T5Pf3PabgCyO+aX91WRIsdqtSaidnrn5KUenBcI+71VBVu
 tNdBeqbH0YYKgpABvYMzVkQsvYwMPZTTGudOa012ToSPj8jNjs6Nyv6Em0a8xqf95Nkl
 +1LxnHcShX/pfIzW8hciEwmsZgje+s/nXMZZ2wXFlGgPdHz2hnhvEmiff44LFhmopuz5
 t9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685515958; x=1688107958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r8G94B0l6YiUFpst3Rc9YK5wRXcyf24e+TTlFUFtvpY=;
 b=jj76eq2xEAC7QYHhWjj2bdWdV4MDCR/SlhNPbaRU9Czx2d0aovVMWxURFUW6l4eXpk
 j7ddzxtnDjQrXBkovhhN5reZNBKWPOK4nkPsHVNtAofLsrrdH9FC/DhM/Oywh+QSquC5
 8ewpkopXY5BFrPDYBc/fMDF8bZR11LIRrM9fzsOwB2Y7EVNGSggV6WcxtbwkdZQVo+v9
 uM1wJe+mDK75nzxjrSU2vGMk9mIN72UqiLuG4yCwXS0B4D4V0rrC9ox+bWQz9tSrbyJO
 dKpfIpfrHG07Y0YgY0cGpWssOVtY91GHOLQjisxo1gdyivo6PgJf9SM4l/xyRLplmCd1
 ZXtg==
X-Gm-Message-State: AC+VfDxo/+sB1Mh17ApxDj/lOajjoJy8IfhjGCxeX7s9JvDUu2hX6unH
 mlsvY9HwKh16GRY+RwnB+R8=
X-Google-Smtp-Source: ACHHUZ7yjH59N72m8WI0zVPK1zXMPRerY6E6L7DB283tWqWJxdduWbvnojlxvxECsOliCWu7vS1pzw==
X-Received: by 2002:ac2:5598:0:b0:4f3:824e:a94b with SMTP id
 v24-20020ac25598000000b004f3824ea94bmr2052446lfg.54.1685515958214; 
 Tue, 30 May 2023 23:52:38 -0700 (PDT)
Received: from mkorotkov.rasu.local ([212.22.67.162])
 by smtp.gmail.com with ESMTPSA id
 l9-20020ac24309000000b004f37aca1aa3sm593977lfh.113.2023.05.30.23.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 23:52:37 -0700 (PDT)
From: Maxim Korotkov <korotkov.maxim.s@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 31 May 2023 09:51:42 +0300
Message-Id: <20230531065142.365199-1-korotkov.maxim.s@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The input pointer "parent" was used unsafely before checking
 against NULL Found by RASU JSC with Svace static analyzer Fixes:
 603f8f9d3(sload.f2fs:
 support loading files into partition directly) Signed-off-by: Maxim Korotkov
 --- fsck/dir.c | 14 +++++++++----- 1 file chang [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [korotkov.maxim.s[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.45 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.45 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q4FhQ-007CGM-D9
Subject: [f2fs-dev] [PATCH] fsck.f2fs: fix potential NULL dereference
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
Cc: Maxim Korotkov <maskorotkov@rasu.ru>,
 Maxim Korotkov <korotkov.maxim.s@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The input pointer "parent" was used unsafely
before checking against NULL

Found by RASU JSC with Svace static analyzer
Fixes: 603f8f9d3(sload.f2fs: support loading files into partition directly)
Signed-off-by: Maxim Korotkov <maskorotkov@rasu.ru>
---
 fsck/dir.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 4a3eb6e..925fe14 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -225,19 +225,23 @@ int f2fs_add_link(struct f2fs_sb_info *sbi, struct f2fs_node *parent,
 	int level = 0, current_depth, bit_pos;
 	int nbucket, nblock, bidx, block;
 	int slots = GET_DENTRY_SLOTS(name_len);
-	f2fs_hash_t dentry_hash = f2fs_dentry_hash(get_encoding(sbi),
-						IS_CASEFOLDED(&parent->i),
-						name, name_len);
+	f2fs_hash_t dentry_hash;
 	struct f2fs_dentry_block *dentry_blk;
 	struct f2fs_dentry_ptr d;
 	struct dnode_of_data dn;
-	nid_t pino = le32_to_cpu(parent->footer.ino);
-	unsigned int dir_level = parent->i.i_dir_level;
+	nid_t pino;
+	unsigned int dir_level;
 	int ret;
 
 	if (parent == NULL)
 		return -EINVAL;
 
+	dentry_hash = f2fs_dentry_hash(get_encoding(sbi),
+						IS_CASEFOLDED(&parent->i),
+						name, name_len);	
+	pino = le32_to_cpu(parent->footer.ino);
+	dir_level = parent->i.i_dir_level;
+
 	if (!pino) {
 		ERR_MSG("Wrong parent ino:%d \n", pino);
 		return -EINVAL;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
