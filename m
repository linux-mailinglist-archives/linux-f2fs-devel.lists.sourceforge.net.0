Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGu+DFxIoWkirwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 08:31:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C01391B3EB1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 08:31:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RATQd6Ui1ctxlUUgiqSsi7wuYn87XML0Csm03qlfV/E=; b=RqlAbcHWGjKvx34PzNrWNgZrVK
	oM8Lcc/8g+xraootkA6GfS1zTAiZJfZjNnJ9PRUdOg0ImB+sN7BP9FSQNHwkrg22yp5GAwUeeIc5m
	/Qz7CDRfj8jEr841h0PfvAwcm5U1JhaWE4fWBnINxQpjeLWh/aSon8mWQWGF/LC+Yyco=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvsJs-0005S9-9z;
	Fri, 27 Feb 2026 07:31:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vvsJr-0005S3-1R
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 07:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B/J+QYJAizjBcLPflcsBjthLgsIibdAM2nS1M+Xnuic=; b=MF0+hUQ1X1v9hUSfg3JyldEx+U
 GZvGE77GU5TEUO2BkJ8hn/TBo0p7qYnQt2evkjLVCje773FUVdHRgHLxq+ISCahZH25VqENVe7Jd+
 A3hQtiU7Hi1PXY73u+Q/woXu8Vg7UYaNPuaofblhlJp2fYDYlPa+zH8E9rs9gjB62Xi0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B/J+QYJAizjBcLPflcsBjthLgsIibdAM2nS1M+Xnuic=; b=Tsrqo4+Lhes0cYo6dbw/eeNku4
 NHZDDntFRg6k8vKLd5HgCBT0Jhw+J/U9gGwfmCNB9aVHkehyh/CEDfFwUKg2VE6LumVgqR29rigAM
 wFi7++zNmW9si8EM8JqnrRtrXHLI7TLDN5B498UBGY8SFt5LEMMMw6Z+GqIEQITFBbuE=;
Received: from r3-19.sinamail.sina.com.cn ([202.108.3.19])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvsJr-00046z-6r for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 07:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1772177487; bh=B/J+QYJAizjBcLPflcsBjthLgsIibdAM2nS1M+Xnuic=;
 h=From:Subject:Date:Message-ID;
 b=0SrKKJ0Xqml3GRfY7zDzu9uzPLaTdeoNJKFY62yuFWzYIy9seYNq3T7Vzs4nxLCYv
 TFmeqo+4BIIcTdP5lTrHod/7gbUIB13P4DcikgY7x1lVoTGisEBgCpi3blN0t1nUzB
 COTBPD9RpKeBp0wSWjwTmxHV4OgpO4eBVmi1Wuo8=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69A1483B00002A36; Fri, 27 Feb 2026 15:31:14 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 5624064456692
X-SMAIL-UIID: 121846B8A8E04036AD5D1845C7E18A02-20260227-153114-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 27 Feb 2026 15:30:54 +0800
Message-ID: <20260227073052.3940958-4-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227073052.3940958-2-monty_pavel@sina.com>
References: <20260227073052.3940958-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang The sbi parameter in
 f2fs_in_warm_node_list()
 is not used. Remove it to simplify the function. Signed-off-by: Yongpeng
 Yang --- fs/f2fs/data.c | 2 +- fs/f2fs/f2fs.h | 2 +- fs/f2fs/node.c | 4 ++--
 fs/f2fs/segment.c | 2 +- 4 files changed, 5 insertions(+), 5 deletions(-)
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.19 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vvsJr-00046z-6r
Subject: [f2fs-dev] [PATCH 2/2] f2fs: drop unused sbi parameter from
 f2fs_in_warm_node_list()
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: C01391B3EB1
X-Rspamd-Action: no action

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

The sbi parameter in f2fs_in_warm_node_list() is not used. Remove it to
simplify the function.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/data.c    | 2 +-
 fs/f2fs/f2fs.h    | 2 +-
 fs/f2fs/node.c    | 4 ++--
 fs/f2fs/segment.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2ffed6ac480c..7130fe35cc9d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -386,7 +386,7 @@ static void f2fs_write_end_io(struct bio *bio)
 				folio->index, NODE_TYPE_REGULAR, true);
 			f2fs_bug_on(sbi, folio->index != nid_of_node(folio));
 		}
-		if (f2fs_in_warm_node_list(sbi, folio))
+		if (f2fs_in_warm_node_list(folio))
 			f2fs_del_fsync_node_entry(sbi, folio);
 
 		dec_page_count(sbi, type);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bb34e864d0ef..3913d684128f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3921,7 +3921,7 @@ enum node_type;
 
 int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid);
 bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type);
-bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio);
+bool f2fs_in_warm_node_list(struct folio *folio);
 void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi);
 void f2fs_del_fsync_node_entry(struct f2fs_sb_info *sbi, struct folio *folio);
 void f2fs_reset_fsync_node_info(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 74992fd9c9b6..bbfa677ef46f 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -325,7 +325,7 @@ static unsigned int __gang_lookup_nat_set(struct f2fs_nm_info *nm_i,
 							start, nr);
 }
 
-bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio)
+bool f2fs_in_warm_node_list(struct folio *folio)
 {
 	return is_node_folio(folio) && IS_DNODE(folio) && is_cold_node(folio);
 }
@@ -1810,7 +1810,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 	}
 
 	/* should add to global list before clearing PAGECACHE status */
-	if (f2fs_in_warm_node_list(sbi, folio)) {
+	if (f2fs_in_warm_node_list(folio)) {
 		seq = f2fs_add_fsync_node_entry(sbi, folio);
 		if (seq_id)
 			*seq_id = seq;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6a97fe76712b..23faf6725632 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3980,7 +3980,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		if (fscrypt_inode_uses_fs_layer_crypto(folio->mapping->host))
 			fscrypt_finalize_bounce_page(&fio->encrypted_page);
 		folio_end_writeback(folio);
-		if (f2fs_in_warm_node_list(fio->sbi, folio))
+		if (f2fs_in_warm_node_list(folio))
 			f2fs_del_fsync_node_entry(fio->sbi, folio);
 		f2fs_bug_on(fio->sbi, !is_set_ckpt_flags(fio->sbi,
 							CP_ERROR_FLAG));
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
