Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ml8BNcTp2ncdQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Mar 2026 18:01:11 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D321F4564
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Mar 2026 18:01:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aSMoD5l7kpfAIcLc6NikrQdgLgYetqPYOYJzIPwwo3s=; b=Ofc6CbYUrNlIrmkh86FACoIrtk
	cQSozffmM33FeeP+DRatZtfwkfsDNvm+j8WuwrDkvIFaaffniCyn6CAXHCZ5oCS04C4X3zwvOE7L4
	c5BRhh2ZAPzISSQsao4bYlyvFhG+QBOz1HcYnQ15SA8SG4T85yoHh+iyTy+LP+xIHOnM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxT7B-0004vm-L7;
	Tue, 03 Mar 2026 17:00:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1vxT79-0004va-PO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Mar 2026 17:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tj6fIquSOaaQ0P/+SLzTmxxrpec92S8HSHsRgt4PK4E=; b=QQz93tHAnFMGL9WRClvysq5gKH
 70P+0vfa8kORdD0J37CfT1y5JGDRzAsrE2IGUGDuP0szsRffjzQ95jfzOCa4loUvrnLV8wcqKr8yY
 XaPuWYhbDGJGaIz3Wl9FX/jfQ4YdfCKZDDkVGufKQU4Q0RqPcOc3czuAvjVH1thqqsZ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tj6fIquSOaaQ0P/+SLzTmxxrpec92S8HSHsRgt4PK4E=; b=h
 YYlRFEyMw8q+ombI4IkkgyrAiTGVBwmfyQk7S/alKaK/nnjYzUXOiYEtXbk5bmK/8h2o+22cxtXMn
 Dub0T5VHxft5gscfUZWQTVkt9xHQl/WKyaSpGdmWBKshSkDwqwozPA0UUL+A6WFu99iHZkgHa9Rkz
 gRwHwA6mBlRO6jhU=;
Received: from mail-dl1-f46.google.com ([74.125.82.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vxT79-0003u5-Dj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Mar 2026 17:00:55 +0000
Received: by mail-dl1-f46.google.com with SMTP id
 a92af1059eb24-1270ac5d3efso5743033c88.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Mar 2026 09:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772557245; x=1773162045; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tj6fIquSOaaQ0P/+SLzTmxxrpec92S8HSHsRgt4PK4E=;
 b=iwWDj6tvWsVqL5QrWLRHkO47Dgzg3JP3dDC6Gkkm/tEtV/+BBP6uQlhgLUdRuDU0Sd
 egzy3ASapahm5a0zj8KspLNIVcxREoNKrJ9uswl2iF/Ml1/bvZ7w+hTpZwTbpSSO0reC
 Lh7koQAFiwmQMN+1szeRNk3/mpVBIqjMllOloRTt7xwnB8vB1ZypBjd1cWId5bHosClq
 IBd9EGZ8aa7H93PxCpe6PjpQmafxT5BURPUYs9y4PcATGzoVfaV/l54UoLncyuUobEq+
 RtQHYdXNyy0VOZT2Ax+rTOOqeut8XZrZpCjnLYQWi0hVj7Jk7wVa02IueFf6Dftjg1MY
 B2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772557245; x=1773162045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tj6fIquSOaaQ0P/+SLzTmxxrpec92S8HSHsRgt4PK4E=;
 b=lS98vTe3JkUNY/pNMcMTB54C8JbyOOqww0kJFnm2oaIP5LKtrmNvT2OT3cbgd8evAj
 02IoubGUGfR85w2SidgBg/4eN+wF2Z6f65h8i5KxW8MnIFRnpweN4iHdVXe0gHopURJu
 rk2BHr0DhV7I9qkWGhvPiABXSfMt75WIOXQ3X2qu4ofymesn5IK+wB5g8qZIQCUwQ7+H
 Q3okPlzT5BRWoY/Yl+cIBRcolhmPSp2l4hgO5HZ2b9bYxD0ss8+4E9bo20ZuR8ELxwMc
 EjX/Ep7CM4s2q36omoBxeQnFXkQBOAmiscawfeWu4WmaqFo1c7fyeencuodGY2uEHnIz
 OIbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX+pk8L8Nj+51sqrs7NlKnFGEBs3NBbrY1DbJQxk0Nx3M3+z/GLER7KodjV9eFjSgzMu4d2O/K2ZktU4KB5qMI@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw2MIky2FXbL8sSarVFmrzysbWA6uf3dDjGtlq2TowczOu0wEga
 73McfW9LQWsCI4T25wopeJDLLxiujsm5Gp8W3HFr3ogQyZeR9DP6OYmC
X-Gm-Gg: ATEYQzwTh30Cn37Bc2YlE5y4ziQDm9S6CDST2mgF9DhCRQEDaYxLw4VKaKYt+NIc7Kk
 4CgOQf9slVOihfzPCT3KMFyGlObdLc75ifhDDWMjleayIQSi5m0RRlL4CfHjgMcryZWQvKMqsVs
 EQGtvZoCqUQMOFYHTLY/kjFBX60z+eU5PnEirEYkCQOv+3eBdR5ymwfdZEFHBbzMYy5ZcxCZfIz
 PDFlfhLlK/kqIj2G9ftgOLOL61rTJ8Ze4Jvissj2ImaaY3NxlJhKzXbzn3fkArVr3uaQRv91w7d
 3YZuG1QqLBFzaR12bz7jlrvQEVxCp5NCdjDy0fmKF5HyMc1iDC1JN2Gc+PITr8LqW6iH7FEAPS9
 oZoIIIDHC6eoZJs+7ePT92rKCfUzWjavP63FIfpXnPXRwn5xWIIImqdYPB7N1C7dhjjliRsBVhe
 1c/SSp5wShQ7Zcbkc2GP3k9BMsqq8JVjv1t9/Q+USqGqj4db9GapgGOtZJYnFw8q6BcyyxA/6Bd
 6LcV7RAHaX9LN3wihPWHk19Ulf5D5Fm/NHYbrR0J6iohsXeng==
X-Received: by 2002:a05:7300:640b:b0:2b7:32fe:4bbb with SMTP id
 5a478bee46e88-2bde1baf2a6mr6818307eec.11.1772557244293; 
 Tue, 03 Mar 2026 09:00:44 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:a185:fc9c:2709:6bc])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be002ee839sm8867931eec.8.2026.03.03.09.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 09:00:43 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  3 Mar 2026 09:00:36 -0800
