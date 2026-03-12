Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFdHKJzhsmmWQgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 16:54:04 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E27DC274F5B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 16:54:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=neOIKpZUMWfui9s84jqx1NVc9570HG7XbjnPbz+Reew=; b=OyvVdKs/CNZuDKC+bVEbmul/Ci
	AyrToC0GMzGjuZsTgQC4Td8FIOCCgD38W89xfqBcZJvzS3rzWHILzvobkA6ISa/ZEWGt/8wvK/zUl
	3zh3SgxWQMGnd7/eWsmLVofcP/T3se+3cuKQ8oD8/1RD6wX/XziOz+K9LMcv7UqQIgvI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0iM1-0001dV-HC;
	Thu, 12 Mar 2026 15:53:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w0iM0-0001dM-Nz
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 15:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m8bHFQ4Hqw5Jo3nJk+5oSn35D5MYhuZiBEaMfgGAEa0=; b=kT3dCd1dgp8lwV0mB4eSvOLdSk
 lseM58jVjehyaFHraLgamRrOpQ0+ndDepJv9BbhhaoRakHMFhAKdimpWfFBOzC3fATgy6dInt+nxD
 2accnjm2M517bpXzr29Fm08Ct3S55/bKne1GvgtZXJyjtOzlBOQ4ouNN/eBMdx2K1OxY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=m8bHFQ4Hqw5Jo3nJk+5oSn35D5MYhuZiBEaMfgGAEa0=; b=K
 6lco1+HUE5k6KVZuGgH6hHjxwj/ouy5utt2aR/bzeFFke73sOyVnnrCy9eZq1Y0MVI9ddxVrqbZz3
 TpOMu6XuRMgqbo5+nCwLK4dwdcdpzDWPIM0LgUSYY0BN29yr1WwqOk17U1nNdHkBNlBetoarq1V0l
 MKO5i69t32OJE2uE=;
Received: from mail-dl1-f53.google.com ([74.125.82.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w0iM0-00073G-9e for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 15:53:40 +0000
Received: by mail-dl1-f53.google.com with SMTP id
 a92af1059eb24-12732165d1eso1479870c88.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Mar 2026 08:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773330815; x=1773935615; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m8bHFQ4Hqw5Jo3nJk+5oSn35D5MYhuZiBEaMfgGAEa0=;
 b=Y8QtVtCMAK5NwTN3aqFRFOtK0ud36BD4FHbk395pImxduAocEu5OOq42QZVlE7XHGw
 ZAJHLBZh2eJqW+8wVDx8QLJMoAsFxj6bcU+Fs1VVkj/U1kiqIHOVifCBQtLtlfjDMZFd
 907RtGcnwEkvt5A7V9o8x8jbheUzuw90Rru61rIz9yMFt+XPCnxX03VXaywVKHDFEyN/
 TF/KIurW19zSDJcbgeh6xQE4l6mhUyGVvaePoPcv4ma3ZAEq3tAtIaIYjvzxj/tkiMfv
 FKkwgv7eUGg7m6ibvnlqCU9Ja6LuJsl3wkVCFpKwITKlzPL3o8RUFdZP8Dm1ROE5Kxox
 bULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773330815; x=1773935615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m8bHFQ4Hqw5Jo3nJk+5oSn35D5MYhuZiBEaMfgGAEa0=;
 b=MTfOQ/vuSVL4hvcVBlQgoWA4WQWig9tVJnuwvhqc4rVXTzG2rNW0MjaKS2R3o6AST0
 L7vkxqAxbklzGCmQfJpjyVBbNRcj2xHorQsFIkU1aens/2FXuFRJBtwXPtQA/OgEclJv
 QPUS6yZ4HWcBGrIF4/drKfr6kfEJ2yfk1utg4IRXxhF9m/U26x9SBG44f7fuXixZh26B
 5j+VvOlV6w1ht9oRTSQfwNT8rm+ejTfpuNfLobtlIKXoux2X4G8zqyCgccNp5vhqjkni
 +1ArO/yWBgx2PdHEH4+c0XlRVXJ3V5dhF/shQ7309FRQlVyhlNPq++j6Zoh2xNh6RVfr
 qmlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdPxJWzkCjbQtaTOiX60iZ9bhmTkNPqo3g//u9yRy2Gd6mkLK1JeBp4JHrwmfwW+8MbKwv+LY/NcUT7ak8MG6b@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzeGM7a6nSvaddvkLwcAuju/tWjw+LhjIjKnJtq1L2XkFUqnC/R
 fS+7Mub8pDUArbctIvuEuP+eulUdy6Wha2lD4HajKBrhSyFV00bv+NTP
X-Gm-Gg: ATEYQzwKRrnz3FL9EA+osLMcsfeE/alfpkVzxRpcnu0YPdsbEo1jnPKGCMi93BEQnlt
 Fp+fta2zddmQIoRXUtYd5HkMQ2J/jrBXPTVMmBnbCVjNPRDdURigrgSNoaM7aNhGuYUBc99UwYH
 4Jz7DEoXmwtTbiefu1aitIHDaiIniRlZneYGW4rNTaWlySXEoRk5DKYjg3EbVYuiTZzXhwrm5fe
 QYuf7z5DYGT13O0xqviLtnbYR+AWAN24EJfbHYy966lgXlaC4SnYAh1JTF90K6t/YYXHzEd4s9I
 ztazrbdUvCyIeeSEB0jrP49oDuHfg8ytbJ9NijkRgWsAmfpSU7ipGohJosa6Z6kplO/DzGuyk2B
 ZCp9T+ybaxG6MOLzILGDQOdWoQb9ZPYV5aw6tQhuH5MDPYKvo0pUfFSO46OpULe91uwPW/XqQhm
 nUfr/5kfQ8FPMfx/7CVawbtVc4qJNQaPbmzC5Ct17YkYdz1eePC7rHvO/fbiMdOZ00A/sS0sOa7
 j0KuqJ1ev8er6xQAMtydXGEx2+LN8zbXo0duthlgfgAXq8mVK8=
X-Received: by 2002:a05:7301:4188:b0:2be:83a5:44fe with SMTP id
 5a478bee46e88-2bea573a339mr62008eec.34.1773330814505; 
 Thu, 12 Mar 2026 08:53:34 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:2c6f:9e91:24da:13fd])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be8aa74450sm6881247eec.27.2026.03.12.08.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 08:53:34 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 12 Mar 2026 08:53:29 -0700
