Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLh0EdT8A2okBwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2026 06:23:48 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7261652D243
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2026 06:23:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fEvHKP0PF12KN/Cw6U+kjubnrDZf95vzsddNq1LrbUc=; b=l1HS7Fkj9AUAnHm31b1THcSi8j
	eALQSoaN3A+TkFXk2iUCq6kSRFif6pCiBfc9U+wu53O3Bv3QY5Q4kMuo4ZJj3A/MvFft3MT7Fn6cn
	4/W+2DT4M+4ztDnOLc6bFqK2Wf1eIqVE3wP3x+80ZPLyxWvBVapzmcwrcEMoT7CSo9mg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wN18E-0004kJ-D0;
	Wed, 13 May 2026 04:23:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3--0DagsKAD4otfssjhmnjslttlqj.htr@flex--joannechien.bounces.google.com>)
 id 1wN17r-0004iW-UG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 May 2026 04:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gl+fbFhlYRHV9uFZaKjbbT4X1sSGcksiAkjCTrWM3D0=; b=kBCgbGVrBjO8Kn6f52s+5XVG22
 J+HOtI5S8nwot5RMrSM5h8+oG+DBqB3FoxgpYDSZciVgzztfnGc2SpLwIkuVcnxOFb2HLmzdEDBeI
 CILrOdph5mx1ajTBd322lneRnLtD71tRGKuYoqD6CVWtEA1+PykDVqiZiWdNsmcFNWgI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Gl+fbFhlYRHV9uFZaKjbbT4X1sSGcksiAkjCTrWM3D0=; b=N
 meiiBh7aVMkHu64APYT5rrue0kiS3O2u3OzJtpCC+Q5Q9BnO4gpmm8efjPKjta5QO6lNaXPU0ZmxL
 bhQ7AfkJLq82mUr8OAFXUM0xzXUz5k91ymPFCN7A6zSzTHzdwNEx/u906YRlHx9PtGqgZu+AAM/hg
 nyk22VkUdOLcokVU=;
