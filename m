Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 504B85888E7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Aug 2022 10:54:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oJA8u-0005pu-VA; Wed, 03 Aug 2022 08:54:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jw5454.kim@samsung.com>) id 1oJA8r-0005po-Fn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Aug 2022 08:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:In-Reply-To:Message-Id:Date
 :Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mwN72SokuOWa7+Q4macxm26JHzmXheVlO0sKudZpGr8=; b=hYE+Dbl52dW/q31o64s8eSucVJ
 ExZMVVMp6VC4eE9g0FL7OkuaCsZ0Im6qYji/dbAfd7KOTJpZGiqPH0tSXnDee+ch9wrSiHElJi2y1
 AHvwu3ewLnqy1GkibGyEmas9G8qKKOat9EIfTIAGkMn5QsnCosgJ3ycHMMPasdh0EC2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mwN72SokuOWa7+Q4macxm26JHzmXheVlO0sKudZpGr8=; b=Jyd+afoOyhPmZaDBwBNKjDlOjO
 B28gi6M3W126KBbv0KGEiw4DWpXQUP3+ONk3pvln6Kb8lCqi7pov52B0LOQ0ugA3zHdBZHOd+KJuS
 0P7w2X2Gia7zmpsMTYg7jzo3V+RYPHZq0Wprjkpk9zTKzYJKzJkz43kmE8fd5EXwac/M=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oJA8n-001bZk-TE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Aug 2022 08:54:14 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220803085403epoutp0240b74e8aee14d595456a614cfaa71964~HycbORICA1037610376epoutp02W
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  3 Aug 2022 08:54:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220803085403epoutp0240b74e8aee14d595456a614cfaa71964~HycbORICA1037610376epoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1659516843;
 bh=mwN72SokuOWa7+Q4macxm26JHzmXheVlO0sKudZpGr8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ekA4WzUbcl2XZ+jLWFXf/WCSGWZ7m0LRyI5g/9oI6E/YEE5BF0qDFwsgZmfZ4KKl9
 8N1qbneSODV0cAFqE0AdvoNRqJUMIpfNRxwsQExN+mxsexE0FzlOr/aMTH7TQ8gGys
 GVcMsc6z8v3fr37LZOy/VtBFAC6MdQ0OS0twsUa0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20220803085402epcas1p312ee9ac397b1be17fbb426fad7c38ff8~Hycay2IgI0647806478epcas1p3w;
 Wed,  3 Aug 2022 08:54:02 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.241]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4LyQdQ4K4rz4x9Pr; Wed,  3 Aug
 2022 08:54:02 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 17.0D.09678.AA73AE26; Wed,  3 Aug 2022 17:54:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220803085402epcas1p2a1a70630592fa73f3404ba120c6c1ac8~HycaL7VrM2105221052epcas1p2-;
 Wed,  3 Aug 2022 08:54:02 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220803085402epsmtrp117a45ad3c5cc414187ff9e51c35f7dcd~HycaLMQlZ2535225352epsmtrp1t;
 Wed,  3 Aug 2022 08:54:02 +0000 (GMT)
X-AuditID: b6c32a39-e67ff700000025ce-89-62ea37aadd3d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 15.20.08905.AA73AE26; Wed,  3 Aug 2022 17:54:02 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.99.247]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220803085402epsmtip10afa9e5a862cac0790cbb4ffaec2e2ae~HycaColiK0334803348epsmtip1Y;
 Wed,  3 Aug 2022 08:54:02 +0000 (GMT)
