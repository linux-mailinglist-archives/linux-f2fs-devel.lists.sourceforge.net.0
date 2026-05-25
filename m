Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KChbCQfpE2p8HQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 May 2026 08:15:35 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBBD5C6434
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 May 2026 08:15:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ACE/GACtwtHmg3GvmcXqs4eEzhB2bi0vFjR9OBR4I6o=; b=goyha6B8wnpBbIuDJ2wFooJkn2
	0IjfPmGUf4ZrEGeULGeGTxc/h0ZGTMSE+Y+1PB18qfxtyzcavDABZ4gCsyVHmowErCaZkpFn6bYml
	6ChXCb+RQ8iIxwwiiQcO2Ngj4eXm34akq/vVW9GyOb1P7feEm8PTZZ8JVsvPmqK/L4tE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wROay-00029O-I6;
	Mon, 25 May 2026 06:15:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wROao-00029A-J7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 May 2026 06:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e524VIBtCoTvqSRyApwFpsXYxkWr/qEm71Ha8pUe2kQ=; b=WjsPjyvHiY2YAUmzAyfhY/k9Cy
 tmupO22WP3FlzZHauE8HHfhQ9BFwbbEsmpJTUbGDG71xf0jvhyRlAutK+sYyL/fPJHuukTLYDjQlW
 a4y/cMGW55ZrKca7/0VPf7lGW6aweb4H9gIcr17U+5ucwVV3Ba7dwUDJX7UXCHMp4V08=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=e524VIBtCoTvqSRyApwFpsXYxkWr/qEm71Ha8pUe2kQ=; b=Z
 Dg11XtIy7b6dXpZDHDFtWi1RG8CZXnhiEy6NLjlWbO+yEIgmdZ7C3gNHeO5uDsg2qC+tO+Yicoq6Z
 TUZ8+yTuuxnbYxuwPtaWhClnDSQK8nnLmcv7/urDgaO5QhUrRLsZgcRywOgHhDufX2Rqir7qo6ktB
 XNxwvwaDSsM8hpy0=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wROam-0003zv-Sh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 May 2026 06:15:14 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3664df30f53so5505673a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 May 2026 23:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779689703; x=1780294503; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e524VIBtCoTvqSRyApwFpsXYxkWr/qEm71Ha8pUe2kQ=;
 b=W87+INaSKmehVIs8HlTKE3ui43grbii5SKEShdMp/GcXvkxsrapyR479womTRrhVAN
 Ae7Y7P+uYss1R6SNXQvqMNFKTuS6P/7lM9bgPSst22v2xD8jIHDps02at/0dQXcrfa3N
 AaALQWsNv3vBZPosuIJ6jnlwYsYPWA66mVnkoeE1hASYaXxJCdjZASslL4u57JldPcvQ
 I/lcFijKIM6ZS3l6pA4Dm9CHqGab935oRwem3hn3xCnSwT0TUp5ZK9H3cBtNDzgEwo4e
 VxMAi8DCPdhYYd+VwJqOmB3JLkt0q/nm0UxWJO4VHYFLMPis5tWlBoCzWLSOTd99+rnQ
 DmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779689703; x=1780294503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e524VIBtCoTvqSRyApwFpsXYxkWr/qEm71Ha8pUe2kQ=;
 b=mL08QMhZ493x588fb9MRPi//81FeZb5teAkJyr5VbitzFNXATqktW6MmMWt4zMQ/qY
 NrkxbBM4bf3eLaR3kH7HkYARXP682qAUd2yEnYNs7iL3NwBURvPuPVSsuuXYoOh2lK0+
 LH3E5nEYa7XaDtKewwrKcC1U7xiIML9dqskia3f0XRCO57Wsw9PEXxN0c+CD11CVZk7E
 8jZFVlFJjPPF+WccGlKoHkXceniEWMDsqiCN6EnNqztCP6Jq3C/epywK0XOUiZDZFimi
 ve3hEl2lDgwxhR2ZRj8vauJhbxqmfuk8cS96S/Tn9Ojr7zTSjHClwkCx2AR+Idmn+CTh
 Aw1w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+zzH/54FC0u/YDEIhiVR2rxs6bMeY7fobuzsu8otwU1UdGqqbjm9e5eFMcNtaVIS+qr/wpZiNgqSitvgPdXKI8@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwBOhgH24rVgt0xfoNlCfYr/ZBV0otCoyaEbHe2iPCuOVMWpEBR
 DSwhrp0a3Ap2jd7JSvm0xxj6HlIdv3vMvtWukx4vH68JFvIZkPDb9wAz
