Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC23CDF682
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Dec 2025 10:48:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3u2JhjnBX6cz8aUmPQO3UskW540zqWQJGy0TgdXt0dc=; b=DbDM6r793m0vWh6mfAbvt0mcjC
	tvgLfWi40lzbQ8qLCxLjn1I8mXwGxcqkJO8AP2mwMdFoLr5IgJQNRrFI5ZTXRYf9H6OK1uGHQL1jG
	1dVqiRtZ7L+r9DEhmhwZpZTD8Moc2EsP9siyk9krx2zpfwL59Wn8hD9o4C9cjvJicIiU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZQts-0001Eb-4X;
	Sat, 27 Dec 2025 09:47:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vZQtq-0001EO-Vg
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 09:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e8WgQvlU/WB3n5BS9u7WnVZTrz6S0f6Apuv6obbEjK8=; b=XIA28W8/WNAktWY8bYKCjxl/Bq
 /Ntr5WUxQL8GFm+irsgFtLO0bE5TfFAU+/6esyaJn/KCRCQQU/+xYNZUD5RN0u9PtKoHhVZbIALhZ
 YluYjg5xmXN1QaSxuc9rGi4BzLSW8QvOpAFn4k+/71n9wrjjkDfBbsSriK/wWRmJGdDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e8WgQvlU/WB3n5BS9u7WnVZTrz6S0f6Apuv6obbEjK8=; b=RFLVbdmz31XqTqKTa/ECaFJkVP
 mV9ENkhWkJBdr1izz9EBuv9vToXEViHmFyiCsQ4DG7FxaVmUgyYIpWmP5/zszh0egmI3UTdHM2Y6q
 4yc9JmajhKlWINXZ2Gd8B3grqRl1SYcDTJfUGVx/BtTB0R/L89n+3fgUf90Mn9NzQsiI=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vZQtr-0005Ot-5g for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 09:47:51 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7b8bbf16b71so7693548b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Dec 2025 01:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766828865; x=1767433665; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e8WgQvlU/WB3n5BS9u7WnVZTrz6S0f6Apuv6obbEjK8=;
 b=UiLcpzGB4fD5IcO/HCI3oWl8ZBl+2o5Y1PNs98fwOPucFDTzsJqCOtO//usopOj6uE
 MDraNFGA2k3c7qDn1/HFWRE5JxQF5sHV3yVRdc0DrQXoCSdCaZ7yjg1XScS9ySJOLkVx
 8jRjncPosnFsZZvlsGAiS1OvB0JxMwmpTT0M4J5u11NbCBwgovd275Rwf58zUWJmimWF
 BbB5wnQV92IlLqcQnXtVGdR9y9rIoqT4XVJABpOqCkvhvnw6topC7PKStwUVi+UwXS4d
 XbTtUiGXTOtfzp6Lw1r/tosben0ATlJ13bwJQpmJRrDC4f+tvz04ab3Fn163+cH1P0/B
 QT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766828865; x=1767433665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e8WgQvlU/WB3n5BS9u7WnVZTrz6S0f6Apuv6obbEjK8=;
 b=wLjfmAzllElLHCcK+riZA7/oo9XZIuNq4b87QO84SjBwMZNB7ojy5izYdwVdYK1MiM
 n3yphltNx6A8ItuB0j5fAo/08oTLlvjYJEsEMOa05Dm56LXg/DEbn1UUMJvtjhABtoId
 OJ5zFWogJA/48F3Ugv7/Iq7FACGBk1KucqDqZz+yJHQXVrQfXtn3Qec2O9DgH+7aVePP
 4Udc3JAA5s7szGtUt4583xbHTYoCGOn4xuhiuV4ITFpBM2vOJG6hu6XQiv/+EnbHctkf
 EZPlETYhfrRIeL7w1OBnZGiBd8PJEr3fxi1QWUXbUwzVpVLh5UoTHbf557xWoscqsJhF
 o2lQ==
X-Gm-Message-State: AOJu0Yx5QqycGxLjatxvdAbdL6E9/FtXdY2tN2LMJFoX98EdIAH4UlOp
 GltHVCiVVRWW/yEdEiYX3kytJrEF1LU3rsnwjq4LOkBTChTeIjdN0TGpxyOwwtW5
X-Gm-Gg: AY/fxX44lIcg0mQaiENjKajY7XoYPASUvUyF8q36Fz7DpnUXSEV9g5it66DH7K/fh8P
 1PqVg1ZBkl9E08i1+OEEUvBcE2Qvo3D5VCf4UJWUGzbzb47HIZMSaF2iuQhHduqFdIjt0Q12iNU
 danDn1Rk/2hABOH4oObKuLEkaSGoyQJfFbJoV2VIb8N3hvLZVqkJK1qFDB8vO+L5f9724L1tTtd
 CZXrD1QQl/Wp+HhuEYmZT9wnzIlAreD6OApIDUr5umgqKAtInE1+zzHm4aUEnnDv2/A9s4pjgAD
 EX2Np0G/BGciJA1fVNdVU+wZfn+bSIwny7ZgKuhj+/t35cabQx95crEYjtzPHkAKe/hQBMWaQq9
 Jv6K5b+1wHHHeM/xzu/rY1gXwoWzEbPcdwxEr00d/REPj/TSLpYM/CqMyaMQsYh0hwKsr6Dq4pf
 H33mRD3Hxr0nuGJ9rAfQyrva1uoUU=
