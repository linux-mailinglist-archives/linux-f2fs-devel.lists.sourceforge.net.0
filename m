Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B075CDF5BD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Dec 2025 10:20:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6lIODTHQmqtj2pIZJLFU2MHkomRrgk5MduJnlRGpdX0=; b=btCkSxX3K+2bl2AqntMlJlhiiu
	6eGO5jkStH9oXwCUlmVoFhWYKD9tsF6l5AcmQ0uUhPRnSKSE1qP3CaZcPuSt6fccnQ0bhVj66uIaj
	/DH276S3DrbGbj/+yzOTlFW32iPbvztN84sfFGwTLTAHjd4I5WLUbUAK9vaHz0p/Ojxc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZQSk-00074J-1a;
	Sat, 27 Dec 2025 09:19:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vZQSj-000747-0r
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 09:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cGRzQTMrGJ/TF/qWSORrRmjikBJIiHC7TT8tbvyUhSw=; b=QzyN+N+DATG33gQFIvMttLmXRF
 84P02cFkIUOhlATN4jiH3YMs/vIHTTWxQHrO/30b+MP6KFh3ymF9DmcqkgxVpkA8rpVFIz5K8DvQp
 y4KEUqP+D0LMM3TxmlOvy79zdCkGEnsmdCjOhlEAk5Uh/FImvesgHSfOyvBlNxq+k17A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cGRzQTMrGJ/TF/qWSORrRmjikBJIiHC7TT8tbvyUhSw=; b=c
 jTtOMscL62ewM9RbMzjPvGwqxSu4qGNV4og4JcA4AXlyhllq1gVW0IW+qLLjT1Y1M9SNHOmYxjl24
 ROVV8GjhaCJmPWumxBHg1p5ON9NMWMfLHU0qF8rC1ICwIjY/BkgtG/VEWCvINMeTHsMPeckcowONS
 5o6cBljnFX+KXjIk=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vZQSj-0004MJ-9a for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 09:19:49 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7b22ffa2a88so7307279b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Dec 2025 01:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766827178; x=1767431978; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cGRzQTMrGJ/TF/qWSORrRmjikBJIiHC7TT8tbvyUhSw=;
 b=mvTG5o2K6BmTdyQL1iOpNR/jxyz7USWMr2w+4hXcn/w9VWEzMpbGp6f0wwApTFxcz3
 TxkGs6dIpLqX04+1qXZTX4A3FSGdmLuPTUBYnsBUYvFnAYarjFqxFsHKUoi4rsGis2V2
 pxH7qXCEmN3GVgbAt6abNI+3JHXHuNgEcLhdu4MY1pAZ19dN7iTueftar4YoODS0C/va
 oTdBxZeB53sCXODwnkv0mddBncdBz2Gz8+upSViCepGbAS6c47DrqqYFgImVLY7q/T+2
 VgZIAgG/TkUlUH+0ARhAvnztjKDyEPojRIi+E6IHVuimE45PNNAY7L3cA16Piqol4RrG
 YYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766827178; x=1767431978;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cGRzQTMrGJ/TF/qWSORrRmjikBJIiHC7TT8tbvyUhSw=;
 b=cdgoBE8d4k1fSW2F5P3n+gcsuhJPBJQMOeTtaHNqVITU0pAPErPQM1l2zMMsz9brRQ
 tsnpVzmsydizaIYMYlvKS33TPfA/F/zc3HvcX52VD8MLSn65RH0Dc/SWy7ChmnJat/3z
 Twm7sSiZ2qMe8wsFrIaF9t3MWMSvMOEcmWHIyXW8ZuX7CnyKn3znwDGBjyWrFfateqq7
 l4Piu/4YWAupwxldt25puwyVNkgN74Vu/Sq08iDCaXPTdzmmEKQOBVs7LkoBb1PgkGYw
 1Op3A7eJuqvPbQ/pSWtBtW7fq8ShUZ82WzxzjDOMSdYgl7s5Ku/YmdeMZ0Z1+QdX0vno
 Xe8g==
