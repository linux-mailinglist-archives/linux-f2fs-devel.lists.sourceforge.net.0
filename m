Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6D066B5E5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jan 2023 04:12:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHFup-00013p-6B;
	Mon, 16 Jan 2023 03:12:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1pHFun-00013j-H9
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jan 2023 03:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+uvWnxWMZEBIPVCCWshuAk5p9GxmhTM+KlXSt0OWDlo=; b=BTXMqUoYNmMQ3V5M97AiIUXvLF
 mNrUweDZthlroPBc49bxmlvnKRGVnbtyN7aKgcRq5LUytxeT4qmG3Qww1wFYgsTUA/stjzt3VPpV7
 wdFnfhoHi8JrCobmPHGUAGNgiBVh1ncmi7jshkguiTPvYzt8OaWQAmOZKev9s9upP5Yk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+uvWnxWMZEBIPVCCWshuAk5p9GxmhTM+KlXSt0OWDlo=; b=arpN7kX+/iz0g2e3tKAWxqEaz+
 P2aagjve8RZD/PLtk/49QRaZ4Dm9vw9X5db1duqAiEf8bAo24RS+wnYRDeobiz4Y4O9bz5rPD04P8
 Y3u0MMdLhH8pYOgTVse84U2CQ1OGK6acYuBXq0LBkt9NA/UtOhk07FFkgp99O/2QGttM=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pHFuh-0006jY-Ll for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jan 2023 03:12:04 +0000
Received: by mail-pl1-f178.google.com with SMTP id jl4so28968876plb.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 15 Jan 2023 19:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+uvWnxWMZEBIPVCCWshuAk5p9GxmhTM+KlXSt0OWDlo=;
 b=e9J/PhiX3rq8foVglCMKTK1MRLHL40bGSnRCohcD26yDRznHcBNM1F24x8vJ3tbdtZ
 pLRH/B+MYdUSzxuh5nLa5vi/NOm4Z+EG4zPSja/UKyhEyrtAP6TPpAQFM/Jz0bUJaWyG
 8jPAmPnnzI36C8JpFcNdXhOCWZbZXX03Ff0DsH22t7iJx+G1bNOGeX9ltcPnDYGiCRgD
 AWNnAoxbGesfPyxEmcDfgdCV0TzFIQ+lNI7UfpffLOV85fp0xzPJpfR6Y2rd7adindM9
 Bzgy5/nFaLx4pW5ORpKVN0rUGFRXO7Tp2lGqCLG8U7QVaQcjYSmuNWkHXSyYuCyuX0cL
 1ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+uvWnxWMZEBIPVCCWshuAk5p9GxmhTM+KlXSt0OWDlo=;
 b=oRKH+aWQfKW1g2w6lNIXuSu6kg+QG5hP7OCDT5ZeRPLMOLYzq3rFRgeLKmPJ4JLf+c
 ew9TU6Ynvs5no0WqXHa8ZBjJcxsoWmR9amW46oYpgX7qh1Ryzb8ovM49SjV8qAftTiyQ
 DCLLFWMjWoMH7ASq+5rEg1JCCv3Zr+Iro0jmHtVOxF/NVsg3LV6ltQ6UIT1Z4k3bAEXT
 mNKHwIgnMJkiSdwvQfmuxLwGokX+mqdscwxJtzh4htFUSF/iJlJO4Bv30kO4MfnWw9nB
 fHEUdQfJflZBCXarVaOph7cLO6Eg/MdhJ9cejnMJJTX78t+bOon34JUZCokZWF8z3+2t
 9bWA==
X-Gm-Message-State: AFqh2ko/PcR15MIi3lGsy/6r/Du06rDLrUlblmRUd/lkFUicyDi1+2G3
 yR4/e9n5YXfmJvdNxnd98Q8=
X-Google-Smtp-Source: AMrXdXuF2b9j/acNhKWm3eKdgl1Kz9pOPdAae3xJR8x+uVyVFiK8BPcplWdJZN/qW3mTaUcx5sjONw==
X-Received: by 2002:a17:903:24a:b0:194:480d:6afc with SMTP id
 j10-20020a170903024a00b00194480d6afcmr20913024plh.48.1673838714072; 
 Sun, 15 Jan 2023 19:11:54 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a170902db0300b0018980f14ecfsm15326458plx.115.2023.01.15.19.11.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Jan 2023 19:11:53 -0800 (PST)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 16 Jan 2023 11:08:49 +0800
Message-Id: <20230116030850.20260-1-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230113125859.15651-1-qixiaoyu1@xiaomi.com>
References: <20230113125859.15651-1-qixiaoyu1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently we wrongly calculate the new block age to old *
 LAST_AGE_WEIGHT / 100. Fix it to new * (100 - LAST_AGE_WEIGHT) / 100 + old
 * LAST_AGE_WEIGHT / 100. Signed-off-by: qixiaoyu1 Signed-off-by: xiongping1
 --- Change log v1 -> v2: - fix udiv 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.178 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pHFuh-0006jY-Ll
Subject: [f2fs-dev] [PATCH 1/2 v2] f2fs: fix wrong calculation of block age
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
Cc: xiongping1@xiaomi.com, qixiaoyu1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
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

 fs/f2fs/extent_cache.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 342af24b2f8c..ad5533f178fd 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -874,11 +874,8 @@ void f2fs_update_read_extent_tree_range_compressed(struct inode *inode,
 static unsigned long long __calculate_block_age(unsigned long long new,
 						unsigned long long old)
 {
-	unsigned long long diff;
-
-	diff = (new >= old) ? new - (new - old) : new + (old - new);
-
-	return div_u64(diff * LAST_AGE_WEIGHT, 100);
+	return div_u64(new, 100) * (100 - LAST_AGE_WEIGHT)
+		+ div_u64(old, 100) * LAST_AGE_WEIGHT;
 }
 
 /* This returns a new age and allocated blocks in ei */
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
