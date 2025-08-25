Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D871B333C3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 03:56:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVKs0CAQRZyzPZYk/QyomSkYDoztzJXeMt3wsmgYIcc=; b=mSo7/fkXowwZ6A15I7WzJgCToX
	qCnYv4Af6cfGj3+xnSDFCn0z+YESd9bZNecidDS5NTYBoM3Mpd9GvDG+hBOolsjZiOyB8AByUxaQ3
	+vAubmUczX5qElsL4vqpK1IS5JwF/K3sKEVd8pEsuG6tHGpRTMqdhYDA6eqr1cJ4ImN4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMRk-00012x-FL;
	Mon, 25 Aug 2025 01:56:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uqMRi-00012k-ND
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J005PltTUq54IH8VBKzU0KCwcTcJecVMi+BmKpI7jwI=; b=K2uV0Tj6njwRMY+uGate7LNdku
 n33CTTO6xz1PQfiqHdd2Ae6Z6BiICCE9f5mD8WFvo8/SgP6XXCb63WVVO2v8RsRMt0g19u+uKAh9g
 by0sKdzYpz0SVCKXKgbLB5c2vVACrXH/ECRk84qhc5ninRyWoYr/tP/1vkaR6drFOHuQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J005PltTUq54IH8VBKzU0KCwcTcJecVMi+BmKpI7jwI=; b=mMRS6/zp+kOz7Mnlv9ANdNeEyu
 e+wAb70PFhfAi48mlQSPdTms3hhgxogvtcdzCtAYv0JAAq/riYjNpI90KFWitlF1eeMrOqyXRD81E
 +ifTZhBdZJEB47MPLmE70P6FxrzsPJ2jryVe8rF4195oND68nVH2+Btc/Oz5ccxI5804=;
