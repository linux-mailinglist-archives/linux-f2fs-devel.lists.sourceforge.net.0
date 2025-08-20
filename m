Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51117B2DCD7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 14:43:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGdxCfIh/61/QXDnoI17pB1WrzDSj81xCVzdkGNKpfk=; b=IqgKueSoHaa2S1n7NDGrvIJRZh
	pok+fV4HXtNKiVbiLFPRkhjmJfZCFHtESsvil7pmu2PhO2lSOhrDMyLI1Zl/afeZhrrsoWfH6mSWh
	2ykTVoD4rQufnORl9wItGh8pjqSiDnzWMiSATQnaGt6becnAsQ2q0Y2QQEfrZVgLktGQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoiA2-0008SF-3z;
	Wed, 20 Aug 2025 12:43:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uoiA1-0008S7-3j
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NwgBflSTSqRVQZTG2ZAka1lG5PRpZlyjERAuHVaraR0=; b=GDaIF3uCpye10Ye7Jw2ueXo5Kc
 bGpONSfnQrPWizId9oKqL+i2LqcSjvV7HMR2+xDQOd//baexAvn2eQt/i+I8oRdb4YwsI0kP/eCDr
 obN4OOcIgh0m5BUBmgZBP4fGaFRWfPq9/8OwAFNnmCQdGbvR/NHSMJmZoAC41m2QLoFE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NwgBflSTSqRVQZTG2ZAka1lG5PRpZlyjERAuHVaraR0=; b=Wyyrjo71OLDhKjbtd82pr9GCrm
 8QNRCEQb9fTYroqji0a5L8jQFEdXKMlkGEQV1YngvHVHoIxUwKVC4bizryjZ7m4ErTjGxw18pAUQ+
 Cv3JKBaSXY8r91MIbgr/1WumhLf5+mEagl/9TJOagNNKtL7B8zHShbcmsyzE0dWlB4ZI=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoiA0-0003mr-Ph for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:25 +0000
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-24456f3f669so10263375ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Aug 2025 05:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755693794; x=1756298594; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NwgBflSTSqRVQZTG2ZAka1lG5PRpZlyjERAuHVaraR0=;
 b=Tjo4GfWHNfezw+n/QjUNbtxR8dy2+ShRfZGxrMrM7IxQemfnLxQDcVpHiPi60H+llF
 4a3TovfoFnSjzdY0JGJet77VVY3pEGJxZszbDiBWXCWqpOiqxv6JHXShQQ30B1BHXehj
 u4PtPw+ynNqN/0EGaYHCF42OaGELTGqa0KgSulUpkXykjomfWIIP0WggNvdjBt4rC57r
 BGU5eApaLdXr7Z4S0YgxSDXPkLJEgAmUAIIXzCh3UPPZfgrQWpg7WYN9855SF6Ekazhw
 6lQaATiSV6r1VBlLxF5+j8TCW1iOFC3B5ziDXsG0tSPlW53lWUzOq/J2zKYH/ykRwGB+
 GBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755693794; x=1756298594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NwgBflSTSqRVQZTG2ZAka1lG5PRpZlyjERAuHVaraR0=;
 b=KmgRwf3PFHm5ycoE9njnK4aP1bFrx5VkVc5nHLg7F7Y1hy5/iDNg4jggC1JORsgv9w
 ygcpt3kz2wlgL6YAwGDvHRQahgJzQ2DnGYZQDzN+KpWAl1sDmF4W6FtUxaDvmfdjc0Zq
 gpe67v5M5OsHMLqeaPtp5XEQh62TnwSTf2eFCfgP/QBEEvj7x96KZ+O1s2zDzfkwTAbm
 iChu+bhRzXLChIDXUXdQkcLobnf73aioZQ29o9vkXX6LMJjMpgNhkqCKFvAY7GoUL3lu
 RQoVaQl10KoCTMK82yS6sNlPiHSqzq5ygeD+Inf1iBgPTch9DJ1SsSyWTAzOgwDgY8Vk
 hLrQ==
