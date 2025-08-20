Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D137BB2DCD2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 14:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjWbMhFLWrRXhjD46Er4G+tTlFJ93dNxJ1qvLBNoF6M=; b=a42kIMcqYsYcKksQ8AoSPkeP1s
	fMjI5VdiywjPih3cDZe//E2k41ps8SMIGYdP2OdRBeJw6FB5hR8jyIzDtKF2IU6262yi0zoIb9XDK
	R/3VoIWcLiqA9ttHFnc9RrSljJz0oxGso8Zmwlfn0sWScyRCGuKIuKKLytI64YpacqDg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoi9v-0003dj-GN;
	Wed, 20 Aug 2025 12:43:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uoi9s-0003Xa-OM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AqrKmzM6DhPGzGA6MYJRzPtkcXIxyOgg7D8QVQZFdt0=; b=aQuEoNEYYXXwJq0xmx6Kuqgi16
 CDQv7DocQc51DuFWvbR5jvpsBpv4ry/wslS3odB4HDbIf/fKG8hxmyFpWZ1RCVO+AnFOlAxZct5nI
 Wqe103CEISFOQGw4HS0Z6dPEK60yf6JhznRejxIhIWfMXjjiHyKU5j9JLVkx1ZH+3mDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AqrKmzM6DhPGzGA6MYJRzPtkcXIxyOgg7D8QVQZFdt0=; b=fLVEsASmrC8hR/ZU1lIrLZ4d1B
 WWV4sB/hi1Yb2dbfiB7LA1bzoN5BG3507Bfo2uq20avEncw46ljv7+A2xtzwxh9OKtWyI6v1zvFje
 VP8QYnA/GDehJtMy18ERZX74XkroondQpz9wFFdIP30ChcLxvFLladxVwSlE2TT8miqI=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoi9o-0003lt-0J for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:12 +0000
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-24457f3edd4so46919755ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Aug 2025 05:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755693781; x=1756298581; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AqrKmzM6DhPGzGA6MYJRzPtkcXIxyOgg7D8QVQZFdt0=;
 b=Eb7aqQuSOqtpBeUu3RoLqAq50xt1YYj8zw7+I71Zw70r9ayOOTLipYf7JTr1yw1/Ok
 OVHMT41S+MmFvOMr2d3nBNOXXoUzvnuQrOmNrc/gnLNATXOWf5955Qh0aD3w2WX6ZipH
 a3i8nDY88HwOd/tJIbU7pur6xy0vNekeNZsBwYnDgnIeNEQ/wdWrEmbe9Lgf4MD/uIZh
 h105H6+hx5woCk1jC6Kp45cZehBOlhxTFyNeQW5tN2FUpmluUkMyxiNnbSDCcvqhk8Hn
 rA7TKrGsfTAGKqd+MSIs9cIzZj572+WT7+36apwz2GuYQNw/COOvZ8emPRmJETR9WG+Z
 OKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755693781; x=1756298581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AqrKmzM6DhPGzGA6MYJRzPtkcXIxyOgg7D8QVQZFdt0=;
 b=OhTVxtgBbHyvjuZ73Y/15xNky532UxZMNE0tFOG6RfvOF/qTqwsnD5qEG/PX14KHZO
 d3qRkMp5VDWTj+NxzUOGzTWTYGLMwM97tGrFkVySh+Gi5lxq9OTq6pbIix6gzoDay6hI
 7z4JsTUWIfVq9voU5bUMAN4v1TgwXmC2kQZidW3FT0AwQ+1rirRiS67zu3VXvGrA0BXe
 H4k4GpbH8YKfq5lDFILhhBIDc59o6ZljuWnftLRzGr6V8vM3/0iFtLKdDEmCD3cxu3de
 T2ubZfCmVAom+ozYJyihpn5Tfv4In/jbCN0iZ7hm+e9yE0iqIYYY4cBWz0uHEG/576/s
 cAvQ==
X-Gm-Message-State: AOJu0YzGd1mE7yMIkFjNyzVeL2iVL3L/2ivVU7LUCTgBnWr40RRFnXAB
 m4w9s0OYVPq4Ovl9Z4hhxjlkYJhiUAMOFBZULFIwLxInAbeezkXh6K0wbfYI5g==
X-Gm-Gg: ASbGnctQEF4UZ34YF9q6EiJjRroo6fNeeTrn8G0Vu2hv52F9KuRSER1nFibaJusgRfC
 2CTdhFPBO2fwv7VNmHB3x8+YXIvjYpyqB/0/9Xmz7p/q5Q7iakdOjGs3AkKIuqmzaN7V9x6Ckwz
 ZK4Q0tVu6DweEApo2GhXKaXre33NGKiXakpfPEuWKetmYl14CAr/1DKnfvSpC9uimrbONpy/BQG
 bHFaEpdlt7U5VbrUXzrYduDuRy4tVWbdM45yexP6QZbgHm+dfZCm9n8tj0Ao+xmprBv0Jw4WjQU
 TI9j1mj1ZHodPVGutKV2YTNcdMpjPJ6fQzV6AZ75RQ1MXboGTQVw0J8THUZT6YetU0hbuEpqxNE
 Xv9UPW0BGn/7OeiQOjg19air03F0eTGlbMo0m7oY=
X-Google-Smtp-Source: AGHT+IEN3tAs3grqVS1JgeuVEyId0DlDfnPAvM3BAj09NHsnUVX7mRMpD/XKpwxYQWMB37e4xHtMmA==
X-Received: by 2002:a17:902:f783:b0:240:c9b6:f8ee with SMTP id
 d9443c01a7336-245ef27f86cmr23144195ad.50.1755693781301; 
 Wed, 20 Aug 2025 05:43:01 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51b3dfsm25962545ad.142.2025.08.20.05.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 05:43:00 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 Aug 2025 20:42:28 +0800
