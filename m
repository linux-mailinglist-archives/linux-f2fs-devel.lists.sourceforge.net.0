Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LMuBuFUGWqYvAgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:57:05 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 434505FF990
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhiWSvUJbGFfQn7xivkMN0MdtHxf5HepBWhcV880/C0=; b=FquezfyHAKlu/siKJndcU7c5Cd
	n2zjsKYNJry/7iN3sTV4vtVbvjqZL9CCe6U0dg4cPbyC8irDpdKhLEt5A2vBRWuqCwKjioLQEb1tb
	7kMTHelGjmwVpgayLFRZnx1mWz65KEbxefn9obvOlGEKtXVL5pPW8Aj6uEHAOaUuwJNk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSt1P-0006Ct-TR;
	Fri, 29 May 2026 08:56:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1wSt1O-0006Cn-7y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kMJCn94Jl7Zofs0vJzZzLEdAcbriaV0/YZwgT/8EIQs=; b=PnNhdmGRjUT4N2cIiWe9kdHgH6
 X0EzsWXLSegzxG3G9vOsKCLCBQHFIrVXSJdrL90tTZnxvMvQ/t2tBDAuHRLNt7lmGVbrksxmZtHBL
 Th+kHzjyJ3CVrgdkFN+JkedGYRQ5LdnPvO7WKkUgqrAbchoaPK+54Rb+h1NlcCQJtVj0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kMJCn94Jl7Zofs0vJzZzLEdAcbriaV0/YZwgT/8EIQs=; b=Zg4xXKm8KlfxFBgHatCg3VH5F0
 SkMkVRcUtILCryDuBQyccYnMJpzpbJ6Gb9jo2lQ9arJagMac20wVGJ7gi94e/p1U7bGa4W3/ajYx4
 jcIziWgdDgFIx2eAKuwdnHGQX08FYEDHqCYQ48JjrgviNqGG6PETR+C6XcAQ8Cw3PlgM=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wSt1M-000111-Ii for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:56:50 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-36bcf3d2565so163471a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 May 2026 01:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780045003; x=1780649803; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMJCn94Jl7Zofs0vJzZzLEdAcbriaV0/YZwgT/8EIQs=;
 b=eo0q8MVAqAKKvxdQAFFN5a5CJjB2kf3hcHTikVhJAja6QepwUQ5rM2heZOtB+8sfJN
 VKFdezCtyXRIH+lfr8hvp1pK8jbeMSMcqo1sam08vXZmmWQ69jPbQ/+5k5WJkI1ClXht
 2ThrqpEjoCvwflHFCQzjgpa6BTlrJ0CXG+bjpTaYjz/1W+y10r626WPnj3cGgGR/A2/I
 7MkxYOGKjuGVSGPo3mGul9FWb3V6ZNFjLpz8f0plgxRBqEUh38Nadz2d4hkLt3kB5+xI
 EbZa7s19KaBxvHdqC4uL1PmFktxPqGWKYzsQf34hTyd3Pf5taigRz6UUsypolW3ExXLk
 KYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780045003; x=1780649803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kMJCn94Jl7Zofs0vJzZzLEdAcbriaV0/YZwgT/8EIQs=;
 b=p79boU5FHzViZ+qzvJM+xQocxER4DLEjgybNZC+ttX6RVPYDlGRJKfsEbuiD3oGuY/
 rnKZ8fo+CBycuIfFr4xEw3DLypDh7spWCh4wSvwRw6KHCMe+yOxznBIGUBaNcOLzrxUj
 uawq8AajOOiIEaeShtB7G9gGGNvex7Syeg+SSRMrA1YbHz6/uceeLNI981PR1Dyaz9x6
 1ZL0boAPMljI56OaZNWZlr92Ae2OM2/zJt7TlQnJDVTXY0hkGnpSBTgUQdF8PSXsST7y
 QFLDsHcHYMt1W1gbjr/m6kqjzGDtAgTIZilJq/j3ChaMmYbbVPevkTz4mS8XeuoyweSv
 W1/A==
X-Gm-Message-State: AOJu0Yyr/tSvu9Jh57EbC9DJPisNHWc4seEQ9CfLnQb6d+ntkplHeR9X
 Ct1DSf0mLWDmCbX/S0DNrGaA8YEcaPXTF0Ep1AlLh8qrESuNNm+fTxwQ