X-Gm-Message-State: AOJu0Yyb24oX7wCjWzYsYaryD0ct6XzQrmzzgWsJXIqJw3Urbu/k/YcS
 Q12EZHlK1zp2w+9L+pEDKHYFfRY0a7gmfY5Z6MU/ZBUOXRNCQS+f+HZz
X-Gm-Gg: ASbGncvEtOxu5l/3RhV0HyHgzM9ohOtHtFVzVgKMe0sHf/qJFa0MrXJ09gX4ZwPZqWp
 XZLKHafDhZ+6vxl9mhscKqmPHG1gZw9kj10/Pcskq9CjzpEaIX9qMsPCQbaBQVD+n7l9m/WKZec
 5u6mdS2W3ugyC1cSmqGnRKJ1bDx6uWruTbodvT4Lb15XWPilMZZ2AtCkwedpE10KFw4VHIhua4v
 sHEkvYqtWCoZqNIJT7x9ZruK9m6LVZBG1ksW6nMz9KFs+yMMxw9HBty3z7gnm0E9YnhyQMlNe/l
 ljm3s1ED05I5WH99UBRdJZ5nonbpg5W7fnE3bJjqzg8eROpgIKKHD/uiV3AZ2h88YllpOm5+io+
 S0VJzzd+oEC1vNcqmko402YLr3bAJ
X-Google-Smtp-Source: AGHT+IFx2/qAMD9MpyqAIAxsvyo0YGpDVvBGWlkc42fq6es2Nu3W2/abqEm2acBwtN8tD61+CwjEmQ==
X-Received: by 2002:a17:903:18c:b0:240:1ed3:fc28 with SMTP id
 d9443c01a7336-245ee04fae9mr42893845ad.12.1755693794034; 
 Wed, 20 Aug 2025 05:43:14 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51b3dfsm25962545ad.142.2025.08.20.05.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 05:43:13 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 Aug 2025 20:42:33 +0800
Message-ID: <20250820124238.3785621-9-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820124238.3785621-1-shengyong1@xiaomi.com>
References: <20250820124238.3785621-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sheng Yong Because node and data blocks are updated
 out of place on zoned device, sit_area_bitmap and main_area_bitmap are required
 to record which blocks are allocated, sit should be flushed to reflect changes
 [...] Content analysis details:   (0.1 points, 5.0 required)
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
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uoiA0-0003mr-Ph
Subject: [f2fs-dev] [PATCH v3 08/13] inject.f2fs: fix injection on zoned
 device
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

Because node and data blocks are updated out of place on zoned device,
sit_area_bitmap and main_area_bitmap are required to record which
blocks are allocated, sit should be flushed to reflect changes in
block address, and checkpoint should be rewritten to update cursegs.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fsck/inject.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index aae3db0c6524..674881043a76 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -1227,6 +1227,9 @@ int do_inject(struct f2fs_sb_info *sbi)
 	struct inject_option *opt = (struct inject_option *)c.private;
 	int ret = -EINVAL;
 
+	if (c.zoned_model == F2FS_ZONED_HM)
+		fsck_init(sbi);
+
 	if (opt->sb >= 0)
 		ret = inject_sb(sbi, opt);
 	else if (opt->cp >= 0)
@@ -1242,5 +1245,15 @@ int do_inject(struct f2fs_sb_info *sbi)
 	else if (opt->dent)
 		ret = inject_dentry(sbi, opt);
 
+	if (c.zoned_model == F2FS_ZONED_HM) {
+		if (!ret && (opt->node || opt->dent)) {
+			write_curseg_info(sbi);
+			flush_journal_entries(sbi);
+			flush_sit_entries(sbi);
+			write_checkpoint(sbi);
+		}
+		fsck_free(sbi);
+	}
+
 	return ret;
 }
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
