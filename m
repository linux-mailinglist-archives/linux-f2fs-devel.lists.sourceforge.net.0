Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NYmKDpTuGmKcAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Mar 2026 20:00:10 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA47529F6C3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Mar 2026 20:00:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3WAttY3FABA40DotK44n1N7FE9tF045Ucdg7HZfFf2I=; b=dkuY9miE3F1m2y/h+BJip4H02o
	suBwGGc7f4EdzIgGOrG9lP7r3vEiZj8hqRHRLoZeP+YepKvTZJE0VmU2od1jRgp9+0L23lgJarWod
	0kc2Lqk9EuZyhShlrti+MPQ1q2Aggtp3grZeON8Aw6eAw9T8JkWcT94m+rOKtup8SecI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2DAU-0006mj-LH;
	Mon, 16 Mar 2026 18:59:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w2DA9-0006mN-US
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Mar 2026 18:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ZwAP11ug2Xx4XJCJXQvNUR+uQma1SjuWI/1y2Kw2a8=; b=PvIVZgFLO4jIflBOkCbSCvaull
 X8BDpdwqTGEWEXpE04aPatJd8d5XUHpFN1K8hNipMxvR3tNt2PLaPFAb7ae3p3j0MPzqOrl3uMhcJ
 VGfqfHJJvr1reN0lH5TwmsCECtRlwgBOgkgq9+uXLW1WHnC1BjrTgaps9oSbvJ0vfn0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2ZwAP11ug2Xx4XJCJXQvNUR+uQma1SjuWI/1y2Kw2a8=; b=K
 iemE8jw0828ttu+Y6T4lOOMhCsfAnQOgi/NPz6M4iQcNiKFnKriHVBq9hCynzPnBjlGQGrgaLO2d3
 VpElxAMb9efO6wuJIHhj/RnEM79/+UvdulrojfbA0NHPzsag0+mF5JZHRmWnT2EBOg/g4ZuWAclA7
 vdEQJN0XmHf2LP8A=;
