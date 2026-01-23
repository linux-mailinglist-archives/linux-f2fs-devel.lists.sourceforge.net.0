Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jojHKWTycmmHrQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 05:00:36 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA90703A5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 05:00:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6mV1fg96/g6MwxkL77FNTzTbYx82PAr27D2WA18IhPE=; b=eEpJ3ePGyhO5C/dJNc8yQQDe7o
	9ZZ+Wz0jNSLEm8J9El3eDTCmKA2jcBdqzZf+5a9V8Aa/eCH8evIYFJveNOYnN4r1omqgZIzLwZbNZ
	rRoh9vkknH+HW0ypUzAfo8AKCNtgL4yUBnqwWOwzzp2n0YZ4wmmshlDZFxhd45jBRXYA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj8LO-0005tt-Tq;
	Fri, 23 Jan 2026 04:00:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3uepyaQsKAKwVaMZZQOTUQZSaaSXQ.OaY@flex--joannechien.bounces.google.com>)
 id 1vj8LN-0005tl-0a for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 04:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vu+XY7SifxPF9zfQVHIOb6NKonDohlP8TI+sekSIbTw=; b=TciT860+rwdF1XJ/3OeAMOks7c
 wsRF4Cpqr63ZL4sXd3YkNJy2A+Y6YxJ3GYxs/u+GvBxI9OQtFm8iirlZ3fL2aBfEqezrG7HLebgJK
 ewkoU1OO/g3rbgkFenoPIvDn3w37NgmVZspJIwaYBUeZsmlkXA6L3vWsZ2E3PJcKQfYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vu+XY7SifxPF9zfQVHIOb6NKonDohlP8TI+sekSIbTw=; b=E
 FbOqPRNDPtupgVlhhSCejzfXaCP3xmZImVZ/06umZCH2fWS3v4KkgooK3nnrs+VBK0Lk0iXJLtKCd
 Zhc+fTnqwKiPUdbNFfIKtygYbnOTNQV30SVLhlYzAE2Ai5Iqfnq53A6jix57Uim/5S8VBW1lflyFQ
 YkG4qYAq2gPoghMc=;
