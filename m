Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF585517E4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jun 2022 13:58:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o3G2Z-0002xU-2Q; Mon, 20 Jun 2022 11:57:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <qxy65535@gmail.com>) id 1o3G2X-0002xF-FA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jun 2022 11:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9C+hw/LDK0fNwXiLPN2w98TPlBfCZarzlx/DbOVjVR4=; b=KswevZQI3mE7AkuhPyOQrsUXAW
 cmDRKd1Lws7n3eXX+xHVEFAh1Yb1457yPRh4YmpcrbpzSfL9kq3w5SO/pnlAwBZWsr1RnNLXzG/q/
 lWp4WhParyyh0qWb+0r4T3ht3EqqbLuaytpf420i9om/ji6P++zNRrKoh/QZXMsDmmzg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9C+hw/LDK0fNwXiLPN2w98TPlBfCZarzlx/DbOVjVR4=; b=EPHK3zHlvBtVZhEz0KPxieFpxU
 vUnhDEUA4kWK66vDJKgAvSyMXiZWVNG2ZI5Tozbo6C96TUqvKcEI1rWl4LvxnQiWmtggxaQ6bLEK1
 m8cGQhzYPexeAFOh1Ojz9ggERVAXEWp66wxYsCJQsxyWK5u5bbK1Ob5SLIOpFUWebDg0=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o3G2B-0008Af-4t
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jun 2022 11:57:48 +0000
Received: by mail-pf1-f170.google.com with SMTP id s37so10006833pfg.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jun 2022 04:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9C+hw/LDK0fNwXiLPN2w98TPlBfCZarzlx/DbOVjVR4=;
 b=kynoLGne7zsBPZJecBRrJPiyLchBLvmtNMel3lqaLJ13AK4Ko0E25y341pPgT+IcMc
 7RRMUMgoFr5ipH5k1btOHMgvMdRZfzZerPlUy5svd8/xgUxJoP2mElEwnhrLSzI7bMPA
 OylnVImfJ9YVaaM4BgVEswf6ktREpWRHBooCgmaUTUOySb9uvO2cXF5MtGAZbgMcEfNz
 Xzc84ZGcOpAJtH9hWmRCo4vB63jETIRcKyXdNxPzkDjwGIdExTQ3Pie9B5Xtg3z3H9fz
 n9WPeyddmKQqSIkjm3+EG4jAleiH1oAumH8+oiuvl68wn4ixeCJYmx06lC83ywu9zyns
 Hjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9C+hw/LDK0fNwXiLPN2w98TPlBfCZarzlx/DbOVjVR4=;
 b=zTTeT0arSz+voDmBWwmvbb2/qSw5iHhh2Wpqz856vaT7y83fBqmbjn/h3GUCfQ2eGX
 5UfP11idYsVlMqZWndWUSXsHv2o1ZVDeTPQbt8xWboEOMtP8Z2N/mvJ92b4K6Uf5hhi1
 5OZ9REYblAHTLuOM4CJzIzKNd9U1IMRb5+dMrwkHxujPaZDJRcJaBB9NpdDSMLed04oN
 F1SEXiN4HzJx0pl80mfzahjNxm9eZA0o4vPRd4HqzvM8pD0cV9VMq6sayyZCwrcWofox
 L/zdf+AzJluawDgTZBTvfqOEzhIpMw3dhD5Habb5GBbB46bl4X+2xHH3bEgVJV6YnXai
 q/sA==
X-Gm-Message-State: AJIora+ivFWIHXWP+3OcKRNsLEUCrIG9ZKp8zZIEG8tF5bTOSas1bfsy
 dB4II7+GoEQ2sypQla7V75F9jV1sK+CS42qf
X-Google-Smtp-Source: AGRyM1uzKXry+gURZQst1vKjzwX7SOs+3xu91J4k8AyY31VrvU7Tzr8QKFS0h2NZ/vGmblST1v1Y5Q==
X-Received: by 2002:a65:6e96:0:b0:3fd:c8b7:5fa6 with SMTP id
 bm22-20020a656e96000000b003fdc8b75fa6mr21049752pgb.569.1655726249529; 
 Mon, 20 Jun 2022 04:57:29 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.250])
 by smtp.gmail.com with ESMTPSA id
 mm21-20020a17090b359500b001ec86a0490csm4539154pjb.32.2022.06.20.04.57.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jun 2022 04:57:29 -0700 (PDT)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Date: Mon, 20 Jun 2022 19:56:29 +0800
Message-Id: <20220620115629.9169-2-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620115629.9169-1-qixiaoyu1@xiaomi.com>
References: <5627a654-d605-6840-a133-e583c804aadd@kernel.org>
 <20220620115629.9169-1-qixiaoyu1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: qixiaoyu1 --- man/resize.f2fs.8 | 18
 ++++++++++++++++++ 1 file changed,
 18 insertions(+) diff --git a/man/resize.f2fs.8 b/man/resize.f2fs.8
 index a4b6cd7..3288760 100644 --- a/man/resize.f2fs.8 +++ b/man/resize.f2fs.8
 @@ -17, 6 +17, 15 @@ resize.f2fs \- resize filesystem size .B \-o .I over [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.170 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o3G2B-0008Af-4t
Subject: [f2fs-dev] [PATCH v3 2/2] resize.f2fs: update man page for options
 -i, -s and -V
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
Cc: qixiaoyu1 <qixiaoyu1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 liuchao12@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
---
 man/resize.f2fs.8 | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/man/resize.f2fs.8 b/man/resize.f2fs.8
index a4b6cd7..3288760 100644
--- a/man/resize.f2fs.8
+++ b/man/resize.f2fs.8
@@ -17,6 +17,15 @@ resize.f2fs \- resize filesystem size
 .B \-o
 .I overprovision-ratio-percentage
 ]
+[
+.B \-i
+]
+[
+.B \-s
+]
+[
+.B \-V
+]
 .I device
 .SH DESCRIPTION
 .B resize.f2fs
@@ -44,6 +53,15 @@ Specify the percentage of the volume that will be used as overprovision area.
 This area is hidden to users, and utilized by F2FS cleaner. If not specified, the
 best number will be assigned automatically according to the partition size.
 .TP
+.BI \-i
+Enable extended node bitmap.
+.TP
+.BI \-s
+Enable safe resize.
+.TP
+.BI \-V
+Print the version number and exit.
+.TP
 .SH AUTHOR
 This version of
 .B resize.f2fs
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
