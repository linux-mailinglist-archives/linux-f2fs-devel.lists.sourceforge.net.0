Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D477F6C4B6C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Mar 2023 14:14:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1peyIV-0006me-Fc;
	Wed, 22 Mar 2023 13:14:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jyh429@gmail.com>) id 1peyIU-0006mY-Ms
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Mar 2023 13:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=baxr/TfV6vb0mZSM+YpIGl9rUZD6xaIa7Gwpdmc5OPs=; b=N+FFtR46dl1cfdezrR8cduTFxH
 CsKj7S4Z073J0isI0px5wvBgK1+r/3MsMVR+nKyDQNVUmDGtZGb9H9kBqsmwCwnWmEDJngJNDK8Y6
 dIMKyiYyq7CmjMWcnX2Ezs+4/7U3K7PmDWMGkCQVrWs8iYX4Wl0c7JJtX8ltRb8vUyI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=baxr/TfV6vb0mZSM+YpIGl9rUZD6xaIa7Gwpdmc5OPs=; b=Z
 iBvKjDd3Y6i+JWOyy24KfH53p9Cnb4XlD4m9S5bk+apfufBSoGJRzMOkwn09Qke+EEsPkyTrSaOpA
 JYj9+njpjrx4KOLdDXQTAj0y1kJP6Vxcs/IoWLIBJa5CrwW0RMaS4gBx0RzOvag/1Uv9aDzF5YaAq
 D1qscF3nwUEbRQHM=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1peyIU-00053p-LB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Mar 2023 13:14:35 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so23561230pjt.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Mar 2023 06:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679490869;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=baxr/TfV6vb0mZSM+YpIGl9rUZD6xaIa7Gwpdmc5OPs=;
 b=Wmo5wz+2MsyX9LclYzujPJoSIBAygEI83ePf+HLkFRMJ2RmdHCkE2jQpsncyq6UqsA
 UzRJGDjb2Qk4E+1OkmnLaz82UOU8UV7/4/Jzcck9glym1w0WxnR+XvuqU3eT5/oK7V9s
 yQVuL/kcrQX3VjGi67GZ3CbsLdLjuqmJV0XHsQ8TFrcH5QMLo++Z4rCPhS/uUEyxAZio
 CgHbrRvI/43Yu46gUmsZKUp9dv62y74NWUUje/AsgNRZI9pfqhq86vAFsPn9fGxA1Qdz
 A2Ul0hszaOwL73L776o2LuZFhCtUXfhS4p4iyt1lQXosmtC13SGGn9U5tdeoz77e8Mc4
 D32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679490869;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=baxr/TfV6vb0mZSM+YpIGl9rUZD6xaIa7Gwpdmc5OPs=;
 b=SiSRPAe3EDVV/qzlsl+sryKnhCSvkTTfk0WJmN0HmhRHI8MNgx+JYtA+vND2DD2fH6
 jiX+QerTQWAa2xrhKZziUVsyMfA7xPNCo0lb/cMHKBOBqD1s5iQuuK8rbWkZRogpD9px
 OOxUgdb6zkDsE2ZvK7vbJ0pSfYt6dFhRHlwSDQsdCbXyv+LxGy0LCOys5HkNMLyuw2cz
 lGVE+EXlWaG62ZD7ow2OlEJ0CcJaNevp12p5UnzLD3A4fBHvrT96zmMoBXH/alaM/fYx
 /PN6LvTZ0Fod22YYbEU7hC/DNNQV6kQeXDjqCzvLljbHKLi1dClQ+1CDKTNbz0q/lQ5k
 54Vw==
X-Gm-Message-State: AO0yUKXpqPNGAx7AfuXzzL58FyhJHav7lo0WZgyznBEnVBdCame/ZewV
 Z6nT8VH/lrJEAiwRiBL5q5s=
X-Google-Smtp-Source: AK7set+pi70MjDAx+ZKG581ampyYxjngbxcTO5dJPbA9C1GBChsou4z1lipYiBryJ0Td8UDuEfmABw==
X-Received: by 2002:a17:90b:1b4b:b0:23f:7666:c8a1 with SMTP id
 nv11-20020a17090b1b4b00b0023f7666c8a1mr3732804pjb.18.1679490869014; 
 Wed, 22 Mar 2023 06:14:29 -0700 (PDT)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
 by smtp.gmail.com with ESMTPSA id
 u62-20020a17090a51c400b00233afe09177sm13228631pjh.8.2023.03.22.06.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 06:14:28 -0700 (PDT)
From: Yohan Joung <jyh429@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 22 Mar 2023 22:14:08 +0900
Message-Id: <20230322131408.1192-1-jyh429@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fix alignment check to be correct in npo2 as well
 Signed-off-by:
 Yohan Joung --- fs/f2fs/segment.c | 2 +- 1 file changed, 1 insertion(+),
 1 deletion(-) diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
 055e70e77aa2..46458085a8d0
 100644 --- a/fs/f2fs/segment.c +++ b/fs/f2fs/segment.c @@ -1858,7 +1858,7
 @@ static int __f2fs_issue_discard_zone(st [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [jyh429[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jyh429[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.50 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1peyIU-00053p-LB
Subject: [f2fs-dev] [PATCH] f2fs: fix align check for npo2
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
Cc: Yohan Joung <jyh429@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix alignment check to be correct in npo2 as well

Signed-off-by: Yohan Joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 055e70e77aa2..46458085a8d0 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1858,7 +1858,7 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 		sector = SECTOR_FROM_BLOCK(blkstart);
 		nr_sects = SECTOR_FROM_BLOCK(blklen);
 
-		if (sector & (bdev_zone_sectors(bdev) - 1) ||
+		if (sector % bdev_zone_sectors(bdev) ||
 				nr_sects != bdev_zone_sectors(bdev)) {
 			f2fs_err(sbi, "(%d) %s: Unaligned zone reset attempted (block %x + %x)",
 				 devi, sbi->s_ndevs ? FDEV(devi).path : "",
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
