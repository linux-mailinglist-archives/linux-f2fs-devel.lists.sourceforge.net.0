Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CECF6CF0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Nov 2019 03:40:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iTzcV-0007pL-06; Mon, 11 Nov 2019 02:39:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2117e6735=damien.lemoal@wdc.com>)
 id 1iTzcT-0007ow-0K
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gQm9oHXUsueCPc7wF/batIlK6HoXDMYpSXkKRKJlsF8=; b=YMQ9A2niPb5oFdGxrRvEWgUDoq
 nJcit/YqdXoXwDjpABu4vwOmLGRg2ujjg2gRn58TSdDWUHanxJwOo65pAmj5qMQXN/E97VgbLeciC
 rF+RKRHNx06KdQ4kkCj8E4oP6O5Wi4DYc128xkDJfwHEbRHPlqO1WuyJEa5EBoNPVONo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gQm9oHXUsueCPc7wF/batIlK6HoXDMYpSXkKRKJlsF8=; b=NtWv0sSCjIJUdl3wRk1BroGXM3
 MWTrnf/reTJ4irEvl8NoNiD85PAY5qocJ/OYrLecg8hUMWrPYD0nMEw4bp9seB2c5/0czHaPeHUgc
 h8DEQjP/EPJhdbo5GCbFpZTSMhuoM39BFmwRu1GD8tzEaMALwu608b1Txh38Iy5Ca1NA=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iTzcR-00EDr9-1c
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573440039; x=1604976039;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZiPMJXvFrkhjV/NQNmkkfkyUBz8ze5+Dwp1BnuDjbu8=;
 b=bEppA/2Ce3SudcV49oCRt6Gyt3iqcSONS6EhxqcwU1tzw+fl5TI8+Q+e
 dck/SEJsUCK2qg51X7n8YGB2qKPfsSTsPPIRTBJXjbyoEhUNbf25Dw3yf
 CwqUZfYW/vdQ58H9cnQjXAjl4ok5WXOkdP5OnBkVvZTEBKYhtje/6lNIP
 vGMIxZyOmDhG6Hr20ji/WSH8DmwKo852EyB5Y1TmmXdO58v/NLKgDsQEZ
 vr3TsEJ7NVegJsmca4bMqf5Hr6mkQ9IFLHfuDD0zPVi0VMtehnb8EejVF
 AMjB1DfC1nyf+7zI6Ziq9dXZ2HauI5usZ4TFZD/LCmt5wUJG/+cytW+va Q==;
IronPort-SDR: i8ITUfcxvs6pfqzOAcoQRjWz4f80NnrP8npaXjgcpHo207W6aF2ddroVd0G7VjTtNf+ujyw3E6
 BEp8hlIERtYO0BQgarDd/IMm+a1PCUB7iR74VYPMOM6K4rQzxwRm6xxGHu2aILeF3myaaKMyia
 ncyIK9/Dt5GeMifA3q1NIQH8uW8mBOSJX7exFo6e6hCZoRt2aGYmLYyztF16dgxMrJueYgjDn5
 f5LPydgcFHkhPolHriP7TjRyH6nXuoxW6aryUKFvm5BOXn0FTgwCrWeEHzwS4lZVAKoYajz0i5
 TqU=
X-IronPort-AV: E=Sophos;i="5.68,291,1569254400"; d="scan'208";a="223871020"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2019 10:40:23 +0800
IronPort-SDR: WM4OK6MzN0Q2AXlmz/MVoBQZ86gRBY3Xt4LYhTw4EGLxgNnM+AkdzzVQC7XiNOpU3cmbZTU2Zw
 It5keUIrsTY8LzS6bm80unfW17pCWwRvpKc800NNWG5YOD1i+Tp4qPCe7h8a9FALE1hFZAn8Dm
 fcpGkNqTpJpNhdThbTIcQiJ6EwWFunBpurf/UQ0pmV07KajsmuPCGVPXlXp4idiF6yI27ed/NG
 PAnd5DClAVxJzoa/erYSHQwsUrxZ8OYfa98U5SDYQ7PavwEKsCCJpbvLKHkcTxGFSqkzChMS/x
 qOVhJiPslhmYtWqonyygcM6I
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2019 18:34:49 -0800
IronPort-SDR: AAngVtZSiBojiLXp/FiK1WVNwreEkIoLIx3acvuylkjpOHLL9ELYXZ2JqDTlY6aVogeqZQj4lB
 wDhA3CGOwsJkD/b6NhTbI+/eA5P/jUxynwAB3Fhf2jAH6Ix3ST6hbx5OEjgYm4oSoF4gUoexpv
 5NHZ8UP9iR7U/MVywlalJ4BQ/r0o3NiNkZ0/AM0umuOi4I6VwKb+hhxc/FtQsiCbRZie4a95yh
 9tum5aOleaM3tjCo0NGNvjcFhKFILYHybeUdGPE5lG5eoMzqfSqcBcdhqhSeZH6RdmIQYzwTQo
 O4g=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Nov 2019 18:39:44 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Mon, 11 Nov 2019 11:39:28 +0900
Message-Id: <20191111023930.638129-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191111023930.638129-1-damien.lemoal@wdc.com>
References: <20191111023930.638129-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTzcR-00EDr9-1c
Subject: [f2fs-dev] [PATCH v2 7/9] null_blk: Add zone_nr_conv to features
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

For a null_blk device with zoned mode enabled, the number of
conventional zones can be configured through configfs with the
zone_nr_conv parameter. Add this missing parameter in the features
string.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/block/null_blk_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
index 2687eb36441c..27fb34d7da31 100644
--- a/drivers/block/null_blk_main.c
+++ b/drivers/block/null_blk_main.c
@@ -467,7 +467,7 @@ nullb_group_drop_item(struct config_group *group, struct config_item *item)
 
 static ssize_t memb_group_features_show(struct config_item *item, char *page)
 {
-	return snprintf(page, PAGE_SIZE, "memory_backed,discard,bandwidth,cache,badblocks,zoned,zone_size\n");
+	return snprintf(page, PAGE_SIZE, "memory_backed,discard,bandwidth,cache,badblocks,zoned,zone_size,zone_nr_conv\n");
 }
 
 CONFIGFS_ATTR_RO(memb_group_, features);
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