X-Gm-Message-State: AOJu0YywfFsV/aFmMeNyg3FBKvRZNhzd5IUVpBhfgBWDEh8ZfJn0sS48
 UH6VwuzZOGQaTeVA2j5UoShTkm9Z/pPNPVUWxpF+Wm9LuUsowq5XBM2E
X-Gm-Gg: AY/fxX7OoTIT/5UNmAUtvDIlMKSma0xpup/SxT6z8niB8rKhqcoABHdnzdwYjN+MwYJ
 5Icy+vKan8/PFOKKQOCRRp8wEHwrLYyXsmm6lIiGcUF/v9fOgsbs01DgQnCtW9KYcSRfDjYjd3Y
 Pi+/4XNgZPKf/p8OYI+dGukAFP2l6+goEWSEipfiTDCMmagST7DRgc13h/CM3Cm0GvCQoYDb6JI
 F13gOKLFjA1UULdo0Wyhs5Q3GkEllJAE6lnaJb0carWWWunOVow1X7ms8YT5irrtsHZR7INliAl
 yFCLfTv0z+/TRIbGWiRw1dJHkaTXZy7LHAy0wBRiPNclC1dpId+/grCVvxUXZCcq8noYPuG7kTO
 RcXItm0C+BkfoTeJCbQlP1BwHVkdee+52yyYG76dNG6p4qqanCBn9S9hVFoQNInCcHRW/pb0pHG
 0S4+IEOg+lDiWVW5mzpw+TzaXLpUs=
X-Google-Smtp-Source: AGHT+IGCbvXZAxPa7qBkl7EdGRMgTlJoNWGHdemDvx/xVcdj3Nm8GTmi2lnKFMMQo6FSl0gy2G4X2w==
X-Received: by 2002:a05:6a00:420b:b0:7e8:4471:ae55 with SMTP id
 d2e1a72fcca58-7ff6745678amr22051368b3a.33.1766827178456; 
 Sat, 27 Dec 2025 01:19:38 -0800 (PST)
Received: from monty-pavel.. ([120.245.115.65])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e892926sm24122590b3a.66.2025.12.27.01.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 01:19:37 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Sat, 27 Dec 2025 17:19:06 +0800
Message-ID: <20251227091906.216322-2-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang The force parameter in
 __submit_merged_write_cond
 is redundant, where `force == true` implies `inode == NULL && folio == NULL
 && ino == 0` is true, and `force == false` implies `inode != NULL || folio
 [...] Content analysis details:   (0.8 points, 5.0 required)
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
X-Headers-End: 1vZQSj-0004MJ-9a
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: clean up the force parameter in
 __submit_merged_write_cond()
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

The force parameter in __submit_merged_write_cond is redundant, where
`force == true` implies `inode == NULL && folio == NULL && ino == 0` is
true, and `force == false` implies `inode != NULL || folio != NULL ||
ino != 0` is true. Thus, this patch replaces the force parameter with
a stack variable force.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
v2:
- Clean up force parameter in __submit_merged_write_cond() as separated
patch.
- Add writeback parameter to __submit_merged_write_cond() for waitting
writeback case.
---
 fs/f2fs/data.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 12bf4b6e0075..d4ef26beadbc 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -664,10 +664,11 @@ static void __f2fs_submit_merged_write(struct f2fs_sb_info *sbi,
 
 static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
 				struct inode *inode, struct folio *folio,
-				nid_t ino, enum page_type type, bool force)
+				nid_t ino, enum page_type type)
 {
 	enum temp_type temp;
 	bool ret = true;
+	bool force = !inode && !folio && !ino;
 
 	for (temp = HOT; temp < NR_TEMP_TYPE; temp++) {
 		if (!force)	{
@@ -689,14 +690,14 @@ static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
 
 void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type)
 {
-	__submit_merged_write_cond(sbi, NULL, NULL, 0, type, true);
+	__submit_merged_write_cond(sbi, NULL, NULL, 0, type);
 }
 
 void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
 				struct inode *inode, struct folio *folio,
 				nid_t ino, enum page_type type)
 {
-	__submit_merged_write_cond(sbi, inode, folio, ino, type, false);
+	__submit_merged_write_cond(sbi, inode, folio, ino, type);
 }
 
 void f2fs_flush_merged_writes(struct f2fs_sb_info *sbi)
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
