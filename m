Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9524AF6A26
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jul 2025 08:15:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PR8KhQPijOVScyCQzd2YWDRPfQmqE1IkxFnik7/hcpk=; b=geovp+oMbK+NCy8kszlUmoB59z
	tKjDhXf8OvyhF/Q2Acb6yqJb3G3qRdyVahfiqsr8Z8T5rDIDjXtzr/JgHhRKwucExs2l62BVVu2XT
	Kb/SYPqyBliKhdU4hUCeEN57rrsNzngSO4+XU6os8RU2pPj/uCfEaGDv5qIP+JoR5m4o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXDDh-0006H0-30;
	Thu, 03 Jul 2025 06:14:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jqqlijiazi@gmail.com>) id 1uXDDe-0006Gd-Fa
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Jul 2025 06:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Od3PF4RS53A7QsLp35+y+5uzvfxRl7JdTycHj2dci8=; b=cGdU65QQA00JrcpJyXHf6oS6cU
 W5xGtdHvx9K2yTWVksjMtNA7IzIQJAlhYvIbSC3rO0CGerbp4jEDwAmlrOqHvAJj+Iqj5C6ZPaNyt
 d8UGvrhcWOaou7qv83wvRvwff4AkOAm7iyRKfVmnZai9fHZsMjB93ZfgLJUfXj+8EQFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/Od3PF4RS53A7QsLp35+y+5uzvfxRl7JdTycHj2dci8=; b=T
 p/p7EuPo+C6+95Gi8MBlMaI+kshM2F0wotePLJxXfYWwnOV/3ISmEk8yAIjx88SwsXDJs8FvHDPaN
 zOjSLXSJAIvxxzsjzU60YDBLuUEDSLZrSDmI0oDmKg9qPCfqeV37o26YZISX/a36fk82ZMnM0JCwR
 qG/N3Yy56GZQg4KA=;
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uXDDe-0008AI-3j for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Jul 2025 06:14:50 +0000
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-236377f00a1so78191435ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Jul 2025 23:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751523284; x=1752128084; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/Od3PF4RS53A7QsLp35+y+5uzvfxRl7JdTycHj2dci8=;
 b=cfbqBsqhVck1Bunn1Bak3T4L1dC7nM0+ZLIOboa/5l7OaUcO4WNVU80vWs3lMGBqD5
 8mZ1Ab3llUhJ0iSvVvs9EJcPj+T0qxWNfTkJD8oltNlCcg/mCwLkXvqB3DX0yExOZUau
 WTjgsmmLwaClrGLRFU1YhmQcm+Ysu/q35YG4R7LYlJZ5xP/VlruNnlsanba7Fmp4bCsM
 4SmD5pmbHwvBAfmXO9Y0m6vQbcmxCXP4QSjhAuX9E4Vxt9+vJWrqSNcjb/vuj6d4A5Tj
 RsvJQFm81ZJHaMMVSzVd8J1vcxgFmU6wi/zxyremX3Dw3XwMGfnNIUpOJ96FAnQNYydv
 cfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751523284; x=1752128084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Od3PF4RS53A7QsLp35+y+5uzvfxRl7JdTycHj2dci8=;
 b=MbDOKqKzHqUCyXf/EtmzGaw505At5w8b/ivQzDlccAHfQosTz5ZgEginncKlELJ0Pt
 GmTd+DHE9QnAo27sPJcbNN1G8eFhQF9cksEtMvRF0BDh7E4krtWnnVzDArlvodc3Kl/k
 XXiQAnkydM6cHbQ/1o3M1Z3PAyK+7as6a7mFdZjm2BCucW/lPBUW3b6U99wXkQSh5vzK
 4TtDAZjvVu43IBKHh0GqLZR650inH80mhjKYRSIriKLtAJJO8HDmL2PkbprQmMv3wco8
 kChAAGB6CHS8N6hc9Bm/C78z6pBNqN4sW5oD7Igeg3n9c6U2FQOKUO/oSdN0ByM70fEU
 5WzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7L8uw2Z5KEli9FGFpMfKYNV/W+N62QaT0KiOnBzpSmlu0GV/hi0/NvI6Dmh+IcSfQtVjNPZ3vWNu7yIEzD1DG@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx8GzeBgz6GyRcCcVzROv8uDClGLN3MYiCa+RS4Q4TBrb4XUuo5
 908B+mOut22986IPJGgKsIkJHKJ7CVY24EvgzYIa7+e4/HI/tR3jc14wpU7IlA==
X-Gm-Gg: ASbGncsTaZ5C2OF3+5Wvg5tR83yfOUKm1KHJQZ8IF1ckxBlE3d0QS/2oN4YQXEzMTqh
 lCYcbZoGH4dU9t7WE+kFtvvVLJhwSfi5rwd3eWKbElqSlAT/A9aX6nLovgoyosGNQowhJ2MPcBL
 yJ8aHIaYssW5cfoAbM/trtjmHpRbgM2OWOUf3CQWhd9vN8zGDibeaQPfyt3GepytQzw9H0N0dhE
 qyKibgqBKLg58r2TKe0A1H3aii2o9inL3149x+n3zXiNFxLKpmMSZawbvuKLvqDUzavB/8tE588
 Umr5Z3JO5kiLzL0llL/e6lw3h7UOs2q32qG+7bVX7110DhFplU8HF16VWHcCM5VuNcs+gs0=