Message-ID: <20250820124238.3785621-4-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820124238.3785621-1-shengyong1@xiaomi.com>
References: <20250820124238.3785621-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sheng Yong Signed-off-by: Sheng Yong --- fsck/f2fs.h
 | 4 ++-- fsck/mount.c | 14 +++++++------- 2 files changed, 9 insertions(+),
 9 deletions(-) diff --git a/fsck/f2fs.h b/fsck/f2fs.h index
 187e73cf9aec..4c6c0c48b9ee
 100644 --- a/fsck/f2fs.h +++ b/fsck/f2fs.h @@ -504, 9 +504,
 9 @@ struct fsync_inode_entry
 { #define sits_in_cursum(jnl) (le16_to_c [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uoi9o-0003lt-0J
Subject: [f2fs-dev] [PATCH v3 03/13] f2fs-tools: cleanup
 {nid|segno}_in_journal
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
 fsck/f2fs.h  |  4 ++--
 fsck/mount.c | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 187e73cf9aec..4c6c0c48b9ee 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -504,9 +504,9 @@ struct fsync_inode_entry {
 #define sits_in_cursum(jnl)             (le16_to_cpu(jnl->n_sits))
 
 #define nat_in_journal(jnl, i)          (jnl->nat_j.entries[i].ne)
-#define nid_in_journal(jnl, i)          (jnl->nat_j.entries[i].nid)
+#define nid_in_journal(jnl, i)          (le32_to_cpu(jnl->nat_j.entries[i].nid))
 #define sit_in_journal(jnl, i)          (jnl->sit_j.entries[i].se)
-#define segno_in_journal(jnl, i)        (jnl->sit_j.entries[i].segno)
+#define segno_in_journal(jnl, i)        (le32_to_cpu(jnl->sit_j.entries[i].segno))
 
 #define SIT_ENTRY_OFFSET(sit_i, segno)                                  \
 	((segno) % sit_i->sents_per_block)
diff --git a/fsck/mount.c b/fsck/mount.c
index 5399f16c6bf0..1fe2b110942b 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1694,7 +1694,7 @@ static int f2fs_early_init_nid_bitmap(struct f2fs_sb_info *sbi)
 			continue;
 		}
 
-		nid = le32_to_cpu(nid_in_journal(journal, i));
+		nid = nid_in_journal(journal, i);
 		if (!IS_VALID_NID(sbi, nid)) {
 			MSG(0, "\tError: f2fs_init_nid_bitmap: nid(%u) is invalid!!!\n", nid);
 			journal->n_nats = cpu_to_le16(i);
@@ -2573,7 +2573,7 @@ void update_nat_blkaddr(struct f2fs_sb_info *sbi, nid_t ino,
 	int ret, i;
 
 	for (i = 0; i < nats_in_cursum(journal); i++) {
-		if (le32_to_cpu(nid_in_journal(journal, i)) == nid) {
+		if (nid_in_journal(journal, i) == nid) {
 			entry = &nat_in_journal(journal, i);
 			entry->block_addr = cpu_to_le32(newaddr);
 			if (ino)
@@ -2677,7 +2677,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	}
 
 	for (i = 0; i < sits_in_cursum(journal); i++) {
-		segno = le32_to_cpu(segno_in_journal(journal, i));
+		segno = segno_in_journal(journal, i);
 
 		if (segno >= MAIN_SEGS(sbi)) {
 			MSG(0, "\tError: build_sit_entries: segno(%u) is invalid!!!\n", segno);
@@ -2883,7 +2883,7 @@ next:
 		return i;
 	}
 
-	nid = le32_to_cpu(nid_in_journal(journal, i));
+	nid = nid_in_journal(journal, i);
 
 	entry_off = nid % NAT_ENTRY_PER_BLOCK;
 	block_addr = current_nat_addr(sbi, nid, NULL);
@@ -3282,7 +3282,7 @@ int lookup_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid,
 	int i = 0;
 
 	for (i = 0; i < nats_in_cursum(journal); i++) {
-		if (le32_to_cpu(nid_in_journal(journal, i)) == nid) {
+		if (nid_in_journal(journal, i) == nid) {
 			memcpy(raw_nat, &nat_in_journal(journal, i),
 						sizeof(struct f2fs_nat_entry));
 			DBG(3, "==> Found nid [0x%x] in nat cache\n", nid);
@@ -3307,7 +3307,7 @@ void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
 
 	/* check in journal */
 	for (i = 0; i < nats_in_cursum(journal); i++) {
-		if (le32_to_cpu(nid_in_journal(journal, i)) == nid) {
+		if (nid_in_journal(journal, i) == nid) {
 			memset(&nat_in_journal(journal, i), 0,
 					sizeof(struct f2fs_nat_entry));
 			FIX_MSG("Remove nid [0x%x] in nat journal", nid);
@@ -3611,7 +3611,7 @@ void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
 	/* Traverse nat journal, update the corresponding entries */
 	for (i = 0; i < nats_in_cursum(journal); i++) {
 		struct f2fs_nat_entry raw_nat;
-		nid = le32_to_cpu(nid_in_journal(journal, i));
+		nid = nid_in_journal(journal, i);
 		ni.nid = nid;
 
 		DBG(3, "==> Found nid [0x%x] in nat cache, update it\n", nid);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
