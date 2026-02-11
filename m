Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QlqDGVgqjGmqigAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Feb 2026 08:06:00 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B12121C50
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Feb 2026 08:05:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4W9YgyCMGZwYGaFqI6fmDwF6kURAsCdRnlvIGhlnfOo=; b=Lhwc9LKf5giBLR8I1r518T3Lkz
	7d9LkHd+SKMA4E8/zmDEEESL87TX9eS3O867nGjglWx1HltCmQ2GMnTOuvTL+ypRco1iIOfwAGmNj
	R3DjWLVN8/q06GbNFC0TiHI9It2cggNFCzMlktTyqezW7x8wmg3p7kU982EFaPoXRGIs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vq4IP-0001fa-27;
	Wed, 11 Feb 2026 07:05:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1vq4IN-0001fT-TG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Feb 2026 07:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zszdhhsrv+up7ZflU5pHLQgNi3Fdy52nk5y4MQowDYA=; b=PWWxx19epA3G2EUY61e46qnQOU
 ysUz7126VDLTEwLd0HVJTg830c5A8+1i8bknuGVOBGTKiROVdqRq81oYAeunFhUqD0Cq/7gVG/SXD
 Obb34RrSucVOp8o8qB2rS1k0DKd61v9iK27Klblzpa/OalS2dqCuGhQm03N4JrF6eAOA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zszdhhsrv+up7ZflU5pHLQgNi3Fdy52nk5y4MQowDYA=; b=Am2eJKDV3yMVLaLdiLTc69D6Qe
 87YIKN88aXkG4GRZK8exZkCXgMMRSTsTJdS8dY1wCFapIGavnBuohM1w9JleM84WEoqLLd1a7jf+n
 jzV6UAVkuCKgjdv7/voccL1TB1YwqdfwNCq8N4rUAXxzP4zI3u38vtMYwcVAvrcI5UgM=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vq4IM-0003S6-V7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Feb 2026 07:05:55 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20260211070548epoutp04939771ceffaa00abd26456e0c7b1555a~TH1mUQOK60340803408epoutp04o
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Feb 2026 07:05:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20260211070548epoutp04939771ceffaa00abd26456e0c7b1555a~TH1mUQOK60340803408epoutp04o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1770793548;
 bh=zszdhhsrv+up7ZflU5pHLQgNi3Fdy52nk5y4MQowDYA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WWUr6nZcjgHEPbuOWxqLj6c5sQ+lkAaT3ncuY1G/MbqO/p3AMo70C+4eq5S56ReMj
 ECOVKuaONKdh16KXE//3K0JTSjleo8r614eFQ/c/+euucns5DCg9j7GcyQeNjr3JDe
 +/+ROg7B5TVn4MzxYmzW2L2YyVxzE3bs/H+GnQhg=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20260211070547epcas5p1025d920a110b5eea592d51eb0e1aec0c~TH1l5Q-u02670926709epcas5p1c;
 Wed, 11 Feb 2026 07:05:47 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4f9qG26XHvz3hhTC; Wed, 11 Feb
 2026 07:05:46 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20260211070546epcas5p486d5ecfe6754e6237fe3a428705db456~TH1kyHT_a2610826108epcas5p4S;
 Wed, 11 Feb 2026 07:05:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260211070543epsmtip238fdf67c48a700330e71852ca4040edb~TH1iDhZo40199301993epsmtip2i;
 Wed, 11 Feb 2026 07:05:43 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, hch@lst.de, brauner@kernel.org,
 jack@suse.cz, viro@zeniv.linux.org.uk, djwong@kernel.org,
 pankaj.raghav@linux.dev
Date: Wed, 11 Feb 2026 12:30:57 +0530
Message-Id: <20260211070057.22001-5-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260211070057.22001-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20260211070546epcas5p486d5ecfe6754e6237fe3a428705db456
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260211070546epcas5p486d5ecfe6754e6237fe3a428705db456
References: <20260211070057.22001-1-kundan.kumar@samsung.com>
 <CGME20260211070546epcas5p486d5ecfe6754e6237fe3a428705db456@epcas5p4.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert NFS WB_WRITEBACK accounting to bdi-scoped writeback
 helper, eliminating direct access to writeback. Suggested-by: Christoph Hellwig
 <hch@lst.de> Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
 Signed-off-by:
 Anuj Gupta <anuj20.g@samsung.com> --- fs/nfs/internal.h | 2 +- fs/nfs/write.c
 | 4 ++- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vq4IM-0003S6-V7
Subject: [f2fs-dev] [PATCH 4/4] nfs: stop using writeback internals for
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
 gfs2@lists.linux.dev, mcgrof@kernel.org, vishak.g@samsung.com,
 Kundan Kumar <kundan.kumar@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:agruenba@redhat.com,m:trondmy@kernel.org,m:anna@kernel.org,m:hch@lst.de,m:brauner@kernel.org,m:jack@suse.cz,m:viro@zeniv.linux.org.uk,m:djwong@kernel.org,m:pankaj.raghav@linux.dev,m:linux-nfs@vger.kernel.org,m:gost.dev@samsung.com,m:anuj20.g@samsung.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:gfs2@lists.linux.dev,m:mcgrof@kernel.org,m:vishak.g@samsung.com,m:kundan.kumar@samsung.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:mid,samsung.com:email,lst.de:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	FORGED_SENDER(0.00)[kundan.kumar@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[20];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 90B12121C50
X-Rspamd-Action: no action

Convert NFS WB_WRITEBACK accounting to bdi-scoped writeback helper,
eliminating direct access to writeback.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/nfs/internal.h | 2 +-
 fs/nfs/write.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index 2e596244799f..a738c357b153 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -866,7 +866,7 @@ static inline void nfs_folio_mark_unstable(struct folio *folio,
 		 * writeback is happening on the server now.
 		 */
 		node_stat_mod_folio(folio, NR_WRITEBACK, nr);
-		wb_stat_mod(&inode_to_bdi(inode)->wb, WB_WRITEBACK, nr);
+		bdi_wb_stat_mod(inode_to_bdi(inode), WB_WRITEBACK, nr);
 		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
 	}
 }
diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index bf412455e8ed..c56b15b5380f 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -872,8 +872,8 @@ static void nfs_folio_clear_commit(struct folio *folio)
 		long nr = folio_nr_pages(folio);
 
 		node_stat_mod_folio(folio, NR_WRITEBACK, -nr);
-		wb_stat_mod(&inode_to_bdi(folio->mapping->host)->wb,
-			    WB_WRITEBACK, -nr);
+		bdi_wb_stat_mod(inode_to_bdi(folio->mapping->host),
+				WB_WRITEBACK, -nr);
 	}
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
