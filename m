Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC23B7E73A6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Nov 2023 22:34:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r1Cf3-00008C-Nn;
	Thu, 09 Nov 2023 21:34:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1r1Cf1-00007v-Lc
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Nov 2023 21:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/unuH/wgOv+LMXS1Iv/n0xTf2dbEARyI1vRnvxRKBR4=; b=UtNAlAw6LhLyzFzdcqgGtIOR98
 tMn6hH29OSANSf+VZ0H9DSxaLif6Gwxw2MC54XlsTaUD7vt9ijP3pz2EgCJ6KW5z1xDP5K9HLRNWp
 bKdXMc9EHxemXFOhoB4JTbih1RcReyQx8/4kemaFOSWdvzcV6eu7smk86KSXtEbVts1k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/unuH/wgOv+LMXS1Iv/n0xTf2dbEARyI1vRnvxRKBR4=; b=H
 rNvcVdO0T/B0nKZLr6cbDbaRERU5ylfglvySaSO8H04EMsU//EuB0ocQiS06TXf1II6dvgs+8SBsg
 hWo9ZOAj3wvxtO3ooeFbPPKA57Wg6b0Jy68AsNKQrDCSo8uPK3Q95x5jtFQ1OzkcUZmwx0DLVMur8
 rHDSOXiJlXKGU19E=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r1Cez-000Gm7-SH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Nov 2023 21:33:58 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1cc316ccc38so11826845ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Nov 2023 13:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699565632; x=1700170432; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/unuH/wgOv+LMXS1Iv/n0xTf2dbEARyI1vRnvxRKBR4=;
 b=BJSSdasxIjtAqZg6x+Hd5T2fvvIVL4VnILQpfpuJTCm3HEWNtv/U4cbn73o6k1xmxO
 Twy9Z+xKGFZ/PCJ3mt3guEaHotY6pZOzAXFnPTOLaXNZSJsmjumeQw9r+u62qLsl+Qh3
 yEDBoeRnfAMARE1WuiNjKFYoEUse5Xzl9YMVbq4bi7eN2xic8ZCpGldhc1dcxPkaxHmH
 1SV8bWet5efQzQ0ZHzE8FHkg7e/upXtE4p3ZqtR48O6bOiPMfSBZ4TjxgIE0ri+dL8JI
 Pee2lkrFnGHsg3+sO9CZHQoBs2Dqp+qYRdktZCXCsLAuva2hjQlMjXrfpukzU1aY5L+t
 jagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699565632; x=1700170432;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/unuH/wgOv+LMXS1Iv/n0xTf2dbEARyI1vRnvxRKBR4=;
 b=mN+r7NIKV8Iwn1pLVSB5ZUC+lQrHK39vlQXgVKb4n41O9lECy/iPgNPqS/4i7+HtuA
 GNKnkMVs70ED5n869Tz8WXbMWqpuoTqEQFTS57/DrLEzAx/QSFhT6+n7BbS15WKtZM3I
 TX2gMCGsK3PsvZoQ9940RTZefMy6jFcNySiEVB1VIT2mfVWyXOx1g38g4aAW41SO1p3U
 GO0ziBT2Fi/0EpA9XGO4iZa4IkzA+5kz8QgY0PEQA40TYJTPB5oH+jm8J8wdUCMj3WH4
 E8z+pqU9rVwRwygDUh5wxAf0CHks5QbX/1ktWVqC9lzRUVDT/HuKfn+QKcMkINP5l3MQ
 5w2g==
X-Gm-Message-State: AOJu0YxDa71Rt7jupsKNisZ3vaGGkWpCkX95W4E61+5TAqkSSaYJV4lf
 W6RTBCPLJJgYZP/tJIHiHfM=
X-Google-Smtp-Source: AGHT+IE9PYWFnJi2XRz1FID1YWfKCOTF0hvn9ln/YjvaPRVQc+6AbSETDQawoHmp/BfL6AQW5zP/ww==
X-Received: by 2002:a17:902:8e89:b0:1cc:636f:f37c with SMTP id
 bg9-20020a1709028e8900b001cc636ff37cmr5781479plb.13.1699565632137; 
 Thu, 09 Nov 2023 13:33:52 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:f97c:cf47:191e:4442])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a170902d48a00b001cc46240491sm3977722plg.136.2023.11.09.13.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 13:33:51 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu,  9 Nov 2023 13:33:48 -0800
Message-ID: <20231109213348.675704-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Need to initialize user cache valid values
 to prevent from providing false cache entries. Signed-off-by: Daeho Jeong
 --- lib/libf2fs_io.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-)
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.178 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1r1Cez-000Gm7-SH
Subject: [f2fs-dev] [PATCH] f2fs-tools: initialize user cache valid values
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

Need to initialize user cache valid values to prevent from providing
false cache entries.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 lib/libf2fs_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 39d3777..d76da83 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -165,7 +165,7 @@ static int dcache_alloc_all(long n)
 		|| (dcache_lastused = (uint64_t *)
 				malloc(sizeof(uint64_t) * n)) == NULL
 		|| (dcache_buf = (char *) malloc (F2FS_BLKSIZE * n)) == NULL
-		|| (dcache_valid = (bool *) malloc(sizeof(bool) * n)) == NULL)
+		|| (dcache_valid = (bool *) calloc(sizeof(bool) * n, 1)) == NULL)
 	{
 		dcache_release();
 		return -1;
-- 
2.42.0.869.gea05f2083d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