X-Google-Smtp-Source: AGHT+IFERY3t76tWfmFM9oUHVs/TLS8SO0df7GYYogLaTiRb+3FHXe1QV09GYmFdciDCowtYk1jDCA==
X-Received: by 2002:a17:903:294d:b0:235:f4f7:a62b with SMTP id
 d9443c01a7336-23c6e5b6811mr57926085ad.41.1751523284342; 
 Wed, 02 Jul 2025 23:14:44 -0700 (PDT)
Received: from localhost ([202.43.239.100]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f22cdsm142392125ad.76.2025.07.02.23.14.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Jul 2025 23:14:44 -0700 (PDT)
From: Jiazi Li <jqqlijiazi@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu,  3 Jul 2025 14:13:04 +0800
Message-ID: <20250703061358.13425-1-jqqlijiazi@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  options in f2fs_fill_super is alloc by kstrdup: options =
 kstrdup((const char *)data, GFP_KERNEL) sit_bitmap[_mir], nat_bitmap[_mir]
 are alloc by kmemdup: sit_i->sit_bitmap = kmemdup(src_bitmap, sit_b [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [jqqlijiazi(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uXDDe-0008AI-3j
Subject: [f2fs-dev] [PATCH] f2fs: use kfree() instead of kvfree() to free
 some memory
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
Cc: linux-f2fs-devel@lists.sourceforge.net,
 "peixuan.qiu" <peixuan.qiu@transsion.com>, Jiazi Li <jqqlijiazi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

options in f2fs_fill_super is alloc by kstrdup:
	options = kstrdup((const char *)data, GFP_KERNEL)
sit_bitmap[_mir], nat_bitmap[_mir] are alloc by kmemdup:
	sit_i->sit_bitmap = kmemdup(src_bitmap, sit_bitmap_size, GFP_KERNEL);
	sit_i->sit_bitmap_mir = kmemdup(src_bitmap,
					sit_bitmap_size, GFP_KERNEL);
	nm_i->nat_bitmap = kmemdup(version_bitmap, nm_i->bitmap_size,
					GFP_KERNEL);
	nm_i->nat_bitmap_mir = kmemdup(version_bitmap, nm_i->bitmap_size,
					GFP_KERNEL);
write_io is alloc by f2fs_kmalloc:
	sbi->write_io[i] = f2fs_kmalloc(sbi,
			array_size(n, sizeof(struct f2fs_bio_info))

Use kfree is more efficient.

Signed-off-by: Jiazi Li <jqqlijiazi@gmail.com>
Signed-off-by: peixuan.qiu <peixuan.qiu@transsion.com>
---
 fs/f2fs/node.c    | 4 ++--
 fs/f2fs/segment.c | 4 ++--
 fs/f2fs/super.c   | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 2fd287f2bca4..be3d38d1fdee 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -3408,10 +3408,10 @@ void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi)
 	}
 	kvfree(nm_i->free_nid_count);
 
-	kvfree(nm_i->nat_bitmap);
+	kfree(nm_i->nat_bitmap);
 	kvfree(nm_i->nat_bits);
 #ifdef CONFIG_F2FS_CHECK_FS
-	kvfree(nm_i->nat_bitmap_mir);
+	kfree(nm_i->nat_bitmap_mir);
 #endif
 	sbi->nm_info = NULL;
 	kfree(nm_i);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5653716460ea..b6baf099c407 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5813,9 +5813,9 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
 	kvfree(sit_i->dirty_sentries_bitmap);
 
 	SM_I(sbi)->sit_info = NULL;
-	kvfree(sit_i->sit_bitmap);
+	kfree(sit_i->sit_bitmap);
 #ifdef CONFIG_F2FS_CHECK_FS
-	kvfree(sit_i->sit_bitmap_mir);
+	kfree(sit_i->sit_bitmap_mir);
 	kvfree(sit_i->invalid_segmap);
 #endif
 	kfree(sit_i);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9b58cf891a66..c4810ddc1db0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1718,7 +1718,7 @@ static void f2fs_put_super(struct super_block *sb)
 	destroy_percpu_info(sbi);
 	f2fs_destroy_iostat(sbi);
 	for (i = 0; i < NR_PAGE_TYPE; i++)
-		kvfree(sbi->write_io[i]);
+		kfree(sbi->write_io[i]);
 #if IS_ENABLED(CONFIG_UNICODE)
 	utf8_unload(sb->s_encoding);
 #endif
@@ -4935,7 +4935,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		if (err)
 			goto sync_free_meta;
 	}
-	kvfree(options);
+	kfree(options);
 
 	/* recover broken superblock */
 	if (recovery) {
@@ -5018,7 +5018,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	f2fs_destroy_iostat(sbi);
 free_bio_info:
 	for (i = 0; i < NR_PAGE_TYPE; i++)
-		kvfree(sbi->write_io[i]);
+		kfree(sbi->write_io[i]);
 
 #if IS_ENABLED(CONFIG_UNICODE)
 	utf8_unload(sb->s_encoding);
@@ -5030,7 +5030,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
 #endif
 	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
-	kvfree(options);
+	kfree(options);
 free_sb_buf:
 	kfree(raw_super);
 free_sbi:
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
