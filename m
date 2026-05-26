Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC1QB2YxFWouTgcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 07:36:38 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B36E5D0E2E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 07:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hs9f/O2q8zsB+73Vzjv/6VC17leo0sjKn7Z4nU0Gmn4=; b=JEfP+y440NBxE78BnvCfq75HzN
	Al+r5t5jz/6qYx8IpQ7xnZtInyVbrnwVy5eeuJhFys/9M/kVBBG1LT440OBL7w7VGbP65ln/LAp73
	fJkYBRbU9CYi3WH5wjN5hlhB95/ET2Z/TuUDR3ereBqUmH70HpX8cRjh1zKCIuv8szPQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wRkSj-00009Q-3O;
	Tue, 26 May 2026 05:36:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wRkSh-00009J-Mj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 05:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L8sMiHhDi5X06YZ5Z6Hrq+UhNSJVExmPOyUWtvQndg4=; b=BAINiCB5B2INC4Ltq2Ts7Pm4YN
 8sMcya7zW5zK4h0cNu3nB2SKQFkYgiUUqPV2j8bzoznHncHuN2qF8OYGQMOHQcCNcpO44xFyh1lkr
 gVy8GnldVV06HNYYNKazYCfMPm2y5w/pRvuavPNZ89RwBjbbE1bhfhNbhTLF6cRHaV84=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=L8sMiHhDi5X06YZ5Z6Hrq+UhNSJVExmPOyUWtvQndg4=; b=h
 UD6pUBWYwHEum/ZuOKWB0Fjv3R9FR0hQ55PdCDedVq1pq16B+CZE1QdWCTl92imZssbbdaag+R0zQ
 dMJis+iTihgngOha9x7c5mZYCkDIh8jFBhXp45nIJfDaVChlbzKt93NsdzwJ1J+q6FPFfORRJlXoT
 Ahg1P7fiXQfz1UFU=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wRkSf-0004kO-Qs for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 05:36:19 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-36a8ee1e28cso2656716a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 May 2026 22:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779773768; x=1780378568; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L8sMiHhDi5X06YZ5Z6Hrq+UhNSJVExmPOyUWtvQndg4=;
 b=V2S9VNxV/aQjAd60Mvfg4059ydi17yvCRihAtbnjD7WyhlzIX9aKH5ryxfdNTum9Il
 V/IPRhlexzRVPzjoZd7h/AJbiC8rM997xRLSFtcVK+i1TVgcDdQo4r8i3MUO7IeiFj4M
 OAfgg2wcV4S47f2dzGy2h11TZVCKktVw4qcms3IPM2xzX4Cv+NXYxAboBdOWfG+8Guly
 8v4bTxJmwsbkHS9M8b9K04NfQyPCw9ZcpkGS1dgapUAwdbEa8wHfwDSD6ARRZkROqBBV
 AinhaZKGIFJ4uIU07k/CujhIGIBWwxvQTdWQjNnGIAt+NAq9XWLLQlQru8G0CejIi5Yo
 660g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779773768; x=1780378568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L8sMiHhDi5X06YZ5Z6Hrq+UhNSJVExmPOyUWtvQndg4=;
 b=ZGuQkGNnC5LJ+L0zEfND0+ay8AYgLHwgjgbqNvzhcKDfqjvTHAU22AryEoaairzwtR
 BSRLlh8dSMej22Oa45Tq99wrGVSpejjCE/LNt4mrcRhVW8VNBG+M3Upazx5kavPb4ofY
 K1It/Zf2mxxBDwWf5DEydZ2aslFch6fQK/HG3LW8WHQRDlND53IusFjBC6RiZQEFln4z
 Cosn3LjdCoJgd/F3tGtXqwVRarAaAJHQ+ruJGm+9+cxN2ukcfcfpQiajupZVVYxKMjrA
 x0M1E34ZqrSPZqGM4sEhI2ONtgbakTrKrY29ckJ7n8Y1P/1jyscRk4fUff23cYNy+bZ7
 i7rQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8/3lIy+7nKW6aRl0m6S/dqZfHNDSOAucsxZkcmfgGgrSq7HoMkL14wimQPiW7jtKYVt4MMefSKmRR8y/FN8afg@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwH9OAR+taWaeOzwkrvXppo8hAMue8slROQV4c2AlpW9fyY7oBx
 jo0hqPk3QPWfbEkATmf0jB8x2AONO/b9lO5h7SXOJvZqO8alc1EuqpuI
