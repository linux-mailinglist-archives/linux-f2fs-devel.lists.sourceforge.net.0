Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B081E5885D1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Aug 2022 04:35:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oJ4E4-0005yw-Vx; Wed, 03 Aug 2022 02:35:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jw5454.kim@samsung.com>) id 1oJ4Dv-0005yk-Cy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Aug 2022 02:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T5VoLQpBcRJo92C2lV7/m8DkQiN/Co1igRSrZP3ut6k=; b=GZx3LehiBsWE4CCVZBrWYC7ySx
 MBgGjjkwB5rsuxAzEycLo6NUenaUSpcWljMohrcAZzOOhiZcUxyB6TrPr6OozGzKhrFMIeN4Upl78
 F3kagRnN2VMnVWJuDBUvzmzpQC/QxglJ/J7V49kZ/ZKtE8meVWn+i6ARRDxeQbetZaY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T5VoLQpBcRJo92C2lV7/m8DkQiN/Co1igRSrZP3ut6k=; b=Jow77iF4KflPC4ux3LCUolwcnL
 iZsgHbqTj0yx+zMHkvrKZZA01oPF3/PF15OMvBss/t50+SCCooKuVtLX1pBOjxSNnP9x0vFGGW74e
 zOHmSxZMkxUDdNuqbpVybDwjDYXNfyTFBi0RgIWSpL6jnH3NYzovI7l7FefSjbKyFTO8=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oJ4Du-00024y-MN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Aug 2022 02:35:04 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220803023451epoutp035236de85cf38fd5284a44d8c2cf90f8f~HtRV_EH2P0974109741epoutp03n
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  3 Aug 2022 02:34:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220803023451epoutp035236de85cf38fd5284a44d8c2cf90f8f~HtRV_EH2P0974109741epoutp03n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1659494091;
 bh=T5VoLQpBcRJo92C2lV7/m8DkQiN/Co1igRSrZP3ut6k=;
 h=From:To:Cc:Subject:Date:References:From;
 b=dQwFsqKZzAlLkGcTlBkKB1Q8oPSFKqxwpvUdceKqG1dW9EVXx6S1qB9uME7zjZX4Q
 jmMp+6KEvJL1YyCPU+aYGx+gKDRFDTbh238nYrgD+Pin8ASPqw5ZIUKPStDHN1l1w6
 segL42wjHhkgaO3Yh8nhKiyBV5GFUxNTIUdq9n+4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20220803023451epcas1p4bef07360d1c599a2c2da0bc634829db1~HtRVgqxGR3091330913epcas1p4n;
 Wed,  3 Aug 2022 02:34:51 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.38.247]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4LyGCt5Xx6z4x9Ps; Wed,  3 Aug
 2022 02:34:50 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 79.DE.09633.ACED9E26; Wed,  3 Aug 2022 11:34:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20220803023449epcas1p4a9b09cdc73878c8ee40ae10523279dc3~HtRT_BUNs2254422544epcas1p4c;
 Wed,  3 Aug 2022 02:34:49 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220803023449epsmtrp174cf5728076bd9e7ce9959424629ea3d~HtRT9XqWP2673726737epsmtrp1s;
 Wed,  3 Aug 2022 02:34:49 +0000 (GMT)
X-AuditID: b6c32a36-075ff700000025a1-0e-62e9deca3170
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 6E.1C.08802.9CED9E26; Wed,  3 Aug 2022 11:34:49 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.99.247]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220803023449epsmtip172e1d9b7dead092cb5252dd3e06a8c47~HtRT1ZRlc0481204812epsmtip1r;
 Wed,  3 Aug 2022 02:34:49 +0000 (GMT)
