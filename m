Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8196628C517
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Oct 2020 01:05:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kS6ss-0003Dk-HW; Mon, 12 Oct 2020 23:05:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1kS6sq-0003DS-Kz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Oct 2020 23:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pz4Ui2jCJtClJBIATbfazvgxZ3kq9GUXpMCgGJydrbU=; b=jqjJg+VOngttvpPPyAQ+bYcQ7W
 f5P0i9KnzmCgATIgDUFep5wcg6lKZIqw8htUdJm0hMT6PyGHAKnLfPa28yiROTZydIVrh2DsIuFjE
 bhjVZiVqTIsIjo+TTCs4FATPpP1CD7INKBGU5dPmucJZwKJH4Jwt+mG1tjHdd1qP7X6Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Date:Subject:
 Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pz4Ui2jCJtClJBIATbfazvgxZ3kq9GUXpMCgGJydrbU=; b=bmSUxikU91TGHkhCetqT+KcBSB
 WdN0M9YB+ta/xQMDmy9wo8lnXKfhuJsbSQvoPtiU4vzPjSLFT7k0iuFzgx3ufRQjsZKSMQJx8Z/lg
 fp9pyBVYh/4V5dDG8A1lcdqC6gGkUmQW1jy4mOu6ZHS+tbTjo4m5QjN/fBZ33FPCW/P8=;
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kS6sj-00CjcI-0E
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Oct 2020 23:05:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1602542975; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=EzhfQMOxQwzdoWXX4NZSD0g7MBSU+aX14E6HdEaws+N5gEf1k13rxWCTv3wj5K3/6epqQ8NEx3w3fW4PQPkCGe3w9OCc+K/arhq//p9plwiew26x79+2fWCkr8rTablpysWZkEZKcFe6vuhtWKyVAUWg7FF4jHQfSh2hoevQV+M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1602542975;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=Pz4Ui2jCJtClJBIATbfazvgxZ3kq9GUXpMCgGJydrbU=; 
 b=oUEhXpcEv54YGm1CQcjWvq0jFASjG+3oEtjXzEJSOUSzDdpifGPT+E3hSEDcOQN/TvMFfz5qVpN4lktiDXS2TXbGAeIeblRZ6joDl2F1NyydkBCoyXVVwLzNJObNOsHoLWj8/OfOEWFYEZOSmOp+7FqSVZc76jSnuvUik8QjiP8=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1602542975; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=Pz4Ui2jCJtClJBIATbfazvgxZ3kq9GUXpMCgGJydrbU=;
 b=aNaog3BBY5Qbu4nbe6Jb6PyBlbC+b3hK43hqYjl4WxmPHzmps3CyNAaaJCM3FkLl
 WWIJUpmVB31/2C10AwAel6yn9+9vAU0IHIVOxObNONJ4KAqeUeYscUCsJe88Ta/HJOK
 Yw3hodFgjq379X0wOHvqlfFh6fXtqEU61NUYzHTk=
Received: from localhost.localdomain (116.30.192.239 [116.30.192.239]) by
 mx.zoho.com.cn with SMTPS id 1602542973347717.1793620610222;
 Tue, 13 Oct 2020 06:49:33 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: jaegeuk@kernel.org,
	chao@kernel.org
Message-ID: <20201012224921.3829713-1-cgxu519@mykernel.net>
Date: Tue, 13 Oct 2020 06:49:21 +0800
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-ZohoCNMailClient: External
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [163.53.93.243 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kS6sj-00CjcI-0E
Subject: [f2fs-dev] [PATCH] f2fs: code cleanup by removing unnecessary check
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
Cc: Chengguang Xu <cgxu519@mykernel.net>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_seek_block() is only used for regular file,
so don't have to check inline dentry in it.

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
---
 fs/f2fs/file.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8a422400e824..048c89517001 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -429,9 +429,8 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 		goto fail;
 
 	/* handle inline data case */
-	if (f2fs_has_inline_data(inode) || f2fs_has_inline_dentry(inode)) {
-		if (whence == SEEK_HOLE)
-			data_ofs = isize;
+	if (f2fs_has_inline_data(inode) && whence == SEEK_HOLE) {
+		data_ofs = isize;
 		goto found;
 	}
 
-- 
2.26.2




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
