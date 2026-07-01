Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zDYUMffdRGpq2QoAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Jul 2026 11:29:27 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CD26EB9A0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Jul 2026 11:29:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=CzWkCZ76;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=M7V9KuaI;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=mBDdmQ64;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=ZOXiksTI;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJHW/9o1LDWLU6djta60MHufyj38OPImAPh2dWqUKUY=; b=CzWkCZ76g0Mt7QQUWw6noFaJTi
	ibdzEb1C9JFnYsQ2y/d8NaFjq/2GIniIBJ/E0hZjoo3tlRX06y9IdLmTMTbmSFV7ZIfrpWzpIvId3
	AgUdyzulkyJUH7S/NjzN2pECq1P342Txo0vwz+nUuHa3Ly1P6HwPcYchAe0/034JD4i8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1werFx-0006ml-5S;
	Wed, 01 Jul 2026 09:29:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1werFv-0006mY-Ee
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Jul 2026 09:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lp5O9+O+7QDEDntjCsZ4esXm+S8DPpjPpF8P+QT8tmE=; b=M7V9KuaIEQxC8bASqwjgx+BweR
 whoLkPUEpNybpSHp+0dFLvSeOpxA+cAe+kwiaXuTV3Yz76P+RFNxRaV7Ix4dr4Ri6GX18fja9i5yb
 cUSXcK1pCRBJdz3CSWFYbN34B/VAKE0L3K/PFn2JOu3tYWp3QStZfMtjguRBtRonRB6Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lp5O9+O+7QDEDntjCsZ4esXm+S8DPpjPpF8P+QT8tmE=; b=mBDdmQ64IE4rXlwZfDeRJaTEc1
 S5ZbpXFhtcjcWBZX/MO8nJAMy1tdsBUe7o1YEDD0bRgoR8e9+/+NjTDQ6ggbCCBZimdv7AUGx2zxL
 2QDjpwqzl9otve5eiMVskz6H+dEUz+V6Pzv1nmOQTkpgrqFD3yxlOWj6X4a+itevkrr4=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1werFr-0006Yg-QP for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Jul 2026 09:29:20 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-84783bce476so387841b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 01 Jul 2026 02:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782898145; x=1783502945; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lp5O9+O+7QDEDntjCsZ4esXm+S8DPpjPpF8P+QT8tmE=;
 b=ZOXiksTIPSt18UdaHSGp0QhOl86GbUFBmdZBaF1TZLHwdJ594DpSwGyrp0IyJuKc00
 UyiggjooSCQ2XQSu2snGmhiDMERMX6WjyIQXxU1H5qvpS8Pbl1ooBnHuhpYujPVfrhTk
 t2tpNovg4ssAOaMw0vllnDHWM4Q9KiKxsq2XGKqILWvk1iRv669ZD0k4sM1eeX8vHvnP
 hSG4hUdyzcwRv0vROuyIIXEmEcoqo5qg8PL5GNNbSEl0v7hhRz0LkCl9mZHPsbKcep+c
 kstpEvx5iWRo5B+07qtEyAypERp3H4HR3aZhHcRCFtlxmRSmXsPObRuYbahQYJzBRR3d
 I/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782898146; x=1783502946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lp5O9+O+7QDEDntjCsZ4esXm+S8DPpjPpF8P+QT8tmE=;
 b=PikABV0N4PIqXxJlJjjWIbyu8AfUTdje4hvBAy1++6xLkTTdZDJPycqn2y0R4h41ok
 jIMvonm6J7ljLXvDZ1GuC1BhUnvarVIjffzpZlJmgrlBk5/DJto7xDHFaOeCNToEjXYR
 0BWHdDjaX8sM9Lk59HgZ9djaM7TfO/f/IeTG2ncBmGqBnkFX68QwaQGIljTy4SpOqY8f
 QGYSe+fLcVz9WAgqWC+bkzdtF3AIP+k4YIU0KD2rZsYb9Z9QsRXyCuWdGwf7CdxYIZbB
 epzA8WRbGjAmKIE4VMzUQiTNro/pgNaDyNM/eeaD3o35G11kQsBE4qf/QcPx5pt2Hspu
 P9sQ==
