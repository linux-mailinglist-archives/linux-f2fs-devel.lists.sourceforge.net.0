Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C73527F0D0F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Nov 2023 08:55:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r4z84-0002G1-HV;
	Mon, 20 Nov 2023 07:55:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <korotkov.maxim.s@gmail.com>) id 1r4z7z-0002Fp-57
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Nov 2023 07:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AakIS7gjBUkb4rimXmYmgZJQZetziS+ULe2MTjK0V8s=; b=SmVectLd+SuxZ6WIMTGKl4JKmL
 lj6BoH1ykI3dji2klm218mgOHKppLeUaut6Zh+ZNnGC+XH+HtwvxMmt/60gPWzUKeu4xIz5SjaPOh
 uCgktPeQZaAmkj/06ct952zGKf99sk+2KDHzcYWJEB+pTGJfF9vwf8g9rlr5IKAlNm+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AakIS7gjBUkb4rimXmYmgZJQZetziS+ULe2MTjK0V8s=; b=VAjqdSucalwT6FoeG6PcanGwUk
 66ylSYtHGl8R9dUdw3azhDIqbT4Gt4VVzQvHQ/mRHWdWk9fgCjPchB22gvMQVGQ0TeoV/DPDfha5f
 fCcex1q5vzR0NCFqxQ02R2eLPuXlvwoh9O5v8aLZzBrdmWfse0bnvch8Hc4IfD48CfOA=;
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r4z7w-00AmL5-Vj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Nov 2023 07:55:29 +0000
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-507bd64814fso5639254e87.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 19 Nov 2023 23:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700466922; x=1701071722; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AakIS7gjBUkb4rimXmYmgZJQZetziS+ULe2MTjK0V8s=;
 b=FBBF7N4zj6vQooRaKoYsGfTF9IbNUFhenPu7TFRHriqINc6Ed1FPL8vYC61jLwdiS4
 dCgL7482M4WnxmeKtNR8O/XSyZJ3iPnzY2g2iE9/w/HxSiN8x9rLe+dJDANuNnmuZNNM
 rysIZscqZyP6LFe+ZUw5cQkHyrHSZ2L7RpDM8T+hRNW1GBP8yneh6yHw6wNFBGQomZrV
 2kvUSy7tBLs/+Tqq1u38OD0xnthXlUB+xxmuZjNEG3XcOGOTs6ImwfVyoPNz+TepOmM1
 1SU/GUyN2PuOnwq5OI/yham4oauAd7c/ZEUYDYMQp9PiDHmFuWZamGxFwxMLCiESpDhz
 0KHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700466922; x=1701071722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AakIS7gjBUkb4rimXmYmgZJQZetziS+ULe2MTjK0V8s=;
 b=scKnY0K+741Aayz8Yc0lkc0Zw52vBHmrQbJcNx6M9LNa3wU0oe72eY2GRK69HVMN7t
 y3WHfJqFWMEH6fqIM0Rlgr7IMPqMV2VqVQiGX8eskO4W8GjM+1G+WXeARr9HRCi8pBNP
 uFEpYlyVznQ6murlVrxtnSSxYeChIdQ1GyS1fcifVhHjcPK2H/xul2Ut2v3x/5DWFPTT
 BjEHku8GF6m3LoNmXtWWsLGp/vwDIZhTT0gb2yAvo0dt/a8+P7TTQdxl6m/WqX4/gMHK
 C3qJtdoFEoH9f55rWyfyGuHrfMqZ1HQNQOdf4ovAYg7o4kZ4jVGT+4JI/FDqkhWCNKRA
 qWug==
X-Gm-Message-State: AOJu0YzzB0+KdrIUjj7FJBCkVbJNzRqNsCKnJEm7nt100jIFDr5ahbDU
 2ABnFg9KztvUoWPcjf+3r7Q=
X-Google-Smtp-Source: AGHT+IGtUHouHuifutXj4JYY1dMd+Hmn+KUUV9GGwiazh1XML5bNImKMH32wJQcGBTT7WWQg6xctkA==
X-Received: by 2002:a05:6512:2c0b:b0:50a:ab3e:cac with SMTP id
 dx11-20020a0565122c0b00b0050aab3e0cacmr2569822lfb.22.1700466922029; 
 Sun, 19 Nov 2023 23:55:22 -0800 (PST)
Received: from localhost.localdomain ([212.22.67.162])
 by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b005079fa0b1c3sm1097111lfp.243.2023.11.19.23.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 23:55:21 -0800 (PST)
From: Maxim Korotkov <korotkov.maxim.s@gmail.com>
To: Aravind Ramesh <aravind.ramesh@wdc.com>
Date: Mon, 20 Nov 2023 10:55:04 +0300
Message-Id: <20231120075504.455510-1-korotkov.maxim.s@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120065507.423065-1-korotkov.maxim.s@gmail.com>
References: <20231120065507.423065-1-korotkov.maxim.s@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Case of failed memory allocation of dev->zone_cap_blocks
 doesn't
 release heap allocated rep Found by RASU JSC Fixes: f8410857b7a8(f2fs-tools:
 zns zone-capacity support) Signed-off-by: Maxim Korotkov [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [korotkov.maxim.s[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.43 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r4z7w-00AmL5-Vj
Subject: [f2fs-dev] [PATCH v2] f2fs-tools: fixed incorrect error handling
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Maxim Korotkov <maskorotkov@rasu.ru>,
 Maxim Korotkov <korotkov.maxim.s@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Case of failed memory allocation of dev->zone_cap_blocks
doesn't release heap allocated rep
Found by RASU JSC
Fixes: f8410857b7a8(f2fs-tools: zns zone-capacity support)
Signed-off-by: Maxim Korotkov <maskorotkov@rasu.ru>
---
changeset:
 - editted description
 lib/libf2fs_zoned.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index 56c97d1..81088af 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -293,6 +293,7 @@ int f2fs_check_zones(int j)
 
 	dev->zone_cap_blocks = malloc(dev->nr_zones * sizeof(size_t));
 	if (!dev->zone_cap_blocks) {
+		free(rep);
 		ERR_MSG("No memory for zone capacity list.\n");
 		return -ENOMEM;
 	}
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
