Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB9425663B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Aug 2020 11:16:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kBwyS-0008F3-O9; Sat, 29 Aug 2020 09:16:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1kBwyR-0008El-PV
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 29 Aug 2020 09:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Es3rvz04fngLIaLN2IdMnrhBrW+CztPcUNNZVbcvRLU=; b=hjEdV5eiUKIOqdb7Oc5CidcWsW
 RfxiKBvuEvwnnAoqy5FQRklQPkWJ1Zv64u0WePkvVc08fmVKQXqI9WL+ktx8DvZukqK+nYA+tA2Hu
 ZYe4bMhaMQeBAmg9P+LHFmWOcbdWhpbBUn0leahrHil6q2lLtQ7jCwT96Zqxm1vl5hnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Es3rvz04fngLIaLN2IdMnrhBrW+CztPcUNNZVbcvRLU=; b=S
 1VS19FNEyhKCBpU2UUy84IpYfN5QoEhWoj4HDgh7CLP6cOLy/bz57Wi+y/ghWhIOVIoDYAM2r9FLB
 7PtRA83onJSR00GAY+oWHC2RX6yytwsa1vvNj+CRX600Y/em2+6ypZYo9eXe17jh/Vy8Q0GC/EsSB
 o1JCSn0g1079l2n8=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kBwyL-0094nT-CN
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 29 Aug 2020 09:16:35 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 10E3A842DC66368B0B2C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 29 Aug 2020 17:16:12 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Sat, 29 Aug 2020
 17:16:10 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Sat, 29 Aug 2020 18:05:52 +0800
Message-ID: <20200829100552.29043-1-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kBwyL-0094nT-CN
Subject: [f2fs-dev] [PATCH] f2fs: correct statistic of APP_DIRECT_IO
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

Miss to update APP_DIRECT_IO when receiving async DIO. For example:
fio -filename=/data/test.0 -bs=1m -ioengine=libaio -direct=1
	-name=fill -size=10m -numjobs=1 -iodepth=32 -rw=write

Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
---
 fs/f2fs/data.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a19e2a7891f3..f9f25bc52487 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3671,12 +3671,18 @@ static ssize_t f2fs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 									err);
 			if (!do_opu)
 				set_inode_flag(inode, FI_UPDATE_WRITE);
+		} else if (err == -EIOCBQUEUED) {
+			f2fs_update_iostat(F2FS_I_SB(inode), APP_DIRECT_IO,
+						count - iov_iter_count(iter));
 		} else if (err < 0) {
 			f2fs_write_failed(mapping, offset + count);
 		}
 	} else {
 		if (err > 0)
 			f2fs_update_iostat(sbi, APP_DIRECT_READ_IO, err);
+		else if (err == -EIOCBQUEUED)
+			f2fs_update_iostat(F2FS_I_SB(inode), APP_DIRECT_IO,
+						count - iov_iter_count(iter));
 	}

 out:
--
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
