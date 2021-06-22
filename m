Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EC13B0346
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jun 2021 13:51:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lvew2-0002DO-V5; Tue, 22 Jun 2021 11:51:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1lvew1-0002DH-Ff
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Jun 2021 11:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lmnRqCUfHYJKiXt1d8BEWW/1eed+RsLOSZB0ZyY64U0=; b=OwSAQ+povS0irvnf0Q9ak20REU
 b7VCvScR8HjbJziVUfahdIa9e+khxtRZ5AZa5PaDiH4zQmH5ONWscwJmtYhrN1g8LweO9RyubdUv4
 aBUUu2FF5Fu1Dbq85PC5rXh8QzY6AHS+hi7VO5w0SWvHNAF7Fc5IL6PUfO0361LUI54k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lmnRqCUfHYJKiXt1d8BEWW/1eed+RsLOSZB0ZyY64U0=; b=H
 loCGv827tNcAhSPqcVXN9m6+g25Z7iIKodThb2KVGmubFGe6ZbjkLDPQ0LPfGnuMSa5cXxPpCDdFx
 CGg7Ox0LBkhVoER19CW8S579qoRuxIZ5fR/Ba7Ca4loUoWP15sb1quqCSA5N8uxcPp5XzrT75jCEl
 LTnnuxgMEqyo/z10=;
Received: from mail-m121144.qiye.163.com ([115.236.121.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lvevr-0006BD-Dl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Jun 2021 11:51:20 +0000
DKIM-Signature: a=rsa-sha256;
 b=ReA4UThI6jfhgxnbqtenDpm+EIRjDwhf+9IpL86in4UiJ+ODPLOWPcvzHCNN//aUiwbLEKni314xn0RgCTiD7tyMfd5ZnRW5M9iOI3lth2zxT7OiJ34G7Dnx5Hkdu32ZWuK/BRhRcu6HuqhGzkii6y62eoRVrAo+R31OfTzpTuk=;
 c=relaxed/relaxed; s=default; d=vivo.com; v=1;
 bh=lmnRqCUfHYJKiXt1d8BEWW/1eed+RsLOSZB0ZyY64U0=;
 h=date:mime-version:subject:message-id:from;
Received: from comdg01144017.vivo.xyz (unknown [218.104.188.164])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id A3F30AC0349;
 Tue, 22 Jun 2021 19:51:01 +0800 (CST)
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 22 Jun 2021 19:50:59 +0800
Message-Id: <20210622115059.24860-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQklLSlZDS01LHUhOTBgYSxhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 JITlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NxA6Axw6Pz9JDD4xFzohORo#
 TDNPChFVSlVKTUlPSE1JTU1JSk9NVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WUlKQ1VKS09VSkNDVUpNT1lXWQgBWUFKTUhMNwY+
X-HM-Tid: 0a7a338f37d0b039kuuua3f30ac0349
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.121.144 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [115.236.121.144 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1lvevr-0006BD-Dl
Subject: [f2fs-dev] [PATCH v2] f2fs: compress: remove unneeded read when
 rewrite whole cluster
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

when we overwrite the whole page in cluster, we don't need read original
data before write, because after write_end(), writepages() can help to
load left data in that cluster.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Acked-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3a01a1b50104..2aeb1196cd5f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3328,6 +3328,9 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,

 		*fsdata = NULL;

+		if (len == PAGE_SIZE)
+			goto repeat;
+
 		ret = f2fs_prepare_compress_overwrite(inode, pagep,
 							index, fsdata);
 		if (ret < 0) {
--
2.29.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
