Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sBtXNBG+MGqTWwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:08:01 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB7768B9DE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:08:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=ihNTZPAj;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=YWfUtlzS;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="Z ImhbVi";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=HPEZDnAK;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wWSh0AmbXRTTD+7VWBG58iuo0t8rEbwjSztF8IeG6Qo=; b=ihNTZPAjQAK0gRU/rgI2tYQd6M
	OO6bTXM5tyQTo4X8/EUZx7qmHak9k29ydSFWVvXlYRPdUEvwGkiTtFgGZWVGzKml0mRp7QI6NP4Lk
	kO0dlaBG5o1rsGyr4CwXNrOPU9FiCNjTZw8eC57Vc0jfPi4jHOyIbrIEJ4OdjgZzDL+s=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZK9a-0004aA-Ns;
	Tue, 16 Jun 2026 03:07:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wZK9Y-0004a3-Tg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AjRN7pGql3/0sl5ul3djqlQ5ytyJ1WICP/I+lVMXzt8=; b=YWfUtlzSUE/Qp2rc/33wRpuDtN
 pTU+wwaco5DwI+CHx8HW06Ufa9x3KRanEVZFSmgwpxKP2s1NGK0V81DZ6z0olvB8AERW7Ef3sthLR
 2+EsTSskGcnQ5HWF6eoK2Tx5WiSSqJ+nsc38SGtS/UBvfjIv3INfa/fN5ZtUyGkcs5JY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AjRN7pGql3/0sl5ul3djqlQ5ytyJ1WICP/I+lVMXzt8=; b=Z
 ImhbVij4t+9zZBcpvuPsUCRCvkUgzkBoaxBbCy89BenhhxltBW57VsxwYHymEcbDqJukghpojzjOT
 MG0zBiw2eNHqariwAK9CUPmKeDQCFGINPXR3kg3Q93t5h2+k8HGX8vpvqOwKfgO5CQ0LtSaJGfLun
 klinnPDje9NmRgng=;
