Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8/YHNRzIOGoIiAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 07:29:00 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 079AE6ACC0A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 07:29:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="eug9t/Gu";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=bs4mUgjp;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="h 5IHN0U";
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b=BteTivXp;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=samsung.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=ZkrTEzjEE+5w1DDQjDVK3Lsss2hgbtnJ1xWqtvUP2Iw=; b=eug9t/Gu+xOtpb4hkvPQRZCU/X
	McK9XGvRpjZgdryZBB1eRgSdpJHmkdEpNS2EROndVTv9cJ/0BLVkrXsLAE50iKbZloTprVLKJJlZr
	2RR3DpnWWEElio+zK2eR4VU5VkLpE7DNeqP7rYqKZQ4LK2qZvK+H208gxzf4scIDg6sA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbXD8-0003yo-6N;
	Mon, 22 Jun 2026 05:28:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s_min.jeong@samsung.com>) id 1wbXD6-0003yg-J9
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 05:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Te4Pm+XdZHSOIHP0/XZ5WunWFBbsDXVqXfqI5GAPdzk=; b=bs4mUgjpWpKloDZnyzUuX1Ot74
 a6cTE2ENN0gRvIe7dfo81NOmu0g0aq/Exx0paj6ulvaYJ/QDzUiFE10TocY87nJwTH/mxVD2n+Xlt
 GuxEPPdXu6nbcxfFzIy0X8C0OfTjIayU7irpnazqJWyFWEOghxlrWo5wOMudN4x9KRrw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Te4Pm+XdZHSOIHP0/XZ5WunWFBbsDXVqXfqI5GAPdzk=; b=h
 5IHN0UcOfl1x8+MMZnwQUtqgSdo5nK5zX8w6ufKi3oZ6JU1v6AFG7U4Edlq/xUWZoB2nD2BWE+Qrz
 xgw1p2UvU/mJ8mh4RMJfmwXFBpL4QNn3DXslNBckya36cbc3AnYp/uAWgoSECCGC+fx9RY3T+DNkl
 TV5nKakQUbnD7j7c=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbXD4-0002Xa-S2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 05:28:41 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20260622052832epoutp01cb02b9387f84bb2ea03c36fd8ebbc671~7UBE2q1dT2415824158epoutp01H
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jun 2026 05:28:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20260622052832epoutp01cb02b9387f84bb2ea03c36fd8ebbc671~7UBE2q1dT2415824158epoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1782106112;
 bh=Te4Pm+XdZHSOIHP0/XZ5WunWFBbsDXVqXfqI5GAPdzk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=BteTivXpRjWgl0PWFq4o98iA7UkovFPQt6N7VMf4SDG1X3b4zekhl4T3yzinKY0Si
 7EKJ7H342vKf3pv7xbCbs0M9dJ7HivMRkRbkmMBRm15aPKf84YjlqWWMXzpjdlAqQd
 MqVZsYUwMVvloORhLn6DyeZ5RHUtoXS3Y6OwGWtY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPS id
 20260622052831epcas1p1cd54d25bc2de4a4dbc489ae8f2eea563~7UBEZedhR1191911919epcas1p1L;
 Mon, 22 Jun 2026 05:28:31 +0000 (GMT)
Received: from epcas1p2.samsung.com (unknown [182.195.38.190]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4gkGvM55mTz6B9mB; Mon, 22 Jun
 2026 05:28:31 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260622052831epcas1p205548491ce904c0cfda685ed05fe7cab~7UBDqqEuu2144121441epcas1p28;
 Mon, 22 Jun 2026 05:28:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.253.98.34]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20260622052831epsmtip1b49e4b635d11a43e7643a1f2b2cdff59~7UBDnjVAn1486814868epsmtip1H;
 Mon, 22 Jun 2026 05:28:31 +0000 (GMT)
From: Sunmin Jeong <s_min.jeong@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Mon, 22 Jun 2026 14:28:17 +0900
Message-Id: <20260622052817.3972188-1-s_min.jeong@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMS-MailID: 20260622052831epcas1p205548491ce904c0cfda685ed05fe7cab
X-Msg-Generator: CA
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260622052831epcas1p205548491ce904c0cfda685ed05fe7cab
References: <CGME20260622052831epcas1p205548491ce904c0cfda685ed05fe7cab@epcas1p2.samsung.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wbXD4-0002Xa-S2
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to round down start offset of
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:sj1557.seo@samsung.com,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[s_min.jeong@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,samsung.com:s=mail20170921];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,samsung.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,samsung.com:mid,samsung.com:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[s_min.jeong@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 079AE6ACC0A

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

Cc: stable@vger.kernel.org
Fixes: f5a53edcf01e ("f2fs: support aligned pinned file")
Reviewed-by: Yunji Kang <yunji0.kang@samsung.com>
Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>
---
v2:
 - Handle the case that pg_end is aligned to sec_blks but off_end is not
   zero
 fs/f2fs/file.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8acdd94272a0..4b52c56d71f0 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1916,8 +1916,15 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 
 	if (f2fs_is_pinned_file(inode)) {
 		block_t sec_blks = CAP_BLKS_PER_SEC(sbi);
-		block_t sec_len = roundup(map.m_len, sec_blks);
+		block_t sec_len;
 
+		if (map.m_lblk % sec_blks) {
+			map.m_lblk = rounddown(map.m_lblk, sec_blks);
+			map.m_len = pg_end - map.m_lblk;
+			if (off_end)
+				map.m_len++;
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
