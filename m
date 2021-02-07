Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55210312702
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Feb 2021 20:04:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l8pMZ-0004oj-85; Sun, 07 Feb 2021 19:04:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=665305f4c=chaitanya.kulkarni@wdc.com>)
 id 1l8pMW-0004oa-9n
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 19:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dQH47KFNBqwhXElKVENOyFZ0w2cvoJOpXJzwEIn1FF4=; b=MFLZBpE/PxuzD3nrot7kb9e+3e
 BA+9yjIT3aW6gOywAJjfi51qe7ZONMQivjs1wzpFTX+pXzWZHnIdp1ANssLu64HpEOODlPBWr4lt/
 ZSO+TDAzSwPhtsJK7Sbb8S4Upl3s0l6ZtGJMf0ZUNqFTxM/Aojo72XZ0pggWgsPSXJXE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dQH47KFNBqwhXElKVENOyFZ0w2cvoJOpXJzwEIn1FF4=; b=H
 xrQKO8H/yEQqlks9dk7WEtA/Tihd+zPJTt/dtvlU3Bq7jYRmT4wDVnslH3P0R8+FtMdWGeyOJS42/
 kfuBOhIocBa/aPVebxkpfkYcNScNaaq0uFOJMkr4jLmA4oy8yzCchiRuzyqFgU15tQfNUqdHEIbVU
 DxWLE/8p+34vHe/U=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l8pMM-00DxQu-N7
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 19:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612724678; x=1644260678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w6zlqoB4qKT1nXBrbOhQGOcEIB8ZlcLodmo+qNAVwo8=;
 b=UCfNs0x0OsK/l20kfl8kwFDbriYifkJ5zrIPTq6M68Lcl8MXp77yFo1P
 CdKAIr0u4VY5DcvRnh4xf3n+fA/IgQl09hl8dAM+fruGaj7G1erOAH/qx
 NYH/hFy7Anoa+4Y6FB2o8h3fMjTmMNJVKU9ZkbzR4wtGRAWG/vFZk0Jrw
 LTqjd3UedzoQeJPM1NrTE7hEQPmprbtiwX5pjDIlgrAOwTq67rRacxYnq
 xlH6BtdjCTlmnWy87gmO/p8QOWO6R1SfiN3u3QNf+9NyKStDnDbho2eww
 RM6quhQxR8Un0E4h/NfONgkktT5HEATEDA8GmuvfGKv5NiqYAn9YT6aSY w==;
IronPort-SDR: feNwWh9//8pm3cscKVlO2JvZsozTHbFDPOUvu6f9xHSXupQXAUPAJ0s9oXgdytCf9Nrv1LbloS
 rtM/zvyngMTucvT6lwPbQbTD3+80FCIwEz2IYVd4M0eJioP+S4Q+Z9sK/n2LWp6bliJmksOb8q
 hLYtNJR5lDfwKIEV6Mq9JbT35ExB0VZ3ALZSuOY9cmQXJq+HmFUdaT3rKybE91dkj0KJBR7fdi
 vAHJwgmxBH7b6tkCqrXkUue3tBVtHrcwtao4i3XEFF8IqbmsPQFP9CalcLBj15fkItNdP+z/Ig
 UV0=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="163856596"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 03:04:28 +0800
IronPort-SDR: BLEdlyoizb5FgkdONHiuBcdFffufYaXt3sKVXpVX2nk0d/rKaU75ED0RfL7LqGtzilbLPpku5g
 OA7I4SLmgL8NtijXZp2uEwWIadTv+Rn6dPZzgBKDuc3eeOKw5FPv3RIbVJY2L7+VDflK5mnRJ0
 i7b1xicGPcNZGMyDCEciQlROOa7wlyp6A6D9841XIuvOeZNR+H1P++kOk7KukApjhFF9IzVLy3
 PoT9tqAXx1f8epJ51zGt/LW+Rn/hbTIIjlrns7J0ejj3BLnb3wh1Wx4gEjvCFhaBbOQvJg76qo
 iXwnz1Pc4lOX2xMqyOmVSyra
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 10:48:22 -0800
IronPort-SDR: G5UkKRJXYnZF6S2td3KTLC+tstktMSOx5USrJ/8vqHVbIEJIIqHE54GblQXzzWDKDkJYqqMIm8
 /grFclx6OokLW8XLT0EahhHRmjldgbrOtSVmPY2iDCY5Jwp+My9e1mLwkFllm9yHbk9+aju3il
 15LQnCcS+ED+Ppe8kNeaBlIGJhrSuXnC4oBjsWuwx0fM688vkAbf9ysIyG2UljqmNHOexojEFr
 /H6RbprJtDTtcF2llfZVRwZ4x57vttCqniYZ/8MvLzgQIKhpwqYUiaZvOJJ8ufVCYjb+mvKwd7
 3Os=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 11:04:28 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Sun,  7 Feb 2021 11:04:17 -0800
Message-Id: <20210207190425.38107-1-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.71.153.141 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l8pMM-00DxQu-N7
Subject: [f2fs-dev] [RFC PATCH 0/8] use core page calls instead of kmaps
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
Cc: axboe@kernel.dk, hch@infradead.org, damien.lemoal@wdc.com, tytso@mit.edu,
 bvanassche@acm.org, chaitanya.kulkarni@wdc.com, dave.hansen@intel.com,
 johannes.thumshirn@wdc.com, ebiggers@kernel.org, clm@fb.com,
 adilger.kernel@dilger.ca, dongli.zhang@oracle.com, dsterba@suse.com,
 jaegeuk@kernel.org, ira.weiny@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This RFC is based on the discussion going on the linux-fsdevel [1].

I've tested this on the brd and null_blk. The fio verify job seems to
run without any error on the top of the original series applied [1].

Any feedback is welcome to move this forward.

-ck

[1] https://lore.kernel.org/linux-fsdevel/20210205232304.1670522-1-ira.weiny@intel.com/T/#m53145c155fa3631595594877da96a3a75b71e909

Chaitanya Kulkarni (8):
  brd: use memcpy_from_page() in copy_from_brd()
  brd: use memcpy_from_page() in copy_from_brd()
  null_blk: use memcpy_page() in copy_to_nullb()
  null_blk: use memcpy_page() in copy_from_nullb()
  ext4: use memcpy_from_page() in pagecache_read()
  ext4: use memcpy_to_page() in pagecache_write()
  f2fs: use memcpy_from_page() in pagecache_read()
  f2fs: use memcpy_to_page() in pagecache_write()

 drivers/block/brd.c           | 17 ++++++-----------
 drivers/block/null_blk/main.c | 23 ++++++-----------------
 fs/ext4/verity.c              | 10 ++--------
 fs/f2fs/verity.c              | 10 ++--------
 4 files changed, 16 insertions(+), 44 deletions(-)

-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