From: Jaewook Kim <jw5454.kim@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Wed,  3 Aug 2022 11:34:31 +0900
Message-Id: <20220803023431.30214-1-jw5454.kim@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDKsWRmVeSWpSXmKPExsWy7bCmge6pey+TDK6u17Y4PfUsk8WT9bOY
 LQ5eOcJosfLKbxaLS4vcLS7vmsNmseXfEVaLGfufsjtweGxa1cnmsXvBZyaPvi2rGD0+b5IL
 YInKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBukJJ
 oSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BWoFecmFtcmpeul5daYmVoYGBkClSY
 kJ3x+t85toJt/BWvlz5nb2C8x9PFyMkhIWAicb75CmsXIxeHkMAORonJr0+zQDifGCWezZjB
 DOF8ZpS4MWk5E0zLpu+PoFp2MUqs7P7BAld14stURpAqNgEtiTPtv8A6RATUJU5NWsoCYjML
 7GOUePWzHsQWFgiWmL/lDFicRUBV4vT/g+xdjBwcvALWEkuO6EAsk5dYveEA2BUSApvYJQ58
 bIO6wkVixrQbrBC2sMSr41vYIWwpiZf9bVB2tkT7q0ksEHaBxOYdd5lB5ksI2Eu8v2QBYjIL
 aEqs36UPUaEosfP3XEaIK/kk3n3tYYWo5pXoaBOCKFGROH5nBQvMonUPtzJC2B4Sv7o2s4GU
 CwnESnzYKzSBUXYWwvwFjIyrGMVSC4pz01OLDQuM4FGUnJ+7iRGcrLTMdjBOevtB7xAjEwfj
 IUYJDmYlEd47Ls+ThHhTEiurUovy44tKc1KLDzGaAgNrIrOUaHI+MF3mlcQbmlgamJgZmVgY
 WxqbKYnzrpp2OlFIID2xJDU7NbUgtQimj4mDU6qBKfQiw/bKF02C3kY/ns/cWLD2jM1WXrYN
 V6XbJIxVD5mnn9Z+tvDYh9LrSV/KP8zuf9R0hGFjZuIuEVbfnsw7u5MOrFkSw3+sL6n+pm6u
 m5S1hjz/O6tZf7P/OO/1jc5IN+RptNhszr7na+/hYNmJ57qz/licO7Rn+p/PEYK1L5M3pm+c
 lro8snaHALOCW9fqfSc27/ouVWnyZmOTpvmlg6+v3eJUVz7xefNsaakvnILPHj+cXrbhYu6c
 J290DzIv5b39QGLzDOsq7Q4P9+evp8T52O595rTwi6Dx5MZVrJc96xuLqs2DLxZ9kDartmqU
 FH3+dEPppojcW0u+fzx0WC3BYdH20p2mZx/M2xiq26bEUpyRaKjFXFScCAAla9Cv3wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLJMWRmVeSWpSXmKPExsWy7bCSnO7Jey+TDI4elbQ4PfUsk8WT9bOY
 LQ5eOcJosfLKbxaLS4vcLS7vmsNmseXfEVaLGfufsjtweGxa1cnmsXvBZyaPvi2rGD0+b5IL
 YInisklJzcksSy3St0vgynj97xxbwTb+itdLn7M3MN7j6WLk5JAQMJHY9P0RaxcjF4eQwA5G
 ifYFK9ghElIS6zcsZ+pi5ACyhSUOHy6GqPnIKLH8RQsTSA2bgJbEmfZfYLaIgKbEkc6Z7CBF
 zAJHGCVmPO5mBUkICwRKPD6zBWwoi4CqxOn/B9lBhvIKWEssOaIDsUteYvWGA8wTGHkWMDKs
 YpRMLSjOTc8tNiwwykst1ytOzC0uzUvXS87P3cQIDiEtrR2Me1Z90DvEyMTBeIhRgoNZSYT3
 jsvzJCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqYtFui
 1q0UutKXPd1mrY1+zHXNcyXMDOwah+yX/0k+tO3XSwWGXdLaIu9meCQ8V3+vffdld0Fl57sl
 73rPb9t4tPqBX7n830s5zXLGdpbihqsCkz8H82yueKGs+PvI76VKSa0sK6a0pzLa2zF1vb7d
 JlRt/2HxPsddR/i7rOR7E6tSfMV0Knq2hm2825GR1GLXpO478cQ9bT3lJedqzyWfOtasPDXE
 4qaMvbj23+iNapICK0498f68pU8qrSA4xS9skUfw8wido78zk/m+Fzzr+PXjxr7kM44fFkQL
 8dZb3ZzZfdd069YDLMVs/L/X8BpMtJt8r2xFyxbdY37mz/ddKKsIrQnQtHixzjTj/HIlluKM
 REMt5qLiRADyrdjqkAIAAA==
X-CMS-MailID: 20220803023449epcas1p4a9b09cdc73878c8ee40ae10523279dc3
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220803023449epcas1p4a9b09cdc73878c8ee40ae10523279dc3
References: <CGME20220803023449epcas1p4a9b09cdc73878c8ee40ae10523279dc3@epcas1p4.samsung.com>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If a file has FI_COMPRESS_RELEASED, all writes for it should
 not be allowed. However, as of now, in case of compress_mode=user, writes
 triggered by IOCTLs like F2FS_IOC_DE/COMPRESS_FILE are allowed un [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oJ4Du-00024y-MN
Subject: [f2fs-dev] [PATCH] f2fs: do not allow to decompress files have
 FI_COMPRESS_RELEASED
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Jaewook Kim <jw5454.kim@samsung.com>, sj1557.seo@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If a file has FI_COMPRESS_RELEASED, all writes for it should not be
allowed. However, as of now, in case of compress_mode=user, writes
triggered by IOCTLs like F2FS_IOC_DE/COMPRESS_FILE are allowed unexpectly,
which could crash that file.
To fix it, let's do not allow F2FS_IOC_DE/COMPRESS_IOCTL if a file already
has FI_COMPRESS_RELEASED flag.

This is the reproduction process:
1. $ chattr +c ./file
2. $ dd if=/dev/zero of=./file bs=4096 count=2000 oflag=append conv=notrunc
3. $ sync
4. $ do_compress ./file      ; call F2FS_IOC_COMPRESS_FILE
5. $ get_compr_blocks ./file ; call F2FS_IOC_GET_COMPRESS_BLOCKS
6. $ do_compress ./file      ; call F2FS_IOC_COMPRESS_FILE again
7. $ get_compr_blocks ./file ; call F2FS_IOC_GET_COMPRESS_BLOCKS again

You can find compr_blocks has a negative value.

Fixes: 5fdb322ff2c2b ("f2fs: add F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE")

Signed-off-by: Junbeom Yeom <junbeom.yeom@samsung.com>
Signed-off-by: Sungjong Seo <sj1557.seo@samsung.com>
Signed-off-by: Youngjin Gil <youngjin.gil@samsung.com>
Signed-off-by: Jaewook Kim <jw5454.kim@samsung.com>
---
 fs/f2fs/file.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6b1b030830ca..a4713b7e12cb 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3945,6 +3945,11 @@ static int f2fs_ioc_decompress_file(struct file *filp, unsigned long arg)
 		goto out;
 	}
 
+	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
 	if (ret)
 		goto out;
@@ -4012,6 +4017,11 @@ static int f2fs_ioc_compress_file(struct file *filp, unsigned long arg)
 		goto out;
 	}
 
+	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
 	if (ret)
 		goto out;
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
