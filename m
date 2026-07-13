Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id To3TF15+VGp4mgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 07:57:50 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE6174762C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 07:57:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=G9PwUkk5;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=DsngSSdj;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="f xE1fHb";
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b=hGG0sqd+;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=samsung.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:References:Date:Message-ID:To:From:Mime-Version:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=OepbJCh7GobwfzRRLRqnDO0G0YI4yJUODkSlxmBgSNo=; b=G9PwUkk5AfKBqVqn+H74KbShfy
	sWeWcAdbV3WYygsgX7TdDbgNu0PE3LMhIWOqgVeX/w3ZGbTRHfTrHQXP335n3jkUUYFJQKYVPozlH
	rZOYbjASdrnh+ebbUbfYxpn92ug/YeVWJYhcHnW3jln0SiozDONLwvSsehZXjYPJ+2mM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wj9fW-0004X7-Gk;
	Mon, 13 Jul 2026 05:57:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1wj9fR-0004We-Pb
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 05:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=weRZOxR+KQTuAh8kZhURaaciCfLqo4AauSDjmWHo/iM=; b=DsngSSdjj1XUVghocyGO7m7+Xn
 d7a6jPdvZxaYIcH3J4T5K5dtgnDpp8S7WJAI8FXDCq9y2oYRYJOyMc6KzYbCd9dDephCSo5S04VOZ
 FkL1CMAghj8VnvIddQlp6RtK1JuDOsfEzyTdwVGeKn85IJMYVAiwoDl8+N/ZsjlXe9EI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=weRZOxR+KQTuAh8kZhURaaciCfLqo4AauSDjmWHo/iM=; b=f
 xE1fHbg+HYTgZ4mhnzNKxZWMXcwcGMnhr/x9E0e7wsY38gnv59VIBxzIXu4XRYA64e3P8EUnmxzSU
 yYjmKvwxmQInjxBXtrcq421wyMsLMGM/d+fzHw6Y3QJG7NwLruM7fDJ9l7BOV77azGy2QAcDATi+n
 qURpkq2Yp2Z5Ppxg=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wj9fQ-000143-V5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 05:57:26 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20260713055712epoutp0237ed9d3148b005f280b4522db65202a8~Bw9GnzJeF2677726777epoutp02K
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Jul 2026 05:57:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20260713055712epoutp0237ed9d3148b005f280b4522db65202a8~Bw9GnzJeF2677726777epoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1783922232;
 bh=weRZOxR+KQTuAh8kZhURaaciCfLqo4AauSDjmWHo/iM=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=hGG0sqd+wnETTyms84gJTf+Wp1Vmr1wIQ+pymRjLBDIa7lXhdl5KVutNPOH5dRgut
 CsJYjXAnZHeH7uPHy8+6HJAcUNQadZMQhr0/WkaKm3XFfGvkIu3wfymOkYYbCqv0WF
 u9TxyCTzsKy2WIDz5H5Vo73aaU+6rCNTxp40tmss=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
 20260713055712epcas2p4f229b0be13f9e4f6b777c650cced947f~Bw9GVyMSU1460414604epcas2p4E;
 Mon, 13 Jul 2026 05:57:12 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.205]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4gzBXm0mSbz6B9mL; Mon, 13 Jul
 2026 05:57:12 +0000 (GMT)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260713055711epcms2p712e7add62211e42e995c54a92fd4ff0c@epcms2p7>
