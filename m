Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id djz6Nx7tPWpq8ggAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jun 2026 05:08:14 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1492E6C9E6A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jun 2026 05:08:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=huEAJvDk;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=gopMNHBc;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="T pHy/w0";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=R9GGuogK;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fs4dnyWK7FKEht7FkSIC/Ze7j8hdCDU+MEYRGUrck0s=; b=huEAJvDkIHEen+fErTT9woRn+n
	VfMpWBefYGYV5fV87ggkwb4bcsjKj/4pP40CnhXtDt47TygziCkUhaIMgKpS4v076PNCuu+ZKqAoD
	oSUTBjzGQ7H9Q9NjZ707OzZcBEj+xQuYSt+XZxS/xlP3JICF0VM6w8S07/up3Ih6qM8I=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcwvA-0002JS-Dz;
	Fri, 26 Jun 2026 03:08:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhanxusheng1024@gmail.com>) id 1wcwuw-0002JA-JB
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jun 2026 03:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z4o/+uzc41vKgJ19Dqul3fyR5EOnKFEN3eoQx2mbEsg=; b=gopMNHBcpawnGWi7uoIGEDHbHv
 iRuN7k8LZXEjAOnqCqW3znw/jabxLhjvUjxdpv+v1Omyb37CShvPuC/w+BkRM7KEy8wHzaaLDf6QZ
 5Y1NC2IhPr2dHxRs8jV9z0F0RvSP1BnWJvL9RX5lcK1jGdX7ABIRXBQ5gzog/2WC5Xd8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=z4o/+uzc41vKgJ19Dqul3fyR5EOnKFEN3eoQx2mbEsg=; b=T
 pHy/w0ESIL666VT6dIjqPms2UuZ+9zDnuHtj2e7ka/Z0I92olqkjZ5ClUDfbvCArO9c0fQ8LV0haA
 4Ml570dv3xiPasd9SdP3JzGm8+TxQBlH59VdU2Usv6/FCLI/1etfuG+c24WtUmE3uI7DrIjie8MbW
 6Jz+lUuhgIoTcUDw=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wcwuv-0000e3-Dj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jun 2026 03:07:47 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2c7f1db3ad4so4971075ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Jun 2026 20:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782443255; x=1783048055; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z4o/+uzc41vKgJ19Dqul3fyR5EOnKFEN3eoQx2mbEsg=;
 b=R9GGuogKS654g3WNTNBUvW7f80XAS1OSE4LxYZFQalytaGCWA56cb9dNRI6LO3UimV
 1qTlWxJt+gpjVL92Mx4Z/+jrGLdPSUTXOg/8OtZ+Ua9hTj0buh+G3TgX/hJzNWiohbwp
 NcPChZnErD5535QLXvleq07/qWXsZGkgH84T8M1NBos+uDxIXqfyrXRGxLPhLb1C3yXc
 d0nuLrzK/sDBbncrHqrOnvK896a14nEbZ9sPqcjlJ4oM8ZRY9s2pm/IO0PLFlpNVOGjr
 FJsG9/dt0klEo4TPiYO0KJ9hWw8r+/WwgURlNI3LsQbJW6EgGm+rVpMfqE0G4aFsgwzo
 2Xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782443255; x=1783048055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4o/+uzc41vKgJ19Dqul3fyR5EOnKFEN3eoQx2mbEsg=;
 b=GyJHFuK5HGztZg/8blUPQ/2ISH+DFYM/XrVHUTncWABz/TtQPEMhFnZx8fwGu66PPc
 KGYY7IV646GuXTL4/dbN7NpNLpo40Qo3iab5ZehK9RlUdgX8s/aT8+CaAp41/xg/qnmJ
 dq5jVn2AOVFf4aoBm8UYkJYqf9V4Mx9Da89XTTh9QC8VgBVYuX7u2xsyrjHMMEdBDYqH
 5xV4FvRiKxto0cM9/pWYbhY7sdox4vEEZqFMiX2tylwgD+N11/aFxrWuGJ7q4xhyfZN0
 4gr4876mxGjpOSIyjHfXvaX+F8S4rXowrgDAdyzjIEiI4rZUCfdFj0phs6+q17Ua40mZ
 /rCg==
