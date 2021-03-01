Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B6D328081
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Mar 2021 15:17:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lGjM2-0006RZ-Gb; Mon, 01 Mar 2021 14:16:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <heyunlei@hihonor.com>) id 1lGjLX-0006Mx-To
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Mar 2021 14:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mWRx2rR2LNW/f/TEhGOioYpGXfar6s5bDQ8BzXX4mIk=; b=lED9EK/TWjl3iCT8ElR87mt/oW
 rM+PDpBe5nZHSujso0i459VgZnkggOE7sWms48tJndOd5Is6+pYCbEZ1Wn0J+R3WiOSvIcwG66wOv
 6OPlB377eczy/F+hFPyjQm5W0BBhQIDEeWKTnEOHvd0meXumMmRBMP94Rx7zH4eFMhJg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mWRx2rR2LNW/f/TEhGOioYpGXfar6s5bDQ8BzXX4mIk=; b=QBP7mfvRVMCzP1uPvlF6073of7
 6ki/lsGf0XbOe0mTeC3cVOcgdDN6o88T4rgASBeRx2Bwa2DhbigEeM9S6Oc9M3Wf111e0NfMm09Px
 iUZnOJsRaqW+uI6PxXmr/JRt9zyp5NkWhVsWKY3EjOMFfnxy2Lca3t8p4zCxsSQ3TcVo=;
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net ([165.227.154.27])
 by sfi-mx-2.v28.lw.sourceforge.com with smtp (Exim 4.92.3)
 id 1lGjLI-00046Z-Ep
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Mar 2021 14:16:27 +0000
Received: from pekshcsitd06010.hihonor.com (unknown [198.19.133.5])
 by front-2 (Coremail) with SMTP id DAGowADHkH0h9zxgMuJDAA--.911S2;
 Mon, 01 Mar 2021 22:16:01 +0800 (CST)
From: Yunlei He <heyunlei@hihonor.com>
To: chao@kernel.org,
	jaegeuk@kernel.org,
	ebiggers@kernel.org
Date: Mon,  1 Mar 2021 22:15:06 +0800
Message-Id: <20210301141506.6410-1-heyunlei@hihonor.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: DAGowADHkH0h9zxgMuJDAA--.911S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFW8AFW7KrWxuw1xXFWfAFb_yoW8tr4Dpr
 9xAFWakw48XrW7WwnakF1UZr15Ka48K3yj9as3uwn3uF1kZw1FqFyIyrW0vFW3tFWDXw42
 qr4jkay7Gw1DGw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBG1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2
 jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
 x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWU
 XwAv7VCY1x0262k0Y48FwI0_Jr0_Gr1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x02
 6xCI17CEII8vrVWkCVWkKwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8Erc
 xFaVAv8VW5ur1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
 IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUm0PhUUUUU=
X-CM-SenderInfo: pkh130hohlqxxlkr003uof0z/1tbiAQIJEV3ki2mkXQABs4
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [165.227.154.27 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [165.227.154.27 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lGjLI-00046Z-Ep
Subject: [f2fs-dev] [PATCH v2] f2fs: fsverity: Truncate cache pages if set
 verity failed
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
Cc: linux-fscrypt@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If file enable verity failed, should truncate anything wrote
past i_size, including cache pages.

Fixes: 95ae251fe828 ("f2fs: add fs-verity support")
Cc: <stable@vger.kernel.org> # v5.4+
Signed-off-by: Yunlei He <heyunlei@hihonor.com>
---
 fs/f2fs/verity.c | 47 +++++++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 054ec852b5ea..3aa851affc46 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -158,33 +158,36 @@ static int f2fs_end_enable_verity(struct file *filp, const void *desc,
 		.size = cpu_to_le32(desc_size),
 		.pos = cpu_to_le64(desc_pos),
 	};
-	int err = 0;
+	int err;
 
-	if (desc != NULL) {
-		/* Succeeded; write the verity descriptor. */
-		err = pagecache_write(inode, desc, desc_size, desc_pos);
+	clear_inode_flag(inode, FI_VERITY_IN_PROGRESS);
+	if (!desc)
+		return 0;
 
-		/* Write all pages before clearing FI_VERITY_IN_PROGRESS. */
-		if (!err)
-			err = filemap_write_and_wait(inode->i_mapping);
-	}
+	/* Succeeded; write the verity descriptor. */
+	err = pagecache_write(inode, desc, desc_size, desc_pos);
+	if (err)
+		goto out;
 
-	/* If we failed, truncate anything we wrote past i_size. */
-	if (desc == NULL || err)
-		f2fs_truncate(inode);
+	err = filemap_write_and_wait(inode->i_mapping);
+	if (err)
+		goto out;
 
-	clear_inode_flag(inode, FI_VERITY_IN_PROGRESS);
+	err = f2fs_setxattr(inode, F2FS_XATTR_INDEX_VERITY,
+			    F2FS_XATTR_NAME_VERITY, &dloc, sizeof(dloc),
+			    NULL, XATTR_CREATE);
+	if (err)
+		goto out;
 
-	if (desc != NULL && !err) {
-		err = f2fs_setxattr(inode, F2FS_XATTR_INDEX_VERITY,
-				    F2FS_XATTR_NAME_VERITY, &dloc, sizeof(dloc),
-				    NULL, XATTR_CREATE);
-		if (!err) {
-			file_set_verity(inode);
-			f2fs_set_inode_flags(inode);
-			f2fs_mark_inode_dirty_sync(inode, true);
-		}
-	}
+	file_set_verity(inode);
+	f2fs_set_inode_flags(inode);
+	f2fs_mark_inode_dirty_sync(inode, true);
+
+	return 0;
+out:
+	/* If we failed, truncate anything we wrote past i_size. */
+	truncate_inode_pages(inode->i_mapping, inode->i_size);
+	f2fs_truncate(inode);
 	return err;
 }
 
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