Received: from mail-dl1-f54.google.com ([74.125.82.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w2DA9-0007bM-KT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Mar 2026 18:59:37 +0000
Received: by mail-dl1-f54.google.com with SMTP id
 a92af1059eb24-128e4d0cc48so5631773c88.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Mar 2026 11:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773687572; x=1774292372; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2ZwAP11ug2Xx4XJCJXQvNUR+uQma1SjuWI/1y2Kw2a8=;
 b=VhJYfaUcI25KCV+cZ8ParBIwBaDKmh9w9q6I9aKJLmbATOn+IoABhtkvg6PJwq2xdt
 SQUsbu3UquiR6Eg0LuCnaGdneJ7zS/+aOAgs6zi8I6uujtu7TOmmmErPsEuOjJlBvPOy
 AGSYQAh6eGBAvLU5GJDkBmGRSt19307MsO2BYmlcdY3FvEF1N8Aiw8P8GS5+W/tLJDRy
 tlOZh2Flt7BCFbgFX1bS4qAFlU51hweSpGJQHhsLpBS80/KGUs3Y5m4O2mA1fvBR2fUG
 kD6L/H0yvFM6bBJh1P0fT7/ZhYLxL5oPy8oVA1sqs3VymJyB53/u4+vc/K+hvZadBjNZ
 qXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773687572; x=1774292372;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ZwAP11ug2Xx4XJCJXQvNUR+uQma1SjuWI/1y2Kw2a8=;
 b=Q0TUpCP3mgG02rdjCAGqwjeU/yYI/bgs+8cNR5nBhWnm6impz/BT+2UWhlAA7pHPcn
 P3ltlfmLagY5OC8rUiVKaEthfkvDitfwZiaTjIysNfOQJrxpACZkYXnxqKiTxXYvY65n
 rTMUKlYUsIAVyBW5AwzrXaLDFXdlRaslS2doP/EvY1KvGU0OKJmcFonz9JBAZC7t7Xyu
 Tncod+dlJ9i+CWTyB+qqzcbP9KVl7nLWWXjBNy36jS6f2xeycwbrOfj4iKXbsm/or+EX
 cf7G5+rlFcyiKjVZ9pjJNVyjR8NvU0buBaKPaiBm2Gc/Owx4JG+l24b84tv9oi1qgirP
 HZDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR5pxmO+VDCG9IFgwzZ4uK0ZC4UE1fIZhbCPAjECGFKzFCfDR7bfG8TcPnPAS+F913vQrFdt0/I0aON7rOdwbO@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzqmQs819lktG60zieowDPxRPNuSvK3HqCnpVeJ+4kfnE+RqMfX
 QAC69VBNUR9aSpVDy3I5n9RC84GVdpM3/QMH0cmEj/gux4B3g9UseUFe
X-Gm-Gg: ATEYQzychXxz3iXAXnT4Kjgu0e3/+9NdXrm+9wPE+1DlVTR7yrlzT9AiYfwebKQAyqV
 XHhg6hxxR8b1g8uTInekmRicSSEuP3xrj+fp4FxvcbsIsoVZYysfYL0Uetk0t37ocMlTz8W9Rpt
 h37mx1e3JaMFyMCkxAhlZLImVyY2ZHcMRTAH8aW1nb9ligidJmsTlyMxDcmtgIkZgxYHtS7TUQF
 mDd0880umcgl0Aj63jMVQWxuThvLVVRBMrZrb0WmaV6USvg2llz/unrnhzTBa158OLPRf3g4Wxn
 5b69qf7a2rrdfzPO3XT6v4ot5AKlY6bgWpmcvFG6Z83ApIBPIsBgI1iMuODQU0zqIZsuz8RJg/9
 so5SLh/ZFQcjNVejujj1aWzIwP/ZYUCmp1mx6fL6vWC8YixjbkgngiQovd+C7kcRR4OTg2QRD06
 BDSfy9n09iRrn1CRFVn+ngvQhFYdhgGGv7Y4/gjqPZWYBcpS9zEVHZdem6lC0S7Knfo1nHPcXDM
 yELuIWZyg5YwqhbtjVLPgoQrBszchN2KeG3qS2MswPgkyUN+l0=
X-Received: by 2002:a05:7022:23a9:b0:11a:fb3c:568b with SMTP id
 a92af1059eb24-128f3dbf12emr6161834c88.17.1773687571862; 
 Mon, 16 Mar 2026 11:59:31 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:de83:bdfe:287b:a163])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-128f639d1e4sm12718714c88.13.2026.03.16.11.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 11:59:31 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 16 Mar 2026 11:59:21 -0700
Message-ID: <20260316185922.2184759-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong In age-based victim selection (ATGC, AT_SSR,
 or GC_CB), f2fs_get_victim can encounter sections with zero valid blocks.
 This situation often arises when checkpoint is disabled or due to race
 conditions [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w2DA9-0007bM-KT
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to skip empty sections in
 f2fs_get_victim
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kernel-team@android.com,m:daehojeong@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: CA47529F6C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Daeho Jeong <daehojeong@google.com>

In age-based victim selection (ATGC, AT_SSR, or GC_CB), f2fs_get_victim
can encounter sections with zero valid blocks. This situation often
arises when checkpoint is disabled or due to race conditions between
SIT updates and dirty list management.

In such cases, f2fs_get_section_mtime() returns INVALID_MTIME, which
subsequently triggers a fatal f2fs_bug_on(sbi, mtime == INVALID_MTIME)
in add_victim_entry() or get_cb_cost().

This patch adds a check in f2fs_get_victim's selection loop to skip
sections with no valid blocks. This prevents unnecessary age
calculations for empty sections and avoids the associated kernel panic.
This change also allows removing redundant checks in add_victim_entry().

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: changed the check position.
---
 fs/f2fs/gc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2e0f67946914..246496fbe5e5 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -907,6 +907,9 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 				if (!f2fs_segment_has_free_slot(sbi, segno))
 					goto next;
 			}
+
+			if (!get_valid_blocks(sbi, segno, true))
+				goto next;
 		}
 
 		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
-- 
2.53.0.851.ga537e3e6e9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
