Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C94AE2F06B8
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Jan 2021 12:50:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyZEX-0000QR-HX; Sun, 10 Jan 2021 11:50:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1kyZEN-0000Pr-8m
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 10 Jan 2021 11:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mxMpmXkWJjwEMdM/O2b4C7lt+bY2lLcCMWNFO28q1tQ=; b=Fu0UHD+iY/O5D8ErkJM8FsyNP1
 b/p6ABlKLQn5DJvAUZ6trbX7efXqQ+rtpFqfG8zKp22t7Jx7I6/g9Z98sjQE5fADRMeVJXO9VgA8n
 HfhNa36JcITTrh1v/M0kKE2kVwFFjFyG+UC4mSWwt5kpUrHlfp8kcw1J1lYuYJ2XYXHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mxMpmXkWJjwEMdM/O2b4C7lt+bY2lLcCMWNFO28q1tQ=; b=Mm++L15HbQ7nyxyaucofKdr77L
 BHFTAUQtHFvFvUxNRpahYmsnSfVXT3eWnmcH+uydONRhmfWi2s9UPGCTwr5UP0DRpENLKpYDL6Ssv
 4XF+AejhhX74Do1Wqp9IWF0uYwaPGGIfqosaTe6gcs+eSSuz9ExM9YySLgyB1KI5sfPs=;
Received: from sender2-pp-o92.zoho.com.cn ([163.53.93.251])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyZE7-00Gfbr-1q
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 10 Jan 2021 11:49:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1610279346; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=L99go08AE3Zef507Jweb6b4QZ/gYRiOB228igUPVeCWA9/GSnXPJNmufU8QhhUvMg+qYpgw2BgoBFtOIgr53NDuODJMyI9wB/6GGj1Qqjdb91u4ljlykSEpO9eBZzoZRghcthvayIxsKxsEltfconUGMuxwbAcEJsCDrV7xcAPQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; 
 t=1610279346; h=Cc:Date:From:Message-ID:Subject:To; 
 bh=mxMpmXkWJjwEMdM/O2b4C7lt+bY2lLcCMWNFO28q1tQ=; 
 b=ngQIEPxiANpQRUrbdJi2mdePchI/4YtyCQiuskAJmRBc3dUEuAvvDO4xFNlJqtseqywrsDfTTp2SF/hrWbLObGufNkieQ9+ROEH90/Yb1zmmDn/ZbziaPFex5fqRcHRcEIlyqXSyT9TTltnpON8Egi5Y1pDQj1yI3SFYkVvEyt0=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1610279346; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=From:To:Cc:Subject:Date:Message-Id;
 bh=mxMpmXkWJjwEMdM/O2b4C7lt+bY2lLcCMWNFO28q1tQ=;
 b=BTUlSIw8t6aG2NoATt6V0JLyaDB5CNHV45KJMRGkQzXs0SEzYngtoHaZuNDL5Zxz
 EuKfwoxrWnJ0WvYXNP+RYLDwia5++BoY1NHVCkx0AEATgkT8D5tq75ACquMflN2HPZZ
 MbPo+2HSgKxaSWGCB1m/yYdgrdgkNRsVVEPkffBQ=
Received: from VM-144-5-centos.localdomain (159.75.205.129 [159.75.205.129])
 by mx.zoho.com.cn with SMTPS id 1610279344385182.4112417494863;
 Sun, 10 Jan 2021 19:49:04 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 10 Jan 2021 19:48:49 +0800
Message-Id: <1610279329-5733-1-git-send-email-cgxu519@mykernel.net>
X-Mailer: git-send-email 1.8.3.1
X-ZohoCNMailClient: External
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mykernel.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kyZE7-00Gfbr-1q
Subject: [f2fs-dev] [RFC PATCH] f2fs: using generic_file_llseek() instead of
 generic_file_llseek_size()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

generic_file_llseek_size() is used for filesystems that have
a custom maximum size and a custom EOF position. so it's better
to replace it using generic_file_llseek().

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
---
 fs/f2fs/file.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f585545..2ca22ea 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -480,15 +480,11 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 
 static loff_t f2fs_llseek(struct file *file, loff_t offset, int whence)
 {
-	struct inode *inode = file->f_mapping->host;
-	loff_t maxbytes = inode->i_sb->s_maxbytes;
-
 	switch (whence) {
 	case SEEK_SET:
 	case SEEK_CUR:
 	case SEEK_END:
-		return generic_file_llseek_size(file, offset, whence,
-						maxbytes, i_size_read(inode));
+		return generic_file_llseek(file, offset, whence);
 	case SEEK_DATA:
 	case SEEK_HOLE:
 		if (offset < 0)
-- 
1.8.3.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
