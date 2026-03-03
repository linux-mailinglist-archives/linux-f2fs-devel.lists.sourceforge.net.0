Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DLPAF1Ypmk2OQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Mar 2026 04:41:17 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C4E1E8865
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Mar 2026 04:41:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ui5I3lf/mFQyJP/LePlWrfuei6//Bnw9bhpZ7YhvNeE=; b=Iv2qIs+xsxWVht6I1mTVeA9qrI
	GeI5IAzumWOmApOKcj1etrQDfvr14nMkAxj7jdbVGL04E9tvjfpblIJBjyrmQo4jhpQjT0Pg0oCp9
	d0BDaYg98qL7Now24T4aYp8XSxQ2vw/2qS43iHNXtYj8pNWEVNowYWKPiQ/BXrn9IkZY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxGd4-0005i1-KE;
	Tue, 03 Mar 2026 03:41:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangqing7171@gmail.com>) id 1vxGcr-0005hd-NR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Mar 2026 03:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tVDX1OHaR0G1PQmsHFLwUIq/XMUol6wQoO+xg+p5sn0=; b=hk+e7FORD6kG+5dGP1rRYWdyxJ
 UXnx0fKCP1NUgik+gZkkEHykCNOCrmNXMZHVHSyt6zhXvuPR25SEWRX1hCBi0YpEtE2DfXEmyC+M+
 KvjCJ2t190yFJ48EJBLSfhiAEmCSALiGTaPPxW+KvQVXpH7JL9zSphGqvm4kJw+MxJnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tVDX1OHaR0G1PQmsHFLwUIq/XMUol6wQoO+xg+p5sn0=; b=I
 0tH6W9E0FiqtkD62cUtRa+M0EbVxN+M83+NzbPcRo6EuDCDvULrhHBrkb8xPTNlGVXu2LxwVGqvxs
 xSbtV+RqnE4ACselbTSw/lAJM/LDGPMJPGY7JwHGxuft0ryXPVei0oM7525a08o6aYh5Iz9IX2vHC
 N1xKSXHkr19b/p/4=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vxGcs-0005wp-3q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Mar 2026 03:40:50 +0000
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso35502335e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Mar 2026 19:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772509243; x=1773114043; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tVDX1OHaR0G1PQmsHFLwUIq/XMUol6wQoO+xg+p5sn0=;
 b=KH5elzCyvO1Otnx1oAiXU8VFcAP7EkZJ8eSUWD/Sud7Ex8qWAxi41FmPNuhXaQp8EM
 kkVSKQMhwxQ4aNOfIjtS382pZS9/KACW6+wGKTol9sogxCjnPYLWmv1t6OYDG5VIZa56
 iB36xrWk74p1ZMTzuKITtpTLb758a7GT6Yr9HRk4zcvQ/feLJenwTqMZVimA8rZqRCGO
 nQ8XOGims9RgHe6Yk1kz5vC+8DsyszncvsP93T4MojU8fBoHadvLDRTktpC8Ly3hx2PP
 5swYip/eyfdbVmE/dAExshZFhnINzn6L1v0wMCGzFav3h7ZI2odgLeSFfBzm6ZEjbg+g
 9bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772509243; x=1773114043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVDX1OHaR0G1PQmsHFLwUIq/XMUol6wQoO+xg+p5sn0=;
 b=d4niIicIshNXjkvm1M7pGL1YwL9vHHxdjkl8isu925V0UsgE8vcYiYICO38A46qeLO
 FgxEEBP2ri/3HhM+uVmqs+XGPmiihyoGyh4oV4dJyIkcm8Zl2Ci3o+RH5vR/+RH6HLe2
 EFHSvQ5v8DhFmTVtUmIO0iKuoghki3j3JAhNfTWik35iJZrnkDeySIp9216jSbA5oirw
 24ZHK9drRg0AtbQYmxeTseA6xrW7I/JKkoxVUqiFoPBOh8v0qy0pf61UgrS04OvodUdm
 txxXq6hnxf/VuNCnCFTpGPXJfk0odW8JSo9MfljudTVowV4xobkH2yXKy7biModMVX0f
 3ucA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGUY3DXH2xaqDStaU2Me7iNL+FPgXd0rXuFoQvJFjTTSCx1vkyR6GH5uA80OUYwM007ADyeqe37sRu0SI8pRO1@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyR5lVqLNt0G1AcvjArcoQwLLkuK0eOcIcxJ4aqd3o0Z+fREflQ
 LdBmEFNRykxqMK0CbphWavnVECjXmOKQc9izNMwbME9hK2jyTx5r8aPa
