Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC109D1864
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2024 19:46:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tD6l9-0004YT-Su;
	Mon, 18 Nov 2024 18:46:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1tD6kz-0004Y3-Fg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 18:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hi+RFUnTdC+uuCyoN74teTvaWgXTbPW8c0oasB6dJN0=; b=BCxrtfNJGm+WfnGYD9S+msKJwY
 ngHwd5B3ZD8B1dsuX0cY2C/M/WgMzD3uDhdIaBJyXcTP/psF1KLhvJ0NC6BdUyVM+HNxURX/IrsDN
 KGETbgYGH9jYdy97prI36W2dKxwYaUznevMof2TRSdKQl3G+BnEx/M9JY9YpYFFeRdUw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hi+RFUnTdC+uuCyoN74teTvaWgXTbPW8c0oasB6dJN0=; b=T
 4AEOmzwGiXOozx3QfxWZIBg0MV2WeBtiIp5ZsxV/KNTIZAwwRZ0Ww0DA3TitJTxVpnH6bKmGQlty6
 3RbJTfLA+lvWSw09JyOZQZ5r/DDr16HWAMw+XLsDZa9RZyUWfB4HyrS1mIvxtJQjkFTytWK2+UqlU
 ln8nslCI+uDk2MWs=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tD6ky-0007mi-88 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 18:45:52 +0000
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-7f8b01bd40dso3129329a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Nov 2024 10:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731955541; x=1732560341; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hi+RFUnTdC+uuCyoN74teTvaWgXTbPW8c0oasB6dJN0=;
 b=QdocJU+saxKHMbgoKolTPO8iF3LTTHHLnLbHxHBr6ZBM/dE3yTQBCNUBXrIj2DzwJL
 i4YbkLjYLHjisKHyW8l7lkp4e3IR7/hEzZgt8I4c30vhLbjRh1VfqKmw8H/PX+L1+MeE
 vbvYYbvid2ZCaMfhAqXrC4xr8OXV/GJAx7vlHIV5BxQbdoE1sNVfsTjnMe0UPfbj6H7K
 zjb/DobVD1GLj7xWK/tHQ2yAq88+IhQ07iS7d8d6P8XAfBlw/fb++gLD1SrH9ZrddSl3
 +0/Esk0rELYHzHdk4w7wgQSk2m2Y+3wyWdwxVGcxH7HJ5jkxTlASnI1IrKOhtIBdDPY0
 2BKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731955541; x=1732560341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hi+RFUnTdC+uuCyoN74teTvaWgXTbPW8c0oasB6dJN0=;
 b=uNpvK0D1NP9HQV9Q09AA/0MYf6vEkw0K2x6U/X9wBQEdf1ahdC6b1V8UlWUMQpwsO0
 mvONPwZlv1TidTlbDPBZqNQpG98RBjshzQaNjzeFiDWXOGFJpTZk/kW54phMRyXZMU0d
 aWaA/VmeqeJrynWCs3TSrG9c8JMGmro3t0ks6vwrIgXCq0EzlEVyDCkInIyVC4xhT0dZ
 +5Cy5LvH7jAKzrC6DyyH6qJuWuyx/HUA0CjrswXqM6LmEI59F2O7NRYtQztIm9Saex2j
 Dv5EQsh8UgpQJC7mI1r9Q+zWciZn/H05zkUm3sfnOXn6d236rMNWVVYicyLPZkg773JM
 klNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEsIw+opDiDdlPqeEApdUSl7ni1QZdSRqyspo88yFF2jRlr63/iygcP19oX+hHF9ycslIsB0kLbbtyNmXF/lmd@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwNhjMQkg3TyxQtY2KsPEF8CLgIsUGcMVp6UmuX4yErGLbdozC9
 1tgY+PffIeD6mydip9+AxxS9hrrRkHcbuxV9x7fKtNhOAPzrDuLd
X-Google-Smtp-Source: AGHT+IFsxG1vk886ZhlOHC0wu4CA+2e4OBsKJr9OaHDhhc6RVWAcXeKEiYio1UdcAHKb+ImgCuig2w==
X-Received: by 2002:a17:90b:3806:b0:2ea:507f:49bd with SMTP id
 98e67ed59e1d1-2eaaa7379c5mr617970a91.2.1731955541020; 
 Mon, 18 Nov 2024 10:45:41 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:7bb5:50ed:8f20:3617])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724771e640esm6507466b3a.156.2024.11.18.10.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 10:45:40 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 18 Nov 2024 10:45:35 -0800
Message-ID: <20241118184535.1047327-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong The unusable cap value must be adjusted
 before checking whether checkpoint=disable is feasible. Signed-off-by: Daeho
 Jeong --- fs/f2fs/super.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-)
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.215.170 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.215.170 listed in bl.score.senderscore.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.170 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tD6ky-0007mi-88
Subject: [f2fs-dev] [PATCH] f2fs: adjust unusable cap before
 checkpoint=disable mode
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

The unusable cap value must be adjusted before checking whether
checkpoint=disable is feasible.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 87ab5696bd48..da85e3c47698 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2474,6 +2474,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		}
 	}
 
+	adjust_unusable_cap_perc(sbi);
 	if (enable_checkpoint == !!test_opt(sbi, DISABLE_CHECKPOINT)) {
 		if (test_opt(sbi, DISABLE_CHECKPOINT)) {
 			err = f2fs_disable_checkpoint(sbi);
@@ -2518,7 +2519,6 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		(test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
 
 	limit_reserve_root(sbi);
-	adjust_unusable_cap_perc(sbi);
 	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
 	return 0;
 restore_checkpoint:
-- 
2.47.0.338.g60cca15819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