Date: Mon, 13 Jul 2026 14:57:11 +0900
X-CMS-MailID: 20260713055711epcms2p712e7add62211e42e995c54a92fd4ff0c
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260713055711epcms2p712e7add62211e42e995c54a92fd4ff0c
References: <CGME20260713055711epcms2p712e7add62211e42e995c54a92fd4ff0c@epcms2p7>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On a multi-device setup, submit_flush_wait() walked the dirty
 devices in order and aborted the whole loop on the first device whose flush
 failed, leaving the remaining dirty devices un-flushed. Each d [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wj9fQ-000143-V5
Subject: [f2fs-dev] [PATCH] f2fs: issue multi-device flushes in parallel
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
Reply-To: yonggil.song@samsung.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Dongjin Kim <dongjin_.kim@samsung.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	MV_CASE(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,samsung.com:s=mail20170921];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:dongjin_.kim@samsung.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[yonggil.song@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,samsung.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yonggil.song@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[yonggil.song@samsung.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CE6174762C

On a multi-device setup, submit_flush_wait() walked the dirty devices
in order and aborted the whole loop on the first device whose flush
failed, leaving the remaining dirty devices un-flushed. Each device
still needs its own data made durable, so a failure on one device must
not skip the others. It also waited for one device's flush to complete
before issuing the next, even though the devices have independent
flush queues and could be flushed concurrently.

Flush every dirty device best-effort and in parallel instead: build
one PREFLUSH bio per dirty device, submit them all, then wait for
every completion, returning the first error seen (0 if all succeed).
This bounds the flush window by the slowest device rather than the sum
of all of them. No caller depends on the previous early-abort
behaviour -- fsync only checks whether the return value is zero
(fs/f2fs/file.c). The checkpoint path (f2fs_flush_device_cache) is
unaffected; this only touches the fsync flush path.

Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 fs/f2fs/segment.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 78 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d71ddb3ee918..51d7f76e3d1d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -566,24 +566,96 @@ static int __submit_flush_wait(struct f2fs_sb_info *sbi,
 	return ret;
 }
 
-static int submit_flush_wait(struct f2fs_sb_info *sbi, nid_t ino)
+static void f2fs_flush_end_io(struct bio *bio)
+{
+	complete(bio->bi_private);
+}
+
+struct f2fs_flush_bio {
+	struct bio bio;
+	struct completion wait;
+};
+
+/*
+ * Flush every dirty device best-effort: a failure on one device must not
+ * skip the flush on the remaining dirty devices, since each device still
+ * needs its own data made durable. Report the first error.
+ */
+static int submit_flush_wait_serial(struct f2fs_sb_info *sbi, nid_t ino)
 {
 	int ret = 0;
 	int i;
 
-	if (!f2fs_is_multi_device(sbi))
-		return __submit_flush_wait(sbi, sbi->sb->s_bdev);
+	for (i = 0; i < sbi->s_ndevs; i++) {
+		int err;
+
+		if (!f2fs_is_dirty_device(sbi, ino, i, FLUSH_INO))
+			continue;
+		err = __submit_flush_wait(sbi, FDEV(i).bdev);
+		if (err && !ret)
+			ret = err;
+	}
+	return ret;
+}
+
+/*
+ * Same best-effort/first-error contract as submit_flush_wait_serial(), but
+ * issue every dirty device's flush before waiting for any of them, so the
+ * per-device flush latencies overlap instead of adding up in series. Fall
+ * back to the serial path if the bio array cannot be allocated.
+ */
+static int submit_flush_wait_parallel(struct f2fs_sb_info *sbi, nid_t ino)
+{
+	struct f2fs_flush_bio *flush_bio;
+	unsigned long devices = 0;
+	int ret = 0;
+	int i;
+
+	flush_bio = kcalloc(sbi->s_ndevs, sizeof(*flush_bio), GFP_NOFS);
+	if (!flush_bio)
+		return submit_flush_wait_serial(sbi, ino);
 
 	for (i = 0; i < sbi->s_ndevs; i++) {
 		if (!f2fs_is_dirty_device(sbi, ino, i, FLUSH_INO))
 			continue;
-		ret = __submit_flush_wait(sbi, FDEV(i).bdev);
-		if (ret)
-			break;
+
+		bio_init(&flush_bio[i].bio, FDEV(i).bdev, NULL, 0,
+			 REQ_OP_WRITE | REQ_PREFLUSH);
+		init_completion(&flush_bio[i].wait);
+		flush_bio[i].bio.bi_private = &flush_bio[i].wait;
+		flush_bio[i].bio.bi_end_io = f2fs_flush_end_io;
+		submit_bio(&flush_bio[i].bio);
+		devices |= BIT(i);
+	}
+
+	for (i = 0; i < sbi->s_ndevs; i++) {
+		int err;
+
+		if (!(devices & BIT(i)))
+			continue;
+
+		wait_for_completion(&flush_bio[i].wait);
+		err = blk_status_to_errno(flush_bio[i].bio.bi_status);
+		trace_f2fs_issue_flush(FDEV(i).bdev, test_opt(sbi, NOBARRIER),
+				       test_opt(sbi, FLUSH_MERGE), err);
+		if (!err)
+			f2fs_update_iostat(sbi, NULL, FS_FLUSH_IO, 0);
+		else if (!ret)
+			ret = err;
+		bio_uninit(&flush_bio[i].bio);
 	}
+	kfree(flush_bio);
 	return ret;
 }
 
+static int submit_flush_wait(struct f2fs_sb_info *sbi, nid_t ino)
+{
+	if (!f2fs_is_multi_device(sbi))
+		return __submit_flush_wait(sbi, sbi->sb->s_bdev);
+
+	return submit_flush_wait_parallel(sbi, ino);
+}
+
 static int issue_flush_thread(void *data)
 {
 	struct f2fs_sb_info *sbi = data;
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
