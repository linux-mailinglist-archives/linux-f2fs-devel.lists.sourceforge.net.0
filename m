Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F76E3EC450
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Aug 2021 19:59:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mExvr-00010G-PI; Sat, 14 Aug 2021 17:58:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <frank.li@vivo.com>) id 1mExvr-00010A-7C
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Aug 2021 17:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x3jtRuyEgQv9SqEviDew0/kG28jtnwqtsG8Vj3N0txQ=; b=bcbDxe8qGYGRnhd83n5OT0qBa7
 xUhVlrEdPFeBLro/l1PRNsztxYgaqnq/0nSu6iQ1EwtYHa/JBFRWp5aGnz/7lVozuNpGrn0XP2dTE
 PW2bFktKdJz2Hm/ishDqwvQGuo7ypZf0KRQpgpbo0VWICiWEGdnBbC57miLPM/gu7YDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x3jtRuyEgQv9SqEviDew0/kG28jtnwqtsG8Vj3N0txQ=; b=XmlBjAQENMLb11cxLwC5vaFUa7
 pkc3xO0BAogMJaow7SBqtX9FrED9PBM7YYCCespc8yzezOvLqryivFpdsm9Fuio0OaIq+m+CLsR47
 EbhWEu6HA85rj/XDaXkRoXn1T6JCZRcSeTVxPpCL+k1KGTjAYL5w3Nkbr3fRMdw9NdNE=;
Received: from mail-m17636.qiye.163.com ([59.111.176.36])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mExvn-006TwI-66
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Aug 2021 17:58:55 +0000
Received: from comdg01144022.vivo.xyz (unknown [218.104.188.165])
 by mail-m17636.qiye.163.com (Hmail) with ESMTPA id 04E8CC400F1;
 Sun, 15 Aug 2021 01:58:43 +0800 (CST)
From: Yangtao Li <frank.li@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 15 Aug 2021 01:58:40 +0800
Message-Id: <20210814175840.115938-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210814175840.115938-1-frank.li@vivo.com>
References: <20210814175840.115938-1-frank.li@vivo.com>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRkaGU9WSx8aHk0eQkMZSU
 8YVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kxw6Ezo*Pz9DAx8#KzQzDxBK
 CzoKCwpVSlVKTUlDQk1IQklPTk1KVTMWGhIXVR0JGhUQVRcSOw0SDRRVGBQWRVlXWRILWUFZSUpD
 VUpLT1VKQ0NVSk1OWVdZCAFZQUpDT0s3Bg++
X-HM-Tid: 0a7b45d0e8c3d996kuws04e8cc400f1
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.36 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mExvn-006TwI-66
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix description about main_blkaddr node
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Don't leave a blank line, to keep the style consistent
with other node descriptions.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 32df6d16d74f..ff5a8fdadbfc 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -41,8 +41,7 @@ Description:	This parameter controls the number of prefree segments to be
 What:		/sys/fs/f2fs/<disk>/main_blkaddr
 Date:		November 2019
 Contact:	"Ramon Pantin" <pantin@google.com>
-Description:
-		 Shows first block address of MAIN area.
+Description:	Shows first block address of MAIN area.
 
 What:		/sys/fs/f2fs/<disk>/ipu_policy
 Date:		November 2013
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
