Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEzzBuWDsGnRkAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 21:49:41 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5E325806A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 21:49:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0qvKrE3ONUt2xBZ9e8LWdUccLsYKvb4K1KO58YbTPZc=; b=G+bzJnZkyQsYd0c78unFjsa66S
	ti5/qu3gRtVi+5fISFjLoL8xSOUccViSUWntkK6s6BuDNdzfNhtO8pGHhdnbmpMfhpw6V2xwxMIJO
	9nVSWsckoA4vriPXu8r5dBKa17K2ZPoWRI3+xhNLX6exgmXSE9HJElaYKs7pSfA6RTJI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w041F-0000zP-B7;
	Tue, 10 Mar 2026 20:49:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w041D-0000zI-MR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 20:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJuWdsrqe+6jRpgcLawBwjbQOS7Fk+dZEC7WEwVmrnk=; b=k8ChJOCnOaycPlLsiTnntol4jr
 PNRywoQxV8l9A2HA9QvzOSAHvoss9e35ooc5ycSjSJUjwNeMRtIvZFnrW7In6xk/ZeOorMwdSLEfY
 jm1VWJQ0kP73Fqt84zV6puzI1k6g7/VKHTFeR8msByDfWhGkmRvFUz2k6ZLitEY75lrg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IJuWdsrqe+6jRpgcLawBwjbQOS7Fk+dZEC7WEwVmrnk=; b=Q
 unILPBtybG9KNWaE+WXon7H5bQaQ8K/ipmfub7scjLT4UCEsWF6hTPzgvnIai9LvYbJhedMyp6Rvj
 ooiFvMyuGEBVsVHdL0QZ5IPnUv55Y8XXrGm+Mrm5kWJbmBFWPUFsFTKOyt62qGSsXh3WuL2TDtpA2
 Y4l3yh+Oq6qDaOUc=;
Received: from mail-dl1-f47.google.com ([74.125.82.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w041E-00023v-1e for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 20:49:32 +0000
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-128b9b7e3edso966395c88.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Mar 2026 13:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773175761; x=1773780561; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IJuWdsrqe+6jRpgcLawBwjbQOS7Fk+dZEC7WEwVmrnk=;
 b=f9WHAu9zky47ziIRZIeMhW1ToB8YDGo63C9wutwgk/LJaS6yT7QD05Hdkc+/OBt++J
 KVvCIlg2R6ieGXtUelp3LAFyVssniDaElLLWcmp4BEO/fB9xAOKMSvYqzTHgvr4T+QJo
 kWvaCKosl55t17aPwINNs86PnZxWqWRHXjQh9hk0udZuCmmVppnx33r0PnK20aarTxI4
 nA3C1eILEcB5iWqdR/1/UPKm52o8lGFxCcYiaGGhneYXrnld13qCfPeTwITIqmeZ1FFi
 IHC21Xr00pLjHQ2tKBAXemGiLmt1cRD5Lkha4tvv6HrpBgPl91+xe+i5K16qzvGZzz38
 6zRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773175761; x=1773780561;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJuWdsrqe+6jRpgcLawBwjbQOS7Fk+dZEC7WEwVmrnk=;
 b=XhGoGS9siHBw0oocvJ3pjpmEZrTrv2/ddV7dlOSQizNv938m0MRkv/ySEP+CLporpB
 y8rHTJi5lW+jrOP22KbYqUpN4XA96y+vX1mtj0/VgTXOGkdUoGlszbQBVXvfe49jSpkO
 pdlrWwOFJObLy1oejubZLsGrsFCcCsG+hH9McX6kl70aOzsWg6jBgSs4wCRymMj36SCt
 nlkf+aJ/3CpLcFFKt7dBNWYMNaCdqRdy4vZoCVRTYPXYKmsKFC5ERRoT4Zguz7P+2FOW
 8xfp0FeeNQn5DMgbQ8vMboM6MagYXSaGPh3V6AgiwJ01gfnoEwcpqSup0Bo250cPB+pX
 XiHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGs7iM/yYRKtUppGq44N3D6qMEeUReroLq0RIXmpnlOooLjQydJvszOBXsQEk1AFwlx7Keh9Ly5vpF45XegVfa@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzpNmihWDCopXgSOVpKAXzOu4y4j/jZfvNKE9Yz3gL/zPaLLTzJ
 HZs2Bew9j7SanGFEzyc52Jio1vQ5hlkzwJNHeKOAojl79JlCAFF+3UMG
X-Gm-Gg: ATEYQzxM0+1wRSeTG7V7Cu4tYnzM8zXrERqq8Q8nTRTGLvLa2dxiLcOkPYGBt2AJra0
 WlgZAIf9uxl70KuBpXbTDIRYRLfPjHLGDiKFslQMHiVdDM8RXyYFY5BCc6McScQIltsZvCQtbCM
 BcZQJCR0fref1owAUzhnymyvjqzElylbhCSH5bujoEVWTyEvb4RNfg2Cs2n8I5qkA/Ic0k1pJqS
 ORA8yS665W+y82bjKR3oekV1yPakeP8LnzvVUcvhaQYd9i3HX8MLCOvLDrrASlZ2ceQgXwEFunv
 bcIZ5Kf06+hxq6iUZmztuG/P1s4eD//5oR1jdsEGUJ5KG/etXaEH83biRybtN8cJWeU6eB87pGj
 lZ4vTw7V9mM/Jgv4UumYIYwBY0F4Kj664fMZLgD4lguJ7Z9pCDTVFvOil78kbJo9sEdI5VbFRdN
 c4ZjnLPxSgqgXDvhmUPYStEhrNEd1hnpa0ggjTJD2WgO8KqXI+EYW3Fbd4Oq4g9js9YYx44fcQZ
 db8nf7kxI7k+C2BQUA6KoYOb9Vk5emkxh6ZOzOqK0+zvsskMjI=
X-Received: by 2002:a05:7301:1292:b0:2be:ca4:e13d with SMTP id
 5a478bee46e88-2be8a572eaamr27094eec.30.1773175761255; 
 Tue, 10 Mar 2026 13:49:21 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:493f:f39e:ec36:a0a3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be4f807a30sm14188481eec.6.2026.03.10.13.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 13:49:20 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 10 Mar 2026 13:49:16 -0700
Message-ID: <20260310204916.1265736-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
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
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.47 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w041E-00023v-1e
Subject: [f2fs-dev] [PATCH] f2fs: fix to freeze GC and discard threads
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
X-Rspamd-Queue-Id: 5C5E325806A
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

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
 fs/f2fs/gc.c      |  4 ++++
 fs/f2fs/segment.c | 14 ++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 981eac629fe9..fdc3366c4db3 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1962,6 +1962,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
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
2.53.0.473.g4a7958ca14-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