X-Gm-Gg: ATEYQzy1bMpaJZyViXkBEohLDKFqkb1O2bTBnclnu2C2JhN24JDRv/iQDr87i/K7Z21
 baYlGSXCytMLZMoYxe4FXSKlXGNcBr33lRWARLkpwgtuxTn6BtkNKYF8wL8peqS/i3dk4D+AzQC
 XAWQ9jffL82AoUjx+A+lubRPjPnk8E+gIPIBnO/s1eb8pYSBNJj+uqM6wOAte/4a9tWh+8uY5B/
 TJd2j/eyz4Zs/Hii4DtRJnE4nAFgHKLQKTgQ0D5nMr1SDzXVY8oDNY4HlVlRsV5Nuu5AatkDdFL
 MytxPqt1r7LbZZL+/6W8cP4TdCGVL2DWPArqk4/5lGs4V4f1BcUy/n6oDMULYocn9QTjpd10RlU
 6gbdAMKn016SNbNbQbI1e0FgzRQrZTiab0yBO/XPoaEJYC3iqsG8uAgPMKDJn4EBFfCd9ULojrb
 I5/r6RRzsC+F3PPYxoQAM1YuoY/5/8DQE8SQbCTbYWRuIGmqmK1cChaOJsHfDr
X-Received: by 2002:a05:600c:8b44:b0:479:13e9:3d64 with SMTP id
 5b1f17b1804b1-48513c76ea4mr8401595e9.15.1772509243347; 
 Mon, 02 Mar 2026 19:40:43 -0800 (PST)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.208])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b55d15besm15461724f8f.30.2026.03.02.19.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 19:40:42 -0800 (PST)
From: Qing Wang <wangqing7171@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Tue,  3 Mar 2026 11:40:33 +0800
Message-Id: <20260303034033.3934672-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The 'sbi' parameter in f2fs_in_warm_node_list() is not used
 within the function. Remove it to simplify the function signature and all
 call sites. Signed-off-by: Qing Wang --- fs/f2fs/data.c | 2 +- fs/f2fs/f2fs.h
 | 2 +- fs/f2fs/node.c | 4 ++-- fs/f2fs/segment.c | 2 +- 4 files changed,
 5 insertions(+), 5 deletions(-) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [wangqing7171(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [wangqing7171(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
X-Headers-End: 1vxGcs-0005wp-3q
Subject: [f2fs-dev] [PATCH] f2fs: drop unused parameter 'sbi'
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
Cc: Qing Wang <wangqing7171@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 47C4E1E8865
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:wangqing7171@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[wangqing7171@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[wangqing7171@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

The 'sbi' parameter in f2fs_in_warm_node_list() is not used within the
function. Remove it to simplify the function signature and all call sites.

Signed-off-by: Qing Wang <wangqing7171@gmail.com>
---
 fs/f2fs/data.c    | 2 +-
 fs/f2fs/f2fs.h    | 2 +-
 fs/f2fs/node.c    | 4 ++--
 fs/f2fs/segment.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 338df7a2aea6..30cf5cac1f5d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -397,7 +397,7 @@ static void f2fs_write_end_io(struct bio *bio)
 				wq_has_sleeper(&sbi->cp_wait))
 			wake_up(&sbi->cp_wait);
 
-		if (f2fs_in_warm_node_list(sbi, folio))
+		if (f2fs_in_warm_node_list(folio))
 			f2fs_del_fsync_node_entry(sbi, folio);
 		folio_clear_f2fs_gcing(folio);
 		folio_end_writeback(folio);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bb34e864d0ef..3913d684128f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3921,7 +3921,7 @@ enum node_type;
 
 int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid);
 bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type);
-bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio);
+bool f2fs_in_warm_node_list(struct folio *folio);
 void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi);
 void f2fs_del_fsync_node_entry(struct f2fs_sb_info *sbi, struct folio *folio);
 void f2fs_reset_fsync_node_info(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 74992fd9c9b6..bbfa677ef46f 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -325,7 +325,7 @@ static unsigned int __gang_lookup_nat_set(struct f2fs_nm_info *nm_i,
 							start, nr);
 }
 
-bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio)
+bool f2fs_in_warm_node_list(struct folio *folio)
 {
 	return is_node_folio(folio) && IS_DNODE(folio) && is_cold_node(folio);
 }
@@ -1810,7 +1810,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 	}
 
 	/* should add to global list before clearing PAGECACHE status */
-	if (f2fs_in_warm_node_list(sbi, folio)) {
+	if (f2fs_in_warm_node_list(folio)) {
 		seq = f2fs_add_fsync_node_entry(sbi, folio);
 		if (seq_id)
 			*seq_id = seq;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6a97fe76712b..23faf6725632 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3980,7 +3980,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		if (fscrypt_inode_uses_fs_layer_crypto(folio->mapping->host))
 			fscrypt_finalize_bounce_page(&fio->encrypted_page);
 		folio_end_writeback(folio);
-		if (f2fs_in_warm_node_list(fio->sbi, folio))
+		if (f2fs_in_warm_node_list(folio))
 			f2fs_del_fsync_node_entry(fio->sbi, folio);
 		f2fs_bug_on(fio->sbi, !is_set_ckpt_flags(fio->sbi,
 							CP_ERROR_FLAG));
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