X-Gm-Message-State: AOJu0Yy6lriC0N/wCj//fOVQWay/HaIDazWHA0TefUZKvSCzX0V8XQrS
 fogwO5XHySknK6ckZqAfRVzIfO0aK9h6+pTlTWk3KELqSCsC043H0Ep8WWCQaw==
X-Gm-Gg: AfdE7ckQ3Vzh3S5BRRU5NdNto3lLV9K0+x9Vs1JQo5gRe9lTYaUoXmweOSrnFiYCFB+
 +nBlISA2wAogaLq2rUBCXWVNt6QK8h/i2iXcPyJR+1G6ruAYqOo53Q/E0A6HgCZ9/9Rwh0zW0ml
 yD4vWegnk5Z5cP+t+iC/4kFcsx59+IWe5eKYCbKUdA0uLqAKE2zF968SViKy6pgYQfvmPKq2KeH
 d8EIUfyoY5bOqokjdAK1vFvHAOvvpshSSPm/epG6RWlErYLZRLbewtM8su2VEvccd0UIhUlNsMk
 ozOJWaFe9cAauZqZCuj9ZYbAXm4DVx11ade7P/GowtsPv1WNNxrvLsLuvR6nfnI95VGkyP9KJvw
 U6DSan1YB2PmneR7+lXXDykJXtK0FPZKUBAWgYr7aN1EnxpqIlyaNIYxYxszmw+/Orb/LC2UcMb
 L/fIcfMiovbDChBtuTGjXzeTk=
X-Received: by 2002:a17:902:f693:b0:2bf:114b:924 with SMTP id
 d9443c01a7336-2c7fccdef3amr53480065ad.34.1782443255137; 
 Thu, 25 Jun 2026 20:07:35 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f65127a5sm30246155ad.83.2026.06.25.20.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 20:07:34 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 26 Jun 2026 11:07:28 +0800
Message-ID: <20260626030728.1364795-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The only callers of curseg_segno() and curseg_alloc_type()
 were removed by commit 5a4fed7cd97a ("f2fs: simplify do_checkpoint"); both
 helpers have been unused since then. Being static inline functions they do
 not trigger -Wunused-function, so the dead code has gone unnoticed. Remove
 them. No functional change. 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zhanxusheng1024(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zhanxusheng1024(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wcwuv-0000e3-Dj
Subject: [f2fs-dev] [PATCH] f2fs: Remove unused curseg_segno() and
 curseg_alloc_type()
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
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>, linux-kernel@vger.kernel.org,
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
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[zhanxusheng1024@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:zhanxusheng@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhanxusheng1024@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1492E6C9E6A

The only callers of curseg_segno() and curseg_alloc_type() were removed by
commit 5a4fed7cd97a ("f2fs: simplify do_checkpoint"); both helpers have
been unused since then.

Being static inline functions they do not trigger -Wunused-function, so
the dead code has gone unnoticed.  Remove them.  No functional change.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 fs/f2fs/segment.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index b0c06b3580b4..33a2257da1e6 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -796,20 +796,6 @@ F2FS_IPU_POLICY(F2FS_IPU_ASYNC);
 F2FS_IPU_POLICY(F2FS_IPU_NOCACHE);
 F2FS_IPU_POLICY(F2FS_IPU_HONOR_OPU_WRITE);
 
-static inline unsigned int curseg_segno(struct f2fs_sb_info *sbi,
-		int type)
-{
-	struct curseg_info *curseg = CURSEG_I(sbi, type);
-	return curseg->segno;
-}
-
-static inline unsigned char curseg_alloc_type(struct f2fs_sb_info *sbi,
-		int type)
-{
-	struct curseg_info *curseg = CURSEG_I(sbi, type);
-	return curseg->alloc_type;
-}
-
 static inline bool valid_main_segno(struct f2fs_sb_info *sbi,
 		unsigned int segno)
 {
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
