Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCA421AD13
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 04:30:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtioQ-0000i6-Gm; Fri, 10 Jul 2020 02:30:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jtioJ-0000hn-6v
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 02:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wp1RikfBlWn8JwSSKOYNMqEEvaAX2Amzyy/j7gHNGYM=; b=PtJrFcjKi6qEvXUhQSgOvg8UST
 nBLBLgGzKE9gzrI5orN8sNuu9LQwXTVCkVQzugEi+SC1QvvWg+LYcGLZFDlucr88X1NY/nfJZLUv6
 38o0B4XZli4p5AxELhU+zKhw+WBTNH/7grdZmPtn7RppV9jv3yz4sL8Y7Ib5F/VabKsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Wp1RikfBlWn8JwSSKOYNMqEEvaAX2Amzyy/j7gHNGYM=; b=C
 gzhaDWYrvCebFYGanivoBV3pNHIcb3A5ldeVypvBYMhV16jBsmXwXeR4D4IF7pn2aCY7EZeQyrTJP
 sqLX7Gpl+U/AqYzmnbsKSl0Wifx1ND5A23u+oLqj7plRoRM//VKv3YcB3pVUcpwyEQc0YeqVW8qFl
 XXnwFm/yKGfroQxU=;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtioA-00Cmki-0C
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 02:30:47 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594348238; h=Content-Type: MIME-Version: Message-ID:
 Subject: Cc: To: From: Date: Sender;
 bh=Wp1RikfBlWn8JwSSKOYNMqEEvaAX2Amzyy/j7gHNGYM=;
 b=oX1jaiS+7G2NW3/IRp+OWMgjWdXF0tu9w2+ENTvDL5nGC1QZVPW6xb4DJnqBTlzteiLGbPOF
 tTGY9uzcrR0VI4EIQQ4PUj74B0owjbWimV/DZ7CFD1KDdCJX4Rfwf5YfUVHLQLPG8JlIsdeg
 LvjGF3cK/CmEb2sSLqyGdGcSPoY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-west-2.postgun.com with SMTP id
 5f07d2c1a19992ac65868bf2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 02:30:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5DCD0C433C8; Fri, 10 Jul 2020 02:30:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 37F39C433C6;
 Fri, 10 Jul 2020 02:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37F39C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Fri, 10 Jul 2020 08:00:19 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20200710023019.GD2916@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.43.7 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [69.72.43.7 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jtioA-00Cmki-0C
Subject: [f2fs-dev] IO hang due to f2fs checkpoint and writeback stuck
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

Hi Chao, Jaegeuk,

I have received an issue report that indicates that system is stuck
on IO due to f2fs checkpoint and writeback stuck waiting on each other
as explained below.

WB thread -
----------

io_schedule
wait_on_page_bit
f2fs_wait_on_page_writeback -> It is waiting for node
			node page writeback whose bio is in the
			plug list of CP thread below.
f2fs_update_data_blkaddr
f2fs_outplace_write_data
f2fs_do_write_data_page
__write_data_page
__f2fs_write_data_pages
f2fs_write_data_pages
do_writepages

CP thread -
-----------

__f2fs_write_data_pages -> It is for the same inode above that is under WB (which
	is waiting for node page writeback). In this context, there is nothing to
	be written as the data is already under WB. 
filemap_fdatawrite
f2fs_sync_dirty_inodes -> It just loops here in f2fs_sync_dirty_inodes() until
			f2fs_remove_dirty_inode() has been done by the WB thread above.
block_operations
f2fs_write_checkpoint

The CP thread somehow has the node page bio in its plug list that cannot be submitted 
until end of block_operations() and CP thread is blocked on WB of an inode who is again
waiting for io pending in CP plug list. Both the stacks are stuck on for each other.

The below patch helped to solve the issue, please review and suggest if this seems to 
be okay. Since anyways we are doing cond_resched(), I thought it will be good to flush
the plug list as well (in this issue case, it will loop for the same inode again and again).

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index e460d90..152df48 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1071,10 +1071,12 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type)

                iput(inode);
                /* We need to give cpu to another writers. */
-               if (ino == cur_ino)
+               if (ino == cur_ino) {
+                       blk_flush_plug(current);
                        cond_resched();
-               else
+                } else {
                        ino = cur_ino;
+                }
        } else {
                /*
                 * We should submit bio, since it exists several

Thanks,

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