Received: from mail-qv1-f74.google.com ([209.85.219.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vj8LM-0003Pk-3a for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 04:00:20 +0000
Received: by mail-qv1-f74.google.com with SMTP id
 6a1803df08f44-8947d47793fso93916666d6.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jan 2026 20:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769140809; x=1769745609;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vu+XY7SifxPF9zfQVHIOb6NKonDohlP8TI+sekSIbTw=;
 b=iKSqG5PDicmktwlktPYKBrWaNgXFJ16giC+Zb1nnxzoBXddVmAZzYDfOBFDh5V/xQj
 C1eedxDxZnsZ2pZGkyrpSlXrp9fs4TxyJxXCB85S4h7RnBK9KMYOi/e9DpdH3BCPdetG
 +0wGC+TKXDrY7CY8Zox8UTWzKim3kqxFcMtem+05eAXHqNj5Bg5y8CAJckrN5+v7ZKIi
 5Jz0LkatW4zJ2Q6hwlaBMIACfbgb58/ccv7qFKRHPVlqwYKOAeLeoZluT4QjG3k5V2Bh
 x0gTQGSsgPKr8eC8Xps4eftLAZtY15Zwys8gkXUMyNEReMsy4HVLprtsKYdjMQI+g5oQ
 vfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769140809; x=1769745609;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vu+XY7SifxPF9zfQVHIOb6NKonDohlP8TI+sekSIbTw=;
 b=ivGEzlpMIRmPuI1rXGZvHVqE3EpBsVdQms+8vegHQh6rehjVzLeMPvd95WQBN3Mafx
 Z44RZ+0gIZBWffCZwv7DvM20olBxJ7G1cQYwuSBs7R8w8kkJi5M1DskTQwZ608FDWKew
 LFd04MQcTyv74wW+qDfOtPRHgPfFsxZiw8y5teuw74Xg+1OAyHm/t2QjfzBAU6tc2wVK
 mEO8QaPA1jEQjSd4vC73VSbjnWIkQadw8OCfZ30uYay5DBg8/be8IqObsXbcen366pNz
 Ug8oZuonF29HL6MRiXdd2tTliZ7VNevp57sEXKWjOTsyTFoGbunTQBrWVX9SUfQ/2+1E
 2EHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1OBuiF2XBspfzChUJO2Ygs0sxebLCbGgKP2x6a6L6+aSdDPjpnTixqsxmJ8hgo3Ale+IGt7hskNsSpn9T5+oJ@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyi3pslnzKYy4rIseOkXFeGJcYPaWUZLazAh9iEmO3GGfqaBtM0
 SA4xFjUttx+ui9Lo+c0WaCGFbl3MNMq6+VDm0+Qzr3Yz353fcL2keVbq+0fxJtR3rXER0WMDVZJ
 042Yi/Y9VJqmhGdnnQf26Fz4KmA==
X-Received: from plbli12.prod.google.com ([2002:a17:903:294c:b0:2a0:bb0f:ea50])
 (user=joannechien job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d511:b0:2a0:a0e1:9c5c with SMTP id
 d9443c01a7336-2a7fe43f366mr13655095ad.10.1769138873912; 
 Thu, 22 Jan 2026 19:27:53 -0800 (PST)
Date: Fri, 23 Jan 2026 03:27:44 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260123032744.1018230-1-joannechien@google.com>
To: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Jaegeuk Kim <jaegeuk@kernel.org> Let's add the required
 mkfs options for quota mount option cases with wrong results. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> Co-developed-by: Joanne Chang
 <joannechien@google.com>
 Signed-off-by: Joanne Chang <joannechien@google.com> --- tests/f2fs/015 |
 10 +++-- tests/f2fs/015 [...] 
 Content analysis details:   (-7.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.74 listed in wl.mailspike.net]
 -0.2 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1vj8LM-0003Pk-3a
Subject: [f2fs-dev] [PATCH v1] f2fs/015: Test correct mkfs options for error
 cases
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
From: Joanne Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Joanne Chang <joannechien@google.com>
Cc: Joanne Chang <joannechien@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zlang@kernel.org,m:fstests@vger.kernel.org,m:joannechien@google.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,google.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,google.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[joannechien@google.com]
X-Rspamd-Queue-Id: CFA90703A5
X-Rspamd-Action: no action

From: Jaegeuk Kim <jaegeuk@kernel.org>

Let's add the required mkfs options for quota mount option cases with
wrong results.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Co-developed-by: Joanne Chang <joannechien@google.com>
Signed-off-by: Joanne Chang <joannechien@google.com>
---
 tests/f2fs/015     | 10 +++--
 tests/f2fs/015.out | 92 +++++++++++++++++++++++++---------------------
 2 files changed, 57 insertions(+), 45 deletions(-)

diff --git a/tests/f2fs/015 b/tests/f2fs/015
index 6a7a582c..81ea9818 100755
--- a/tests/f2fs/015
+++ b/tests/f2fs/015
@@ -59,15 +59,19 @@ options=(
 	"usrquota"			""			\
 	"grpquota"			""			\
 	"prjquota"			""			\
-	"usrjquota=ausrquota"		""			\
-	"grpjquota=agrpquota"		""			\
-	"prjjquota=aprjquota"		""			\
+	"prjquota"			"extra_attr,quota,project_quota"	\
 	"jqfmt=vfsold"			""			\
 	"jqfmt=vfsv0"			""			\
 	"jqfmt=vfsv1"			""			\
+	"usrjquota=ausrquota"		""			\
+	"grpjquota=agrpquota"		""			\
+	"prjjquota=aprjquota"		""			\
 	"usrjquota="			""			\
 	"grpjquota="			""			\
 	"prjjquota="			""			\
+	"usrjquota=ausrquota"		"extra_attr,quota,project_quota"	\
+	"grpjquota=agrpquota"		"extra_attr,quota,project_quota"	\
+	"prjjquota=aprjquota"		"extra_attr,quota,project_quota"	\
 	"quota"				""			\
 	"noquota"			""			\
 	"alloc_mode=reuse"		""			\
diff --git a/tests/f2fs/015.out b/tests/f2fs/015.out
index 3df29436..cd273550 100644
--- a/tests/f2fs/015.out
+++ b/tests/f2fs/015.out
@@ -87,87 +87,95 @@ Option#84: grpquota :
 0
 Option#86: prjquota : 
 32
-Option#88: usrjquota=ausrquota : 
+Option#88: prjquota : extra_attr,quota,project_quota
+0
+Option#90: jqfmt=vfsold : 
+0
+Option#92: jqfmt=vfsv0 : 
+0
+Option#94: jqfmt=vfsv1 : 
+0
+Option#96: usrjquota=ausrquota : 
 32
-Option#90: grpjquota=agrpquota : 
+Option#98: grpjquota=agrpquota : 
 32
-Option#92: prjjquota=aprjquota : 
+Option#100: prjjquota=aprjquota : 
 32
-Option#94: jqfmt=vfsold : 
+Option#102: usrjquota= : 
 0
-Option#96: jqfmt=vfsv0 : 
+Option#104: grpjquota= : 
 0
-Option#98: jqfmt=vfsv1 : 
+Option#106: prjjquota= : 
 0
-Option#100: usrjquota= : 
+Option#108: usrjquota=ausrquota : extra_attr,quota,project_quota
 0
-Option#102: grpjquota= : 
+Option#110: grpjquota=agrpquota : extra_attr,quota,project_quota
 0
-Option#104: prjjquota= : 
+Option#112: prjjquota=aprjquota : extra_attr,quota,project_quota
 0
-Option#106: quota : 
+Option#114: quota : 
 0
-Option#108: noquota : 
+Option#116: noquota : 
 0
-Option#110: alloc_mode=reuse : 
+Option#118: alloc_mode=reuse : 
 0
-Option#112: alloc_mode=default : 
+Option#120: alloc_mode=default : 
 0
-Option#114: fsync_mode=posix : 
+Option#122: fsync_mode=posix : 
 0
-Option#116: fsync_mode=strict : 
+Option#124: fsync_mode=strict : 
 0
-Option#118: fsync_mode=nobarrier : 
+Option#126: fsync_mode=nobarrier : 
 0
-Option#120: test_dummy_encryption : 
+Option#128: test_dummy_encryption : 
 32
-Option#122: test_dummy_encryption=v1 : 
+Option#130: test_dummy_encryption=v1 : 
 32
-Option#124: test_dummy_encryption=v2 : 
+Option#132: test_dummy_encryption=v2 : 
 32
-Option#126: checkpoint=enable : 
+Option#134: checkpoint=enable : 
 0
-Option#128: checkpoint=disable : 
+Option#136: checkpoint=disable : 
 0
-Option#130: checkpoint=disable:32768 : 
+Option#138: checkpoint=disable:32768 : 
 0
-Option#132: checkpoint=disable:50% : 
+Option#140: checkpoint=disable:50% : 
 0
-Option#134: checkpoint_merge : 
+Option#142: checkpoint_merge : 
 0
-Option#136: nocheckpoint_merge : 
+Option#144: nocheckpoint_merge : 
 0
-Option#138: compress_algorithm=lzo : 
+Option#146: compress_algorithm=lzo : 
 0
-Option#140: inlinecrypt : 
+Option#148: inlinecrypt : 
 0
-Option#142: atgc : 
+Option#150: atgc : 
 0
-Option#144: discard_unit=block : 
+Option#152: discard_unit=block : 
 0
-Option#146: discard_unit=segment : 
+Option#154: discard_unit=segment : 
 0
-Option#148: discard_unit=section : 
+Option#156: discard_unit=section : 
 0
-Option#150: memory=normal : 
+Option#158: memory=normal : 
 0
-Option#152: memory=low : 
+Option#160: memory=low : 
 0
-Option#154: age_extent_cache : 
+Option#162: age_extent_cache : 
 0
-Option#156: errors=panic : 
+Option#164: errors=panic : 
 0
-Option#158: errors=continue : 
+Option#166: errors=continue : 
 0
-Option#160: errors=remount-ro : 
+Option#168: errors=remount-ro : 
 0
-Option#162: nat_bits : 
+Option#170: nat_bits : 
 0
-Option#164: atgc,mode=lfs : 
+Option#172: atgc,mode=lfs : 
 32
-Option#166: ro,flush_merge : 
+Option#174: ro,flush_merge : 
 32
-Option#168: rw : ro
+Option#176: rw : ro
 0
-Option#170: norecovery,ro : 
+Option#178: norecovery,ro : 
 0
-- 
2.52.0.457.g6b5491de43-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