X-Gm-Message-State: AOJu0YzI44YJ/KFd0jjYsMN0qUXaOgAxRhe/0OnW3mBIVTXnZ9xxgs5j
 j2f+X2exmW+pMYTCSsUfYNMtSYS68rnjd40v0c0ULmhRzDG01C2BoZ+F
X-Gm-Gg: AfdE7clugxZvJ0T2WSMs+CCv/LM2d0onvNwMni5j5RaLSh2mWffwpqPjleganV0ulV/
 8Q+4aKlQFdu3ISS84vm7RyJ9tg1ZP217Z4YfKhrEr/ffHLPDPYXVqhDhiXpDtuX7fwk3FAEOkCI
 L/RA1MFNLYZiouiyKJw4c9EUQYGWgnNylH/N1z9iaNazvXmtKvG5PNpRsZxoRJfX+sifHSane8P
 rEcf4KaJ+TQKNqXPKRUbZ2LM4Be6T9WABL/ReoGbql7Rz87nd+yVNW9o/SnSYR9/Q0W9gvIKgXx
 GAaraVKOrojOCJKsKnFDeHsQaTfHoYzT3YpRnfMchAEPmx2xdYUB89kSIVu81q49SSUgssW/D2k
 6XsTAtN/uxQIolGJBqLcd0oPLzuX/spzI8+mSZVIigHq2kQzi3wP/HeqlDYM/Cznn4QcPQ9/59Z
 gAp7FkguSWPT5mkdiVP7vLdbpWuIxRcj0YpcyLXlpx/w==
X-Received: by 2002:a05:6a00:2a0e:b0:845:d286:1fab with SMTP id
 d2e1a72fcca58-847c0ab02famr709333b3a.58.1782898145584; 
 Wed, 01 Jul 2026 02:29:05 -0700 (PDT)
Received: from zyy-OptiPlex-7080.mioffice.cn
 ([2408:8607:1b00:8:e680:ef51:fd6d:24b9])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847a0329c22sm3624832b3a.40.2026.07.01.02.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 02:29:05 -0700 (PDT)
From: Yangyang Zang <zangyangyang66@gmail.com>
X-Google-Original-From: Yangyang Zang <zangyangyang1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed,  1 Jul 2026 17:28:50 +0800
Message-ID: <20260701092850.1247010-2-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701092850.1247010-1-zangyangyang1@xiaomi.com>
References: <20260701092850.1247010-1-zangyangyang1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  build_sit_entries() calls get_current_sit_page() for every
 entry while scanning consecutive sit entries. Since each sit block contains
 multiple consecutive sit entries, this causes the same sit block [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zangyangyang66(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zangyangyang66(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
X-Headers-End: 1werFr-0006Yg-QP
Subject: [f2fs-dev] [PATCH 2/2] fsck.f2fs: read each sit block only once in
 build_sit_entries
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:zangyangyang1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[zangyangyang66@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zangyangyang66@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19CD26EB9A0

build_sit_entries() calls get_current_sit_page() for every entry while
scanning consecutive sit entries. Since each sit block contains multiple
consecutive sit entries, this causes the same sit block to be read and
copied repeatedly.

Read the sit block only when entering a new sit block, and reuse the
cached block for the remaining sit entries in that block.

Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
---
 fsck/mount.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index ea171a4c97c5..4c63c2d185ba 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2676,7 +2676,8 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 		for (; segno < end && segno < MAIN_SEGS(sbi); segno++) {
 			se = &sit_i->sentries[segno];
 
-			get_current_sit_page(sbi, segno, sit_blk);
+			if (SIT_ENTRY_OFFSET(sit_i, segno) == 0)
+				get_current_sit_page(sbi, segno, sit_blk);
 			sit = sit_blk->entries[SIT_ENTRY_OFFSET(sit_i, segno)];
 
 			check_block_count(sbi, segno, &sit);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
