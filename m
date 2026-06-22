Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fz7PMlKgOGr9egcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 04:39:14 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 972056AC1D7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 04:39:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=gfSGETXd;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Ed0jG22Q;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="E 358uAd";
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b="KmMZDl/S";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=samsung.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=dcTbi6y8JCIVF+Nq0GZmUM9UwjdlF5UmmkcCuWTq1CE=; b=gfSGETXdHFZAr8X0+Ij69Qu5LJ
	Vl5oUe2qbl398pXG46G/LNLX9tJEfWN/1WcETwrM5jlpMzbVkoopSjH+dWCxMEU1KeK7BoUBl7S7l
	sN79HdSx9JFMB/g4IsW9PcNy/g3q4SKk0bMqq5NlJipTACIdIf+geFeJICHGiAPvUMNI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbUYz-0000ww-Jp;
	Mon, 22 Jun 2026 02:39:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s_min.jeong@samsung.com>) id 1wbUYx-0000wo-DX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 02:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xRBYtPt4GacALwQvCYdpFOdgqKfhmzTawnXTgPBaL6o=; b=Ed0jG22QkqVnUnjgIi1RWYN57U
 PAIf0PvdqsUgmQsKaMgOxnUtD/XsTp8jxdWPXxLq1Thb6xhDh1kcssb7QXl5osTfVfBkFaKwg434w
 T4Ta64hgsuyhS2T+Ez+jaZv2RkFUamwspiAkHO5yZH0ttBlJ/xCvExv6UJXAMVUrR0Mk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xRBYtPt4GacALwQvCYdpFOdgqKfhmzTawnXTgPBaL6o=; b=E
 358uAdNhLHlIDrQnXaZ21g6e0aD3WdNu6NrTQBvzyJffJKwSZfOzkDcBMpZy2cNa1pm9qVrSn5p+7
 Y75rC8CTiF/c/1oD/+72rV2Wwfj4Q6VmBLHRY6SQvVnGCihg/YBbhzM+7ZSBV5NB6ZJtOGuAz6tzL
 YZ2R/185kmvAa5Ms=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbUYw-0006Zl-BI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 02:39:04 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20260622023855epoutp021b2078f4167a9885197ef5a55deefb25~7Rs-Cv1On1673516735epoutp02m
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jun 2026 02:38:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20260622023855epoutp021b2078f4167a9885197ef5a55deefb25~7Rs-Cv1On1673516735epoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1782095935;
 bh=xRBYtPt4GacALwQvCYdpFOdgqKfhmzTawnXTgPBaL6o=;
 h=From:To:Cc:Subject:Date:References:From;
 b=KmMZDl/Sy31BNNi7st7VD7cVEk0Qj/xYaVnZUyQLHNS2QBnrrHnHmLsNsRMr7uNJj
 XLhbAOCRaZYoGOI5t2b0E7QymfxfCJlORdrcalvFJhFk3jXcqbSHJPbQ3zt7R9cmsi
 gNzVHRyUyGiiqF2DQsGPUIz9f8KPltRNEK6NvMsU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPS id
 20260622023854epcas1p295295fe069023eb259f5f2a5e751ac29~7Rs98li4K1320613206epcas1p2I;
 Mon, 22 Jun 2026 02:38:54 +0000 (GMT)
Received: from epcas1p1.samsung.com (unknown [182.195.38.115]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4gkC7f23Y5z2SSKX; Mon, 22 Jun
 2026 02:38:54 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20260622023853epcas1p3d15698d1e456cc549da18ac2674e1f5f~7Rs9Mt_O52963129631epcas1p3c;
 Mon, 22 Jun 2026 02:38:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.253.98.34]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260622023853epsmtip29a3630d09b4f18b07c2f040058adfd5e~7Rs9KF_W70692606926epsmtip2M;
 Mon, 22 Jun 2026 02:38:53 +0000 (GMT)
From: Sunmin Jeong <s_min.jeong@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Mon, 22 Jun 2026 11:38:05 +0900
Message-Id: <20260622023805.3620189-1-s_min.jeong@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMS-MailID: 20260622023853epcas1p3d15698d1e456cc549da18ac2674e1f5f
X-Msg-Generator: CA
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260622023853epcas1p3d15698d1e456cc549da18ac2674e1f5f
References: <CGME20260622023853epcas1p3d15698d1e456cc549da18ac2674e1f5f@epcas1p3.samsung.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently,
 the length of fallocate for pin file is section-aligned
 to keep allocated sections from being selected as victims of GC. However,
 for the case that the start offset of fallocate is not alig [...] 
 Content analysis details:   (-0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wbUYw-0006Zl-BI
Subject: [f2fs-dev] [PATCH] f2fs: fix to round down start offset of
 fallocate for pin file
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:sj1557.seo@samsung.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[s_min.jeong@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,samsung.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[s_min.jeong@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,samsung.com:s=mail20170921];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 972056AC1D7

Currently, the length of fallocate for pin file is section-aligned to
keep allocated sections from being selected as victims of GC. However,
for the case that the start offset of fallocate is not aligned in
section, the allocated sections can't be fully utilized. It's because a
new section is allocated by f2fs_allocate_pinning_section() after using
blks_per_sec blocks regardless of the start offset. As a result, several
unexpected dirty segments may be created, including blocks assigned to
the pinned file.

To address this issue, let's round down the start offset of fallocate
to the length of section.

The reproducing scenario is as below

chunk=$(((2<<20)+4096)) # 2MB + 4KB
touch test
f2fs_io pinfile set test
f2fs_io fallocate 0 0 $chunk test
f2fs_io fallocate 0 $chunk $chunk test
f2fs_io fallocate 0 $((chunk*2)) $chunk test
f2fs_io fiemap 0 $((chunk*3)) test

Fiemap: offset = 0 len = 12288
    logical addr.    physical addr.   length           flags
0   0000000000000000 000000068c600000 0000000000400000 00001088
1   0000000000400000 000000003d400000 0000000000001000 00001088
2   0000000000401000 00000003eb200000 0000000000200000 00001088
3   0000000000601000 00000005e4200000 0000000000001000 00001088
4   0000000000602000 0000000605400000 0000000000200000 00001089

Reviewed-by: Yunji Kang <yunji0.kang@samsung.com>
Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>
---
 fs/f2fs/file.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 2c4880f24b54..3954aea43bd9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1906,8 +1906,13 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 
 	if (f2fs_is_pinned_file(inode)) {
 		block_t sec_blks = CAP_BLKS_PER_SEC(sbi);
-		block_t sec_len = roundup(map.m_len, sec_blks);
+		block_t sec_len;
 
+		if (map.m_lblk % sec_blks) {
+			map.m_lblk = rounddown(map.m_lblk, sec_blks);
+			map.m_len = pg_end - map.m_lblk;
+		}
+		sec_len = roundup(map.m_len, sec_blks);
 		map.m_len = sec_blks;
 next_alloc:
 		f2fs_down_write(&sbi->pin_sem);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
