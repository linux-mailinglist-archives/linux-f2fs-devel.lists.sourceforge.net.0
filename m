Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFC6B2DCCE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 14:43:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxv6RAEZJ+OwoMDsIRSqiD0uzZKe45A18GLn7nsagJM=; b=YqKU1TDuD14kLDSrEyL5tdzadX
	8Sxq+TyvdtBM9NYlG2dN1yGkNStFM86UvXx1sAG0gmOUqIE+rQC5E0ViYoGnvxWACGR60e28BdU8u
	kikOa8E0wLUbpfjlwmae280DWc92fqAvFDwXKOdA5O2ElMluNLrctxwwXY/Wh7jdWDnU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoi9e-00057t-MG;
	Wed, 20 Aug 2025 12:43:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uoi9d-00057j-Ki
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LwK5iQBMTeY/Xz9AFwJju3xpXe3hteMt3ODoz0TfBaM=; b=PcH6JaQNi13pBD9kF2Jbafg/Y7
 ltbNtGuh0dLWuN0k/oK7GCs9GorpVG6Zhp8cAOTv/ME+tSsjfaM6eUUivKtuzrqOiNfHiKWjgREYN
 VkuK+vrCvcJqmclb6u1ukbh3JerIyow8LNLlkpCQjqA8uxwQW/gJ4MHceJUAS+X4/T2M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LwK5iQBMTeY/Xz9AFwJju3xpXe3hteMt3ODoz0TfBaM=; b=IbOfu+8kaR7lXmSZbDYwVMOn6X
 PLGbaj+mtmm6Z6dN7ju5b9bT1LLBx2PyqBGvpMYAguKVDifKsCnwzAUQ3AyL9aQe+xrft1wjAOreT
 2/Y1wzdirEugorr4K3J17DK2aVZ2Pl7KXGSmSAn49OUgZS017pZNggF1IaJLjhiJj8HI=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoi9e-0003lG-1n for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:02 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-24458194d83so47971105ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Aug 2025 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755693776; x=1756298576; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LwK5iQBMTeY/Xz9AFwJju3xpXe3hteMt3ODoz0TfBaM=;
 b=KEIv3cl6POKEwmjim/WmAMK6CZ6SBpi7MBEsuVLiY2+uNyTFeozbAbNItu1Gyu1E0j
 DjjULDdUML4XoUb4Ud3vw+UApwt8CGBSgAUVjiYJefsl1dcoN+gVrazLUjI+8jAvRbcL
 3wN5wBYIYpQQGEEixjx+Ozz3A3pyEGkYkiCQs4mXI2Zl168Auj6/DZXmujYhSGFonyyw
 Z5eRFkg/9yhMC0230lBUHSSHAmDzuBOeHlMbsfPPmaIfm+9zPsC7vjwJuSf6QgIfnFfc
 jvmF+U/5+CFnMbMNJxRy6pwwO90I8iLGOx1Ge45ftVLXjh18S2XWbJU29ghbT0XTeNwU
 RfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755693776; x=1756298576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LwK5iQBMTeY/Xz9AFwJju3xpXe3hteMt3ODoz0TfBaM=;
 b=MVTqEi8lD9qDwlgROdcY9lriKo+jpTe2XJEWXedNgH5KeXsiOVx/FTracif/JMmjpx
 Es4opL7WE2hxEbvRXw/Az1tHKSPLg6bCQnzPCTm6qRHxs7JKhDn+spCrrrPzasaZQ/4i
 JMFbtnaEsJ9U7+KsA2r60DicbBhbtDEQcxoa9GOUQSi/Nnki6qcZMesg1A4NDfazSS+Y
 UIol3jT+Q47aMJHBlXS8k9Wj4fJecqC8nMU6wTgXe8lvO3C7K+1i57PgHdTf96e5Ikv4
 ADB3lMxpERBnEIrnZ7xQk/cc1yVphgulm+Xmiiaa2U6fmOvB7dc1bD7szGEX4AXqlXzq
 ms8Q==