Received: from mail-pg1-f173.google.com ([209.85.215.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uqMRi-0002qM-CP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:30 +0000
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b4c1ed55930so305286a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 Aug 2025 18:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756086985; x=1756691785; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J005PltTUq54IH8VBKzU0KCwcTcJecVMi+BmKpI7jwI=;
 b=I4Q92lQtI85HA6kkVslddGIp9hoxVnhSXeeN7bR2hoZ1fb0gOaKZJ/wShkJtVhbslK
 xM96kLcSmdeIBs//dJ16P00fZecvyd2VXCj5BrpMAW5ms8/yovpYJal/2pp0mjE+KkYK
 meucc1lW5TXpVtliZbl22YqUJwu1qO0Zurp48KZPtZJwtCtqE8kDUa1QNqZ9ql26iEae
 OlYq8vMMVTedSjri1v//hD5hJe/GhMUEMGezTWgrp523ygIZ46odPrtCAZYFImP1OBN0
 Sjc92RKH1y32lg0CPevuH7cdWzVMZkApvCYmQrdPRMxAlzTBcsokOzMVq/1WfFUo79Jl
 sQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756086985; x=1756691785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J005PltTUq54IH8VBKzU0KCwcTcJecVMi+BmKpI7jwI=;
 b=xOOySsu6UnbUa8tVwIR/jDwIEbByVcXr8y740zVp6tITX0yE8EwusG7NkM/4KYIxio
 CTvHJEAQvKuRWvo9hG5dhqXp6YgMuyzJvtvxPP1EX4Bph1L9hzWlNiZusU9iHrcZeUG7
 dKFtv42JOBI5wAAKQPg6ClvJ6y5ZvuyzZXBkj0yOWjGonhxVknkZILMTCobu9MGK24jr
 SrEEXTVSq6T1eKNLMV3eOP549lNoELcXsUNFUo0xHvIprPbHZ/n+0NQ215P1ROAbjG5L
 yfDfKDxhoNQJQnRI/CeOqmJLbrfjuwCVP5oSSznUYViXAgkARQKyAZYEsJygsz4hkHLI
 Q65A==
X-Gm-Message-State: AOJu0YxaUpK3yLKpfXN6dFV/1rMwLXVeazShhqZwR5O9duV/jh8XEql8
 c7rKwW3lqx92jL0xmIVaMB49lfvoPFmyHttg7T2EXOzEPTU3DoKmMXuE
X-Gm-Gg: ASbGncsWLrspubClBHMNuaGrZuR+ad2N5zF3bOUeOVtPV3hPzFsqZ2YxryJC0NMDcik
 6p5Xzm/CAjZrpdCdXyLTAUdXPr8Jf8cKEoq4vQNHT6AVoU999CK8zJtaQBBoaB/53laEuErID5n
 tgA47uKCrhWIzsWRoGaiRxI0q5NWoayUBp2lpZUFKfXZ9DWGW03UFRN1SDEXt23qN+lT34SN1/G
 apstFt/MeI0hSIsOt7go3/aSId+U16BKmLbmw44q47/C5hzYwreQWDfCc7B4sf0GsL6c1TKOzKr
 W+SpM+1A/ehSpIvdN1ZR02PcyVR3AvZ829hG1mzpmSmPBKjRyxcRVAvGjCGFt692JFFebS2iIDj
 9tgkuUnBQ9q/WMX3Ahoo/h8mXd4RO
X-Google-Smtp-Source: AGHT+IEyiP6QvgZXwKYkl5zSHOUdWtXnVXI6RGT9GBLYoHqeR9wP5tBAFNvOJXlLUfYhTEAh7D0Ssg==
X-Received: by 2002:a17:902:e884:b0:246:e885:46c5 with SMTP id
 d9443c01a7336-246e88548edmr7369245ad.22.1756086984656; 
 Sun, 24 Aug 2025 18:56:24 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cb8b1989sm5147883a12.18.2025.08.24.18.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 18:56:24 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 25 Aug 2025 09:54:53 +0800
Message-ID: <20250825015455.3826644-12-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825015455.3826644-1-shengyong1@xiaomi.com>
References: <20250825015455.3826644-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sheng Yong This patch adds a new member `feature' in
 inject_sb to inject features. Signed-off-by: Sheng Yong Reviewed-by: Chao
 Yu --- fsck/inject.c | 5 +++++ man/inject.f2fs.8 | 3 +++ 2 files changed,
 8 insertions(+) 
 Content analysis details:   (0.1 points, 5.0 required)
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
 [209.85.215.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uqMRi-0002qM-CP
Subject: [f2fs-dev] [PATCH v4 11/13] inject.f2fs: add member `feature' in
 inject_sb
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

This patch adds a new member `feature' in inject_sb to inject features.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fsck/inject.c     | 5 +++++
 man/inject.f2fs.8 | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index 272a4a64dc05..cb348b3ba067 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -134,6 +134,7 @@ static void inject_sb_usage(void)
 	MSG(0, "  magic: inject magic number\n");
 	MSG(0, "  s_stop_reason: inject s_stop_reason array selected by --idx <index>\n");
 	MSG(0, "  s_errors: inject s_errors array selected by --idx <index>\n");
+	MSG(0, "  feature: inject feature\n");
 	MSG(0, "  devs.path: inject path in devs array selected by --idx <index> specified by --str <string>\n");
 }
 
@@ -428,6 +429,10 @@ static int inject_sb(struct f2fs_sb_info *sbi, struct inject_option *opt)
 		MSG(0, "Info: inject s_errors[%d] of sb %d: %x -> %x\n",
 		    opt->idx, opt->sb, sb->s_errors[opt->idx], (u8)opt->val);
 		sb->s_errors[opt->idx] = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "feature")) {
+		MSG(0, "Info: inject feature of sb %d: 0x%x -> 0x%x\n",
+		    opt->sb, get_sb(feature), (u32)opt->val);
+		set_sb(feature, (u32)opt->val);
 	} else if (!strcmp(opt->mb, "devs.path")) {
 		if (opt->idx >= MAX_DEVICES) {
 			ERR_MSG("invalid index %u of sb->devs[]\n", opt->idx);
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
index df1d25ea33a9..a61d948224b6 100644
--- a/man/inject.f2fs.8
+++ b/man/inject.f2fs.8
@@ -53,6 +53,9 @@ s_stop_reason array.
 .BI s_errors
 s_errors array.
 .TP
+.BI feature
+features.
+.TP
 .BI devs.path
 path in devs array.
 .RE
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
