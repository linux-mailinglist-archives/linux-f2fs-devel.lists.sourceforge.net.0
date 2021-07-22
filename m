Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9A13D1C65
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 05:26:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6PLS-0000cE-IU; Thu, 22 Jul 2021 03:25:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1m6PLR-0000c8-4C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 03:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b8mgiCoofIzah+7H96ww6/H6tLV8Ex5MlRMhOb3ANb8=; b=Au9KAGHrOCj6Bcf40q1kmqAL4Q
 HolYHIUjfU0C3WoJY4ZXeCeTlTln5laxGacb9osiAjoSkTWjgdzIPxqdZTPSgDbOZf5lYKJiyfjTB
 AT+gmRGMpDdKvCquQn3oFWEzKAibEZn8xS3YO0+NGcA35P3Zav/XoEsYRjZ+vqnSxQWg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b8mgiCoofIzah+7H96ww6/H6tLV8Ex5MlRMhOb3ANb8=; b=k
 MfulcWreAX5suHOzeQkqDbYW8Ou+mdiFyc9LfLRfYTMNHGXRBxjKVx7zs9lPqfWmKlhkOa1QOaI15
 wfCzNe+CWAdiGUe7MLdEbgcgq7UPvA7lc9NQ8AGcz76/peaLa7LfIPzAefTH2yIZHSPsYJwXzmdq/
 hOLRe1K4QU+jsM8M=;
Received: from mail-m121144.qiye.163.com ([115.236.121.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6PLO-00GN7v-AB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 03:25:57 +0000
DKIM-Signature: a=rsa-sha256;
 b=BHAZyXzBdkL1AvHGlGgSASAUtLoQ9EEcECmL0cM0B9W6m8Ns8d0/3ZG/Yq6jYWBtfVsiT5T0wbv/D63g2RJDJ4Uz1aSmG+Xkaz7ZgPZx929WnZIF4O5k6V0QgCJxk5fcFyMVEvWVHC5/FGTdfBi+95diR5gmtm8OLsPraxLPPMo=;
 c=relaxed/relaxed; s=default; d=vivo.com; v=1;
 bh=b8mgiCoofIzah+7H96ww6/H6tLV8Ex5MlRMhOb3ANb8=;
 h=date:mime-version:subject:message-id:from;
Received: from comdg01144017.vivo.xyz (unknown [218.104.188.164])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id F2F4DAC0131;
 Thu, 22 Jul 2021 11:25:45 +0800 (CST)
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 22 Jul 2021 11:25:36 +0800
Message-Id: <20210722032536.150423-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRoZSEpWSEwdThlPGUJMSk
 0fVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mgw6Tio6ED9OTUspPlErFChC
 I05PFA9VSlVKTUlNQklPSE9NTktOVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WUlKQ1VKS09VSkNDVUpNT1lXWQgBWUFKQ05ONwY+
X-HM-Tid: 0a7acc3f6b51b039kuuuf2f4dac0131
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [115.236.121.144 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.121.144 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1m6PLO-00GN7v-AB
Subject: [f2fs-dev] [RFC PATCH] f2fs: compress: avoid duplicate counting of
 valid blocks when read compressed file
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
Cc: Fengnan Chang <changfengnan@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since cluster is basic unit of compression, one cluster is compressed or
not, so we can calculate valid blocks only for first page in cluster, the
other pages just skip.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d2cf48c5a2e4..a0099d8329f0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2304,12 +2304,13 @@ static int f2fs_mpage_readpages(struct inode *inode,
 				if (ret)
 					goto set_error_page;
 			}
-			ret = f2fs_is_compressed_cluster(inode, page->index);
-			if (ret < 0)
-				goto set_error_page;
-			else if (!ret)
-				goto read_single_page;
-
+			if (cc.cluster_idx == NULL_CLUSTER) {
+				ret = f2fs_is_compressed_cluster(inode, page->index);
+				if (ret < 0)
+					goto set_error_page;
+				else if (!ret)
+					goto read_single_page;
+			}
 			ret = f2fs_init_compress_ctx(&cc);
 			if (ret)
 				goto set_error_page;
-- 
2.29.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
