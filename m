Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLCROB55Dmrc+wUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 05:16:46 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 307B059E542
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 05:16:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l6D3cN7oYKU8DMc/fViCstl3gs9Iw8SdYcBBmpFHjSc=; b=Oq9hSQaKqiDaUggPNAR1re/5AD
	fjUJ1aSd6srbeICOq/YfM9biAPXF2Ruwvjj99rDdKywwmbZY5ZHVbOVbzAm+XMRy93E+/8LD/4Y/X
	mbWO1t1EuFqxWpaChathLqhHKPC24pnMQX0l8Wi51XaExyeIHtIfdGXWmW3NWAW370gA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPtth-00080l-4k;
	Thu, 21 May 2026 03:16:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wPttg-00080a-Bd
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 03:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EKjh9nPNMD7rWtFqw8faB+5LtmT286jBIqF2tedz39g=; b=hOE6xmW/mR3XRMyge2LqwkfpaR
 UG2xDr5CPi06KlwKXJTaNjlUd4WphigrKShcsKisatL5zup6guFqhEC9jBdD4GRRgd7k45UeMybfb
 jugqV8jG6pHlru4A5jPackGGrhr2j245nRGCek3C/wIXpofQ0CtSvPkYKhfoMGtHWOvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EKjh9nPNMD7rWtFqw8faB+5LtmT286jBIqF2tedz39g=; b=T
 5rgybGRdhc3NBRJsV5zik/6hlct2RxobTRGn9nphxUBZEw8ZWBVY35z76T5MGO++GzHNUuxGatzUu
 QFgzWJd9wp97BzAEjEn9Okwf2klRCrBb0fu4qlsJa65YaVsOJRYgQeNmVJSuGUwkeecjZxUkv3CKD
 eU08mm9m5IEdBVdE=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wPtte-0002ml-1s for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 03:16:33 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2bd266f6fc0so27744935ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 May 2026 20:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779333385; x=1779938185; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EKjh9nPNMD7rWtFqw8faB+5LtmT286jBIqF2tedz39g=;
 b=PjK0eLBl6+sm03mbA6YjQpbMghVHiS5wftL36Zwl+oV5+fdqQ0O/vGzL+4tc92dcJE
 zwdo0BMHdkgWos9PVVQoTP3wLJbWnkkTkhTGmiXasPtdPGMXXbmyvlmHNXoISsSNKelC
 zRh4hwNnCxryTndwFli/phqex8I4j706Q+5r70pzLmFE3uzYBvBCer/amyumq7Te2KEi
 zOmCNDJR7bCwsnYgv00j/bnGYRcpJ/Ea7SXN0iG4L2BDLBawqV/TJPuvabojSnDJ1Xkg
 EJSoBKeL4Ug3BYuC0L5dEfogtXQ1PBDc9auLygEFAGoGS7I/q7UeTb4YqanEtSaC2/zg
 LdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779333385; x=1779938185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKjh9nPNMD7rWtFqw8faB+5LtmT286jBIqF2tedz39g=;
 b=ruWWrEY6qkQHyYmzlUAkQFMg5/xAP+2M5I3Pwu/EdLF5rwAKrbOjQJ8G2rM9DBhpAr
 VfurEZv1Kuh56GiphhxSh0T3alK+mRC1eeywcvAcZ/Jshrj5b+dobQC10Q2AD8J7D3iK
 fG4IzBUIHAQItlAzGhfWl3ILqldhHH51GfkUEzl6BHZ0NrO5HLQf/s0akAuv5TkfsTAq
 HuQoTMBuxWZZxdU6EMr3fjUAjYz6DyBDQmurIt/L06BeFqxiLUZ6jBsLOMwFmqpBjrAN
 TcDhBAIErHh3ike39/DBWi8GFS5RZHoqB5GMU+m4MPyyiQgX/1O+O/UH65AAQ7HaHsdI
 udoQ==
X-Gm-Message-State: AOJu0YwZhmZ4s0YBLZlQnTx1PhjOkPyMcW99ZzwO+75YJPRatSWQc9QZ
 U+KmsHCfmuM85EZhfzO5ZDHQ3OeedJ7ex/Hi8YFCFcQdC/OQpl8OkhS2
