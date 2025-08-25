Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD011B333BD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 03:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKA3Di5/OCcCBh1lVi/dOZKX6LwAryqnP1KYUxj1FPs=; b=eIWGqxjn3d3xx/8EfAb/GuBi1R
	NlzSSsAqwS8zrKb2aYAIyPSr26mwLTW9mf3d1rGzX9jjE9CrtyEpjULbXbb3kYVNShW+jEk+zlU35
	UbXdCWVFBtGavYXGDr0licj5kW4S3DdFKfJybQyUC5w9v1/zoC+THOvIlnqyZYyBRkpI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMRa-0007Tj-Pt;
	Mon, 25 Aug 2025 01:56:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uqMRY-0007TX-QX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EAeHePFRYzNNaRJkiKGaGtx+08+pxzuQ+R1Cpf0InEo=; b=kpUQh8cY5RBSGjwpQXwB83V0Iq
 vATEK4qxgLBmKj7tjz3b13vqvYTQQwivbXla8siqJDX0ORHd43eUGhEjLlh3M6ANtiWAvQmMOK2Al
 NnO+xMk7Po7Gwa5nHU4M3vQ6lX9X2tLZFCEGW0q4hex11mS/5qvzJtQPzAU//AOW0mjA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EAeHePFRYzNNaRJkiKGaGtx+08+pxzuQ+R1Cpf0InEo=; b=QFXExVqMzl7bfbYrbJPB5VyikD
 EH0zJh+La4f1k24fQIFUFUNYetjL34I2JXqPEMwGnfOPUar5SBiDd33ePVzbb9RGkiBopAJLUrLpw
 vxwZtiHulBq7JGI3mrAf4BmcJaPAfU6QuSXXkHA+uRPpyZ2KW2PcO8xMZ+3wrd2f3dw0=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uqMRY-0002pE-FJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:20 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-76e2ea6ccb7so2942026b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 Aug 2025 18:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756086975; x=1756691775; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAeHePFRYzNNaRJkiKGaGtx+08+pxzuQ+R1Cpf0InEo=;
 b=Lrmxl2qDgC14XShFWX/LLSJAKNJh1G04JyGQin7JHDdXSvv/P0nCtgHZlba9YK25sX
 eETueJLe2EX1FCHjSQLLeTw3lB2uf/KmwwwsGAUh8eAcPnq9W8ADKvbFhcpLjKTaObyj
 BcIiz6wO6RhUTZHcImCuaJMWU3ijuwPLnVXfFsFLd26ylRZUCKYRrjazUZqd+H3ZOuUC
 wm8uYNFBL5N924oegeIDWzrhBXaF1YtZT4fV5XCZ1emo68bvmZfXuJCckZRyAdT2U3W8
 D+vD/UaKRO0TaAkhcnqxG4mQ079Ahiqld7+Jlu5QnW+o41l942I4hvsC7Bpn6GxpQ2Ip
 kyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756086975; x=1756691775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EAeHePFRYzNNaRJkiKGaGtx+08+pxzuQ+R1Cpf0InEo=;
 b=hs2ftOHB1EAKGzpUspmZaPEV4MPkV8HDmRacf/c1eTHB/VREt+i/nzNBcBTS/CGdNg
 JlLOjZ9bY6CIq/5knUYhtgeHfbS9NMzWU7O1LamCgAL0oUA45vbMJy54aPQzbslSMSbL
 iHjMtiLgz/zA5XG2IB2cuevX+meeO9WmaLGiivW+w43oSKa2MXaXH+ZGtRG+C9/rBGvh
 73ETILm/04kCh2/jg/dZAcg7k0flGHGdArkEsLNboYKT5u9og/4aCsBRX6oRYZsf5CSl
 24ZGlB6oi2d9tWCi9zein7lSFGs3UPdCshjyQsYbI7chkhYfESQ5quIBH/ItO/8mKv32
 1d8Q==
X-Gm-Message-State: AOJu0YxibDd27pQMFpknvhujeMm2pIPWUfQS5X8UOjbsaAdK3ICPCDeu
 eVIb/9jGOWt9CufyM1nS0wTzD5a9C/WSQ5RITy9wnGUvz8/0Uh5g6X9E
