Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 198B7A71831
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Mar 2025 15:15:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txRX4-000663-8f;
	Wed, 26 Mar 2025 14:15:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jyh429@gmail.com>) id 1txRX0-000655-S5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 14:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Anvf65kFlASXiYrhuvhmi9oEZJmpnJM1LPwfUNxcGpU=; b=PTFSjUJxzsqeDkz6racaCK8HST
 VXERPUFOaeL3wlu+99TttYPJ+AIcYJxtmNl/adJf+rRC0dJSbV7rYkVLzPha/PLCaYe62r6WwtnpU
 xmJ1O8Q2UyQfHsT9GUYhV3YNqvPclZZKVVsiC9mDuEFax1101zGjzWKHglTTQ9Sp7860=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Anvf65kFlASXiYrhuvhmi9oEZJmpnJM1LPwfUNxcGpU=; b=c
 GZHQwo8aSydlIj7fQSE9gIJcDNRpiczX3QdW8h2sl2Sz87VpZgaJXBDvZNYdaV9sqDp/I5ZWnYCcT
 rcWCwhVYOSHxGU3FI7laxQyXCwIiTjJ2gLuUr4tIM6YO2YO42V/a3pvQIKcg6mMqlcO9rp94cAW00
 AhkLC9nPgew07jiM=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1txRWp-0004WN-FM for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 14:14:59 +0000
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-22423adf751so128876815ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Mar 2025 07:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742998477; x=1743603277; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Anvf65kFlASXiYrhuvhmi9oEZJmpnJM1LPwfUNxcGpU=;
 b=eGd3rKz5d5vfpI2ozbqIeSflr/EMH3ekLPSJ2BCT7Vmf7wpzeHK82TtsmkdVtQhYh2
 DQcSjvmi7XWyk2pSisuTJQXFN0tcQwONdPsjoEZSMRNv8BaxX2Ujoll56OzTyuuPlLA5
 STvdckKOClokcPd2XEy/x88J3X1fD8AETLgd3ynzDUeOImAta9ZibI4FYilflIOXNJ3p
 hnb3y53geb0prTDxiSY4Mq/Eayg/pGJwWG4dyx24dnYoNVPHa1KWWDKvoK+ZoQtN7XTQ
 MTXQp0cf0OtEEX1FCF2tMtwvRvMuM6dnNVgxHJRi6lzydl5XYAhotHKX7wgh6UF1Pg14
 4Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742998477; x=1743603277;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Anvf65kFlASXiYrhuvhmi9oEZJmpnJM1LPwfUNxcGpU=;
 b=nHLn0n5G7pHIwSL4Sbw8zSk2w3LPzFUOidYSck4xS8EeQrMZuId0gfE6hikD9zi4Fz
 EOzXH0qpW1UI7K1ZTAfRNF7VN7QwhlKmMm311IK/LRDuV3t7ueiVHA0A8WNYewpI+DE6
 Wt9lnR2quJikZ2Po7XZHryXqgi/FR1gkq4sreVqvqH8+XJVyjvS0kZ0Ni/NFHPgzk49u
 mPOCcaHXG6ApYDGeVfNjk0n4WjxzQaCbpMc4kLxxM/fCGS8NmzFCa+prVX6lREXasoWp
 STGjuMQiw0DGic8Qd6oWmERf7/EOreOwIyeGNwWtT078GkHDc4kvRPqYIiQWiGcnJMjy
 w1yA==
X-Gm-Message-State: AOJu0YwnAMSn3vPYMHM3tAM//neeU/NLE4s3pCrqHxH9ZOJfcNqxH9wW
 BdMmpIFZrmKLeStJI+g3fYLb8p+fXV+a3FZfwhu6Ok7mXkpFw2E+
X-Gm-Gg: ASbGncuyPeEWdZmTSImhrgSAE4I7RGzl0HqDLMfaGgNwB4k9dXpoKteL04rcOiHEM1L
 wMmLE6Ha3lA4jsK3Y0IDzLvOHqwOY1qeks9j7eUnOtEgX1H86JCyPOqir8IXd8iAHiczF9LKTME
 bSQtCvXlwzeKUKjpy5erllh9HjnEW5awaA1pAkisCrReYj69VRdx/O1GgbPrJhk6o4qJdFGiI0V
 w5q+gsxfgO7oslNCu3QPtVK9SCu4xt4XmEga6uaM7FHHUpJAJUYt8IdnrsUish07XXUsnmVg0qt
 +bWGlmhDsjm7/TBgjjA+i5qWsXEgXZ9j7NKst5NYXaEAVKQ3K2suEjwmbKApKjqH0Au/HKwrbw=
 =
X-Google-Smtp-Source: AGHT+IGK01CfleCX2pzM5nt0ir3um7yD8M9syjpA5VmHgXO/F4LfW2P+UBe4DgFIy/ycLsbdmFIZ2A==
X-Received: by 2002:a17:902:cec8:b0:225:abd2:5e4b with SMTP id
 d9443c01a7336-22780d7fb22mr302208615ad.16.1742998476493; 
 Wed, 26 Mar 2025 07:14:36 -0700 (PDT)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-227967dfe4dsm92323315ad.167.2025.03.26.07.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 07:14:36 -0700 (PDT)
From: Yohan Joung <jyh429@gmail.com>
X-Google-Original-From: Yohan Joung <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daeho43@gmail.com
Date: Wed, 26 Mar 2025 23:14:28 +0900
Message-Id: <20250326141428.280-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: When selecting a victim using next_victim_seg in a large
 section, 
 the selected section might already have been cleared and designated as the
 new current section, making it actively in use. This behavi [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [jyh429[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.170 listed in sa-accredit.habeas.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jyh429[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.170 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1txRWp-0004WN-FM
Subject: [f2fs-dev] [PATCH] f2fs: prevent the current section from being
 selected as a victim during garbage collection
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

When selecting a victim using next_victim_seg in a large section, the
selected section might already have been cleared and designated as the
new current section, making it actively in use.
This behavior causes inconsistency between the SIT and SSA.

Signed-off-by: Yohan Joung <yohan.joung@sk.com>
---
 fs/f2fs/gc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2b8f9239bede..4b5d18e395eb 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1926,6 +1926,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		goto stop;
 	}
 
+	if (__is_large_section(sbi) &&
+			IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
+		goto stop;
+
 	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
 				gc_control->should_migrate_blocks,
 				gc_control->one_time);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