X-Gm-Gg: Acq92OH2fJvi+Ktc39f5MSKuLCqalFHl0xDx2Xx7ooEZ153eqCvW4KcIlVdKIOOkTAR
 0B54kotDdgCgh3PuUKFAWFvgQhgyjWuW8vhbzr8fx5v4qr01EXoej3YckEe+/ILu1lHyhxdiuDx
 m2bwfusy07lJgjk+PYQ2+uB/G2oKuWOiQeFxkfRJ8lXkVOercAa18FgrjbA3isMyc9U9WBCvHko
 wJkKwxWSmXqLJzFzQvDfcLoiy1c0uiPWKSvmUxkGvDTTejxU1oB4IsCgHWj9JMxM7APYgXW8X2T
 p41puOzwKdsrB9Wkj0HUS67UO1rtciNMgEGMkPfeiTXXuvDZmt5I/kc3CzhGY5yg3sx+SZJ0UBp
 8TVNuuTEWZxHhLM5pcyeJgJkahg0eRtuXVW6+AocZi1jcFZHggXYDxG2eNLwbEefZJFbPvlEKuo
 zSk7oadT4zhIvDoTePLLT3fvSaJpTwWPqy73HRKnfX86QWTlermsZp5SxMxowEFqN0375fBCE1e
 uk8+jx+
X-Received: by 2002:a17:90b:58c4:b0:36b:91a3:6af3 with SMTP id
 98e67ed59e1d1-36bbcb017bbmr2391444a91.7.1780045003209; 
 Fri, 29 May 2026 01:56:43 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bc1d9f2bbsm874027a91.2.2026.05.29.01.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:56:42 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 29 May 2026 16:56:25 +0800
Message-ID: <20260529085629.2664539-2-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529085629.2664539-1-yangyongpeng.storage@gmail.com>
References: <20260529085629.2664539-1-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang The raw __le32 pointer arithmetic in
 f2fs_truncate_data_blocks_range()
 directly accesses block addresses via get_dnode_addr() and pointer increment.
 This pattern is not friendly for inline extent acce [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
X-Headers-End: 1wSt1M-000111-Ii
Subject: [f2fs-dev] [RFC PATCH v2 1/5] f2fs: replace raw dnode pointer
 arithmetic with f2fs_data_blkaddr()
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
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
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 434505FF990
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

The raw __le32 pointer arithmetic in f2fs_truncate_data_blocks_range()
directly accesses block addresses via get_dnode_addr() and pointer
increment. This pattern is not friendly for inline extent access where
the inode data layout may differ from direct block format.

Replace the raw pointer access with f2fs_data_blkaddr() which provides
a proper abstraction layer. This prepares for inline extent support
where the data block address retrieval needs to go through a different
path.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/file.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 633e9ade654f..e40e136f9d43 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -659,7 +659,6 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
 	int nr_free = 0, ofs = dn->ofs_in_node, len = count;
-	__le32 *addr;
 	bool compressed_cluster = false;
 	int cluster_index = 0, valid_blocks = 0;
 	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
@@ -667,12 +666,11 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 	block_t blkstart;
 	int blklen = 0;
 
-	addr = get_dnode_addr(dn->inode, dn->node_folio) + ofs;
-	blkstart = le32_to_cpu(*addr);
+	blkstart = f2fs_data_blkaddr(dn);
 
 	/* Assumption: truncation starts with cluster */
-	for (; count > 0; count--, addr++, dn->ofs_in_node++, cluster_index++) {
-		block_t blkaddr = le32_to_cpu(*addr);
+	for (; count > 0; count--, dn->ofs_in_node++, cluster_index++) {
+		block_t blkaddr = f2fs_data_blkaddr(dn);
 
 		if (f2fs_compressed_file(dn->inode) &&
 					!(cluster_index & (cluster_size - 1))) {
@@ -715,7 +713,10 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 		if (blklen)
 			f2fs_invalidate_blocks(sbi, blkstart, blklen);
 
-		blkstart = le32_to_cpu(*(addr + 1));
+		/* data_blkaddr may exceed the boundary of blocks. */
+		if (count > 1)
+			blkstart = data_blkaddr(dn->inode,
+					dn->node_folio, dn->ofs_in_node + 1);
 		blklen = 0;
 	}
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