X-Gm-Gg: Acq92OEXjRVQkWIY9A3nYNo7FzJhyqeiQfqSvpJsQhlUSz1DxrYIFUlaH6GKySOi1LJ
 pn9ggI2sGFXe45LRpSWWciOkgag8mZk60ium4i8hmn1zCvVGVU/g2oQgcJQP4Ymnit7HcHvWYul
 G4J1G1ri320O8aAr/PnOyo4ydxINRkNd7JmaLPgK9hBt5/4CZj8FyvAZiaybENKyCXGK3vYSt4I
 jT88Tgi5ArPU0uMZkcdhBr/5XT0bo7Qp3TBvo9b/kZh74lug5kiA0ayeCu+KgbLjrJzr+Z0/MWX
 gFaX3x3a0lunG20IjoqqtsVHChoxkYderraZKUIDOw9nlXf61+GEAxFFskXrd863e3FiQ2PNyrz
 5yGwb5VmKvTCIke6Qu7v8YSnaSRauoa06FvlmXiKs4y1+MM+rGD9LHQef353GeJT4lo+8WHEP9C
 ZC6wn1SiOU8DrqIjo/gsXh+hUbgX3UYxUt15ubp+JPWvvKsaG1xjmcaeFmVRe34uTXT6Ax5g==
X-Received: by 2002:a17:902:f546:b0:2ae:ce35:2686 with SMTP id
 d9443c01a7336-2beb033f57emr145382605ad.5.1779689702651; 
 Sun, 24 May 2026 23:15:02 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb58b3058sm85611535ad.39.2026.05.24.23.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 23:15:02 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 25 May 2026 14:14:56 +0800
Message-ID: <20260525061456.231710-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Compressed data writes are accounted as F2FS_WB_CP_DATA
 because
 they write compressed pages through fio->compressed_page. Their end_io path
 should therefore have the same checkpoint-stop behavior as o [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.46 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wROam-0003zv-Sh
Subject: [f2fs-dev] [PATCH] f2fs: stop checkpoint on compressed write IO
 error
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
Cc: qwjhust@gmail.com, yuchao0@huawei.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, qiwenjie@xiaomi.com, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:yuchao0@huawei.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,huawei.com,vger.kernel.org,lists.sourceforge.net,xiaomi.com,kernel.org];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 6BBBD5C6434
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Compressed data writes are accounted as F2FS_WB_CP_DATA because they
write compressed pages through fio->compressed_page.  Their end_io path
should therefore have the same checkpoint-stop behavior as ordinary
F2FS_WB_CP_DATA writes.

However, f2fs_compress_write_end_io() only records -EIO in the inode
mapping when the bio fails.  The filesystem can keep checkpointing after
that failure, so a later checkpoint may persist metadata that points to
compressed data blocks whose writeback failed.

Stop checkpointing with STOP_CP_REASON_WRITE_FAIL for failed compressed
F2FS_WB_CP_DATA writes, matching the ordinary data write end_io path.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Cc: stable@kernel.org
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/compress.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index caf522d667d6..9b1501004456 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1488,8 +1488,11 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
 				f2fs_is_compressed_page(folio));
 	int i;
 
-	if (unlikely(bio->bi_status != BLK_STS_OK))
+	if (unlikely(bio->bi_status != BLK_STS_OK)) {
 		mapping_set_error(cic->inode->i_mapping, -EIO);
+		if (type == F2FS_WB_CP_DATA)
+			f2fs_stop_checkpoint(sbi, true, STOP_CP_REASON_WRITE_FAIL);
+	}
 
 	f2fs_compress_free_page(page);
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
