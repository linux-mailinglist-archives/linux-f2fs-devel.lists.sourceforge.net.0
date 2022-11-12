Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A300A62682B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Nov 2022 09:33:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otlxK-0005pl-C8;
	Sat, 12 Nov 2022 08:33:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1otlxH-0005pY-LV
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Nov 2022 08:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uKgNXpHSoU4bJRdAiprU+Siq+ztqOPTG6adKu9Aw2Mw=; b=S2Zdp4Znim6L7RilWpaoqbipyj
 BvvUTy8tkQr24MdFJExWd+y/VXCQfij57jJhdWyd2cNJauuH7ho7WYRcSL0rYoOUyrocZO5P4UX9s
 llqsz0N4oJrJte1sWWy0VHLZaKIOrDEcCAXIFhxRPtLw6Yco2esPHrjX4+h7v9Gh21HM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uKgNXpHSoU4bJRdAiprU+Siq+ztqOPTG6adKu9Aw2Mw=; b=b/dGKUsLTCsBc2I08IyDVD0Rkz
 +ZHrwZj3qsOWZMvmob4uiOuVVxy3IkAH1Rbhy4LNw9TttL64xUz2cr4DgZ+/Fexjwdq5zS4uXVFn7
 lcNg/EfqdliLg4f5i64LfzpIvWOHQpQFqEV/AlCClVuk77lQU74eo4HLk6CW6d+Q5lis=;
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1otlxD-005EAy-EG for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Nov 2022 08:33:35 +0000
Received: by mail-pj1-f42.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so6547971pjk.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Nov 2022 00:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKgNXpHSoU4bJRdAiprU+Siq+ztqOPTG6adKu9Aw2Mw=;
 b=fBP3FX0pwml50Uh6/7TLPrlSWu4YWvKJq6zHrIeKb0qe8NHom1gBIj7oK7F129fe6y
 aQulO3GzWYv65HSqRYzxN64wM63L70wge67TQdtKPZ0J5aojcZnDrahYEf9czVi0zdJa
 oxcEQlq7LokErV4Z76/A1SFCNFHpcAwoCMVTDaMeNmhdSOdQNaFhXUAiUU22//JmaZmY
 nsoVISIeSGI2ojwWXIRHMNQ4o3YKdSf6cZtJ64c6elvK+q4kuDnCZqO/XyCuW4qrC/bs
 BfEH5RfWE1ybX/0QxNDyleXrBOMqvSJpKySj1bz+7Wl9B0KgIzyy9VgVRcfJoPrsRr9/
 nCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uKgNXpHSoU4bJRdAiprU+Siq+ztqOPTG6adKu9Aw2Mw=;
 b=18rolTUZt+oAl04IKRMocD7CuZd6r0/WW2PbajqE0JPGrGMbgTB//LCwnKClp8/owj
 v5zaMwKN5xUoOF2x/CYCy8Ey7wFMCGf2To8L95WZOlp/sJq0chcGzpSlsLxHQhlFy5iC
 9p8Xr+MyeJLQLkCttAuh4KvNzsjjRCdoQCt+pQ3k6y+XLnqaxBKsgyQ0gjKJN6okJgak
 9gGgHz9A6M7MZLVgwWDCGLA7s5SCwzuSFOeowwRMfqTooUIMDIKZLvxQxMhPf3pyt3tk
 i77c63xyEmkvT2iO5xLR830+LsC0LA9YYsMDakOqpVVQaY3NXH4GbrEWYvmuex9R5Zmm
 /zjw==
X-Gm-Message-State: ANoB5pnh3su5FX9zshWx32SUGG5cgfq9eLh8FvJl7vOgkOjuSQKL+lDs
 g5CVANutsNvKzcV4Pspv9Mc=
X-Google-Smtp-Source: AA0mqf4ULTYzbfuO1jXL9AwmtP2BbudfwlpLYyhMZW16sEQ+6W5t/RVYFye2WVxtIEoTh/ZopmR5Lg==
X-Received: by 2002:a17:90a:d302:b0:20d:2f:709d with SMTP id
 p2-20020a17090ad30200b0020d002f709dmr5660496pju.40.1668242005943; 
 Sat, 12 Nov 2022 00:33:25 -0800 (PST)
Received: from VirtualBox.. ([129.227.152.6]) by smtp.gmail.com with ESMTPSA id
 i11-20020a1709026acb00b001870533c443sm3066927plt.236.2022.11.12.00.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Nov 2022 00:33:25 -0800 (PST)
From: Yuwei Guan <ssawgyw@gmail.com>
X-Google-Original-From: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 12 Nov 2022 16:32:49 +0800
Message-Id: <20221112083250.295700-3-Yuwei.Guan@zeekrlife.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112083250.295700-1-Yuwei.Guan@zeekrlife.com>
References: <20221112083250.295700-1-Yuwei.Guan@zeekrlife.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: A cleanup patch for 'f2fs_tuning_parameters' function.
 Signed-off-by:
 Yuwei Guan --- fs/f2fs/super.c | 8 +++----- 1 file changed, 3 insertions(+),
 5 deletions(-) diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c index
 2f36824ff84b..f18ae5410b2c
 100644 --- a/fs/f2fs/super.c +++ b/fs/f2fs/super.c @@ -2192,14 +2192,12 @@
 static void f2fs_enable_checkpoint(struct f2f [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ssawgyw[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.42 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1otlxD-005EAy-EG
Subject: [f2fs-dev] [PATCH 2/3] f2fs: cleanup for 'f2fs_tuning_parameters'
 function
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

A cleanup patch for 'f2fs_tuning_parameters' function.

Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
---
 fs/f2fs/super.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2f36824ff84b..f18ae5410b2c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2192,14 +2192,12 @@ static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 
 static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi, bool is_remount)
 {
-	struct f2fs_sm_info *sm_i = SM_I(sbi);
-
 	/* adjust parameters according to the volume size */
-	if (sm_i->main_segments <= SMALL_VOLUME_SEGMENTS) {
+	if (MAIN_SEGS(sbi) <= SMALL_VOLUME_SEGMENTS) {
 		F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;
 		if (f2fs_block_unit_discard(sbi))
-			sm_i->dcc_info->discard_granularity = 1;
-		sm_i->ipu_policy = 1 << F2FS_IPU_FORCE |
+			SM_I(sbi)->dcc_info->discard_granularity = 1;
+		SM_I(sbi)->ipu_policy = 1 << F2FS_IPU_FORCE |
 					1 << F2FS_IPU_HONOR_OPU_WRITE;
 	}
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
