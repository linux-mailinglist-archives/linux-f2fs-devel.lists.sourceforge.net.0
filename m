Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAFF68772E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 09:20:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNUpw-0005e2-Qy;
	Thu, 02 Feb 2023 08:20:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1pNUpv-0005dw-JQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 08:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DIcuUiiD/SBGnIgaWh9h7tdpch/KAXjOE7i0nNR5sBg=; b=L0by/zxL5NEGaeiAeGr5uoHMkZ
 zs4N/UjWKAsea6FoxvNmAvkgXYVOnT+zIEHGCAtnE3m5xqFn/ueUzCYATcbBujGLkUmN22+UotGet
 zimcfvXVPPuNe/ANrGdEDUyazfDLqbM5zTVfe19r5Nx+vopk30yb1QLzarhew5HpbmYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DIcuUiiD/SBGnIgaWh9h7tdpch/KAXjOE7i0nNR5sBg=; b=UJhAS2RT1D492+TXpDWykRRqdI
 SaV5+FVGFq2GAwFNRjowUz3fncWaNKIsNtLf8u9tmXVgw7i9KBzoBCk6J606Mjap/Kr5IhESsTAo0
 OtHgAqr+NFbyUXWAyIrjgzuF26tjJq/eqIsWhYcTglM0Q0A8P70z7KUGIQiJ1usM1bBo=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pNUpt-0002TD-HK for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 08:20:50 +0000
Received: by mail-pj1-f54.google.com with SMTP id j5so1185930pjn.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Feb 2023 00:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DIcuUiiD/SBGnIgaWh9h7tdpch/KAXjOE7i0nNR5sBg=;
 b=bavLq+RrC+kxjPPcdrbN+TxKPZ/oy996YNrl+gPTSl6aIelDmWWiK0ZbnTy9P5lVRf
 TR9VXV1ywAjmK5xeA6iau58arLHAdcP/4ubbpDPnj8RyIUEsCWVaGT9dF1Papgp6rQig
 ZeMLiWJNzKwOL2QfJPiwee0zLKmjomIIWm8QlU6mdQcWS/MA4DO9br58WxkoNrNg1h9v
 yyw18cifRidBJ8uDKXnCvwdHfMtjyVHjVoFRy0JQKAZ1e14Kuij2wSlLyaxflNute/mb
 I4ughYaQEffqcPOATrx6wWXX1roQB9e51llMaB/nIMKZsTc/TVRekFbWDp9hlP3j06e1
 Wpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DIcuUiiD/SBGnIgaWh9h7tdpch/KAXjOE7i0nNR5sBg=;
 b=ylTBYzcj2YVpSCijgrRmzUrpYENiu8bkG0++zHBUVO9g+ShcJdhLGYhXr3e5vk279K
 Pc0YJXhhhSO/ThI5tn6vybNws6dKIJEpztjlKHUXu4M84F5VX3DdbKqcWEhlR68Kfx2G
 xN8NQkryDhU5E9EM0oFMelqp5YAsHDjqAJ+XiF1xHPe/Zc4CUllazwchXQfo/7TY1Rha
 a9PPUKDkMjb79O0SL1cTt62AOk6whhkjHlJeX3kENek/Pq1b+YHMC/S4PMF8kwL9iN36
 AF1y4ryH9+dd02MjyZ5m3GuvgRe2OUCww3Hs+D/VfNXTyPLQaBWDR70z+pJMn3YieVUd
 N39A==
X-Gm-Message-State: AO0yUKUtIbe2ooyGR7mRwgT2fM1wTtPmaAkfWHU4gA9/tsQqWtARbOIZ
 I2P9jY+1ug3RpxwF9GB7im4=
X-Google-Smtp-Source: AK7set9h/+kDyAmkJhJAUwYxodSQR95dRZRvKb1M0umFvwFLRRIcZIkStEhQCdTLV3UVW0WnmsUqtw==
X-Received: by 2002:a17:90a:bf04:b0:22c:90bd:18a4 with SMTP id
 c4-20020a17090abf0400b0022c90bd18a4mr5658032pjs.22.1675326044732; 
 Thu, 02 Feb 2023 00:20:44 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.237])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a17090a694500b0022c2e29cadbsm2578563pjm.45.2023.02.02.00.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 00:20:44 -0800 (PST)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu,  2 Feb 2023 16:20:27 +0800
Message-Id: <20230202082028.9013-1-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <938a8e61-4e47-1acc-938c-c90d213d2c86@kernel.org>
References: <938a8e61-4e47-1acc-938c-c90d213d2c86@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently we wrongly calculate the new block age to old *
 LAST_AGE_WEIGHT / 100. Fix it to new * (100 - LAST_AGE_WEIGHT) / 100 + old
 * LAST_AGE_WEIGHT / 100. Signed-off-by: qixiaoyu1 Signed-off-by: xiongping1
 --- Change log v1 -> v2: - fix udiv Change log v2 -> v3: - keep the accuracy
 with div_u64_rem 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.54 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.54 listed in wl.mailspike.net]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pNUpt-0002TD-HK
Subject: [f2fs-dev] [PATCH 1/2 v3] f2fs: fix wrong calculation of block age
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
Cc: Ping Xiong <xiongping1@xiaomi.com>, Xiaoyu Qi <qixiaoyu1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently we wrongly calculate the new block age to
old * LAST_AGE_WEIGHT / 100.

Fix it to new * (100 - LAST_AGE_WEIGHT) / 100
                + old * LAST_AGE_WEIGHT / 100.

Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
---
Change log v1 -> v2:
 - fix udiv
Change log v2 -> v3:
 - keep the accuracy with div_u64_rem

 fs/f2fs/extent_cache.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 342af24b2f8c..d9f12f404beb 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -874,11 +874,18 @@ void f2fs_update_read_extent_tree_range_compressed(struct inode *inode,
 static unsigned long long __calculate_block_age(unsigned long long new,
 						unsigned long long old)
 {
-	unsigned long long diff;
+	unsigned int rem_old, rem_new;
+	unsigned long long res;
 
-	diff = (new >= old) ? new - (new - old) : new + (old - new);
+	res = div_u64_rem(new, 100, &rem_new) * (100 - LAST_AGE_WEIGHT)
+		+ div_u64_rem(old, 100, &rem_old) * LAST_AGE_WEIGHT;
 
-	return div_u64(diff * LAST_AGE_WEIGHT, 100);
+	if (rem_new)
+		res += rem_new * (100 - LAST_AGE_WEIGHT) / 100;
+	if (rem_old)
+		res += rem_old * LAST_AGE_WEIGHT / 100;
+
+	return res;
 }
 
 /* This returns a new age and allocated blocks in ei */
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
