Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E66D7A9524F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Apr 2025 16:01:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u6rhk-0000IV-Al;
	Mon, 21 Apr 2025 14:00:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1u6rhi-0000IE-Cr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 14:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e8RPH2BbnVIKvlMK3RpIg2tk/VLMraIy5hL155khQMg=; b=N4PBaO2JYz/BC0A4V868vlLOHT
 qKEKV6zCIqZMAtWFDF0WTMtKXagsiBxrt7eAXPxsjN+7xNpm6m8osbVACf0EtR1MHP2t7mHTt5PGR
 DfdI8pgxeq/SHlki8erV48AO0Xsws/8rSecMFuIqNPSJZp9VZGepzFbhnxGVVv+MS61U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e8RPH2BbnVIKvlMK3RpIg2tk/VLMraIy5hL155khQMg=; b=SR2v/JvY15biumVugJ0aIAJA8F
 iKkQsNKU7A6/nn6Oj5bTdy5mhD72XnTNfAdWlQsoEERjg1r9CNGVWHS9DeO6oy+Z2pmWlNWzieLZk
 5WqJIWSBMcbUJsbrHulF4lkYVHXflyIi8H+BuuISicuW+rq63sovpwGL0Yd+hzJAXzYY=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u6rhS-0003y0-5N for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 14:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745244026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e8RPH2BbnVIKvlMK3RpIg2tk/VLMraIy5hL155khQMg=;
 b=OiQ+XNG88UVc4HS4n7sh535DDc1+DWk0pWR45ps80p8cR1Bbjcs5t3MdkiwWmS5yXej/42
 jG651n1ouBeE8BdKZQ17QWYQNeYvS0aXh2KwCNBRJHJuo5DBnIdvITvvRyC79JwxWuIVWj
 6FOEah886IUOmlOwtp/1b2SpJTrT454=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-uG04BoDrNdKwFR2l6onQ7g-1; Mon, 21 Apr 2025 10:00:24 -0400
X-MC-Unique: uG04BoDrNdKwFR2l6onQ7g-1
X-Mimecast-MFC-AGG-ID: uG04BoDrNdKwFR2l6onQ7g_1745244024
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3d81b9bb1b3so36045865ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Apr 2025 07:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745244023; x=1745848823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e8RPH2BbnVIKvlMK3RpIg2tk/VLMraIy5hL155khQMg=;
 b=RtKb7PCKQauvLEITjYOrZ7mHL4V9dTCgqThpP1bKMdKUsIa7zbciaOGE5FOHHkNjbL
 1drNn30/hM/8EbiXrryyfq0oUQs6pPnuY7MFIQkHcZeysbWPyOR0XuZY3v7nZDJzCKEW
 nKnk3BkMkJGeAmx6r7cZDXyz29k+plWdz4pC5tdVSAEp4+ipWVLcb8DeXspZL8zQ63gK
 61UI5tdkFWGdWyUYr+G3DjVloFrdaWuLwg718LkxjQ/hnC4TZB2DIc1eQD/d+sqj76h1
 /SPJXxV02+DDsIOUYmJjtwsACc0cCFjJOQhPhcfkCZot63hCEq9oR5X7mt3huYTFqmTB
 0Xsg==
X-Gm-Message-State: AOJu0YzLPJOU2wJwaa7p4NaANC/zUWhSo2iXtrMZEJwBBo3WRo2ymKv5
 mKTvwawiKH2qLUyDHmS5lxMmIYBP6zwEeVxk09RHnXAM7ySHxuzs2UDiG5lPT2jkFW2k0ZARFxU
 e1At8YyRnIfV4ofHsGIodaJIHhD1DMQBjkO9qnTzue9BxsG+5s5NPS8CoTPI0iwA9LwTUcOl2aH
 kZgy/ZG+D5cDZaD0NGFYI3S7Q2uv+SeBXl095bFb4Q4dvkZg+A0gnuPO3ggg==
X-Gm-Gg: ASbGncsiHRnw1coIx/5HBpkACDR9LE8k8NanWQLoacLmQbSBr0NQQddsoIaQeFl+rY8
 vnatcK8enV6/5Gzxgc606KQOR+lRSEKNBLNCMfWP5u+FJa3Qa41T5eVjj5xhnpjtH7lERkonj5R
 QWJK7u9qynJYGPrLgUoUmMk0FOdnbhVlFfbbnuGxGbOMkbws78RifbqY24hJYlngIbfh6vnMqJb
 Hke5o3c4ek5P+wJyIkSPw7YFEbLWxpswKZIedxFh9V5UlBCgYEHbVqT8LKqQcNGJA8gUuRlFljC
 IYiH3a3izMFwqV4=
X-Received: by 2002:a05:6e02:b25:b0:3d3:fbae:3978 with SMTP id
 e9e14a558f8ab-3d88eda88b8mr86557115ab.9.1745244023367; 
 Mon, 21 Apr 2025 07:00:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcXmrBchySvZeSIYUTpP1KYEqxDrs6gjM3LNVXs/Ogo5wfzDIS3o/QfmWlwEs86V44NRmD+Q==
X-Received: by 2002:a05:6e02:b25:b0:3d3:fbae:3978 with SMTP id
 e9e14a558f8ab-3d88eda88b8mr86556535ab.9.1745244022616; 
 Mon, 21 Apr 2025 07:00:22 -0700 (PDT)
Received: from fedora.. ([65.128.104.55]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f6a3839336sm1788866173.73.2025.04.21.07.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 07:00:22 -0700 (PDT)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 20 Apr 2025 10:25:05 -0500
Message-ID: <20250420154647.1233033-7-sandeen@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250420154647.1233033-1-sandeen@redhat.com>
References: <20250420154647.1233033-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DHweIDe7ZuqT-0761Hu2snpkcPafWyZo__esginSplA_1745244024
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Hongbo Li <lihongbo22@huawei.com> The
 handle_mount_opt()
 helper is used to parse mount parameters, and so we can rename this function
 to f2fs_parse_param() and set it as .param_param in fs_context_operations.
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.8 DATE_IN_PAST_12_24     Date: is 12 to 24 hours before Received: date
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u6rhS-0003y0-5N
Subject: [f2fs-dev] [PATCH 6/7] f2fs: introduce fs_context_operation
 structure
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com,
 Eric Sandeen <sandeen@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hongbo Li <lihongbo22@huawei.com>

The handle_mount_opt() helper is used to parse mount parameters,
and so we can rename this function to f2fs_parse_param() and set
it as .param_param in fs_context_operations.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
[sandeen: forward port]
Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---
 fs/f2fs/super.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 818db1e9549b..21042a02459f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -705,7 +705,7 @@ static int f2fs_set_zstd_level(struct f2fs_fs_context *ctx, const char *str)
 #endif
 #endif
 
-static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
+static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 {
 	struct f2fs_fs_context *ctx = fc->fs_private;
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -1171,7 +1171,7 @@ static int parse_options(struct fs_context *fc, char *options)
 			param.key = key;
 			param.size = v_len;
 
-			ret = handle_mount_opt(fc, &param);
+			ret = f2fs_parse_param(fc, &param);
 			kfree(param.string);
 			if (ret < 0)
 				return ret;
@@ -5273,6 +5273,10 @@ static struct dentry *f2fs_mount(struct file_system_type *fs_type, int flags,
 	return mount_bdev(fs_type, flags, dev_name, data, f2fs_fill_super);
 }
 
+static const struct fs_context_operations f2fs_context_ops = {
+	.parse_param	= f2fs_parse_param,
+};
+
 static void kill_f2fs_super(struct super_block *sb)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
