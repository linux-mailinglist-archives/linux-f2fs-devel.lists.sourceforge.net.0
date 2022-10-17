Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6E360197D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 22:25:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okWfh-0002aU-UA;
	Mon, 17 Oct 2022 20:25:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1okWfg-0002Zm-9K
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Gcylt+Ee3nnIcC1CSrxmmqTpju5LE3+AXEIgm+aVs4=; b=bSM+nwZg32+/mlMx7HpiTCoLl1
 yg/BrAxmAvPwSL7FQivwBl5X1j/B3KDtZJxfawK3H/tZphCJmugAHYXmCQM+ozPIsQNGhovrVLZeT
 9NOIvpnvgxF6dwRcQsvUd8YboN9Bo0+kNLWaG2xaPiV11dw7vXRWdp1kCzYfREEkj8dU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Gcylt+Ee3nnIcC1CSrxmmqTpju5LE3+AXEIgm+aVs4=; b=mcKSNtu5MgCfO3FuPafFxSsYbV
 ZlTKNHarxprXpRH+NQHEMg6/KRIONSZWWYw5FubPDp89Flgsjm3iJ2zSF0+W9iBVx4HamBSDlSgSK
 qgZYgZ3lfdT3cNuixBTwWBH7ehAlQws3pXgGwhupXwqUcYOItVttaoL7mfOWwqPubV0U=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okWfe-0008SA-0b for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:11 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso15336766pjf.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Oct 2022 13:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Gcylt+Ee3nnIcC1CSrxmmqTpju5LE3+AXEIgm+aVs4=;
 b=ifFTeoUYIX/JHROqieyQ+/nPZoHo4/h5Ny8eP9EcCFh4S+Q1mIxlVXZQkSCwUAkgYA
 9KrR3+3Jqghr6crVnV6qXc5INX2cac8uDEOB4CkIBlX0YCJi7H6Fc3sAhQA7ybel8BgX
 radNlmHPnhi7yvSSHyVufNNIAoVGamFUYc8iB4p+0wU5MtiC9yP8hS5HKsQycm9b8YNg
 n9WVwFdcyw3e06Lf+T1d5fsIQ+OcxptTreSC0TvliItMIby1Vv9slyllHJAtXAWTKffh
 /zK+Jo5uR/RaB3yHi8HAR+9ZGb6Gmx42SHZYRFWpxY5gPcUdKQ7weGZ54ycWpGG932Ob
 xFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Gcylt+Ee3nnIcC1CSrxmmqTpju5LE3+AXEIgm+aVs4=;
 b=jBO+aXOKr0XYuLx+vn0/XJGq6lJl85QE30J5jNEU2vp+ZHF2iZVRyj/KjZPZ2btDul
 WwPXp+sTLRI5SOQix31DsHIonfXeCDvU1EoKRI1eSCE5S/MkGNhCl6Zcuz60/qTyqcNG
 vXW1TuJICPcAwhOS5LJE8qoBWEXjVEVB+IgSg59akmU+eW0NRGcDUxotbce2wOSRjy2U
 Yoac+v9ZoJ7nLS8mFCmC+jQ3Zn4Cmivra8OCntbJOWTHlLvXP7SZusa/BagguSzaHVQz
 JeUPmeZbC4dO3DL4nm9Mrm38CsONr3o2TGz4kKQvPnVnAiiDYsSGw5MAaTC/bpkljSNM
 ZKXA==
X-Gm-Message-State: ACrzQf3XjLiEvR1ZzZTSLhMdHPuwcwmsWASSHbSapqnGW6RfLmmk4y95
 dUDgwGh4+rPpJSJJNT4HbLo=
X-Google-Smtp-Source: AMsMyM55mBmGZvh6IbugVkyMm24ikb9Ki4AcME5alKIBbSUj7cUwzp+XBBbkyaoL4qf34WBmEzkofQ==
X-Received: by 2002:a17:903:2306:b0:185:43a2:3d1c with SMTP id
 d6-20020a170903230600b0018543a23d1cmr13740880plh.154.1666038304993; 
 Mon, 17 Oct 2022 13:25:04 -0700 (PDT)
Received: from vmfolio.. (c-76-102-73-225.hsd1.ca.comcast.net. [76.102.73.225])
 by smtp.googlemail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b00200b12f2bf5sm145037pjb.1.2022.10.17.13.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 13:25:04 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Oct 2022 13:24:39 -0700
Message-Id: <20221017202451.4951-12-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221017202451.4951-1-vishal.moola@gmail.com>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert function to use a folio_batch instead of pagevec.
 This is in preparation for the removal of find_get_pages_range_tag().
 Signed-off-by:
 Vishal Moola (Oracle) --- fs/f2fs/node.c | 19 ++++++++++--------- 1 file
 changed, 10 insertions(+), 9 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.43 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1okWfe-0008SA-0b
Subject: [f2fs-dev] [PATCH v3 11/23] f2fs: Convert f2fs_fsync_node_pages()
 to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert function to use a folio_batch instead of pagevec. This is in
preparation for the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/f2fs/node.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 983572f23896..e8b72336c096 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1728,12 +1728,12 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			unsigned int *seq_id)
 {
 	pgoff_t index;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	int ret = 0;
 	struct page *last_page = NULL;
 	bool marked = false;
 	nid_t ino = inode->i_ino;
-	int nr_pages;
+	int nr_folios;
 	int nwritten = 0;
 
 	if (atomic) {
@@ -1742,20 +1742,21 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			return PTR_ERR_OR_ZERO(last_page);
 	}
 retry:
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	index = 0;
 
-	while ((nr_pages = pagevec_lookup_tag(&pvec, NODE_MAPPING(sbi), &index,
-				PAGECACHE_TAG_DIRTY))) {
+	while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
+					(pgoff_t)-1, PAGECACHE_TAG_DIRTY,
+					&fbatch))) {
 		int i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct page *page = &fbatch.folios[i]->page;
 			bool submitted = false;
 
 			if (unlikely(f2fs_cp_error(sbi))) {
 				f2fs_put_page(last_page, 0);
-				pagevec_release(&pvec);
+				folio_batch_release(&fbatch);
 				ret = -EIO;
 				goto out;
 			}
@@ -1821,7 +1822,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 				break;
 			}
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 
 		if (ret || marked)
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