Received: from mail-qt1-f201.google.com ([209.85.160.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wN17o-0001Rm-TL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 May 2026 04:23:15 +0000
Received: by mail-qt1-f201.google.com with SMTP id
 d75a77b69052e-50e136aff17so108908941cf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 May 2026 21:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1778646182; x=1779250982;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Gl+fbFhlYRHV9uFZaKjbbT4X1sSGcksiAkjCTrWM3D0=;
 b=PSmkeTfGsUtRc3/plOu92WyhVWgYdkSWjvIVvynlWcQi2SuBsHQyMej2o0MMXFApBx
 C4uFL47qejQK/Ujkub4N6AOKQaBBNTS0cOgveC54vPwVZtqsgqYx1H7ujby2/ZCDudeA
 +yBOb0EwwbHenWYTgIj4wL4Xxc9dfFKB33Ld8Ad4+hXjPAn9rixR0WOgTu7zvSOkOsF3
 P2/v9EiIQexqEzvIrxK/VZzBJtRwtWjj3hJxgvQtytAu+QicK9IQ80AgTfJ9qBPimP97
 4GMdC20fLZxWBDDhq44/qQTANDByMOqhPm6qqFXoC9qg7m08XSsdmdaaHzD5LWAAcMj5
 qekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778646182; x=1779250982;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gl+fbFhlYRHV9uFZaKjbbT4X1sSGcksiAkjCTrWM3D0=;
 b=sOPoBW3yb5gGGsU3VVZ8lYKSEt04irBByqzfgqT3ZJgJblVOsZIK+UcZSlTlZ4hN6/
 jX1DpB0JJ4kvQSf6STQrLmeZQYJbmmt9idXqa0iXNjD9XU4anezctvQ6h4dvgs7oBZAL
 aepSJ+H3P+SjNeBpk0XkBXNOheVGZiP/FfOuXP+7TIVx+Ygr+D4c3eEu1cJqnvEStqwT
 G6Y1c6RrdIMg9YvionqY//ZyPEz2aTFHMBCVPWyi/CwP7Yx7B7HYJTjdow4XEtpSLKuc
 ZmFNayR4bEGOlJYhlJuIh0R3Sq3OTSJhLAGAvrwKmAnmzT7wHTz6xcGPW1WMYA5/nuZ7
 //Tw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/CBG4tCfTlovVALTo7/p03nJh18T4d95/bBJ4wU7moHgIuilN9Pr32sAcMZW0CDFdtEKFgxdzMSrxhKrGkY3Jj@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwbTessbgKABQFhZtiltolmNfFfjRjaSR6PgShe3pKHUsZivMXY
 MK1oir8R9BiVTqDmozLMtyi/jyGjToVZ1Txt5OL4ircDSqtxJAOcqOCWnQMv8BkXeBQ6Ifv4QjD
 R651mmtW4sOmEX2QWEWKaNGY6HQ==
X-Received: from pfbkq4.prod.google.com ([2002:a05:6a00:4b04:b0:839:4a33:c35d])
 (user=joannechien job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:b41:b0:835:351c:f22b with SMTP id
 d2e1a72fcca58-83f05c34d23mr1065175b3a.35.1778642427849; 
 Tue, 12 May 2026 20:20:27 -0700 (PDT)
Date: Wed, 13 May 2026 03:20:08 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260513032009.2300435-1-joannechien@google.com>
To: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  F2FS has removed the trailing "=" in the mount options for
 disabling user, group, and project journaled quotas. To maintain compatibility,
 update the test cases in f2fs/015 to try the new syntax first [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.201 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wN17o-0001Rm-TL
Subject: [f2fs-dev] [PATCH v1 1/2] f2fs/015: Fix mount syntax for disabling
 jquota
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
X-Rspamd-Queue-Id: 7261652D243
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zlang@kernel.org,m:fstests@vger.kernel.org,m:joannechien@google.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,google.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,google.com:s=20251104];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[joannechien@google.com]
X-Rspamd-Action: no action

F2FS has removed the trailing "=" in the mount options for disabling
user, group, and project journaled quotas. To maintain compatibility,
update the test cases in f2fs/015 to try the new syntax first, and fall
back to the legacy syntax if the initial mount attempt fails.

Signed-off-by: Joanne Chang <joannechien@google.com>
---
 tests/f2fs/015     | 13 +++++++++----
 tests/f2fs/015.out |  6 +++---
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/tests/f2fs/015 b/tests/f2fs/015
index 81ea9818..54cada4a 100755
--- a/tests/f2fs/015
+++ b/tests/f2fs/015
@@ -66,9 +66,9 @@ options=(
 	"usrjquota=ausrquota"		""			\
 	"grpjquota=agrpquota"		""			\
 	"prjjquota=aprjquota"		""			\
-	"usrjquota="			""			\
-	"grpjquota="			""			\
-	"prjjquota="			""			\
+	"usrjquota"			""			\
+	"grpjquota"			""			\
+	"prjjquota"			""			\
 	"usrjquota=ausrquota"		"extra_attr,quota,project_quota"	\
 	"grpjquota=agrpquota"		"extra_attr,quota,project_quota"	\
 	"prjjquota=aprjquota"		"extra_attr,quota,project_quota"	\
@@ -119,7 +119,12 @@ do
 	else
 		_scratch_mkfs >> $seqres.full || _fail "mkfs failed"
 	fi
-	_try_scratch_mount "-o ${options[$i]}" >> $seqres.full 2>&1
+	if [[ "${options[$i]}" == *jquota ]]; then
+		_try_scratch_mount "-o ${options[$i]}" >> $seqres.full 2>&1 || \
+			_try_scratch_mount "-o ${options[$i]}=" >> $seqres.full 2>&1
+	else
+		_try_scratch_mount "-o ${options[$i]}" >> $seqres.full 2>&1
+	fi
 	echo $?
 	_scratch_unmount >> $seqres.full 2>&1
 done
diff --git a/tests/f2fs/015.out b/tests/f2fs/015.out
index cd273550..45ef9ea8 100644
--- a/tests/f2fs/015.out
+++ b/tests/f2fs/015.out
@@ -101,11 +101,11 @@ Option#98: grpjquota=agrpquota :
 32
 Option#100: prjjquota=aprjquota : 
 32
-Option#102: usrjquota= : 
+Option#102: usrjquota : 
 0
-Option#104: grpjquota= : 
+Option#104: grpjquota : 
 0
-Option#106: prjjquota= : 
+Option#106: prjjquota : 
 0
 Option#108: usrjquota=ausrquota : extra_attr,quota,project_quota
 0
-- 
2.54.0.563.g4f69b47b94-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
