Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E452D0E95
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 12:01:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmEGc-0000lB-8p; Mon, 07 Dec 2020 11:01:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1kmEGT-0000kp-AX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 11:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ahLQg8MrMI6osprKut7o6uDiMoSyYPIbtdyZ0pYRcwI=; b=iroSIIiQZb1Yl7SJ/I7byyROhC
 c+loVwSSkr3z+8OQxJIAKS1j61ERf28cZFDHI9V31j2wwZFW8+NEXWuTH+3iHzD1diIFtt66YPDY+
 eBQWA4Lg13r9mhHA5F1HNCExC3olN5Drm9HYBpHXou7o3qI+fRTVeU5UXbOtx7bkmV4c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ahLQg8MrMI6osprKut7o6uDiMoSyYPIbtdyZ0pYRcwI=; b=S
 hd75JnpHvLD101lTlEEY0mgsUBoCu1S3KQyTHl2k4sF4Y+m0c7lxigKpY30nnsQefPBi0I4SanDB/
 IAMozP7XAffekirW8L1mTpC6tk6BkFP6Wux4nzsuIFQZb1z7uuzMYvmqL88r1XRP8h8uZmhXKA/zh
 GbMu/2BPQFUNQTAA=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmEGO-001rGq-Vw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 11:01:09 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CqL1w3dBCzhnrq
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Dec 2020 19:00:20 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Dec 2020
 19:00:48 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Mon, 7 Dec 2020 20:01:11 +0800
Message-ID: <20201207120114.25642-1-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kmEGO-001rGq-Vw
Subject: [f2fs-dev] [PATCH v3 0/3] f2fs: inline: fix minor bugs in
 f2fs_recover_inline_data
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

Jack Qiu (3):
  f2fs: inline: correct comment in f2fs_recover_inline_data
  f2fs: inline: remove redundant FI_DATA_EXIST set
  f2fs: inline: fix wrong inline inode stat

 fs/f2fs/inline.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
