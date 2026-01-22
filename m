Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO69GuD/cWmvZwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 11:45:52 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB27665747
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 11:45:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=lMYycWByds2ra9g6tqGZJIlUDK3a05cZelo0GNEoz8w=; b=KBR2JWnFUOl1a7euHnlEm/x6/X
	5TdN8sbxP6Doi0zN5UxGKHiFHB08R1LfSzzROIbtyqU6rwf7l2ivqQhhInM4b+h82dNaSzW2QKY/S
	60L/obgBYCIM9hT0ax8dMJz4JxguRwX6RgPgamzIDy7CjEbu5vSNM/dJ+cS+zZGoiJ/s=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1visC9-00036p-TG;
	Thu, 22 Jan 2026 10:45:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youngjin.gil@samsung.com>) id 1visC7-00036f-Ni
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 10:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g1ZzHHIazvqQ8EVOQ6O1Uz7npkVii8J0s0Sohl8LpwY=; b=Mu0Bb8QpCcrRSjbMqipR+dBZLy
 mDHtuKm4GHe2/BnK3OW+UP64MOGCdvuDnAsLLInoziIQ7QI7THNmkBqMAAFe14+6P7ThufYHXojrg
 KVny+PR3A+YrSspset6choRrylluxn/GYHVfTMq9CWcVdcfCVFjfSbhsG4NFEdpLEYhA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=g1ZzHHIazvqQ8EVOQ6O1Uz7npkVii8J0s0Sohl8LpwY=; b=Q
 4hVKxBttnsah7erjb4W16X9TbY6tDZ1Cb2l17askmKLkk3RJHRLIwvEkljAkXQX5EZqcgI3LoxsdJ
 yE8PMv1ZH2sefEsWzq3fTRLZiSLAe3KCqdgzeo6XgsgFLVM7M8Ytn4JkhpvaPIMfV4Phr0F/vlCCj
 HwjChoH1rCzq+QDc=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1visC6-0007hk-RM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 10:45:43 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20260122104530epoutp042ebf4257ae68fe7d8be20c7e4982f7b5~NB7uXbREG1422514225epoutp04p
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jan 2026 10:45:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20260122104530epoutp042ebf4257ae68fe7d8be20c7e4982f7b5~NB7uXbREG1422514225epoutp04p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1769078730;
 bh=g1ZzHHIazvqQ8EVOQ6O1Uz7npkVii8J0s0Sohl8LpwY=;
 h=From:To:Cc:Subject:Date:References:From;
 b=ZpDNioPPHZgFxxX8mpTn9xQZzdGo12q+6ItbUCysN2eqecE7M59J37n2R+uK/5+x4
 LvxmZ5Jbb9nt6ISeeNec2rAsrzRLnuELlezWcKOPPfzns0WNst7JDqAw1rc5Nfdkif
 yTJ2lZWvuzE7wAiE+1aJqG/v6/awV8QarW13/gHM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPS id
 20260122104530epcas1p1b9d1fe4258abad16ecf165759e16e312~NB7uHwQbd1545315453epcas1p1N;
 Thu, 22 Jan 2026 10:45:30 +0000 (GMT)
Received: from epcas1p4.samsung.com (unknown [182.195.38.192]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4dxd4p2yfzz3hhT4; Thu, 22 Jan
 2026 10:45:30 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20260122104529epcas1p4ea35d60de87ef7ed53c5a02b0ce921b2~NB7tUqcVX3212532125epcas1p4J;
 Thu, 22 Jan 2026 10:45:29 +0000 (GMT)
Received: from mypc.. (unknown [10.253.98.103]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20260122104529epsmtip239ee9e17bfd43b0cb9851badab11a583~NB7tSGW6C0460404604epsmtip2O;
 Thu, 22 Jan 2026 10:45:29 +0000 (GMT)
From: Yeongjin Gil <youngjin.gil@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, jyh429@gmail.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Thu, 22 Jan 2026 19:45:27 +0900
Message-ID: <20260122104527.416871-1-youngjin.gil@samsung.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMS-MailID: 20260122104529epcas1p4ea35d60de87ef7ed53c5a02b0ce921b2
X-Msg-Generator: CA
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122104529epcas1p4ea35d60de87ef7ed53c5a02b0ce921b2
References: <CGME20260122104529epcas1p4ea35d60de87ef7ed53c5a02b0ce921b2@epcas1p4.samsung.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When overwriting already allocated blocks, f2fs_iomap_begin()
 calls f2fs_overwrite_io() to check block mappings. However, f2fs_overwrite_io()
 iterates through all mapped blocks in the range, which can [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1visC6-0007hk-RM
Subject: [f2fs-dev] [PATCH v2] f2fs: optimize f2fs_overwrite_io() for
 f2fs_iomap_begin
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[youngjin.gil@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lists.sourceforge.net,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:jyh429@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:sj1557.seo@samsung.com,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[youngjin.gil@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,samsung.com:s=mail20170921];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:mid,samsung.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,samsung.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BB27665747
X-Rspamd-Action: no action

When overwriting already allocated blocks, f2fs_iomap_begin() calls
f2fs_overwrite_io() to check block mappings. However,
f2fs_overwrite_io() iterates through all mapped blocks in the range,
which can be inefficient for fragmented files with large I/O requests.

This patch optimizes f2fs_overwrite_io() by adding a 'check_first'
parameter and introducing __f2fs_overwrite_io() helper. When called from
f2fs_iomap_begin(), we only check the first mapping to determine if the
range is already allocated, which is sufficient for setting
map.m_may_create.

This optimization significantly reduces the number of f2fs_map_blocks()
calls in f2fs_overwrite_io() when called from f2fs_iomap_begin(),
especially for fragmented files with large I/O requests.

Fixes: 351bc761338d ("f2fs: optimize f2fs DIO overwrites")
Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
Signed-off-by: Yeongjin Gil <youngjin.gil@samsung.com>
---
 fs/f2fs/data.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2e133a723b99..11c262afad65 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1851,7 +1851,8 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	return err;
 }
 
-bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len)
+static bool __f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len,
+				bool check_first)
 {
 	struct f2fs_map_blocks map;
 	block_t last_lblk;
@@ -1873,10 +1874,17 @@ bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len)
 		if (err || map.m_len == 0)
 			return false;
 		map.m_lblk += map.m_len;
+		if (check_first)
+			break;
 	}
 	return true;
 }
 
+bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len)
+{
+	return __f2fs_overwrite_io(inode, pos, len, false);
+}
+
 static int f2fs_xattr_fiemap(struct inode *inode,
 				struct fiemap_extent_info *fieinfo)
 {
@@ -4443,7 +4451,7 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	 * f2fs_map_lock and f2fs_balance_fs are not necessary.
 	 */
 	if ((flags & IOMAP_WRITE) &&
-		!f2fs_overwrite_io(inode, offset, length))
+		!__f2fs_overwrite_io(inode, offset, length, true))
 		map.m_may_create = true;
 
 	err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DIO);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
