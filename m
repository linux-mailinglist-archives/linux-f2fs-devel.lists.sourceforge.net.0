Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id I6DLCvW7jmknEQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Feb 2026 06:51:49 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B774133140
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Feb 2026 06:51:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93is3lpS+aoWBxLfBXtiT//ag40+4F+Xq5UMhV3czz0=; b=jdtZEXsCYAEeYnecs0zUtJbkBj
	PVgSDys2cytBmdC6v5sBEqC2qEdmxIJ33nFUF2P7Ja9V6vHv/B+Jt8Q418uMjwmLq3KwQeW3LVTGg
	h3Q1YFkVWeGHnRUOZkPY5LfGYwZ2wVijv8rXIms4n7WukVM6DttdS35zuETCAV2GBIKU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vqm5d-0005ck-Fr;
	Fri, 13 Feb 2026 05:51:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1vqm5c-0005cc-RF
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Feb 2026 05:51:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=azX7HNGdMHPiAlnAiQeuCQh9Wq2SAgq9ch93GVn8UK8=; b=Q6zHZpaP8hEhoRHVaZ6vWeMeEA
 AethHnuRQEqIEEgKJOjpeU5LyenlQQ1X/QVYpV0kMUTKMtOVzM4+VWShUi/24Tx/BSDOv5Vgsrpg5
 dxLjjHp7B8dpqVFAb0nyhldezzErFRea9MQc7eA5ntXmAUcC47T2Z/iBBwWBC5+kp2p4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=azX7HNGdMHPiAlnAiQeuCQh9Wq2SAgq9ch93GVn8UK8=; b=ZjfWnI1NjicDMrrnyBgnAYCtHg
 h4g65JgGzE3SszSmqgqIT2DcKS8O75yeYXEDuETwHXTWOMNbgsXfVVVOUhPRS2P7ShN1LSHZoMHsd
 sPaTXQAn8R+nbnLuW3q5dic10rSUOBufq7iH8CumYi54CV1VKcjiYL3XBOwZChCTTbgw=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vqm5c-0007LU-Ir for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Feb 2026 05:51:41 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20260213055133epoutp025b2d4cb90d7f5cdb350ff9da661eb253~TuHWY7tnX3182431824epoutp02x
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Feb 2026 05:51:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20260213055133epoutp025b2d4cb90d7f5cdb350ff9da661eb253~TuHWY7tnX3182431824epoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1770961893;
 bh=azX7HNGdMHPiAlnAiQeuCQh9Wq2SAgq9ch93GVn8UK8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EN9aElZAQxIyB4n8Pa2DGWReaHupTLRwpMdNjzX2DHAxiQj9eD2Eb5PegbFcF7lPl
 eoddUb+xpO8B5rFKJBBsR6vKT8oTrssnbiRAxYRIMro7ktDiuMsRgX6J7WxzuqIAmW
 6CT5nfiEQKyShMv23YYmy5xVyHoDHIvfqTRGG3Mg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20260213055133epcas5p1a2d1507d8072b3f6d79ee3da36344158~TuHV1YxhF0793407934epcas5p1K;
 Fri, 13 Feb 2026 05:51:33 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4fC1WP1XTCz6B9mB; Fri, 13 Feb
 2026 05:51:29 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20260213055128epcas5p485b1d6ad7d811fa71e0e61e6c0a608eb~TuHRc2CNu2345423454epcas5p4R;
 Fri, 13 Feb 2026 05:51:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260213055124epsmtip2c23bb158484bad0746e1e08e0f3f6bb1~TuHNnkB8M2587625876epsmtip2p;
 Fri, 13 Feb 2026 05:51:23 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, hch@lst.de, brauner@kernel.org,
 jack@suse.cz, viro@zeniv.linux.org.uk, djwong@kernel.org, jlayton@kernel.org
Date: Fri, 13 Feb 2026 11:16:31 +0530
Message-Id: <20260213054634.79785-2-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260213054634.79785-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20260213055128epcas5p485b1d6ad7d811fa71e0e61e6c0a608eb
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260213055128epcas5p485b1d6ad7d811fa71e0e61e6c0a608eb
References: <20260213054634.79785-1-kundan.kumar@samsung.com>
 <CGME20260213055128epcas5p485b1d6ad7d811fa71e0e61e6c0a608eb@epcas5p4.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add helper APIs needed by filesystems to avoid poking into
 writeback internals. Reviewed-by: Jan Kara <jack@suse.cz> Reviewed-by: Jeff
 Layton <jlayton@kernel.org> Reviewed-by: Andreas Gruenbacher
 <agruenba@redhat.com>
 Suggested-by: Christoph Hellwig <hch@lst.de> Signed-off-by: Ku [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vqm5c-0007LU-Ir
Subject: [f2fs-dev] [PATCH v2 1/4] writeback: prep helpers for dirty-limit
 and writeback accounting
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:agruenba@redhat.com,m:trondmy@kernel.org,m:anna@kernel.org,m:hch@lst.de,m:brauner@kernel.org,m:jack@suse.cz,m:viro@zeniv.linux.org.uk,m:djwong@kernel.org,m:jlayton@kernel.org,m:linux-nfs@vger.kernel.org,m:gost.dev@samsung.com,m:anuj20.g@samsung.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:gfs2@lists.linux.dev,m:vishak.g@samsung.com,m:kundan.kumar@samsung.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:mid,samsung.com:email,suse.cz:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	FORGED_SENDER(0.00)[kundan.kumar@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Queue-Id: 3B774133140
X-Rspamd-Action: no action

Add helper APIs needed by filesystems to avoid poking into writeback
internals.

Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 include/linux/backing-dev.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index 0c8342747cab..5b7d12b40d5e 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -136,6 +136,19 @@ static inline bool mapping_can_writeback(struct address_space *mapping)
 	return inode_to_bdi(mapping->host)->capabilities & BDI_CAP_WRITEBACK;
 }
 
+/* Must not be used by file systems that support cgroup writeback */
+static inline int bdi_wb_dirty_exceeded(struct backing_dev_info *bdi)
+{
+	return bdi->wb.dirty_exceeded;
+}
+
+/* Must not be used by file systems that support cgroup writeback */
+static inline void bdi_wb_stat_mod(struct inode *inode, enum wb_stat_item item,
+				   s64 amount)
+{
+	wb_stat_mod(&inode_to_bdi(inode)->wb, item, amount);
+}
+
 #ifdef CONFIG_CGROUP_WRITEBACK
 
 struct bdi_writeback *wb_get_lookup(struct backing_dev_info *bdi,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