X-Gm-Gg: Acq92OEAsupf+buIbxqtmqMZWwpym16eZoA60uncU8ud7P/8DdHLyC2i5YZ/ZgDicgN
 OvXq70SHWMlXBUd9smNHz11sHKpiU2eFWSuKSwgbYbzCL1+UM497zPJWAVvne4sfXTRXrOQlRFR
 1z0ivwP+hesa6ES0WRkTjtNcMMxkdA0zGSSC0yWQMhY9zuxsHIChDtsXKLyTmCkm7Roavx4KcoE
 C6Nv7khLNogN4B6VIfdrG5pO5F7vlIuCxMK6uwBSJNF7Iwx3gSapHj5yAHoJrg1GPa0wEQpQsm6
 YDvHed4DZ3aKIESq3CoAs/0AJy/KNWh3m6ru8qVgPL+iCjLHap8uxZO2Wl3uzLQyAckBMoEF41X
 64BhxtLCkFrtiuHzqm147jtnRdlplzsG1WNpTXd+rz/S5XThKcq82XxWolOIGuY5Lgl71pyvbez
 2+4iPWGKmj2tDCQTVplhemoiLVHoW0tU6PTAavVdwGkoHlLfrrN/JFZdGFeAyy+yEjUzMcqw==
X-Received: by 2002:a17:90b:48c1:b0:35f:c729:de9b with SMTP id
 98e67ed59e1d1-36a677f44b2mr18075721a91.20.1779773767539; 
 Mon, 25 May 2026 22:36:07 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36afbc766d2sm1797252a91.14.2026.05.25.22.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 22:36:07 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 26 May 2026 13:35:57 +0800
Message-ID: <20260526053557.1096229-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_recover_orphan_inodes() trusts the orphan block
 entry_count
 when replaying orphan inodes from the checkpoint pack. A corrupted entry_count
 larger than F2FS_ORPHANS_PER_BLOCK makes the recovery lo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
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
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wRkSf-0004kO-Qs
Subject: [f2fs-dev] [PATCH v2] f2fs: validate orphan inode entry count
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
Cc: qwjhust@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, stable@kernel.org, qiwenjie@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:stable@kernel.org,m:qiwenjie@xiaomi.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,kernel.org,xiaomi.com];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 5B36E5D0E2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f2fs_recover_orphan_inodes() trusts the orphan block entry_count when
replaying orphan inodes from the checkpoint pack. A corrupted entry_count
larger than F2FS_ORPHANS_PER_BLOCK makes the recovery loop read past the
ino[] array and interpret footer or following data as inode numbers.

On a crafted image, mounting an unpatched kernel can drive orphan recovery
into f2fs_bug_on() and panic the kernel. Validate entry_count before
consuming entries so corrupted checkpoint data fails the mount with
-EFSCORRUPTED and requests fsck instead.

Set ERROR_INCONSISTENT_ORPHAN as well, so the corruption reason can be
recorded in the superblock s_errors[] field. This gives fsck a persistent
hint even though mount-time orphan recovery failure may leave no chance to
persist SBI_NEED_FSCK through a checkpoint.

Fixes: 127e670abfa7 ("f2fs: add checkpoint operations")
Cc: stable@kernel.org
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes in v2:
- Add ERROR_INCONSISTENT_ORPHAN to persist an orphan metadata corruption
  hint in s_errors[].
- Call f2fs_handle_error() when orphan entry_count is invalid.

 fs/f2fs/checkpoint.c    | 14 +++++++++++++-
 include/linux/f2fs_fs.h |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index c00a6b6ebcbd..064f5b537423 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -943,6 +943,7 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 	for (i = 0; i < orphan_blocks; i++) {
 		struct folio *folio;
 		struct f2fs_orphan_block *orphan_blk;
+		unsigned int entry_count;
 
 		folio = f2fs_get_meta_folio(sbi, start_blk + i);
 		if (IS_ERR(folio)) {
@@ -951,7 +952,18 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 		}
 
 		orphan_blk = folio_address(folio);
-		for (j = 0; j < le32_to_cpu(orphan_blk->entry_count); j++) {
+		entry_count = le32_to_cpu(orphan_blk->entry_count);
+		if (entry_count > F2FS_ORPHANS_PER_BLOCK) {
+			f2fs_err(sbi, "invalid orphan inode entry count %u",
+				 entry_count);
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			f2fs_handle_error(sbi, ERROR_INCONSISTENT_ORPHAN);
+			err = -EFSCORRUPTED;
+			f2fs_folio_put(folio, true);
+			goto out;
+		}
+
+		for (j = 0; j < entry_count; j++) {
 			nid_t ino = le32_to_cpu(orphan_blk->ino[j]);
 
 			err = recover_orphan_inode(sbi, ino);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 829a59399dac..bb2b6cd5d507 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -107,6 +107,7 @@ enum f2fs_error {
 	ERROR_CORRUPTED_XATTR,
 	ERROR_INVALID_NODE_REFERENCE,
 	ERROR_INCONSISTENT_NAT,
+	ERROR_INCONSISTENT_ORPHAN,
 	ERROR_MAX,
 };
 
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
