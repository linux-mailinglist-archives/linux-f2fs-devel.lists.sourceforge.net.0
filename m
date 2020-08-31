Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F1B257161
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Aug 2020 03:08:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCYJW-0001xz-HC; Mon, 31 Aug 2020 01:08:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1kCYJU-0001xq-U6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 01:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NN8/RTISABx+aQ0p974vSW45Ss63FhBBUJfvpP4Sjwo=; b=erXMT7100SCW+WpWDtHxh0X9ew
 jvuEBoS8MzqijtVFmNgww3qAIamMBmXpiir1JHSsSFXLF29TMMvKDPUBLV465HObpEqY9LYzLTzTs
 zhbTEY54QY5M6vS4+gvdnnTmcOw0bExyziGKtrB3/+ePTE+rblqwJ4CBKlGby8/tNs04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NN8/RTISABx+aQ0p974vSW45Ss63FhBBUJfvpP4Sjwo=; b=P
 P3p8uwpK5Z3Gb5K3qhC6r7uJ4YKUXRuqSw0LWOiLnAOgD1gqf/RMK+6zHJp6WnqKrh9Y7hL//ZHX7
 HIPPV6nyfA1uU6n07PjoGrDbDTvjYz1dvDRtfNTyRCW0Q45zuCJAMlMxaACL9dT4x6YmqZimEWJaa
 v+G7iXbzrumbenu4=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kCYJQ-007Sph-OH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 01:08:48 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id AC87C7FAA9D8D6E195FD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 31 Aug 2020 09:08:27 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 31 Aug 2020
 09:08:22 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Mon, 31 Aug 2020 09:58:02 +0800
Message-ID: <20200831015802.34005-1-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1kCYJQ-007Sph-OH
Subject: [f2fs-dev] [PATCH v2] f2fs: correct statistic of
 APP_DIRECT_IO/APP_DIRECT_READ_IO
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

Miss to update APP_DIRECT_IO/APP_DIRECT_READ_IO when receiving async DIO.
For example: fio -filename=/data/test.0 -bs=1m -ioengine=libaio -direct=1
		-name=fill -size=10m -numjobs=1 -iodepth=32 -rw=write

Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
---
 fs/f2fs/data.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a19e2a7891f3..239645433e0e 100644
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
+			f2fs_update_iostat(F2FS_I_SB(inode), APP_DIRECT_READ_IO,
+						count - iov_iter_count(iter));
 	}

 out:
--
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