Message-ID: <20260303170036.2242819-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Reproduction: truncate -s 512M overflow.img
 ./out/host/linux-x86/bin/make_f2fs -g android -b 16384 -w 16384 -O packed_ssa
 overflow.img mkdir -p empty_dir export ASAN_OPTIONS=detect_leaks=0:abort_on_er
 [...] Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.46 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vxT79-0003u5-Dj
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix heap-buffer-overflow of reading
 SSA from checkpoint area
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
Cc: Daeho Jeong <daehojeong@google.com>,
 Maxim Pleshivenkov <mpleshivenkov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 92D321F4564
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kernel-team@android.com,m:daehojeong@google.com,m:mpleshivenkov@google.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[lists.sourceforge.net:query timed out];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[mpleshivenkov.google.com:query timed out,daehojeong.google.com:query timed out];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

From: Daeho Jeong <daehojeong@google.com>

Reproduction:
truncate -s 512M overflow.img
./out/host/linux-x86/bin/make_f2fs -g android -b 16384 -w 16384 -O packed_ssa overflow.img
mkdir -p empty_dir
export ASAN_OPTIONS=detect_leaks=0:abort_on_error=1
./out/host/linux-x86/bin/sload_f2fs -f empty_dir -t /data overflow.img

Result:
==306082==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x7df5201e2500 at pc 0x5567ea010583 bp 0x7ffc3386c210 sp 0x7ffc3386b9d8
READ of size 16384 at 0x7df5201e2500 thread T0

Even though we can reduce the summary block to 4KB, we need to maintain
backward compatibility for the checkpoint area. Therefore, the summary
block there must match the block size, so it is correct to use F2FS_BLKSIZE.

Fixes: ad1357c34023 ("f2fs-tools: revert summary entry count from 2048 to 512 in 16kb block support")
Reported-by: Maxim Pleshivenkov <mpleshivenkov@google.com>
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/mount.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 6f640a0..fdf3f02 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2249,7 +2249,7 @@ static int build_curseg(struct f2fs_sb_info *sbi)
 	SM_I(sbi)->curseg_array = array;
 
 	for (i = 0; i < NR_CURSEG_TYPE; i++) {
-		array[i].sum_blk = calloc(F2FS_SUM_BLKSIZE, 1);
+		array[i].sum_blk = calloc(F2FS_BLKSIZE, 1);
 		if (!array[i].sum_blk) {
 			MSG(1, "\tError: Calloc failed for build_curseg!!\n");
 			goto seg_cleanup;
-- 
2.53.0.473.g4a7958ca14-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
