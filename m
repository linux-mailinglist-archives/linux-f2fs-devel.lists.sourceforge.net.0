Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98050AB65
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf9B-0001o5-CL; Thu, 21 Apr 2022 22:19:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf9A-0001nd-3Z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kr6o/ffcroC8ZFV7QVSAoVWXW1Mh66w9qZqxDoEsaE4=; b=EAOj/7Fo1JHQxCbNbSRcD8zCYk
 0eEnzepC0tMDU9eryX1RKosvPw84hL93NXmAKXucotacquTS1auTRua50elUXOxaI2QAvGI/gPK4h
 L2ONt/pPbjK2/DSQwX8xshvfVADIbpeulTQINL3yeuVWwDaHNAsRaaMn2xugboLkJxBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kr6o/ffcroC8ZFV7QVSAoVWXW1Mh66w9qZqxDoEsaE4=; b=NBmSfPwlp/A+4/vFgkzwUxH85f
 yQmCsP27bXkdTxW6y5FzTtgO4T0PYBUPHWM2j3D/oFnG1F76sioN2kIf0Pf7Az1IctZMMqqBK3L+7
 CffPGk6x6HPB77AbEOcOO2YUO3OC16SxANX++dMF/2KtQDZIcZRAI7WU1H3Xdb5q0atE=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf97-0002xk-SG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:30 +0000
Received: by mail-pf1-f179.google.com with SMTP id i24so6238467pfa.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kr6o/ffcroC8ZFV7QVSAoVWXW1Mh66w9qZqxDoEsaE4=;
 b=FqlguRWJJNgJ0XWhpnDkyfkwuW7fVj+4UfCSGPo5u7lzH6jXhiGex4N4FjcbIOqkYA
 Yb6p++8vCJB6n0EvaYlDG9JF6nmMT74RpEN7YSvqJqGV7eudjOGv0PP9R0s6TKnKqbgU
 tHbMjn84ZF2jwKxrVPqOX0CkOFM7KAxOXZN3aHQTpY1iRAFtOJzK4uZmSO3Q+YcUSl5Y
 wJwkeJDXgv7/QRuvrthZGFKX+K2fCXld+tFo8l8H7dqpGetOsL7fygT++AjFJ/oi2hFQ
 31JjVrz1xA2pF7Lnnef05XS1uKmAEpt2kySEF9ThteGofvuoYTRGhEiw/GBRqj3VWbzu
 wupQ==
X-Gm-Message-State: AOAM531h+NziS5TK+HvdqAwwDS2jF2HeZOZEpsFqOd/QQQ6+iQ9cp+N4
 w5uKAZIhaI9ke97xBjAvSrm+BVdJjNtPLg==
X-Google-Smtp-Source: ABdhPJy10pTbnBEV+I5K2TFYw99qs/CdH1Ga5NE03/7cb+v9s+gPwoV6chw6RUQ5gqYMJotVU/MsTQ==
X-Received: by 2002:a63:194b:0:b0:39d:f8e:9bb0 with SMTP id
 11-20020a63194b000000b0039d0f8e9bb0mr1369218pgz.56.1650579564026; 
 Thu, 21 Apr 2022 15:19:24 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:23 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:28 -0700
Message-Id: <20220421221836.3935616-24-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220421221836.3935616-1-bvanassche@acm.org>
References: <20220421221836.3935616-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Suppress the following compiler warning: main.c:37:14:
 warning:
 unused function 'absolute_path' [-Wunused-function] static char
 *absolute_path(const
 char *file) ^ Signed-off-by: Bart Van Assche <bvanassche@acm.org> ---
 fsck/main.c | 2 ++ 1 file changed, 2 insertions(+) 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.179 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf97-0002xk-SG
Subject: [f2fs-dev] [PATCH 23/31] fsck/main.c: Suppress a compiler warning
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Suppress the following compiler warning:

main.c:37:14: warning: unused function 'absolute_path' [-Wunused-function]
static char *absolute_path(const char *file)
             ^

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fsck/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fsck/main.c b/fsck/main.c
index fc776eb0af1f..8676f17555c5 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -34,6 +34,7 @@ struct f2fs_fsck gfsck;
 
 INIT_FEATURE_TABLE;
 
+#ifdef WITH_SLOAD
 static char *absolute_path(const char *file)
 {
 	char *ret;
@@ -51,6 +52,7 @@ static char *absolute_path(const char *file)
 		ret = strdup(file);
 	return ret;
 }
+#endif
 
 void fsck_usage()
 {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
