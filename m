Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2311396A574
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 19:32:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slXO4-0002Xd-Ke;
	Tue, 03 Sep 2024 17:32:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1slXO3-0002XW-5r
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 17:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wvy2llSb6mhTG2xVJeP62lrOlUSxN0dZzizut/TXj4c=; b=JBafzpYslqS400nGEfpjWTzVyR
 OLZLztaMatSaApNMowb8v5R4s+wAYcEF1m4RRCCc26MZHacDsMRCpbWAT36rgMduhMA4IdoJh7EbF
 RsMv9VnoXN/KxceTdFMLXZ2x/heAFrzcECzxPwP3SjR/hz07rCO53u01UaRanA+WtmWw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wvy2llSb6mhTG2xVJeP62lrOlUSxN0dZzizut/TXj4c=; b=M
 ekHk1gNIXS6I54YBFAkP0M2iLqcVH2Q7o33LwNmxWsZIh+gPmyt1GWdrgza8RewQgNyvA9jkBDkrA
 7AYCZDS81T7OSLBz188i1Rgrd9RgdaU5crq79uuDei7jL0uls9eIqLCrkuhcmnrted3HrcewoLJAc
 d4ivca+5Y1gCLhBI=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1slXO2-0006o7-07 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 17:32:14 +0000
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-20570b42f24so23372045ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Sep 2024 10:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725384723; x=1725989523; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wvy2llSb6mhTG2xVJeP62lrOlUSxN0dZzizut/TXj4c=;
 b=AadOWew9qfmgM3HSsLXJrISH1H0l2QFOC40GK2S16uXRDElsLxWId8qMOPrBK2B8Gv
 3lZ5KkiTwYmBDnVyxzMt/vG7516asI+jcCjRgbBjv/iwXCELiwbbOpQjBtXFAXNyoPYm
 xjsANvl4jhOuTRxtvUdG2dEiLUt+XW8p7BY3jQn4vmBAL+1uIqiFNfDJIZEnjba2bL2A
 BLQ37996l2drEL9wSquhK9Dfm4YGK6xWHO00EL6nJmlDotl7IBGPOJdFdXNPTDtdKNuN
 uMqFFBnsrx0hdfLbykUfn8z0Q+2IJsx0U2b9/nGIPxaspTjqkOPqzeZ3/MugtWhCHMKP
 vpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725384723; x=1725989523;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wvy2llSb6mhTG2xVJeP62lrOlUSxN0dZzizut/TXj4c=;
 b=gS4gJ8PX7YZ4f2cWlVG7kwctVOaTZaAtV19PZgCWXEC+a0UHp1QAmGfBjcIbr1JC24
 057b7WMmiWmEV0+j9+RFf91vLiegirduuwdKANLifVvXjW4JuovAhvvst75qhPufB3Ox
 8GmAYcd1R63SShaEAeXmgl+6BNMq6QdPbVOfgdB9C1L52h/2APVtQN0tiMf0tizzKRzO
 ZOkWXduRZY+lognWCEkcEiAIemYnUY1wGKR7bel/JM/SzGG3g9qQQnfeb7azu7j8ELvR
 gmS+xnhPtyhkn+R3kfkuAvEZO0YR0mCAfMWmZMWye7lbtHpjqZuTOcBUHWYTck39kvS8
 GK/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoEn6i4dlIwkOsXngoTGa0v4daGkUVYKbFys4nH9TkvranSQlDT/KOGgujQsEZT8OUcNIqlZdlLZWNzUXlnBWp@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz3YT2C3M52gfKyMbrL25Ykrzf8tpUdZtxxcBalgPDrO4M0TQQx
 bbi2ArXacEyGKsaUbHzqV93lfwRnTjtlw5MYf1Im6TueaAModIGmnYUvTw==
X-Google-Smtp-Source: AGHT+IFIahYBPcjte+YlQCLqeChmcbFhwZ4TuJKg3HWBf6QpcGikxjLUC7Zob7C2zcJdVqnVLILNog==
X-Received: by 2002:a17:902:d2c2:b0:205:51c9:49e3 with SMTP id
 d9443c01a7336-20699ae7b7dmr21553735ad.15.1725384723218; 
 Tue, 03 Sep 2024 10:32:03 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:368a:4513:19e2:ed23])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206ae951617sm1098315ad.83.2024.09.03.10.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 10:32:02 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  3 Sep 2024 10:31:57 -0700
Message-ID: <20240903173157.602995-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong The conversion between cpu and little
 endian
 is incorrect. Signed-off-by: Daeho Jeong --- mkfs/f2fs_format.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slXO2-0006o7-07
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: use correct endian conversion for
 writing lpf inode
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

The conversion between cpu and little endian is incorrect.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 mkfs/f2fs_format.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index c9d335a..30d8e19 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1547,8 +1547,8 @@ static int f2fs_write_lpf_inode(void)
 
 	f2fs_init_inode(sb, raw_node, c.lpf_ino, mkfs_time, 0x41c0);
 
-	raw_node->i.i_pino = le32_to_cpu(sb->root_ino);
-	raw_node->i.i_namelen = le32_to_cpu(strlen(LPF));
+	raw_node->i.i_pino = sb->root_ino;
+	raw_node->i.i_namelen = cpu_to_le32(strlen(LPF));
 	memcpy(raw_node->i.i_name, LPF, strlen(LPF));
 
 	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE);
-- 
2.46.0.469.g59c65b2a67-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
