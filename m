Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 908618C2608
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 May 2024 15:49:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5Qcp-000573-SS;
	Fri, 10 May 2024 13:49:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1s5Qco-00056t-8M
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 May 2024 13:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cMUMJYURHY94vqRajyuSN39xJoZIvziqTdmR++yNIMs=; b=BRwV9XRAWp73xEv+/IwZD52XqB
 VDf/O78nuXGK66c12Cq3KSK/YQ3nxNo3HP24s+Ohfpj/Yvn2VbenbuGDJsxGHlwdg0xhrjq23d64x
 Z+HlBNSHf2e+mBxCgPtgwMY5f8x90gpF/6W3lND+wnO7V80PurH825jQ4O/AjfzIQsbk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cMUMJYURHY94vqRajyuSN39xJoZIvziqTdmR++yNIMs=; b=D
 xvgf/fc475V2HFUjGbDPrYOwDOM0sqvcP+6cSSlj1LYc6NzHFgaP46+jkcALZ84o/+1PLfMOkD+pf
 8VKEE8rWH//T3gpi+WqkFD8zPfAUl8OMV16/hmSgLJK4n1pYhy5W8dBYLnhr6jSb5UWBINDSNliIk
 7m/AvPExid6xqef8=;
Received: from mail-yw1-f178.google.com ([209.85.128.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s5Qco-0000PS-RA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 May 2024 13:49:26 +0000
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6114c9b4d83so17882657b3.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 May 2024 06:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715348955; x=1715953755; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cMUMJYURHY94vqRajyuSN39xJoZIvziqTdmR++yNIMs=;
 b=So/Ta23sJlNQt1xgu6lNUHJgW0tSieU7004mKDdw1UhWX/Lzf8wiotMQPs4draavWA
 4SdcdkTvM8QkH2km1gjWjtzPzyIMQyXbCYqibfrjI+0J4kAIZv131uqD2h9WXEVYjiuV
 LAcAXyxiTEtAVhLI/Q0TeXG8IWRGJmdG0UHAhpxtXzEEbpcwFbY0DmeubVK+jKc/BiKH
 Licry/nweTz4xIbrH5TYKs0WEJ/T7Q+moIxpwwu9HPSH3Gd1uqa1VrfrQv9et4yoPCVz
 GLrTBjvVYUdZ1p1J/ChrHxK+Ndz4v7Sk3GbpxTLOYR+fiHoKYt6M+YwfKVtk0qZzCejT
 OhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715348955; x=1715953755;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cMUMJYURHY94vqRajyuSN39xJoZIvziqTdmR++yNIMs=;
 b=wsX7ZJPZRRSS0a/BGP3ivgG7bFbobk9svmQd+iyp5fe7uSOwYMbx+E1vhmdJhNAtUi
 ZdWZqB0HxRlna1rdTYjewt2DEh052nh9mrjY0/6Kp6pdqhr26VyhTCD2sN3U5jMP94JW
 LVhWMBN7bc6tZpFowvvZl4Fctj2cZM882+g0N8Efd7UBfkrobc8HrufUoPfD/go53Dtr
 dRxB2aWlNNF25YAN4h8DHQ0Ib2wnuMcYfg1XSzQ6rXZwCRu/WJubV4Y7TNp+zcle99Bg
 bZAITU+Y2KE/r7X/KeThwW3vHUyr1bcdXCju9lGwsUkEDbPZj5FyO+bRBOo0QZyT5p4w
 xmqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVThp7DKywyyESuWR/a4t2Br7mosRA3Eu8sv1LjgzBhdWLwflPcHNEfTy0h0yiTX0RuerosDECS9VxuyOnMzjGRN5Eejf0jkk+qi0wNz4rpAIMPfCGt7Q==
X-Gm-Message-State: AOJu0Yx3Y4q/DGP5tJBDI6o4hh1jHJnGWb2PBVJqbPNmmvH/24eMjLd3
 hjiNueu81Zb1Rvyq6YCapPQe3U9D+Sk/zHppTK3x4MoDuoWhK7cKxkQ7gQ==
X-Google-Smtp-Source: AGHT+IGO7SfWGCZDz2y2v2OJN6Q5pLA4S5PJIF3I0ZYqlYd1skL7TqwiKQ4wsAASxy1Cfm6IGlAjcw==
X-Received: by 2002:a81:4f41:0:b0:620:26f5:c97c with SMTP id
 00721157ae682-622b01479cfmr27053657b3.35.1715348954902; 
 Fri, 10 May 2024 06:49:14 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:88e7:6eff:2864:482c])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-6209e346b7asm7301617b3.103.2024.05.10.06.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 06:49:14 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 10 May 2024 06:49:08 -0700
Message-ID: <20240510134908.3271725-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
MIME-Version: 1.0
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Following the semantic for dirty segments
 in checkpoint disabled mode,
 apply the same rule to dirty sections. Signed-off-by:
 Daeho Jeong 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.128.178 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.178 listed in wl.mailspike.net]
X-Headers-End: 1s5Qco-0000PS-RA
Subject: [f2fs-dev] [PATCH v2] f2fs: allow dirty sections with zero valid
 block for checkpoint disabled
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

Following the semantic for dirty segments in checkpoint disabled mode,
apply the same rule to dirty sections.

Signed-off-by: Daeho Jeong <daehojeong@google.com>

---
v2: simplified codes with the same logic
---
 fs/f2fs/segment.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6474b7338e81..cb0718cc1e47 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -771,8 +771,10 @@ static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 			block_t valid_blocks =
 				get_valid_blocks(sbi, segno, true);
 
-			f2fs_bug_on(sbi, unlikely(!valid_blocks ||
-					valid_blocks == CAP_BLKS_PER_SEC(sbi)));
+			f2fs_bug_on(sbi,
+				(!is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
+				!valid_blocks) ||
+				valid_blocks == CAP_BLKS_PER_SEC(sbi));
 
 			if (!IS_CURSEC(sbi, secno))
 				set_bit(secno, dirty_i->dirty_secmap);
-- 
2.45.0.118.g7fe29c98d7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