X-Gm-Gg: Acq92OHQ3JJOJR7DDmsaDTAUm5Y9nTQQgUijMcL0bbteZ5sxQD9mDi157kYQIUshos/
 I6CX6HEI0AbPteNL6O1wKTq59eseLYdyoMTZXZwgEhmDy4jIYK7kYBVR0MfkKyU7UrZbEksdb19
 sjQxVE3Q0YfWULd0CYCAyijAtGbeDwjN2KFwIgGuUoOzT0/muRty8eJzLVPuEC6kU/LXtlfxGBr
 jqJJlimwAIWKm+KTWr1O6KTughReE5tNzOS35yHIVafyJKOprOju3Lo3lWxvKVdIFTLBT8ETN3P
 vcDVUqIHt+qyjZZM2UN3IxXIg+apnh4xXNvb+D8JEX3p/ys6hd35fjB2mSyAiHFIRsa4amb5WCJ
 RuHUerODaJz8+N1ZlxIwlhjME3FMDrTALOcGCSsRNQrAqAtStF6GX91JuSUkkjFdusIoKYPi01K
 zsUDjuKp5oX35BcVI0DMfN+5BcXvva2FV/Cj+67S3IvI/PPfTcZiJVFnvUu64=
X-Received: by 2002:a17:902:ea06:b0:2bd:9067:58f with SMTP id
 d9443c01a7336-2bea304cfe3mr10136385ad.22.1779333384705; 
 Wed, 20 May 2026 20:16:24 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5bd5fe44sm240471285ad.11.2026.05.20.20.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 20:16:24 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 21 May 2026 11:16:18 +0800
Message-ID: <20260521031618.1734199-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F2FS_COMPRESS_INO() uses NM_I(sbi)->max_nid as the synthetic
 inode number for the compressed page cache inode. That inode only exists
 when the compress_cache mount option is enabled. When compress_cache is
 disabled, 
 max_nid is outside the valid inode range. A corrupted directory entry that
 points to ino == max_nid should therefore be rejected by
 f2fs_check_nid_range(). However, is [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wPtte-0002ml-1s
Subject: [f2fs-dev] [PATCH] f2fs: validate compress cache inode only when
 enabled
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
Cc: qwjhust@gmail.com, qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,vger.kernel.org,lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 307B059E542
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

F2FS_COMPRESS_INO() uses NM_I(sbi)->max_nid as the synthetic inode
number for the compressed page cache inode. That inode only exists when
the compress_cache mount option is enabled.

When compress_cache is disabled, max_nid is outside the valid inode
range. A corrupted directory entry that points to ino == max_nid should
therefore be rejected by f2fs_check_nid_range(). However, is_meta_ino()
currently treats F2FS_COMPRESS_INO() as a meta inode unconditionally,
so f2fs_iget() bypasses do_read_inode() and its nid range check, and
instantiates a fake internal inode instead.

Gate the compressed cache inode case on COMPRESS_CACHE, matching
f2fs_init_compress_inode(). With compress_cache disabled, ino ==
max_nid now follows the normal inode path and is rejected as an
out-of-range nid.

Fixes: 6ce19aff0b8c ("f2fs: compress: add compress_inode to cache compressed blocks")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/inode.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 12f982f87f1..c6623d70e28 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -564,8 +564,13 @@ static int do_read_inode(struct inode *inode)
 
 static bool is_meta_ino(struct f2fs_sb_info *sbi, unsigned int ino)
 {
-	return ino == F2FS_NODE_INO(sbi) || ino == F2FS_META_INO(sbi) ||
-		ino == F2FS_COMPRESS_INO(sbi);
+	if (ino == F2FS_NODE_INO(sbi) || ino == F2FS_META_INO(sbi))
+		return true;
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (test_opt(sbi, COMPRESS_CACHE) && ino == F2FS_COMPRESS_INO(sbi))
+		return true;
+#endif
+	return false;
 }
 
 static void f2fs_mapping_set_large_folio(struct inode *inode)
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
