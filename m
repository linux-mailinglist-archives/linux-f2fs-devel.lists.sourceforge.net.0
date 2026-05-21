Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1CS3JhfnDmqPDAYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 13:05:59 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A44C95A3BCB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 13:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ZdFjE5vLvyDk7YtsBnNIp8RJzqV7v92ZJOutYESeRA=; b=Vw7EEmoDkvwuva77nYdL9tvl2m
	3zJWf56WCOTu3jrLMPru/5/kRcAYf5ssOh9mRsXt79ERufRRy2Ni1IWdzL0RvCF6MeRhZFDhQODSF
	MBzQ/aZ4khAh8smUiP92/dvQRN7x0ixvFvYtx0Opt1pCfXQ7+GLOqLDbRO1giWHtH80g=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQ1Do-00068O-Na;
	Thu, 21 May 2026 11:05:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wQ1Dn-00068G-6h
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 11:05:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OP1QEUlOQim7PDu0CGt9x/Vst5DkA2CeqgWEhYZxdEM=; b=bCXYKWuPEqKjAPVufxG+EtCAxI
 huxzwkSQBxq6JEbC7LuuyMARqUecoiK0aGAzv2nl9HnRFccyDhPAd4dcpFe8GEZ8pWhjTKIXke3bZ
 /R494goWIgCbL+FuP82xjUe0/DYU3z7genSsz0CbgU5ilSgwXszXb6lYKsNni4C/TvOc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OP1QEUlOQim7PDu0CGt9x/Vst5DkA2CeqgWEhYZxdEM=; b=V
 gc8uhMW5tBaf2IMAOyZQqxpNAZ3Xy8aS+CthS1kGv0SCN2c2EtJHrAnDaM52YncX9une2NOPU6v0D
 5APtSHEH9DqrbQGK7YyJ56ZLaFczrjN7b1nJBaPoTMYw6DQ5c+vTeE7oHsSJrtaIugR+J2fmqsYbz
 jecUxzuwiSHheHUw=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wQ1Di-0001Pw-Qp for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 11:05:44 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3697f25d26eso3048336a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2026 04:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779361532; x=1779966332; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OP1QEUlOQim7PDu0CGt9x/Vst5DkA2CeqgWEhYZxdEM=;
 b=q0ttgUquoKlInYAIMVFM94aqiqpF38z76NQ7iEEW53s2WKHBBJd1ayBESSBdadjjfZ
 KLEM6GczgdJr0OWcbV4JZQkHYkiKe5PjPx8mnCPez+JQsZtqFzp1J2GwCMX5NIXQvoUO
 ZvdQFavtu3zmDwpmiljn8HpFtIcHGUNzaoCd4vrfdTM/hXiwyefpQVGUT2wYfSsPiKuR
 VCM5gRsKFMIRxYUxc3JnhS8sCI00Hp8L1jIN48/tfAHOdv5QbmuYVs1D2dGQaptAChpN
 5dvn5sFh/Cng7TOzXJDoj1gaeGXd6o/Zv3CBEjgptBbij6hwXxciy1eqUjs/81iEjlTl
 R3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779361532; x=1779966332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OP1QEUlOQim7PDu0CGt9x/Vst5DkA2CeqgWEhYZxdEM=;
 b=XA/pwPRMqA2Buhko45YkkD083PIIYQFKXHKQMI5xgqhscm+LoSWbFDFxg/RTx0Ud45
 8Ko0fMPXfOGeYnIO7ejjSo4ghm24pBYdyHIAh4b0AHr8V+OWA+BAQ+EEe9H1nctIQpBQ
 Q9QnRPcu9tkw8zBMhdIFMhz7NICUCW9zfLCRgwJDweClu2DP35v+Tzum/kfSCysq41ER
 pfiwNED4K141H3urtFsfEICasMYTF0KWk7OaEambCmhV5DnfG8LIdWoBdp57WhYqc9Vv
 AWM2ijyih66dSrW0ePdXLFSwIrAKndHXMfHqLhW+FWchW8I0plb35B0d5abAj4S4xoV8
 7wmQ==