X-Gm-Message-State: AOJu0YwCYX5uLZbjarukEP9fW4F3UmJLulfGMtPNXGaiZtYiHVjeO5hM
 AOCKy5qgCC8q8q3LiDTLZCyyuUbFA2k/AaNvCYeIOK5KW78x3E03e7a/
X-Gm-Gg: ASbGncuopaZQzYO/vUgFXR6sbACZI2N8fR+ZBV/UXQGxKQbovtjUrViejlpoESjf2/c
 DNLQTAEt9t1GLBBR8GVSTx/qdvEgNGt1o8tAXleHie+ObZBsPQahXIbxuZQ+PypxhRkq2/EWjxn
 TOdn/CCszAApDocy2962pihIlT6piyq0A8RZvC7WMcAWDeAO89R1sEaJShqdXbO77ZRlMNuBCuI
 MjEcI4wVSc9z/Be6l0i3pUPnHZbbMAK6VCd1ibdIn9UleWGf77fv/XbrsX0vydz5jnkAI7pgIrO
 aJi+yoMoBrfEiLhLyP8GxNV14On5h1euSIWx8UIpW3WLl3XIjDZWCFt0Bpq1cDNo/uJttySF7gf
 qv1O+XwCkGUHfl7m/wppMhvIN/zp9
X-Google-Smtp-Source: AGHT+IFtmJXzqFhJ9tykZX0P3+8mLjTLtDtLyd1DyHZWmBRb7E4/4Abfd1H4YpAZB7/1S0TD0irIFQ==
X-Received: by 2002:a17:903:2ac5:b0:242:3855:c77a with SMTP id
 d9443c01a7336-245ef2341d5mr38116515ad.34.1755693776344; 
 Wed, 20 Aug 2025 05:42:56 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51b3dfsm25962545ad.142.2025.08.20.05.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 05:42:55 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 Aug 2025 20:42:26 +0800
Message-ID: <20250820124238.3785621-2-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820124238.3785621-1-shengyong1@xiaomi.com>
References: <20250820124238.3785621-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong Signed-off-by: Sheng Yong ---
 lib/libf2fs_zoned.c | 6 +++--- 1 file changed, 3 insertions(+),
 3 deletions(-) diff --git a/lib/libf2fs_zoned.c
 b/lib/libf2fs_zoned.c index 6730bba0da82..92791a768807 100644 ---
 a/lib/libf2fs_zoned.c
 +++ b/lib/libf2fs_zoned.c @@ -429,7 +429,7 @@ int f2fs_reset_zone(int i,
 void * [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.214.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uoi9e-0003lG-1n
Subject: [f2fs-dev] [PATCH v3 01/13] fsck.f2fs: do not finish/reset zone if
 dry-run is true
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

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 lib/libf2fs_zoned.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index 6730bba0da82..92791a768807 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -429,7 +429,7 @@ int f2fs_reset_zone(int i, void *blkzone)
 	struct blk_zone_range range;
 	int ret;
 
-	if (!blk_zone_seq(blkz) || blk_zone_empty(blkz))
+	if (!blk_zone_seq(blkz) || blk_zone_empty(blkz) || c.dry_run)
 		return 0;
 
 	/* Non empty sequential zone: reset */
@@ -484,7 +484,7 @@ int f2fs_reset_zones(int j)
 		blkz = (struct blk_zone *)(rep + 1);
 		for (i = 0; i < rep->nr_zones && sector < total_sectors; i++) {
 			if (blk_zone_seq(blkz) &&
-			    !blk_zone_empty(blkz)) {
+			    !blk_zone_empty(blkz) && !c.dry_run) {
 				/* Non empty sequential zone: reset */
 				range.sector = blk_zone_sector(blkz);
 				range.nr_sectors = blk_zone_length(blkz);
@@ -513,7 +513,7 @@ int f2fs_finish_zone(int i, void *blkzone)
 	struct blk_zone_range range;
 	int ret;
 
-	if (!blk_zone_seq(blkz) || !blk_zone_open(blkz))
+	if (!blk_zone_seq(blkz) || !blk_zone_open(blkz) || c.dry_run)
 		return 0;
 
 	/* Non empty sequential zone: finish */
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
