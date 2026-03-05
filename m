Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O64AZ3dqGlmyAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 02:34:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35007209DFB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 02:34:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C0uKdzo2A9aken1kebJXAJeUqD10ySF/rvM7hxALI90=; b=GnMk+Ta/R3AilAL40gM63oAq3j
	oBWGm0bAyXhbDEWsifM6FVBlg8nVAgdRnw/kl6pH7HLSrUZBA5e7DpEK6vBDpgl4l3iFhawtewKPJ
	nPn64tnLAOKPDvK0w0IGq9dY/48tzmFUv14j9mnBy344K86vYSIdOpzNTr92BDZsWi5g=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxxbO-0003IY-EE;
	Thu, 05 Mar 2026 01:34:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1vxxbM-0003IP-Rd
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 01:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yx3t+MNPRIvkvv26bpZwDbvx/t65hHMOrOYf94vqZzU=; b=e0aTxifrHJWiKUVP4M2inTllMg
 WQGHNIAi9mKzbsizyknsR0y4ULct3NWRXEffuFeGV3+CO5Kfb0KV1EBJgeu/xoL0Bj/5BHD+niP5n
 VbpATtbFvipnpn9a2dJyJHiVDcsI/LMFxtWTJXnMEyb15/x4tcoWbphI1x+eQH1ZkMzU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Yx3t+MNPRIvkvv26bpZwDbvx/t65hHMOrOYf94vqZzU=; b=a
 cBoVsrpWqzhG7ePiVutxW/P6AfY5yrDKTpGHXKQJPr1It48NPKTamVUMP/Wvjg63igk4HQuD1YNNn
 tUiBEansITQMjfEhAF8h0+c2Ox3+f+r3Q4VN9ydb3SuKpiiwjOcLSbwGexSDuZrLNuCx1KldZcXqu
 ZgmnS81JbZya6/Io=;
Received: from outboundhk.mxmail.xiaomi.com ([207.226.244.123])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1vxxbM-0002Aw-73 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 01:34:08 +0000
X-CSE-ConnectionGUID: rbaoq5vCTxW5KqH8vHqZAw==
X-CSE-MsgGUID: 0W0iOdknS1ukYq2izvlGPA==
X-IronPort-AV: E=Sophos;i="6.21,325,1763395200"; d="scan'208";a="168647734"
To: <linux-f2fs-devel@lists.sourceforge.net>, <chao@kernel.org>,
 <jaegeuk@kernel.org>
Date: Thu, 5 Mar 2026 09:18:10 +0800
Message-ID: <20260305011810.4189655-1-huangjianan@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.237.8.165]
X-ClientProxiedBy: BJ-MBX01.mioffice.cn (10.237.8.121) To YZ-MBX05.mioffice.cn
 (10.237.88.125)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We found the following issue during fuzz testing: page:
 refcount:3
 mapcount:0 mapping:00000000b6e89c65 index:0x18b2dc pfn:0x161ba9
 memcg:f8ffff800e269c00 aops:f2fs_meta_aops ino:2 flags:
 0x52880000000080a9(locked|waiters|uptodate|lru|private|zone=1|k
 [...] Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [207.226.244.123 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vxxbM-0002Aw-73
Subject: [f2fs-dev] [PATCH v2] f2fs: avoid reading already updated pages
 during GC
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
From: Jianan Huang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jianan Huang <huangjianan@xiaomi.com>
Cc: Sheng Yong <shengyong1@xiaomi.com>, linux-kernel@vger.kernel.org,
 wanghui33@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 35007209DFB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,xiaomi.com:replyto,xiaomi.com:email,xiaomi.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[huangjianan@xiaomi.com]
X-Rspamd-Action: no action

We found the following issue during fuzz testing:

page: refcount:3 mapcount:0 mapping:00000000b6e89c65 index:0x18b2dc pfn:0x161ba9
memcg:f8ffff800e269c00
aops:f2fs_meta_aops ino:2
flags: 0x52880000000080a9(locked|waiters|uptodate|lru|private|zone=1|kasantag=0x4a)
raw: 52880000000080a9 fffffffec6e17588 fffffffec0ccc088 a7ffff8067063618
raw: 000000000018b2dc 0000000000000009 00000003ffffffff f8ffff800e269c00
page dumped because: VM_BUG_ON_FOLIO(folio_test_uptodate(folio))
page_owner tracks the page as allocated
 post_alloc_hook+0x58c/0x5ec
 prep_new_page+0x34/0x284
 get_page_from_freelist+0x2dcc/0x2e8c
 __alloc_pages_noprof+0x280/0x76c
 __folio_alloc_noprof+0x18/0xac
 __filemap_get_folio+0x6bc/0xdc4
 pagecache_get_page+0x3c/0x104
 do_garbage_collect+0x5c78/0x77a4
 f2fs_gc+0xd74/0x25f0
 gc_thread_func+0xb28/0x2930
 kthread+0x464/0x5d8
 ret_from_fork+0x10/0x20
------------[ cut here ]------------
kernel BUG at mm/filemap.c:1563!
 folio_end_read+0x140/0x168
 f2fs_finish_read_bio+0x5c4/0xb80
 f2fs_read_end_io+0x64c/0x708
 bio_endio+0x85c/0x8c0
 blk_update_request+0x690/0x127c
 scsi_end_request+0x9c/0xb8c
 scsi_io_completion+0xf0/0x250
 scsi_finish_command+0x430/0x45c
 scsi_complete+0x178/0x6d4
 blk_mq_complete_request+0xcc/0x104
 scsi_done_internal+0x214/0x454
 scsi_done+0x24/0x34

which is similar to the problem reported by syzbot:
https://syzkaller.appspot.com/bug?extid=3686758660f980b402dc

This case is consistent with the description in commit 9bf1a3f
("f2fs: avoid GC causing encrypted file corrupted"):
Page 1 is moved from blkaddr A to blkaddr B by move_data_block, and after
being written it is marked as uptodate. Then, Page 1 is moved from blkaddr
B to blkaddr C, VM_BUG_ON_FOLIO was triggered in the endio initiated by
ra_data_block.

There is no need to read Page 1 again from blkaddr B, since it has already
been updated. Therefore, avoid initiating I/O in this case.

Fixes: 6aa58d8ad20a ("f2fs: readahead encrypted block during GC")
Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
Changes since v1:
- Place the uptodate check after the initialization of fio.encrypted_page.

 fs/f2fs/gc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f46b2673d31f..ec0680187c0d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1230,7 +1230,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 		.encrypted_page = NULL,
 		.in_list = 0,
 	};
-	int err;
+	int err = 0;
 
 	folio = f2fs_grab_cache_folio(mapping, index, true);
 	if (IS_ERR(folio))
@@ -1283,6 +1283,9 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 
 	fio.encrypted_page = &efolio->page;
 
+	if (folio_test_uptodate(efolio))
+		goto put_encrypted_page;
+
 	err = f2fs_submit_page_bio(&fio);
 	if (err)
 		goto put_encrypted_page;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
