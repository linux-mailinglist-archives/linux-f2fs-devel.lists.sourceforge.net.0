Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJZNCloqjGmqigAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Feb 2026 08:06:02 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F06121C63
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Feb 2026 08:06:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ExnaBJMueRfU7F4IyjqGvu9N3UqgdZFyG7TKur9tKI=; b=lhMPAh6z5zz26BH84F5A3Jpbr1
	6PAIanJpiPIMNnVAVtqHfX73m6HVoTLrA6NNKyboY0/K9iZhcsasTHqb1OIHgpJuxfFsOxh0x6g7w
	djpoGAwfDG+AN2lbqyjh/0ck/ICT/n02wShsQwphlp7dR59RWFgotw08LpNTCElroiT4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vq4IS-0005Se-BZ;
	Wed, 11 Feb 2026 07:06:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1vq4IR-0005SW-8j
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Feb 2026 07:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h24FKhiaOy+Lutbyj9qFXxdAOruWVEGhaIk65WyfYFw=; b=OA+wlWvY0UpZUEXOem7049VwVa
 tmX5fGordRlXH07rmc4SKwcRvWBexESph5yXC3u6JGRvwF5B799Zyo/sWKhf3Yi/SFseSNQ6D/0IM
 FpF+IOfTdGkviwAMZU4X6ZQHzNznaHO7thZTNmhxHpo6ODYFgeLXvAgsd5i/QjgtC4R8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h24FKhiaOy+Lutbyj9qFXxdAOruWVEGhaIk65WyfYFw=; b=S4OnlKdSzacKpprmd7epjjk6aH
 sYWmi5Oi1NvKtpRHhlWmPDgOPhDRFCiVwfcYEsjcyvOMMp0z0vy1f322Jf+JaRthS+h2Ep4vEPUL4
 PVqq0yGRXl3JEfv/L+rf8eGyJlBgMMjNcTHmdpCRcKGWTMO0qQJ45E9DywUVTKC2KHfE=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vq4IQ-0003SQ-NA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Feb 2026 07:05:59 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20260211070547epoutp02c7036c9dc40357965caa0068a6737425~TH1le-otW0623106231epoutp02B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Feb 2026 07:05:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20260211070547epoutp02c7036c9dc40357965caa0068a6737425~TH1le-otW0623106231epoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1770793547;
 bh=h24FKhiaOy+Lutbyj9qFXxdAOruWVEGhaIk65WyfYFw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vG2Z/AmVmSMN84JJ+vsOkVuF7lFFsK0R5hYzz0oYPh1uoUuPMZ6QiNHtULXIteLpQ
 WjKfPmY0665Xo2HoaNAMPa52J6w/xjlgnUHv0T8JCDzg/ptzMhXxKZ4bRyZcD8gQlN
 6dKXWahYbbuid/Dc3pA82J+CQcGw4EidKrtpZq+k=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20260211070544epcas5p4534cc829b35964b66e7e9dec40deae2f~TH1i76OZH3071530715epcas5p4t;
 Wed, 11 Feb 2026 07:05:44 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4f9qFz4rwrz2SSKf; Wed, 11 Feb
 2026 07:05:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20260211070543epcas5p44f11ea9b90ce0eb480e2b5ce0941559a~TH1hzeg-k3071530715epcas5p4i;
 Wed, 11 Feb 2026 07:05:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260211070540epsmtip2df267b8ed7e5bbd98bb7dfe147df4c7a~TH1fKMRAL0204902049epsmtip2K;
 Wed, 11 Feb 2026 07:05:40 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, hch@lst.de, brauner@kernel.org,
 jack@suse.cz, viro@zeniv.linux.org.uk, djwong@kernel.org,
 pankaj.raghav@linux.dev
Date: Wed, 11 Feb 2026 12:30:56 +0530
Message-Id: <20260211070057.22001-4-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260211070057.22001-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20260211070543epcas5p44f11ea9b90ce0eb480e2b5ce0941559a
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260211070543epcas5p44f11ea9b90ce0eb480e2b5ce0941559a
References: <20260211070057.22001-1-kundan.kumar@samsung.com>
 <CGME20260211070543epcas5p44f11ea9b90ce0eb480e2b5ce0941559a@epcas5p4.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert gfs2 dirty_exceeded handling to use the writeback
 core helper instead of accessing writeback directly. Suggested-by: Christoph
 Hellwig <hch@lst.de> Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
 Signed-off-by: Anuj Gupta <anuj20.g@samsung.com> --- fs/gfs2/super.c | 2
 +- 1 file changed, 1 insert [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vq4IQ-0003SQ-NA
Subject: [f2fs-dev] [PATCH 3/4] gfs2: stop using writeback internals for
 dirty_exceeded check
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:agruenba@redhat.com,m:trondmy@kernel.org,m:anna@kernel.org,m:hch@lst.de,m:brauner@kernel.org,m:jack@suse.cz,m:viro@zeniv.linux.org.uk,m:djwong@kernel.org,m:pankaj.raghav@linux.dev,m:linux-nfs@vger.kernel.org,m:gost.dev@samsung.com,m:anuj20.g@samsung.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:gfs2@lists.linux.dev,m:mcgrof@kernel.org,m:vishak.g@samsung.com,m:kundan.kumar@samsung.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:mid,samsung.com:email,lst.de:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
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
X-Rspamd-Queue-Id: B6F06121C63
X-Rspamd-Action: no action

Convert gfs2 dirty_exceeded handling to use the writeback core helper
instead of accessing writeback directly.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/gfs2/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index f6cd907b3ec6..7ddeee19dec4 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -447,7 +447,7 @@ static int gfs2_write_inode(struct inode *inode, struct writeback_control *wbc)
 		gfs2_log_flush(GFS2_SB(inode), ip->i_gl,
 			       GFS2_LOG_HEAD_FLUSH_NORMAL |
 			       GFS2_LFC_WRITE_INODE);
-	if (bdi->wb.dirty_exceeded)
+	if (bdi_wb_dirty_exceeded(bdi))
 		gfs2_ail1_flush(sdp, wbc);
 	else
 		filemap_fdatawrite(metamapping);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
