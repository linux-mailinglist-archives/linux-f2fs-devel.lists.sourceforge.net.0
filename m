Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7013D1302BC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Jan 2020 15:37:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1inkXx-0007zU-Pq; Sat, 04 Jan 2020 14:36:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1inkXr-0007yP-KV
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Jan 2020 14:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7k8gaLXukPzjJGyY+xIC8DOJaUh+oLrwvPFiks3Knak=; b=QJYwK5Ab8wxfJNP3eCeBYgMUeH
 Ze02yjhKRaP3dNWyH8bLW3eqrIwXGfYwXCa+vSbqZ+yrAO+PoKiuWQGoR7kjvyMki2dswBqD8q6HY
 fh4Alj8c1leWqKmyNuNSBPFm7c6DaobgXAnARNnyTAcLCwvxU0jnKKCjHBBy2vb7jmNQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7k8gaLXukPzjJGyY+xIC8DOJaUh+oLrwvPFiks3Knak=; b=RdZFvzSjrS5cCa9eFiutt6Q7oy
 XWaY+fHuv6qB/pYGUl7WtjADpgCH/c8g44Qjt5clZHOpwiAdBUVb3ak4//WV4nXa5wT83+gMtM1iu
 UIvg9Kf5zJj4cv5o0aGHJjeUKIbdk1YN4pbKSemopYR6Nuh+ukbOdccMemHJbihKf3N8=;
Received: from sender2-of-o52.zoho.com.cn ([163.53.93.247])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1inkXc-0094CR-IZ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Jan 2020 14:36:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1578147631; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=Wm1LmxEiRdnPxgUwAF6QFOvou39oZfviXf6u9vBIe+s4Wp24uY8rW49btrDPv9isBkv4WKchZ9HgTPykYIZYlv383SWfGnsJuhY7fQAhR2Fyp9kER6BjGvkqh8S9kXxOTn03xPJABz/DQKZNNUnobxZE0uPuw6GceLkABB4hoiw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1578147631;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=7k8gaLXukPzjJGyY+xIC8DOJaUh+oLrwvPFiks3Knak=; 
 b=fZJBaexuGyqp/gqCJVR0N/D7EWMuF9C8MMisxzgrbDxZ8XIW+hjdXF+uBCK/GoiQTc8zGXJlV8Yr4I/RlulMlp+OGQVzVQPBWIxcLi9Y8IjzvQ5IDA+CSaWlEwQ1JlO2DYxgxqC4rRXlIDdiUa3z2Z3AtGKuk9Ezlc5gkOU/45Y=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1578147631; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=7k8gaLXukPzjJGyY+xIC8DOJaUh+oLrwvPFiks3Knak=;
 b=cng1tKuBAc7ah7mdBkmJMkb1ivGDCz7jaUqTUyBO/pfGl6X47GgFlfPQzTB0R8dF
 mpQSMQnATVk2uNkaUraso0szktsumaHmGPg5zINaL4UFB9+wZguvZtGIiYZiG/jyoCZ
 nE/r+3MgyPNA1dCdAgiFTowqWQKHmYrcPzLzBeXI=
Received: from localhost.localdomain.localdomain (113.116.49.111
 [113.116.49.111]) by mx.zoho.com.cn
 with SMTPS id 1578147629444192.7016564807659;
 Sat, 4 Jan 2020 22:20:29 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: jaegeuk@kernel.org,
	chao@kernel.org
Message-ID: <20200104142004.12883-2-cgxu519@mykernel.net>
Date: Sat,  4 Jan 2020 22:20:04 +0800
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200104142004.12883-1-cgxu519@mykernel.net>
References: <20200104142004.12883-1-cgxu519@mykernel.net>
MIME-Version: 1.0
X-ZohoCNMailClient: External
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [163.53.93.247 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mykernel.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1inkXc-0094CR-IZ
Subject: [f2fs-dev] [PATCH 2/2] f2fs: code cleanup for f2fs_statfs_project()
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
Cc: Chengguang Xu <cgxu519@mykernel.net>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Calling min_not_zero() to simplify complicated prjquota
limit comparison in f2fs_statfs_project().

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
---
 fs/f2fs/super.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78efd0e76174..ac01c3f8863d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1213,12 +1213,8 @@ static int f2fs_statfs_project(struct super_block *sb,
 		return PTR_ERR(dquot);
 	spin_lock(&dquot->dq_dqb_lock);
 
-	limit = 0;
-	if (dquot->dq_dqb.dqb_bsoftlimit)
-		limit = dquot->dq_dqb.dqb_bsoftlimit;
-	if (dquot->dq_dqb.dqb_bhardlimit &&
-			(!limit || dquot->dq_dqb.dqb_bhardlimit < limit))
-		limit = dquot->dq_dqb.dqb_bhardlimit;
+	limit = min_not_zero(dquot->dq_dqb.dqb_bsoftlimit,
+					dquot->dq_dqb.dqb_bhardlimit);
 	if (limit)
 		limit >>= sb->s_blocksize_bits;
 
@@ -1230,12 +1226,8 @@ static int f2fs_statfs_project(struct super_block *sb,
 			 (buf->f_blocks - curblock) : 0;
 	}
 
-	limit = 0;
-	if (dquot->dq_dqb.dqb_isoftlimit)
-		limit = dquot->dq_dqb.dqb_isoftlimit;
-	if (dquot->dq_dqb.dqb_ihardlimit &&
-			(!limit || dquot->dq_dqb.dqb_ihardlimit < limit))
-		limit = dquot->dq_dqb.dqb_ihardlimit;
+	limit = min_not_zero(dquot->dq_dqb.dqb_isoftlimit,
+					dquot->dq_dqb.dqb_ihardlimit);
 
 	if (limit && buf->f_files > limit) {
 		buf->f_files = limit;
-- 
2.21.1





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