From: Jaewook Kim <jw5454.kim@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Wed,  3 Aug 2022 17:53:58 +0900
Message-Id: <20220803085358.3963-1-jw5454.kim@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <25e501d8a6eb$84cf4090$8e6dc1b0$@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJKsWRmVeSWpSXmKPExsWy7bCmru4q81dJBj2rFS1OTz3LZPFk/Sxm
 i4NXjjBarLzym8Xi0iJ3i8u75rBZbPl3hNVixv6n7A4cHptWdbJ57F7wmcmjb8sqRo/Pm+QC
 WKKybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOArlBS
 KEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgV6BUn5haX5qXr5aWWWBkaGBiZAhUm
 ZGesOuVQcEqwYu+f4AbGTXxdjJwcEgImErPenmHrYuTiEBLYwShx6skqFgjnE6PEjH/dzBDO
 N0aJKavWMsK0zDw4hR0isZdRYueBDqiWz4wSRxseMYNUsQloSZxp/8UEYosIqEucmrSUBcRm
 FtjHKPHqZz2ILSwQJvFn62k2EJtFQFViT/cTMJtXwEriwJVVzBDb5CVWbzgAZnMCxT9umgS2
 WULgFLvE8d4+FogiF4mPx5azQ9jCEq+Ob4GypSRe9rdB2dkS7a8mQdUXSGzecRdoKAeQbS/x
 /pIFiMksoCmxfpc+RIWixM7fcxkhTuaTePe1hxWimleio00IokRF4vidFSwwi9Y93AoNHw+J
 I03XoeHTyyjx+ucS9gmMcrMQNixgZFzFKJZaUJybnlpsWGAKj6/k/NxNjOA0pmW5g3H62w96
 hxiZOBgPMUpwMCuJ8N5xeZ4kxJuSWFmVWpQfX1Sak1p8iNEUGHYTmaVEk/OBiTSvJN7QxNLA
 xMzIxMLY0thMSZx31bTTiUIC6YklqdmpqQWpRTB9TBycUg1Mcu6zXc+2a3iHvVtvVWW2vdfQ
 0iFE65P81+p31/jFdu4QWlKW+mhzaI/ueyvNi7J6kXd6ei0rupUUFTbtldv/+ro9h0266dmP
 OgemPdqkyHl1t+YsljOSGiF7Ixb+sPzdG3HnQMTeP0uZzwrLXXn902HK/e0+fKdu2ERXcN3c
 dozT52+JXFeB3bJuudtNCmlTk5m21qbv0LXQze16Jya3Rz7XZHcKc9WTWZrH2mczJ68sP+/k
 5NB+OevuNNZJRap9bA26emHLzTwP9HBIahS+1svz6iydvMljCXMr94eWR1f+5PXk7wgR+Nn4
 KVEn34H/Vn0bkxOza12IIcfkswGffM57BH1n/zHt0fG7Z5VYijMSDbWYi4oTAUCrRdLsAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprELMWRmVeSWpSXmKPExsWy7bCSnO4q81dJBu2t/Banp55lsniyfhaz
 xcErRxgtVl75zWJxaZG7xeVdc9gstvw7wmoxY/9TdgcOj02rOtk8di/4zOTRt2UVo8fnTXIB
 LFFcNimpOZllqUX6dglcGatOORScEqzY+ye4gXETXxcjJ4eEgInEzINT2EFsIYHdjBKXnwVC
 xKUk1m9YztTFyAFkC0scPlzcxcgFVPKRUaLp+C4WkBo2AS2JM+2/mEBsEQFNiSOdM9lBipgF
 jjBKzHjczQqSEBYIkdjy5DHYAhYBVYk93U/YQGxeASuJA1dWMUMsk5dYveEAmM0JFP+4aRI7
 yGIhAUuJz6cEJzDyLWBkWMUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERxsWpo7GLev
 +qB3iJGJg/EQowQHs5II7x2X50lCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90nYwXEkhPLEnN
 Tk0tSC2CyTJxcEo1MGXukJ7S9HTFhwuW2yUW3XarnXZZRiTXPzpXQ1zd9I3leau92XqzbI9N
 jlTJEp9kN0vw9KI/hQ+mhngsKxdIuL8tekl9pdSkAys+Bm8PuJBjohHqeFfYRdunJjrYLk6B
 qWFW7brtC2Q+r/nBc3XZgvjIXV/tz3lO/tFyyOdH4ea56Ty1fzKfP1169d0ly6zjVl1239f9
 52VeczDQr7d76sG7h18lp5/QerLQbfVL7sWvpVcoqj1+NXeDlPjzeR+YAm9tFFX/sto/fO/0
 awV9Dh8Vd01f9GD145PfvWcdzq2rmbfY6n7ypYO35VXfZaxlsTGcv1Tic7+l0Ge1a/0TucK4
 W3eXBFaaRWVfjdj1zvq5EktxRqKhFnNRcSIANUwfvqUCAAA=
X-CMS-MailID: 20220803085402epcas1p2a1a70630592fa73f3404ba120c6c1ac8
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220803085402epcas1p2a1a70630592fa73f3404ba120c6c1ac8
References: <25e501d8a6eb$84cf4090$8e6dc1b0$@samsung.com>
 <CGME20220803085402epcas1p2a1a70630592fa73f3404ba120c6c1ac8@epcas1p2.samsung.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If a file has FI_COMPRESS_RELEASED, all writes for it should
 not be allowed. However, as of now, in case of compress_mode=user, writes
 triggered by IOCTLs like F2FS_IOC_DE/COMPRESS_FILE are allowed un [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oJA8n-001bZk-TE
Subject: [f2fs-dev] [PATCH v2] f2fs: do not allow to decompress files have
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
1.  $ touch ./file
2.  $ chattr +c ./file
3.  $ dd if=/dev/random of=./file bs=4096 count=30 conv=notrunc
4.  $ dd if=/dev/zero of=./file bs=4096 count=34 seek=30 conv=notrunc
5.  $ sync
6.  $ do_compress ./file      ; call F2FS_IOC_COMPRESS_FILE
7.  $ get_compr_blocks ./file ; call F2FS_IOC_GET_COMPRESS_BLOCKS
8.  $ release ./file          ; call F2FS_IOC_RELEASE_COMPRESS_BLOCKS
9.  $ do_compress ./file      ; call F2FS_IOC_COMPRESS_FILE again
10. $ get_compr_blocks ./file ; call F2FS_IOC_GET_COMPRESS_BLOCKS again

This reproduction process is tested in 128kb cluster size.
You can find compr_blocks has a negative value.

Fixes: 5fdb322ff2c2b ("f2fs: add F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE")

Signed-off-by: Junbeom Yeom <junbeom.yeom@samsung.com>
Signed-off-by: Sungjong Seo <sj1557.seo@samsung.com>
Signed-off-by: Youngjin Gil <youngjin.gil@samsung.com>
Signed-off-by: Jaewook Kim <jw5454.kim@samsung.com>
---
v2:
 - Fix reproduction process and add test enviroment

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
