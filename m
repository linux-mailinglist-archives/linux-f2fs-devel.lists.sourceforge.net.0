Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 283783E88F9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 05:47:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDfCo-0003wm-9b; Wed, 11 Aug 2021 03:47:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <prvs=850e59ff9=damien.lemoal@wdc.com>)
 id 1mDf3Q-0003g2-QW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iO2KLmW0AKdZBbf0VK15dXKGD5RQUMXf+w2bYuc++yU=; b=KN+D2CnN3tpQlbS49PYJKJJapy
 ltpNjZ/jrAkTaB7VDqP/hYAjcM1v8eE8972J9Nq84WMNeVG3MEl8jKolVURoov0mV16I3/7oP4NzM
 ikwSUBZSEV3p8+L8htzvw1iFmKp0mKFzMHQEchKEawNlm5bf/ongxzGmAQ80AMvywWB4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iO2KLmW0AKdZBbf0VK15dXKGD5RQUMXf+w2bYuc++yU=; b=n
 QfOuUughzlGKSlRoeTShHuYz3Yge47QqFqEdC5GqMnu04KO0Pgk2fJqIfQeNEqRoI1Z1L8ZFEd5Vu
 s+3cpUpYsQGMnAX9aXLEz089UsrYY0nzgIktkaxN9CuDJEUTmQ8W3x7faikop8h0umeRvKwLHjpCB
 +u0BYMs++uuTQtAs=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDf3L-0002eF-T8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628653035; x=1660189035;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TWCAljC1dx1YD2EZP0iY2/a0tIzDQsxuj/cNzvYBxDk=;
 b=Q4SNC+DKYNUfwr+L8IncY36zn8OHk6DACJRyumWMPIl0V3P1MHGJE61K
 tElznKhrbWi5+AaBJ0LPHvvFVtIh03RznJF9ze5hIciYwOKgrX/Ss5HtV
 zmuDZoysoO9TZL6C2FhuNLMhITJ9iXhL5/d5JqxQSl7eZ/1B4L0OjWhw7
 yUZ4Hucw3Y1bM1yYw+Z5o/fuA3JpWYta30FQ6Hq2gluwBcYaxYRcHjqYK
 1a2bBns6pVAbkwUTaibcZXShkxI8JJ4ZtsnzP4C3dM1I9uNf+NbNDKvJw
 PoRvqnnnMYl/Or9b8bbHaAQbU2lVYPVnOc0kVCOZREq0C3U09qkO+pUgr w==;
X-IronPort-AV: E=Sophos;i="5.84,311,1620662400"; d="scan'208";a="176890892"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2021 11:37:04 +0800
IronPort-SDR: iGssvDEPwreAIeQa9I3lPvQeSV2ZX40gIy7cbX4+Lpv+jD1IV1xKxUP4fObaJ53n6HZhEAztEY
 3uweGcetr3bBGhgA4vKmwD7WA/pRb6AuaTdjPRlTpZQxW2lhCF9wQtyk8sRHrAV+uv+atGujWL
 yCpovRXFRlDQOeSk8w/k9ff64xnN8pdnlHF6sF7ZVANmlGRqsziFjwPT06Jwi7rO4PGrD5tux2
 2Er1SEOBe4/ZwrWdUf2dNsdFMtfzkMitl7ZKmVLD7CuInsYrjkQV8GTm8E7o9mibI8U1/+i40U
 Ry+R4YVWweq0NukW+v42VeEO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 20:12:35 -0700
IronPort-SDR: qWpNUjsACDhWC0msNjVZw2DqXZyL+GyC++rO9ZylPLgNjE1KBjvCC62fAc32e19T3FsN+ZCZsu
 Pr48HgqwZDP4ZYVne5Nuca5zS16ItAZ8fqKM65JdcrAVTi4H7KV0BtsNDaBU7w6ZyS+r/WWbvZ
 LrycWVM9okuAhx5b33/B8rggnCgOpoD0xT20orIZGlCyA9aNFx8u80j82BvqIrfLZzlr1ayPPu
 S+W6WGje+933Bu4FDeEhV7q+VxkfS5do7VnmhFjTdnnDF5TduzOjvQmPuSGqrDcAklhwJcdFPK
 vzY=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Aug 2021 20:37:03 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Wed, 11 Aug 2021 12:36:56 +0900
Message-Id: <20210811033702.368488-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mDf3L-0002eF-T8
Subject: [f2fs-dev] [PATCH v4 0/6] IO priority fixes and improvements
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series fixes problems with IO priority values handling and cleans
up several macro names and code for clarity.

Changes from v3:
* Split former patch 2 into patches 2, 3 and 4 to facilitate review and
  have more descriptive commit titles.
* In patch 5, keep IOPRIO_BE_NR as an alias for the new IOPRIO_NR_LEVELS
  macro. Change this patch title and commit message accordingly.
* In patch 6, define IOPRIO_BE_NORM as an alias of IOPRIO_NORM.

Changes from v2:
* Fixed typo in a comment in patch 3
* Added reviewed-by tags

Changes from v1:
* Added patch 4 to unify the default priority value used in various
  places.
* Fixed patch 2 as suggested by Bart: remove extra parenthesis and move
  ioprio_valid() from the uapi header to the kernel header.
* In patch 2, add priority value masking.

Damien Le Moal (6):
  block: bfq: fix bfq_set_next_ioprio_data()
  block: improve ioprio class description comment
  block: change ioprio_valid() to an inline function
  block: fix IOPRIO_PRIO_CLASS() and IOPRIO_PRIO_VALUE() macros
  block: Introduce IOPRIO_NR_LEVELS
  block: fix default IO priority handling

 block/bfq-iosched.c          | 10 +++++-----
 block/bfq-iosched.h          |  4 ++--
 block/bfq-wf2q.c             |  6 +++---
 block/ioprio.c               |  9 ++++-----
 drivers/nvme/host/lightnvm.c |  2 +-
 fs/f2fs/sysfs.c              |  2 +-
 include/linux/ioprio.h       | 17 ++++++++++++++++-
 include/uapi/linux/ioprio.h  | 34 ++++++++++++++++++++--------------
 8 files changed, 52 insertions(+), 32 deletions(-)

-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
