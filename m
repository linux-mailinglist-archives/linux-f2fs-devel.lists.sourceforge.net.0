Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJklKVK8gWm7JAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 10:13:54 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BE9D6A61
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 10:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCmOoLqyp4rhNryWL7eFlpeRftaCY9udKakAX8WT91E=; b=ATCRIy4b5XmnPHWMr5upnx8d4c
	SyAjYQGHuwBXVWQcT4f4Xn10V6iG3WlHspa1r8Yt2ElUnk7jRK5rSV04vtNx0K/5T/YAYQIKw5lBg
	upF7xurfUH6Ov6vy2OJziGdWG3TnDcwZhDSHjiESNJ4F78u4dgzO37llrxLLXq5j4dFk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vnCTa-0007W7-Je;
	Tue, 03 Feb 2026 09:13:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vnCTY-0007Vz-Oi
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 09:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yjZfH6bz5pShRJYAhug080bcmcoUe4xbRgRq6K1+Q7I=; b=eTlzOu8XrNs6clDJvkXmIlKxmZ
 1xU30NSEDkWj2eYEBnPBGPwteuxb7jH3xobDPNnPi5ZnG3A9zJ0eqPIkqykFC7XZ3GYHCSMmEt4+1
 GbAzr1RHKHO2ArJbD+uqyWDDLPZiLkqJBeBd4hDK+0S3OXdg+EUVnXL8mu2wqxxDuP/I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yjZfH6bz5pShRJYAhug080bcmcoUe4xbRgRq6K1+Q7I=; b=M1sskeVLelP3n9Yd3pZ5+EomcF
 16O2+XnZuImsJcX0iytGC4y2pkVagkXYZGCtFApOs9/ydxcK4RIvQXNAC/My5GgZF1SS2wNfwkMs2
 i54pZ2PzS3qsUCWs1VJ87LPBWByh+uFoNdl6WHfdRpGTSmHxxXINt8nw4a69DES1snzc=;
Received: from m16.mail.126.com ([117.135.210.9])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vnCTX-0004WD-T9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 09:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yj
 ZfH6bz5pShRJYAhug080bcmcoUe4xbRgRq6K1+Q7I=; b=NznS2U2IwUMstu58Mm
 zYS1ccIgXDxXR+/J9o3A+46gb8ErSwpReFrJFlmWnqSUCTQgAykhNx+A0vhxcwtX
 I1Sl4JI0wqSSSZ0jDvA9sMckpyEBrNDVG8cUbU+IM+tIqFNkWDILTlJeE7fxKmGq
 9J7C0NgRzu8e9H/37EpO/NUf0=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wD3l2kivIFpOegGAA--.25117S3; 
 Tue, 03 Feb 2026 17:13:10 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  3 Feb 2026 17:12:48 +0800
Message-Id: <20260203091256.854842-2-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203091256.854842-1-nzzhao@126.com>
References: <20260203091256.854842-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3l2kivIFpOegGAA--.25117S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF48AFWrXw48Xr43XF1rXrb_yoWkWFg_Xw
 18AF1kGw1fGryft3W5Cry5AFZagF1Fyr18ua17t39xCr1YqrZ3Ja1qqr9xXw1qg3WUJrs8
 Jrs7Xr4I9347ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRCg4SPUUUUU==
X-Originating-IP: [58.240.165.118]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBogbywmmBvCb9VgAA3N
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Move the definition of f2fs_folio_state to f2fs.h for
 upcoming
 changes to PAGE_PRIVATE functions. No logical change. Signed-off-by: Nanzhe
 Zhao --- fs/f2fs/data.c | 4 ---- fs/f2fs/f2fs.h | 5 +++++ 2 files changed,
 5 insertions(+), 4 deletions(-) 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [58.240.165.118 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [117.135.210.9 listed in wl.mailspike.net]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vnCTX-0004WD-T9
Subject: [f2fs-dev] [RFC PATCH v1 1/5] f2fs: Move f2fs_folio_state to f2fs.h
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
Cc: Nanzhe Zhao <nzzhao@126.com>, Barry Song <21cnbao@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[126.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:nzzhao@126.com,m:21cnbao@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[nzzhao@126.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[126.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[126.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nzzhao@126.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,126.com:s=s110527];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,126.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 80BE9D6A61
X-Rspamd-Action: no action

Move the definition of f2fs_folio_state to f2fs.h
for upcoming changes to PAGE_PRIVATE functions.
No logical change.

Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
---
 fs/f2fs/data.c | 4 ----
 fs/f2fs/f2fs.h | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f70efb040c73..3a40db6894fc 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -35,10 +35,6 @@ static struct kmem_cache *ffs_entry_slab;
 static mempool_t *bio_post_read_ctx_pool;
 static struct bio_set f2fs_bioset;
 
-struct f2fs_folio_state {
-	spinlock_t		state_lock;
-	unsigned int		read_pages_pending;
-};
 
 #define	F2FS_BIO_POOL_SIZE	NR_CURSEG_TYPE
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a6e7368fc40a..bdcd446f6b18 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2042,6 +2042,11 @@ struct f2fs_sb_info {
 #endif
 };
 
+struct f2fs_folio_state {
+	spinlock_t		state_lock;
+	unsigned int		read_pages_pending;
+};
+
 /* Definitions to access f2fs_sb_info */
 #define SEGS_TO_BLKS(sbi, segs)					\
 		((segs) << (sbi)->log_blocks_per_seg)
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
