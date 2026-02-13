Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DDbBQW8jmkWEQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Feb 2026 06:52:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83456133179
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Feb 2026 06:52:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVPeI9vxkXgUdEKBYsyxTbScA6O+fdr7evxJpe47aMs=; b=g4UWiVcH/uGgACtzQ8lbzmIf4i
	5Eg+bq4uMCGQR+JMkzDqgE03zpSX7uRXZbNUwqFAfU+1UwfGUYOttDjmJyLtHwKO43wZgeuOPMRt+
	OO/NXS6OOZOjaWK2XQoB0/X4TDDyCNd3h5HzekUkyE39XcJdYLKUJRqxWoQGXYR/758s=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vqm5z-0008IX-2M;
	Fri, 13 Feb 2026 05:52:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1vqm5x-0008IE-Ai
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Feb 2026 05:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WVUkVxdLZh7dLWtrxwE5uvhOTSw4xvRRD2G/b4/jnPQ=; b=MPDSI0bl7nqdy+9mKGFXOADcSs
 kcUpmfVEX817JlQaTGqU9Abxkmt24jh+wvWe6VQJrsiqKk0xvpeBN0euW3I/DKc9WvXYQLdWE9uMY
 QrW6gsP5lRerwbarDF1wvk45PXUOnaKJv217rapqUGD2NumcnUKEMKqVUUtwMVXVyFC4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WVUkVxdLZh7dLWtrxwE5uvhOTSw4xvRRD2G/b4/jnPQ=; b=Gq9FkppviqayQs2sNtNkEMWAHF
 0+SMDpkaAZW685YXzIVDqsqo4SzkQhuT2JnrQhWD0wa1/LS4ssr/kew59JZF8bkH9DNvDwWGBpKh+
 u8p2y0eJH+oziG6g061VbgkEuZ0yzMmEl+gST2Aotc2tE6F3bwQxFnNkFbwylqEYP0xA=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vqm5v-0007M5-OQ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Feb 2026 05:52:00 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20260213055145epoutp0274a21d6c56db8e4f93b345f6e609939b~TuHhrVcSj3228832288epoutp02d
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Feb 2026 05:51:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20260213055145epoutp0274a21d6c56db8e4f93b345f6e609939b~TuHhrVcSj3228832288epoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1770961905;
 bh=WVUkVxdLZh7dLWtrxwE5uvhOTSw4xvRRD2G/b4/jnPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sR5Bd++N6xGlqfBAAQiW4PWY+ytP+oZxAcdXOEaUOH6XAZb1QkXjhFn4p88p7fSQp
 IgW4+oU4mBdLfnk6XE2hKG56ZHj1qHTbApD7vuAr2A7jSdX/EN3ss1wPf4YyS9iNad
 ATftZG7KD0BUsolWwXrEw1qL9TWSqOL+eBeNyUQw=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20260213055145epcas5p4af1fac07bbabbaf11e521102bd53c538~TuHhJu_df2583525835epcas5p4U;
 Fri, 13 Feb 2026 05:51:45 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.88]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4fC1Wd1twtz6B9m5; Fri, 13 Feb
 2026 05:51:41 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20260213055140epcas5p31b62f7026bd30c79f804c8c0fc02e276~TuHcw1i4J2435024350epcas5p3_;
 Fri, 13 Feb 2026 05:51:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260213055136epsmtip2f67a407f2147b68c7ca6a288c6a4ead3~TuHZIiX9u2622126221epsmtip2G;
 Fri, 13 Feb 2026 05:51:36 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, hch@lst.de, brauner@kernel.org,
 jack@suse.cz, viro@zeniv.linux.org.uk, djwong@kernel.org, jlayton@kernel.org
Date: Fri, 13 Feb 2026 11:16:34 +0530
Message-Id: <20260213054634.79785-5-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260213054634.79785-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20260213055140epcas5p31b62f7026bd30c79f804c8c0fc02e276
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260213055140epcas5p31b62f7026bd30c79f804c8c0fc02e276
References: <20260213054634.79785-1-kundan.kumar@samsung.com>
 <CGME20260213055140epcas5p31b62f7026bd30c79f804c8c0fc02e276@epcas5p3.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert NFS WB_WRITEBACK accounting to writeback helper,
 eliminating
 direct access to writeback. Suggested-by: Christoph Hellwig <hch@lst.de>
 Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com> Signed-off-by: Anuj
 Gupta <anuj20.g@samsung.com> --- fs/nfs/internal.h | 2 +- fs/nfs/write.c
 | 3 +-- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vqm5v-0007M5-OQ
Subject: [f2fs-dev] [PATCH v2 4/4] nfs: stop using writeback internals for
 WB_WRITEBACK accounting
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
Cc: linux-nfs@vger.kernel.org, gost.dev@samsung.com, anuj20.g@samsung.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, vishak.g@samsung.com,
 Kundan Kumar <kundan.kumar@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:agruenba@redhat.com,m:trondmy@kernel.org,m:anna@kernel.org,m:hch@lst.de,m:brauner@kernel.org,m:jack@suse.cz,m:viro@zeniv.linux.org.uk,m:djwong@kernel.org,m:jlayton@kernel.org,m:linux-nfs@vger.kernel.org,m:gost.dev@samsung.com,m:anuj20.g@samsung.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:gfs2@lists.linux.dev,m:vishak.g@samsung.com,m:kundan.kumar@samsung.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,samsung.com:mid,samsung.com:email,lst.de:email];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[kundan.kumar@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,samsung.com:s=mail20170921];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,samsung.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kundan.kumar@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 83456133179
X-Rspamd-Action: no action

Convert NFS WB_WRITEBACK accounting to writeback helper, eliminating
direct access to writeback.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/nfs/internal.h | 2 +-
 fs/nfs/write.c    | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index 2e596244799f..96249d6d9132 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -866,7 +866,7 @@ static inline void nfs_folio_mark_unstable(struct folio *folio,
 		 * writeback is happening on the server now.
 		 */
 		node_stat_mod_folio(folio, NR_WRITEBACK, nr);
-		wb_stat_mod(&inode_to_bdi(inode)->wb, WB_WRITEBACK, nr);
+		bdi_wb_stat_mod(inode, WB_WRITEBACK, nr);
 		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
 	}
 }
diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index bf412455e8ed..9053e0c4a836 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -872,8 +872,7 @@ static void nfs_folio_clear_commit(struct folio *folio)
 		long nr = folio_nr_pages(folio);
 
 		node_stat_mod_folio(folio, NR_WRITEBACK, -nr);
-		wb_stat_mod(&inode_to_bdi(folio->mapping->host)->wb,
-			    WB_WRITEBACK, -nr);
+		bdi_wb_stat_mod(folio->mapping->host, WB_WRITEBACK, -nr);
 	}
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
