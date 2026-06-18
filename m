Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y2ugDLpONGrLUQYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2026 22:02:02 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 464006A2733
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2026 22:02:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Wko11c4a;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=byTVBmia;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="S i7hlzn";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=X80neZuV;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E1jP55zFLXY433njwplW1vMIunttOKOaQzVbL7miOHE=; b=Wko11c4akv3ARnUzL9rwRsEw8V
	ABn7+A6qjGEiIkOH7cUaTfqPKe28QFVZM5PzyTTALCLN5qzvOMxf0uejcL5+PHxf+r0xun9T6DDqd
	4BHP7jiaVRXSWg7aP92hUYVcdvyug9mff+4RsCMui5W/bO+LQCXuRhQ5/BLkjI1NZlyQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1waIvx-0007wn-0I;
	Thu, 18 Jun 2026 20:01:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <iganschel@gmail.com>) id 1waIvX-0007wO-Fp
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Jun 2026 20:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/KjNn7oIPOk5S1KhGdV+Qc8EkkjlRGU4my6m/nNkSF4=; b=byTVBmiay2dH/4MY0R4CwDEu5x
 Ppo2ShCh28qKxDRHHykfZvrf54wqCICaxTtd7jzTg4ZIQLJrFfThnePsjfZJJzgPYpSHtmFFenRJ6
 413BygIbjab59+evRz60HyrrHjX2M505OM9KUmTxNwr/OVQUgPdnwr2drCyPLj4FSDwk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/KjNn7oIPOk5S1KhGdV+Qc8EkkjlRGU4my6m/nNkSF4=; b=S
 i7hlznGW95o8KzP5loRoVw3USBCLY+WE65f8AuvqagplRzIy4vTabW0qJ0Mpw1SVF4jyEufvNiu0C
 2u9eM1/pBhYs6hDwR8xLULBcq3SC6OtDTnjtRG/iQS97lJ8plTJAkKLYb4O8CQmWqILpMMUKucOWt
 lXSs8fLt7t9BHAaA=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1waIvT-0004OH-43 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Jun 2026 20:01:24 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-36ba285e98bso1561096a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Jun 2026 13:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781812878; x=1782417678; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/KjNn7oIPOk5S1KhGdV+Qc8EkkjlRGU4my6m/nNkSF4=;
 b=X80neZuVpv3LoNuBFwAk2ptU3qw6ftDQH+GtyoOwal6SZEXoFsdafGR5daYbRv5w38
 xFj8XLXfyMBBV5q5hrkEPbBa2VU1Jqr+k0nCQYKC04aaBS/k/F1KLlpVDju0xFXQPVYO
 slQCRDF2M6cCAjaa2gRLmZN+jLcFMD0zkBmlWWizmoOMbF3U7PFzFtLDdfB9KQJBParR
 cTQ3vC6jHJt087OwVukPIVabwPGeDIsYb1PizOXYBKlkdBEeWirpgqAXXMzRqTyETkCj
 LxBnY0Bz05BpHWAt9sDeJrAsh4OwnR2cbRJx1wfO8DeO9+EGb2IrIozEIPR21+RmBJfU
 bsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781812878; x=1782417678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/KjNn7oIPOk5S1KhGdV+Qc8EkkjlRGU4my6m/nNkSF4=;
 b=WtF6g5YBQuU4moaUW3eHWW6VgzTFeKj7KEgTUR2yJvMnaB5HB6pIBl+pb/y5iBlejG
 jZuVrviu1M6/jjrVBCP7dtNjYVnjJoSWnl6O9EdF1wvSDcr4L2+aEfR+cqHtFxW0ZZAG
 x/EihZwFbM70hCAxuw71WRzAWLtWTlNx2uPq9wLEdJWfEXcJvC+dgKfMJFVJfdq+gQgd
 baM6j+nRHGcaGJFDAFrP3e82g5XePMFab/bj1z21BNA0vqxk/xeteZ/LZzudH6iqgQGk
 ztOp8M3td0SD/CM0jk505r6wx2qyxdyjy01/7AV/+U9sycOI16+pSM8NLV6Wvkewa28D
 3LGA==