X-Google-Smtp-Source: AGHT+IHc+L3IFe1AxfwloPyJNXIpcmY2ThXb4KSNtkzkidToHMeqx6hD8zmCcZg5cqMfg4BA0b14PQ==
X-Received: by 2002:a05:6a00:1d9f:b0:7c2:60c6:8ca0 with SMTP id
 d2e1a72fcca58-7ff6430ccbemr23784299b3a.5.1766828865328; 
 Sat, 27 Dec 2025 01:47:45 -0800 (PST)
Received: from monty-pavel.. ([120.245.115.65])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7a843ee4sm24601737b3a.10.2025.12.27.01.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 01:47:45 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Sat, 27 Dec 2025 17:46:10 +0800
Message-ID: <20251227091906.216322-4-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227091906.216322-2-yangyongpeng.storage@gmail.com>
References: <20251227091906.216322-2-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang f2fs_folio_wait_writeback ensures the
 folio write is submitted to the block layer via __submit_merged_write_cond,
 then waits for the folio to complete. Other I/O submissions are irrelevant
 to f2fs_fol [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [120.245.115.65 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vZQtr-0005Ot-5g
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: return immediately after submitting
 the specified folio in __submit_merged_write_cond
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
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>


f2fs_folio_wait_writeback ensures the folio write is submitted to the
block layer via __submit_merged_write_cond, then waits for the folio to
complete. Other I/O submissions are irrelevant to
f2fs_folio_wait_writeback. Thus, if the folio write bio is already
submitted, the function can return immediately. This patch adds a
writeback parameter to __submit_merged_write_cond(), which signals an
immediate return after submitting the target folio, and waitting
writeback can use this parameter.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/data.c    | 22 ++++++++++++++++++----
 fs/f2fs/f2fs.h    |  2 ++
 fs/f2fs/segment.c |  2 +-
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d4ef26beadbc..471e52c6c1e0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -664,7 +664,7 @@ static void __f2fs_submit_merged_write(struct f2fs_sb_info *sbi,
 
 static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
 				struct inode *inode, struct folio *folio,
-				nid_t ino, enum page_type type)
+				nid_t ino, enum page_type type, bool writeback)
 {
 	enum temp_type temp;
 	bool ret = true;
@@ -679,8 +679,16 @@ static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
 			ret = __has_merged_page(io->bio, inode, folio, ino);
 			f2fs_up_read(&io->io_rwsem);
 		}
-		if (ret)
+		if (ret) {
 			__f2fs_submit_merged_write(sbi, type, temp);
+			/*
+			 * For waitting writebck case, if the bio owned by the
+			 * folio is already submitted, we do not need to submit
+			 * other types of bios.
+			 */
+			if (writeback)
+				break;
+		}
 
 		/* TODO: use HOT temp only for meta pages now. */
 		if (type >= META)
@@ -690,14 +698,20 @@ static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
 
 void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type)
 {
-	__submit_merged_write_cond(sbi, NULL, NULL, 0, type);
+	__submit_merged_write_cond(sbi, NULL, NULL, 0, type, false);
 }
 
 void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
 				struct inode *inode, struct folio *folio,
 				nid_t ino, enum page_type type)
 {
-	__submit_merged_write_cond(sbi, inode, folio, ino, type);
+	__submit_merged_write_cond(sbi, inode, folio, ino, type, false);
+}
+
+void f2fs_submit_merged_write_folio(struct f2fs_sb_info *sbi,
+				struct folio *folio, enum page_type type)
+{
+	__submit_merged_write_cond(sbi, NULL, folio, 0, type, true);
 }
 
 void f2fs_flush_merged_writes(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 53cbce96f126..6c5b901a5d27 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4052,6 +4052,8 @@ void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type);
 void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
 				struct inode *inode, struct folio *folio,
 				nid_t ino, enum page_type type);
+void f2fs_submit_merged_write_folio(struct f2fs_sb_info *sbi,
+				struct folio *folio, enum page_type type);
 void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
 					struct bio **bio, struct folio *folio);
 void f2fs_flush_merged_writes(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c26424f47686..c0c5b7075b04 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4240,7 +4240,7 @@ void f2fs_folio_wait_writeback(struct folio *folio, enum page_type type,
 		struct f2fs_sb_info *sbi = F2FS_F_SB(folio);
 
 		/* submit cached LFS IO */
-		f2fs_submit_merged_write_cond(sbi, NULL, folio, 0, type);
+		f2fs_submit_merged_write_folio(sbi, folio, type);
 		/* submit cached IPU IO */
 		f2fs_submit_merged_ipu_write(sbi, NULL, folio);
 		if (ordered) {
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