Message-ID: <20260312155330.2670199-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Suspend can fail if kernel threads do not
 freeze for a while. f2fs_gc and f2fs_discard threads can perform long-running
 operations that prevent them from reaching a freeze point in a timely manner.
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.53 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w0iM0-00073G-9e
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to freeze GC and discard threads
 quickly
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kernel-team@android.com,m:daehojeong@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: E27DC274F5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Daeho Jeong <daehojeong@google.com>

Suspend can fail if kernel threads do not freeze for a while.
f2fs_gc and f2fs_discard threads can perform long-running operations
that prevent them from reaching a freeze point in a timely manner.

This patch adds explicit freezing checks in the following locations:
1. f2fs_gc: Added a check at the 'retry' label to exit the loop quickly
   if freezing is requested, especially during heavy GC rounds.
2. __issue_discard_cmd: Added a 'suspended' flag to break both inner and
   outer loops during discard command issuance if freezing is detected
   after at least one command has been issued.
3. __issue_discard_cmd_orderly: Added a similar check for orderly discard
   to ensure responsiveness.

These checks ensure that the threads release locks safely and enter the
frozen state.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: add freezing check in do_garbage_collect()
---
 fs/f2fs/gc.c      | 10 ++++++++++
 fs/f2fs/segment.c | 14 ++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 981eac629fe9..f07746a14aa4 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1883,12 +1883,18 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 				sbi->next_victim_seg[gc_type] =
 					(cur_segno + 1 < sec_end_segno) ?
 					cur_segno + 1 : NULL_SEGNO;
+
+			if (unlikely(freezing(current))) {
+				folio_put_refs(sum_folio, 2);
+				goto stop;
+			}
 		}
 next_block:
 		folio_put_refs(sum_folio, 2);
 		segno = block_end_segno;
 	}
 
+stop:
 	if (submitted)
 		f2fs_submit_merged_write(sbi, data_type);
 
@@ -1962,6 +1968,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		goto stop;
 	}
 retry:
+	if (unlikely(freezing(current))) {
+		ret = 0;
+		goto stop;
+	}
 	ret = __get_victim(sbi, &segno, gc_type, gc_control->one_time);
 	if (ret) {
 		/* allow to search victim from sections has pinned data */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index e9b6d774b985..a6c82ab28288 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1606,6 +1606,9 @@ static void __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
 		if (dc->state != D_PREP)
 			goto next;
 
+		if (*issued > 0 && unlikely(freezing(current)))
+			break;
+
 		if (dpolicy->io_aware && !is_idle(sbi, DISCARD_TIME)) {
 			io_interrupted = true;
 			break;
@@ -1645,6 +1648,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 	struct blk_plug plug;
 	int i, issued;
 	bool io_interrupted = false;
+	bool suspended = false;
 
 	if (dpolicy->timeout)
 		f2fs_update_time(sbi, UMOUNT_DISCARD_TIMEOUT);
@@ -1675,6 +1679,11 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 		list_for_each_entry_safe(dc, tmp, pend_list, list) {
 			f2fs_bug_on(sbi, dc->state != D_PREP);
 
+			if (issued > 0 && unlikely(freezing(current))) {
+				suspended = true;
+				break;
+			}
+
 			if (dpolicy->timeout &&
 				f2fs_time_over(sbi, UMOUNT_DISCARD_TIMEOUT))
 				break;
@@ -1694,11 +1703,12 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 next:
 		mutex_unlock(&dcc->cmd_lock);
 
-		if (issued >= dpolicy->max_requests || io_interrupted)
+		if (issued >= dpolicy->max_requests || io_interrupted ||
+					suspended)
 			break;
 	}
 
-	if (dpolicy->type == DPOLICY_UMOUNT && issued) {
+	if (dpolicy->type == DPOLICY_UMOUNT && issued && !suspended) {
 		__wait_all_discard_cmd(sbi, dpolicy);
 		goto retry;
 	}
-- 
2.53.0.851.ga537e3e6e9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
