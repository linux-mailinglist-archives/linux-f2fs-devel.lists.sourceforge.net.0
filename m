Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGAOMu+1u2lHmwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 09:38:07 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE342C7F93
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 09:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jI8e5iXyiZGCQh3e7pYx+aeXDtW0ngwrHew4quBa5MM=; b=BKVAK3qKi9heJNpvlLHeTbjAzL
	BlttFzWuX+78cXxpqkH4sSPX8W0xihbeTRmT+hnJiYKgeJtk3gNQepzqs4Q0vbRSHwr2yJwAc9BY7
	VkJfyAoGwbG9TSOnt4a/u+6cll9sJwrid//ZDDaHKZTFWTHZKXpQIQF/CHkpmkNRnR3Q=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w38tF-0005AI-Jj;
	Thu, 19 Mar 2026 08:38:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w38tD-0005A3-V6
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 08:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JwG6MhKduduFbMjJXKgLpkSSgn8bAwG/EPSdsHWRu3Y=; b=VY/UJVdxMyLVWcJ4nfnNouE8V7
 lgVwONQwsPGcAq+oTVyR/IFoUTGqw9k7znxGXUzk40TIs32VxwMZ+Kh9m1KcePsxGvM1jfAGzxjaL
 lLGB1lpkBF2+4gouYAIp5OrZgdRXsa3VknEpQo1YttMM4R7oR7sBMpC32fJnZp1MB+nw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JwG6MhKduduFbMjJXKgLpkSSgn8bAwG/EPSdsHWRu3Y=; b=a
 aOY9GRjQfPlYQrKrwkleKjVRDAoB9Sdn8sTYQ/szjze7ndb+GZsq7ULx6HXxxWmuLhNijUvgwq9JF
 V5blAmcidGKewUOGrCDEqs9hx7kmhYPnq02D2OhC6iO8ZENqwzNAqbLp3IOZwVpFl9fillwnZ1FWW
 KqsQTISACe7y5ZCQ=;
Received: from r3-18.sinamail.sina.com.cn ([202.108.3.18])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w38tC-0006VY-9O for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 08:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773909478; bh=JwG6MhKduduFbMjJXKgLpkSSgn8bAwG/EPSdsHWRu3Y=;
 h=From:Subject:Date:Message-ID;
 b=uAqehWN5bPrCuXx8Ue3eAkuJquU8HalNjeN2u0r6v8ivDnqqmrdeumbHPmxgawocV
 a6MgYQ/3QAYjeLz/u+5wQ1zM/BRvsoOGOcV8NgEH6IAU2BsKKbDLz1AeLoJST/M+Za
 MzOvZq2k0JAzffJEmLNNdb9zLyiWYDg6cYi7afeM=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69BBB5D700006EFF; Thu, 19 Mar 2026 16:37:45 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 8185774456816
X-SMAIL-UIID: 62863E60861949E3BFFB23B206D84E21-20260319-163745-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 19 Mar 2026 16:35:27 +0800
Message-ID: <20260319083525.603728-3-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang The ri parameter in
 truncate_partial_nodes()
 is unused. Remove it along with the related code. No logical changes.
 Signed-off-by:
 Yongpeng Yang --- fs/f2fs/node.c | 8 +++----- 1 file changed, 3 insertions(+), 
 5 deletions(-) 
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
 [monty_pavel(at)sina.com]
X-Headers-End: 1w38tC-0006VY-9O
Subject: [f2fs-dev] [PATCH] f2fs: drop unused ri parameter from
 truncate_partial_nodes()
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
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 2BE342C7F93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

The ri parameter in truncate_partial_nodes() is unused. Remove it along
with the related code. No logical changes.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/node.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 6bb810d0f4c3..497712f7bdaa 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1116,7 +1116,7 @@ static int truncate_nodes(struct dnode_of_data *dn, unsigned int nofs,
 }
 
 static int truncate_partial_nodes(struct dnode_of_data *dn,
-			struct f2fs_inode *ri, int *offset, int depth)
+			int *offset, int depth)
 {
 	struct folio *folios[2];
 	nid_t nid[3];
@@ -1187,7 +1187,6 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 	int err = 0, cont = 1;
 	int level, offset[4], noffset[4];
 	unsigned int nofs = 0;
-	struct f2fs_inode *ri;
 	struct dnode_of_data dn;
 	struct folio *folio;
 
@@ -1215,7 +1214,6 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 	set_new_dnode(&dn, inode, folio, NULL, 0);
 	folio_unlock(folio);
 
-	ri = F2FS_INODE(folio);
 	switch (level) {
 	case 0:
 	case 1:
@@ -1225,7 +1223,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 		nofs = noffset[1];
 		if (!offset[level - 1])
 			goto skip_partial;
-		err = truncate_partial_nodes(&dn, ri, offset, level);
+		err = truncate_partial_nodes(&dn, offset, level);
 		if (err < 0 && err != -ENOENT)
 			goto fail;
 		nofs += 1 + NIDS_PER_BLOCK;
@@ -1234,7 +1232,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 		nofs = 5 + 2 * NIDS_PER_BLOCK;
 		if (!offset[level - 1])
 			goto skip_partial;
-		err = truncate_partial_nodes(&dn, ri, offset, level);
+		err = truncate_partial_nodes(&dn, offset, level);
 		if (err < 0 && err != -ENOENT)
 			goto fail;
 		break;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
