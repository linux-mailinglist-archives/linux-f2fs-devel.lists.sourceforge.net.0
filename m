Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2960E3B9AD2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jul 2021 05:12:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lz9b0-0000W6-5j; Fri, 02 Jul 2021 03:12:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1lz9ay-0000Vp-9x
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 03:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7aNljRYRAdLKNH4cFPLCiA2delpSC7HZYvdqgMi59kw=; b=OXVNY7PlF1kscWGSKoLW/Ll7tG
 hMVzP3cxv0silTydyBXBeug2GtVeUQd/3oyUGeGKvfK78y3tIG9CXsaSNg9JvWtsRY4JRdjHK5Q4N
 grPclV1R/L7/AohiubN5e4XY8xvicrYhriPtALf0M+Phf42AgtM4zIozudaoubEZRKTE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7aNljRYRAdLKNH4cFPLCiA2delpSC7HZYvdqgMi59kw=; b=b
 5TASu/7IleO5gKhFxCx1R02Yqb1hBU4eH1hzCDJM8hFeZo0vxIy8KcZfo+ZMogjzMNaW0z9TNHB+x
 /eZjEDMbacUvtKy2GHDJ52zRWAgvtXWi3d9hRkWB5NL8d7n1c8Zld9xxkfd8Eu4Uo2rmYKezNGUnK
 78Dud11WzVM6TnZI=;
Received: from mail-m121144.qiye.163.com ([115.236.121.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lz9al-006rTn-Rz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 03:12:00 +0000
DKIM-Signature: a=rsa-sha256;
 b=ioiiS+/NGDQnhVn3QqkbILLYxGKbKONPKA/w1yZSjruKlncVkfw97d1HtiFE7DIqHKmKiLQ4CgUFpy9Z1ITZxlBTqju+WvmkQoN2X+wSvljKK6NF5EyPWRXHf7lhF4mXAq3MTz6yHY31Sun8rwDV+N2UhBsAL1CzfX5LJzqO9CA=;
 c=relaxed/relaxed; s=default; d=vivo.com; v=1;
 bh=7aNljRYRAdLKNH4cFPLCiA2delpSC7HZYvdqgMi59kw=;
 h=date:mime-version:subject:message-id:from;
Received: from comdg01144017.vivo.xyz (unknown [218.104.188.164])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id C482CAC01C2;
 Fri,  2 Jul 2021 11:11:40 +0800 (CST)
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  2 Jul 2021 11:11:38 +0800
Message-Id: <20210702031138.156851-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGk5PTFZPTUJKSE8ZGE1CGUNVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OBg6Hww4HT9LLi0DQx0sKhwX
 TTVPCkNVSlVKTUlOSkJOTktKSUxMVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WUlKQ1VKS09VSkNDVUpNT1lXWQgBWUFKTkxCNwY+
X-HM-Tid: 0a7a65335596b039kuuuc482cac01c2
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
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
X-Headers-End: 1lz9al-006rTn-Rz
Subject: [f2fs-dev] [PATCH v2] f2fs: compress: allow write compress released
 file after truncate to zero
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

We should allow write compress released file after truncate to zero.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/file.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6afd4562335f..684fc2e8d8a4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -740,6 +740,13 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		return err;
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
+	/*
+	 * We should allow write compress released file
+	 * after truncate to zero.
+	 */
+	if (f2fs_compressed_file(inode) && !free_from)
+		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
+
 	if (from != free_from) {
 		err = f2fs_truncate_partial_cluster(inode, from, lock);
 		if (err)
-- 
2.29.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
