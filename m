Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3447177F9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 09:22:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4GAa-0004SP-Ks;
	Wed, 31 May 2023 07:22:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <korotkov.maxim.s@gmail.com>) id 1q4GAY-0004SH-TQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 07:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=osB1PFoOgarjFoG6hJZ2Q+i003TXS1qizWubHtt0Tbw=; b=ZDpW7vUE2SpFVXFMXGlWDPcf0u
 IjjAFgV19yQtTFzT/A+AxtqN1eLARQIWnAX7Lc71dxp5Gdmb3bPK7K+bt6IOGUd1JArs+s3A2YZAi
 zriwd0aVNKwV15rH+HyvhlyFvo43Rhx0E3WZyzPLkmIfKi1vd7kyh8AMtPk/Hh61+b6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=osB1PFoOgarjFoG6hJZ2Q+i003TXS1qizWubHtt0Tbw=; b=j
 obKYRcTOamOpD8dynH28TqRHIxQqHmYuLUC1h6rjeu/R3P2Ts6KMYqTxTFbs18k0Fo7TwojV6AkxM
 4WKhIZA2yJchCUTBgkRPK8xmXpAT3EB1BYtCR2ygrwb9BozDAVsv04bLk2kQNSX7DHht7+CQP5Wsy
 OwkS5BO2C28VfobA=;
Received: from mail-lf1-f51.google.com ([209.85.167.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4GAZ-0004vt-6w for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 07:22:55 +0000
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-4f5021faa16so3602539e87.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 May 2023 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685517768; x=1688109768;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=osB1PFoOgarjFoG6hJZ2Q+i003TXS1qizWubHtt0Tbw=;
 b=FUdvp+4ybcTP8w7YuiDPadQyM+TRYcE2H5s+zDY0yYwqsuLulxeQCOeTLW+22C+d5c
 2iErxht34KcASVRqMegyowZfYzoILTXDLa1WgT9XuO57985p8fAAV+ccGn5tzXK8220o
 cEuvYyLrVUKs7AczpkEDBHL6TQ92DI4rcRi3Jjcry/bR0Si/jOUtraBtaVyEpCTMnGmd
 zaYaieiFUIsd8tbmjeqUbi30eDzXHYm/RPh1XM3kz16LZTewTf5n+VNJClbqF9WelV6c
 blrh/IXxG5tKaTl8byajruKmMiwKBnKZGur73EZM7ru2QPYpRN8mfc6QKYhBQMuSDOfR
 zN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685517768; x=1688109768;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=osB1PFoOgarjFoG6hJZ2Q+i003TXS1qizWubHtt0Tbw=;
 b=XophJBuiBhRe6h4sHbWGVMtB+uK/CY5bTiShTLbo8/UIyDNUR5qnIOtmToWgaPrRlk
 /C787/T+qftYwfH2jiFXd2PMYPA71eF40dCgnL9ZAReQepSSDdRhYSnAndFhkxSwz7/9
 CSoxoDNmbuOKfU71huK7GoArDk1ft7Y0EJcBqo1ojBh+HurbnLnIBY+SxxZ9aWAzM5cn
 QMbJpyxWF/xJkOGghltrP5iN7mgT9HKBlsleuE0JiSUeCtsF8TCW7hHeSE36sM4dlfPH
 DNISK51xgBgWhqsA1LZLjMhTJNVYrzY8mrLEDCfqYQI0nfUBzTRwR+mbmlsNSxuR9e9s
 8m6g==
X-Gm-Message-State: AC+VfDy/hZaBTHGlt4gHafLPEWZ6ufsz9XaaAnY2/+qKB3HZYDWD2BxL
 XZz/+thGcNCFBu1nR3/sbBc=
X-Google-Smtp-Source: ACHHUZ6Y5m+OinlSLfdUr+k3Ia1sMPPKMTuj97j5PPc70ODRR0i2BLEYnXcZeMxqQHgEeS6Oyqh2Qg==
X-Received: by 2002:a05:6512:3743:b0:4f2:7ce7:dcf3 with SMTP id
 a3-20020a056512374300b004f27ce7dcf3mr2119121lfs.17.1685517768226; 
 Wed, 31 May 2023 00:22:48 -0700 (PDT)
Received: from mkorotkov.rasu.local ([212.22.67.162])
 by smtp.gmail.com with ESMTPSA id
 u4-20020ac248a4000000b004f3b5af3971sm606594lfg.104.2023.05.31.00.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 00:22:47 -0700 (PDT)
From: Maxim Korotkov <korotkov.maxim.s@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 31 May 2023 10:22:38 +0300
Message-Id: <20230531072238.370186-1-korotkov.maxim.s@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In error handling cases, exiting a function without releasing
 memory Added tags to clean up resources and return error code Found by RASU
 JSC Signed-off-by: Maxim Korotkov --- fsck/dir.c | 9 +++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [korotkov.maxim.s[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.51 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.51 listed in wl.mailspike.net]
X-Headers-End: 1q4GAZ-0004vt-6w
Subject: [f2fs-dev] [PATCH] fsck.f2fs: fix memleak in f2fs_create()
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

In error handling cases, exiting a function without releasing memory
Added tags to clean up resources and return error code
Found by RASU JSC
Signed-off-by: Maxim Korotkov <maskorotkov@rasu.ru>
---
 fsck/dir.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 4a3eb6e..c3508bf 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -704,7 +704,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 	ret = convert_inline_dentry(sbi, parent, ni.blk_addr);
 	if (ret) {
 		MSG(0, "Convert inline dentry for pino=%x failed.\n", de->pino);
-		return -1;
+		goto err_free_parent_dir;
 	}
 
 	ret = f2fs_find_entry(sbi, parent, de);
@@ -728,7 +728,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 		if (hardlink_ni.blk_addr == NULL_ADDR) {
 			MSG(1, "No original inode for hard link to_ino=%x\n",
 				found_hardlink->to_ino);
-			return -1;
+			goto err_free_child_dir;
 		}
 
 		/* Use previously-recorded inode */
@@ -805,6 +805,11 @@ free_child_dir:
 free_parent_dir:
 	free(parent);
 	return 0;
+err_free_child_dir:
+	free(child);
+err_free_parent_dir:
+	free(parent);
+	return -1;	
 }
 
 int f2fs_mkdir(struct f2fs_sb_info *sbi, struct dentry *de)
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