X-Gm-Message-State: AOJu0Ywov53q+0y3WsppUiATy1Ft21KNtm9rau/SaeARKxnqaBQmv4Rz
 /g8e74zX+K7cyvYYyb/22aOAB3PWwL88qvYIRdMkryugL4kDnFu5idlJ
X-Gm-Gg: AfdE7cnHzXigyDl/oR6GVELvuZ64OS5yRJNGcvxxYaOhTXZ6YhfkYs+xQ5MGLAqzyOX
 fTBV81B0nrCwVS4Vg0JpZ5gGALZtTHC9jHP93omZikl9A9Ifb/I48pY2qeeZfEalgu/8CjG9Do1
 UZtjcaAANRxhqOF8i4iuOQioS7Qp5t57PTGE13CzWNHrFH/yRwxzKB0sH/vKQmixnj5z+sAEtLp
 ctxOONwpkfwV9q+4gJssgIl7m0/B4SA3Y8J3sAdEtJXaNsIkB56NXmyje+ViUISPI8DqWDaUsIJ
 JLW9jnxknHp1Lsq5DF/SBISZJXp1Dt+tRVIAcxnSU9U8FlKefCdgnJwyvkj+H32ykSez2uJUys3
 EqW5k3AMZ0Dc+f++2eLZWnLDgVJZwvneVYXwbaxa8sOdUQbu9fAymvvlbjriqxMo6uES3o5HB3b
 zFgtVCg/WdzOX2i8QSs18YfGCD9aoCGB9VHg==
X-Received: by 2002:a17:902:dac5:b0:2c6:cf81:74a8 with SMTP id
 d9443c01a7336-2c71900ff22mr6485405ad.30.1781812877821; 
 Thu, 18 Jun 2026 13:01:17 -0700 (PDT)
Received: from LAPTOP-TMVMP5FD.localdomain ([106.222.251.180])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c4327ac72asm225736595ad.38.2026.06.18.13.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 13:01:17 -0700 (PDT)
From: Keshav Verma <iganschel@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 19 Jun 2026 01:31:05 +0530
Message-Id: <20260618200105.3551-1-iganschel@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Validate the xattr entry before reading its fields in
 f2fs_listxattr().
 Return -EFSCORRUPTED when the entry is outside the valid xattr storage area
 instead of returning a successful partial result. Signed-off-by: Keshav Verma
 --- fs/f2fs/xattr.c | 7 ++++--- 1 file changed, 4 insertions(+), 3 deletions(-)
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [iganschel(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1waIvT-0004OH-43
Subject: [f2fs-dev] [PATCH] f2fs: fix listxattr handling of corrupted xattr
 entries
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
Cc: linux-kernel@vger.kernel.org, iganschel@gmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FORGED_SENDER(0.00)[iganschel@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:iganschel@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[iganschel@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 464006A2733

Validate the xattr entry before reading its fields in f2fs_listxattr().
Return -EFSCORRUPTED when the entry is outside the valid xattr storage
area instead of returning a successful partial result.

Signed-off-by: Keshav Verma <iganschel@gmail.com>
---
 fs/f2fs/xattr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 610d5810074d..18f495db20d2 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -581,8 +581,6 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 		size_t prefix_len;
 		size_t size;
 
-		prefix = f2fs_xattr_prefix(entry->e_name_index, dentry);
-
 		if ((void *)(entry) + sizeof(__u32) > last_base_addr ||
 			(void *)XATTR_NEXT_ENTRY(entry) > last_base_addr) {
 			f2fs_err(F2FS_I_SB(inode), "list inode (%llu) has corrupted xattr",
@@ -590,9 +588,12 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 			set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
 			f2fs_handle_error(F2FS_I_SB(inode),
 						ERROR_CORRUPTED_XATTR);
-			break;
+			error = -EFSCORRUPTED;
+			goto cleanup;
 		}
 
+		prefix = f2fs_xattr_prefix(entry->e_name_index, dentry);
+
 		if (!prefix)
 			continue;
 
-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