X-Gm-Message-State: AOJu0YwuNGtzzvTnXtPmggAPKpodRYv+lqsYh+1MB9GrIE253KWKJ1sS
 XwWKiGLXFOqkd1NLzsu+N/5Q7opUbJ1PSDFjwxKAhZe1bmTu7FRnIHa5juW+9MPz/s4=
X-Gm-Gg: Acq92OEba89fnM6pmmdCSqAcnwIQiNVssuiv08dK8hJG2A7e4vIR78kIz7zq5TdxL3K
 Q+nIqxcAdSefm/LQCCWhzVbOzblrylwrxYvghtMdsXUI5LpbbuhrCO3JUrCJTI0N0o1IUWBsvcL
 66mcEcC+XK/8lMiNwi+0zQU1OHoKIS+HAuSp6H8fo0RW/JBwsOAmCGVQSVrG46C+q/uqdoKZ9qC
 gTPGC/X3evF/mIqkzb7xioOBGudBw/KcSUSFQ6RAS/iImq8H4BeO3tIwPAy63mMN7qSpp/1Jq4L
 CwVPf1BIPuSbXIg7G712CnyUg5Iqxv9mVB5coxuP2bny7qSOmo4X4rYzzbS4DHvsIfYW8njRQ6o
 UdJNB472aaEdL08sm1h0KTEcgHQwR8W8mxZDyLoUX7szzEMkyNOS62yeuvOPfL56RQfrgKobrrT
 V2gGXnkpnLZ982tlL2c0i4kzXcGcZ7EaGPWBzrq4MyqlZWxBsQq9JqYwslxNTnY8Ha7r1cUQ==
X-Received: by 2002:a17:90b:2803:b0:369:73a:3266 with SMTP id
 98e67ed59e1d1-36a45183b74mr2557975a91.10.1779361532453; 
 Thu, 21 May 2026 04:05:32 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c851995590esm10181a12.29.2026.05.21.04.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 04:05:32 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 21 May 2026 19:05:26 +0800
Message-ID: <20260521110526.1967583-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  F2FS large folio support is read-only. It rejects writable
 opens and mmap writes when an inode mapping supports large folios, but setattr
 can still reach the inode without going through those checks. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wQ1Di-0001Pw-Qp
Subject: [f2fs-dev] [PATCH] f2fs: reject setattr writes on large folio files
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email]
X-Rspamd-Queue-Id: A44C95A3BCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

F2FS large folio support is read-only. It rejects writable opens and
mmap writes when an inode mapping supports large folios, but setattr can
still reach the inode without going through those checks.

For immutable large-folio files, clearing the immutable flag keeps the
cached inode and its large-folio mapping alive until the inode is
dropped. A path-based truncate(2) can then call f2fs_setattr() with
ATTR_SIZE and change the file size without opening the file for write.

The user.fadvise path adds another visible case: after the file is
reopened with large folios, chmod(WRITE) is documented to fail, but
f2fs_setattr() currently allows ATTR_MODE to add write bits back.

Reject size changes and mode changes that enable write permissions while
the mapping still supports large folios. Read-only mode changes and
unrelated metadata updates remain allowed.

Fixes: 05e65c14ea59 ("f2fs: support large folio for immutable non-compressed case")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 71385ca4163d..3880ff5e6740 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1097,6 +1097,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 				  ATTR_GID | ATTR_TIMES_SET))))
 		return -EPERM;
 
+	if (mapping_large_folio_support(inode->i_mapping) &&
+	    ((attr->ia_valid & ATTR_SIZE) ||
+	     ((attr->ia_valid & ATTR_MODE) && (attr->ia_mode & 0222))))
+		return -EOPNOTSUPP;
+
 	if ((attr->ia_valid & ATTR_SIZE)) {
 		if (!f2fs_is_compress_backend_ready(inode) ||
 				IS_DEVICE_ALIASING(inode))
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