X-Gm-Gg: ASbGncuimH7/WZwPBEzeGo3o0dN1EKzrOwVvQNREyhqhtWNgAttDDM5sV6Mr3xTevNh
 NSDuBj7bY/0BLrKYDnAZEc/GhPz5l7yOJYJ7zmkDBqp9hqqgtwvTeM0gGH+GY88wSajyI/YSboq
 BxAINJxWup2aQkp6Vt++9mHIxYVm/OWMmO6x+1Jg8RWHVJrh74xPzZT11ct2lKwTpXqqlJaM1Kx
 l0MGOKliFESceop/hKxYdNaU9Lc/fr5Fh5WoGmdveb5gYb8FKsucrG3THJxU54IW1IUSgs+haC0
 4SYgplbI6BHHtgDLNboFJluxZGMq5Cj3yAWCNAXRI1JKh1gy0D6kRMb59Hp9sHRLTKRp8gPC9M8
 A5g1UoJqPYhiq99LcUMm1WHmHgdQCkQF0jiAze+WIKa88clmbLA==
X-Google-Smtp-Source: AGHT+IFM3qvjIXGGx6MMvh2yZ9c5ZQWSbUpF/nCxY6B82aTFpji1kYSiAVSRXAqUEHaAjPYfUYSGSQ==
X-Received: by 2002:a05:6a20:1586:b0:243:1edc:d9b4 with SMTP id
 adf61e73a8af0-24340d558f1mr13461608637.51.1756086974698; 
 Sun, 24 Aug 2025 18:56:14 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cb8b1989sm5147883a12.18.2025.08.24.18.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 18:56:14 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 25 Aug 2025 09:54:48 +0800
Message-ID: <20250825015455.3826644-7-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825015455.3826644-1-shengyong1@xiaomi.com>
References: <20250825015455.3826644-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong Add lookup_sit_in_journal() which is similar
 to lookup_nat_in_journal() to get the raw sit entry from journal if exist.
 Signed-off-by: Sheng Yong Reviewed-by: Chao Yu --- fsck/f2fs.h | 2 ++
 fsck/mount.c
 | 18 ++++++++++++++++++ 2 files changed, 20 insertions(+) 
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
X-Headers-End: 1uqMRY-0002pE-FJ
Subject: [f2fs-dev] [PATCH v4 06/13] f2fs-tools: add and export
 lookup_sit_in_journal
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

Add lookup_sit_in_journal() which is similar to lookup_nat_in_journal()
to get the raw sit entry from journal if exist.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fsck/f2fs.h  |  2 ++
 fsck/mount.c | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index a4888a817284..60e3a2ebb0ee 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -613,6 +613,8 @@ static inline int inline_xattr_size(struct f2fs_inode *inode)
 }
 
 extern int lookup_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid, struct f2fs_nat_entry *ne);
+extern int lookup_sit_in_journal(struct f2fs_sb_info *sbi, unsigned int segno,
+				 struct f2fs_sit_entry *raw_sit);
 #define IS_SUM_NODE_SEG(sum)		(F2FS_SUMMARY_BLOCK_FOOTER(sum)->entry_type == SUM_TYPE_NODE)
 #define IS_SUM_DATA_SEG(sum)		(F2FS_SUMMARY_BLOCK_FOOTER(sum)->entry_type == SUM_TYPE_DATA)
 
diff --git a/fsck/mount.c b/fsck/mount.c
index c671811941ad..f9f780d4aff6 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3297,6 +3297,24 @@ int lookup_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid,
 	return -1;
 }
 
+int lookup_sit_in_journal(struct f2fs_sb_info *sbi, unsigned int segno,
+					struct f2fs_sit_entry *raw_sit)
+{
+	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_COLD_DATA);
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
+	int i;
+
+	for (i = 0; i < sits_in_cursum(journal); i++) {
+		if (segno_in_journal(journal, i) == segno) {
+			memcpy(raw_sit, &sit_in_journal(journal, i),
+						sizeof(struct f2fs_sit_entry));
+			DBG(3, "==> Found sit [0x%x] in sit cache\n", segno);
+			return i;
+		}
+	}
+	return -1;
+}
+
 void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
