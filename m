Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F16AA377CA0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 08:57:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lfzqR-0008Uf-GJ; Mon, 10 May 2021 06:56:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=7576b64e4=shinichiro.kawasaki@wdc.com>)
 id 1lfzqP-0008UY-7k
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 06:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gNUjl+PLvbh52ZIam2nXKnIExvP5WzI3JSzcLtP9PeM=; b=TZrQ/KxxKVLT+iG2gcyro4qq5t
 6vxPm7QpA4XI3P8YDCrLjVlM26kgIx9IKT4jwZyfDUaRQFbf0xci+qG/jlKqhpQrbPaMfd4Q7wMYV
 C/3O3JR9/fF5Rm/W6aa9/3YGUUCxMZox5ncPG53IGujefU1CxmwuIvBMmeZd01nvHQA4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gNUjl+PLvbh52ZIam2nXKnIExvP5WzI3JSzcLtP9PeM=; b=T
 E9dI50Iq26N5rRavsrnLCkJPiw874x6MrWzxXGIOSSV65AP3C81UMu6WIoMS/uEjXbiWZpLSakWpu
 ViPi5G8hExlYfHUuLuxLaLSK45LJpMbTsyJdYr530O9JGuXOw26EruoGZGWN+IV5hcZ4rTtoEzBux
 iU11sXz+xUPkiFKs=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lfzqF-0000FG-DS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 06:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620629795; x=1652165795;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D8wz5yzjlc/6HUH0nBu4vS8oCv9LdqMeh3M8Er6BLQA=;
 b=YOJ3CEmkrzmdFJqfNA+v7pMaxnkNsIVTqExu6KDPQgfmNeYQaQTXs84P
 Gn3Zv5bThgR94d8bR1orcvKPgp7geODpyrMx1jAhI6IuBvY5olQudbC7j
 39BpAtfgOJRFOusoQ0ECDQ5AqZv8qOyq2rqWQrTFttYNnr2ssx2EHNITy
 nkvxuaXCk5eNtYJDp2y/RDRPXl39S/eb3yQI8koFioWnwgf9eOxplLeyB
 7v0ltTuaEu5sv8ZzNZ8zFe4HrM5CbGo9w6k8apxCgjC4QvmFXKtovLa+m
 8PSpCA1cEDUFmSm5f0/TbK/lUVr1zfC/IYL80KezahT0pYkKsVKoNG+uf w==;
IronPort-SDR: aQM9FhdOQabwBwMt0qLuQkPNiFPCkg5h7XgcofWeuIrzUdWJNAoQYd2+PKNHKb+3AeQciPCEpo
 42B/To83YDHsKH6I8bxc9ijcFYi5gMiI7fCkfkIXxG4xSBfhTBoCzbFw/FIItKxLai47aHBsaR
 d9+WZuRiEeOWfN76Ngmkv12aS4I3YveoLmJtbkUKdiStdfJY8PZG5J2dcaeF7CHhXTY3pDSuvz
 pngZlrgt/7jy4+4SeSvZaxtGjZHiAy5+ULyFb1tdc4unNHULTLaPpbj5UC6swXE9DynlN9Vo3l
 ZFU=
X-IronPort-AV: E=Sophos;i="5.82,286,1613404800"; d="scan'208";a="167608404"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 May 2021 14:40:58 +0800
IronPort-SDR: 3yo0TNoNi9Kdn/XvOOdHBnC+wtNWLLe+VuVFHWI2qxbe1JcJvTcZLa5mLkRze/7EUmn2ZoOaiZ
 JI/a9sjIYjnJotd986+5jDvHcjIavYfWYFcqdJ0kBkqx5KX7lQ2qZ5M2hBxUKkh8OY/mqB4OMK
 WBTaPP1lnccKRaT+M57+D3nR+MvZR7OqduBC6lk8vxNfnf+uBhAvT1VDq/WmOnnngBhP5gz+4/
 YZ5JTpXO5DgXotZXs103ZDsYYURDsa7Gexc2GznlKH1/brEygBlTvtUfn349Z561XjDFFpA4DR
 oGB6fIzaY3b27q6PUla8ht7h
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2021 23:20:59 -0700
IronPort-SDR: jFleIuy7H9LaMqMJZBrIgoLZydxRjzKw1IKaY+uo+QY386lUll+/CBb+0OWjfTT/eT6Bq6Dg9I
 JCMGaVMlz32hh1qcesOREyrAz6yftY+5XqgtB7ceULGoko3x+oAob2L90l3Ur4iwY+kVujWFs6
 qWgT6uRMGcGdVwBAudq6R5sr0Z3WXMapREBfbFvtIv4yxTuxi8d4w18/uwi7VACvqSSOe5tWG/
 abnoRhvP63lSAo7szZ4ZoKR99pAwP6fhOv0yJqx9scV9g8+WdmoIL+uqYqXvfwthZ5nEOhqH9K
 AVE=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.173])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 May 2021 23:40:59 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 10 May 2021 15:40:57 +0900
Message-Id: <20210510064057.729369-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lfzqF-0000FG-DS
Subject: [f2fs-dev] [PATCH] f2fs: Prevent swap file on zoned block devices
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When f2fs is set up on zoned block devices, swap files on the file-
system causes unaligned write command errors. The kernel writes to the
swap files directly without the assistance of the filesystem then
it can not fulfill sequential write requirements of zoned block devices.

To avoid the errors, prevent swap file activation when the filesystem
enables block zoned device support.

Fixes: 4969c06a0d83 ("f2fs: support swap file w/ DIO")
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: stable@vger.kernel.org # v5.4+
---
 fs/f2fs/data.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 96f1a354f89f..51a832efd8cd 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4050,6 +4050,12 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
 	if (f2fs_readonly(F2FS_I_SB(inode)->sb))
 		return -EROFS;
 
+	if (f2fs_sb_has_blkzoned(F2FS_I_SB(inode))) {
+		f2fs_err(F2FS_I_SB(inode),
+			"Swapfile not supported on zoned block devices");
+		return -EINVAL;
+	}
+
 	ret = f2fs_convert_inline_inode(inode);
 	if (ret)
 		return ret;
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
