Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A33863FC02B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Aug 2021 02:54:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mKs2M-00044s-CC; Tue, 31 Aug 2021 00:54:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mKs2K-00044M-6d
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Aug 2021 00:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=66MOhctBohnV7wvCMd1/bq5Lk7HMv2rZhQVVuO0729s=; b=NM8XJARLofFIKyFp1HcmNe9Nih
 +HHvIYSjb4asf4zjpO0y12//o5bTnpanETnkAgUW140h6LPpxpVEwfeE1Iy0ebocGIBH2xJNSYXZM
 ZhN49mVytVTyeBAUQXpkH6+5ao2Jv+g04/s2He4IiPs41dlwkAIa2zU+U6E1wot5K16o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=66MOhctBohnV7wvCMd1/bq5Lk7HMv2rZhQVVuO0729s=; b=IbxUi46V6LOZJLt7HngWQgIoRJ
 n000Q4TGJbZ4jS6KtQLk/+10IbCW4cQ2KMU+vbubZ2DBEsvF64Jkymf7aQmc+U9kdeOD+emX0lQOc
 slbv1397vj9Dje8kuu/fWJLpnE7dRO2oPlI9LIq4LZAAuPDCVbdcXQSGwjacwly0KnYs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mKs2I-008SkO-G3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Aug 2021 00:53:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E499A60FF2;
 Tue, 31 Aug 2021 00:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630371229;
 bh=wBfoW5VjwX94tcmf1r6pB9v16U5JrskEzJHYSKjraeA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kbsDjgF4iL4PUIHG0HoCvJiey/CrxhSgz64wChmx8LYG+bVhTon7os6IsuNZirvRz
 YandMPLGIx9SEZvQL8C3AzBJVVCiU/L8U6TSzGZ0LDiiVzWtfcg33ExaBw3MqTRmtn
 NJP2a8hktUNxs72et2K904CfeaJHLfmcUWrPbg61rMZoG5P0AwK1aU1HN2ALtL5bWp
 3fVG20HP+dmaezpLzyvEPZOLDLGmFqXr+4R7uWpidqfDfbOMb3nTGy1lGl8zLt28/9
 HX6FPUpdG9SfMCYPznYdh6K8UoebkRyxldHQRHphVsepPRNcYHlPeDcU1KFc4ZYm7v
 2MbMVD4/RTmrA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 30 Aug 2021 17:53:46 -0700
Message-Id: <20210831005346.118701-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210831005346.118701-1-jaegeuk@kernel.org>
References: <20210831005346.118701-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The prepare_compress_overwrite() gets/locks a page to prepare
 a read, and calls f2fs_read_multi_pages() which checks EOF first. If there's
 any page beyond EOF, we unlock the page and set cc->rpages[i] [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mKs2I-008SkO-G3
Subject: [f2fs-dev] [PATCH 2/2] f2fs: should put a page beyond EOF when
 preparing a write
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The prepare_compress_overwrite() gets/locks a page to prepare a read, and calls
f2fs_read_multi_pages() which checks EOF first. If there's any page beyond EOF,
we unlock the page and set cc->rpages[i] = NULL, which we can't put the page
anymore. This makes page leak, so let's fix by putting that page.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8e8824605f83..41d29382eced 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2183,6 +2183,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 			continue;
 		}
 		unlock_page(page);
+		if (for_write)
+			put_page(page);
 		cc->rpages[i] = NULL;
 		cc->nr_rpages--;
 	}
-- 
2.33.0.259.gc128427fd7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
