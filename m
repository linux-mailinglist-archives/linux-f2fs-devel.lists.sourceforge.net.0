Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC3CD8C4C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Oct 2019 11:15:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKfOe-0005W7-9B; Wed, 16 Oct 2019 09:15:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <koulihong@huawei.com>) id 1iKfOd-0005Vz-Dr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Oct 2019 09:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/6JxGDGw+D0Q6Mveb97ahCfxTsGbmTyWy0g90X2qlxg=; b=Zdw1t711oS40mmfdevAFW25aPJ
 Wllo0NpFc6hUn9vmLxo8QUe4KSiQ7qHLDwv31+b3IQHWhSexTpPqdiEuf5D1+SKvyOjzHWOEP9WNg
 J1atjTeFPGKOOcgSRqwyUY9G7LByJVvfbydSMDVUeLPBX0C85KmUZsYeHPP98y8XGWRQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/6JxGDGw+D0Q6Mveb97ahCfxTsGbmTyWy0g90X2qlxg=; b=D
 EDKZmRSwWZvlXCmYpIrZrze86wvBBpb6NPVwZfQTQumlzvIW7+XrnweK2aebnaBAX5rVjDZH4vj++
 0h0kkfx/ZxEAlhA9sYkS97Pi7msxwMyogBZcVAb9rIZV5AX+TuOVYOmaF9N7UN3QM2iIlT93Yp6pq
 blVmADLeLgMCBpwE=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKfOb-003dDf-E8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Oct 2019 09:15:07 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 60C051C46FA7E1FB048F;
 Wed, 16 Oct 2019 17:14:58 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 17:14:51 +0800
From: Lihong Kou <koulihong@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>
Date: Wed, 16 Oct 2019 17:22:00 +0800
Message-ID: <1571217722-88090-1-git-send-email-koulihong@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iKfOb-003dDf-E8
Subject: [f2fs-dev] [PATCH 0/2] add a new fio cache for IPU.
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
Cc: zengguangyue@hisilicon.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

*** BLURB HERE ***

Lihong Kou (1):
  Revert "f2fs: add bio cache for IPU"

k00417925 (1):
  f2fs: introduce a new fio cache for IPU.

 fs/f2fs/checkpoint.c |  1 +
 fs/f2fs/data.c       | 93 ++++++++--------------------------------------------
 fs/f2fs/f2fs.h       |  4 +--
 fs/f2fs/segment.c    | 22 ++++++-------
 fs/f2fs/super.c      |  2 ++
 5 files changed, 29 insertions(+), 93 deletions(-)

-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