Received: from mail-dy1-f172.google.com ([74.125.82.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZK9U-0002RM-Ug for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:07:53 +0000
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-304f590dd91so4660924eec.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 20:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781579259; x=1782184059; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AjRN7pGql3/0sl5ul3djqlQ5ytyJ1WICP/I+lVMXzt8=;
 b=HPEZDnAKMTz+0ddI3bKqE8Mnr99+PudpK3k4MXSYSibHKEWvT1uFVMfQ9w1I7lBzC9
 w0AchmXfZUl38ME2aADTKKKCHfULudgQM2eXPfhw8aglOd2TD8A8CJBiDp6EnSWI+cWX
 svgnnDR7RlYnyaTz0R1pRqwvOoaICS1qRIVHdxLaK2+gSFYB+pyYEslzDJn7zlECNifo
 aXJQQSiF5ZUsRhUPYdvxeuBZLjnC9RXbts6AOrAt4WIK8fz97ga4DmRaOJPTwZ9TeaYK
 pP58uqrRlr7eGS1h2e4nLcjqr9Wj/eAmzJlaq4vPIiux6TUd4HlugWFZab0YQFPkHXay
 i6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781579259; x=1782184059;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AjRN7pGql3/0sl5ul3djqlQ5ytyJ1WICP/I+lVMXzt8=;
 b=IDW2HXpc+Id00oxHXSoUeYJTfU/+2rDKUaPMND6T6wDryqN3LYb7DmSlLdo5DlTPms
 /aEAtLCXMEVXZviqapzmSfIhY4JeaaJvcEVjuGMZiPxKF/+OaNkmlmx/d6aIpuEvaxKi
 1UiCtB0j2ztDXgKimcyjnqz/iIdXPyxR6qjKJ1EU1Bc2sQ9dEn4nF7gPKDlF3uoXt6es
 WHpyGsdAkruhzdxFIkbiXjsSJ2GXzakU8TF1zNI29gGpoEhQjHjfsmdtrBcyiTLYR8yH
 bl1Zb6EVXA9BdkEcpvrZzmVb5h5zugkqT3f9ofq9KF3Q+jogjjNnO09FK3DTL/QxPrfn
 FHbQ==
X-Gm-Message-State: AOJu0YyHPIIiPLjyuz4ThBd9GQ0J1WfQnv3ElepUiJyqLB2QPSts28+H
 2MydmZcDRxpCXGpXV92aPJhchwIOwAnkDyyi3dgKNIiTJnG7Hn+obDy2eQ8xK5v4
X-Gm-Gg: Acq92OHNZFUuPdRgnLlqzCbo8tlAFqUz6Uda/K+O/XCt6BTWC2VlRZ0avN02vK3x/38
 Vu+uNL+RMtcKnKE36ZC35ktpdwePVPUV1mFlB/YVg80MX/oDb+LDGylyTM/mPOEwAO2EeiepNs8
 FzGaTV9SN24F5Pp7pRCipqA9aqFvZyZD2II9gJEo9QRvmIdoxCq/ChoQqG5CWTiS3wIPbYZ5WJX
 wrATKA1fowHnQvYAq3OSXGUU8uPQj2RaMlgco5TzAyGSAmDPhr1yKwEfHulqgqHTAldOpJHsd6X
 fzCpv8K2nYX4aykHrYsHmI6O2nG5ivMF82pTT25MwU/7JFRGJoNuZDxy8xWs84tKmQw4JHXkwN8
 5AEf/p5cb+mXqEJQEAJiJ4BOWdTpzo97WOZjTz87aFwb9ckonVQdMxmwvik+G+iHkzYlBKpTjAr
 35FCx399kWd6qBeEBUWw3JL0W0noT2z0pl33DvAkumYlkyOzN4YSPH1/pXNtcWr4hgczEWKA==
X-Received: by 2002:a05:7300:1827:b0:2da:2ec2:64fe with SMTP id
 5a478bee46e88-30ba5f6fbbfmr1111187eec.24.1781579258759; 
 Mon, 15 Jun 2026 20:07:38 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3081e5d0849sm19083116eec.7.2026.06.15.20.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 20:07:38 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 16 Jun 2026 11:06:55 +0800
Message-ID: <20260616030655.111933-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  F2FS iostat is optional and is disabled by default. Direct
 I/O still allocates and binds a bio_iostat_ctx, updates the submit timestamp, 
 and replaces bi_end_io for every DIO bio even when sbi->iostat_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
X-Headers-End: 1wZK9U-0002RM-Ug
Subject: [f2fs-dev] [PATCH v2] f2fs: skip direct I/O iostat context when
 disabled
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
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
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AB7768B9DE

F2FS iostat is optional and is disabled by default.  Direct I/O still
allocates and binds a bio_iostat_ctx, updates the submit timestamp, and
replaces bi_end_io for every DIO bio even when sbi->iostat_enable is
false.

The byte accounting calls do not need an extra guard because
f2fs_update_iostat() already checks sbi->iostat_enable.  Only skip the
DIO bio context setup when iostat is disabled.  If iostat is enabled
through sysfs before submission, the existing context allocation and
latency accounting path is still used.

QEMU benchmark on a 1GiB F2FS virtio-blk image, with iostat_enable=0,
4KiB O_DIRECT I/O over a 64MiB file, 50000 iterations per run:

                         baseline     patched
  direct_read median    65264.50 ns  55470.95 ns
  direct_read recheck   65553.75 ns  55470.95 ns
  direct_write median   68054.62 ns  56309.44 ns
  direct_write recheck  66873.51 ns  56309.44 ns

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes in v2:
- Drop the extra guards around f2fs_update_iostat(), since it already checks
  sbi->iostat_enable.
- Limit the change to skipping DIO bio iostat context setup.

 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6edf0105dbc8..d8d895c27026 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4799,6 +4799,9 @@ static void f2fs_dio_iostat_start(struct f2fs_sb_info *sbi, struct bio *bio)
 {
 	void *bi_private = bio->bi_private;
 
+	if (!sbi->iostat_enable)
+		return;
+
 	iostat_alloc_and_bind_ctx(sbi, bio, bi_private);
 	iostat_update_submit_ctx(bio, DATA);
 	bio->bi_end_io = f2fs_dio_end_bio;
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
