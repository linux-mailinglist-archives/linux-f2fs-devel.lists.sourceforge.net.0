Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E87AA376301
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 May 2021 11:46:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lex3U-0007Rh-CJ; Fri, 07 May 2021 09:45:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1lex3S-0007RZ-HT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 May 2021 09:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KKE/qGqPTR9KTCsbAHM0BFFI5Dm7gcVPGwrFuI7x75s=; b=Ep4iWt/i5VSrHsltgxINUe/ZF1
 TPeOPp2XhGsqp3b52QOfglrTf2swCW8B6ZYtvkhRwjzZE2O1eO13TCx7h/S/Zw3mnGZh16eTf2aTS
 +13taPdOUnl1MQ16PEB34C44ePDb9dGcUI5B71uaTyA9+mK5x59L8sFVT9FTiCKc3/M4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KKE/qGqPTR9KTCsbAHM0BFFI5Dm7gcVPGwrFuI7x75s=; b=R
 NnCsNckBHJZ23Gv/tO1B26Tlb2l2sQOcgWuW1ZiMdntaxep79Wybfdsb6JfVra2ZEyY9djn/Vnng9
 fK2agtTdfgaP5j2AwUluXk41dbBy6vS45sNmJMSzIYCs4/TC3SUjqcPcFIeFtB5AfEvpxX935onw1
 YSzwnhXjYI+DImIQ=;
Received: from mail-m17657.qiye.163.com ([59.111.176.57])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lex3O-009MJv-RT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 May 2021 09:45:56 +0000
Received: from SZ-11126892.vivo.xyz (unknown [58.250.176.229])
 by mail-m17657.qiye.163.com (Hmail) with ESMTPA id C136328009A;
 Fri,  7 May 2021 17:45:42 +0800 (CST)
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  7 May 2021 17:44:54 +0800
Message-Id: <20210507094455.1695-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.29.2.windows.2
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGRhLH1ZMGB8aTU8ZHkpLHRpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oio6Dio4TT8QQjotTCEMAyo*
 ATkwCw5VSlVKTUlLSENLTE9ISUpNVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOS1VKTE1VSUlCWVdZCAFZQUlKSEI3Bg++
X-HM-Tid: 0a794637f4fdda03kuwsc136328009a
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lex3O-009MJv-RT
Subject: [f2fs-dev] [PATCH v4] f2fs: compress: avoid unnecessary check in
 f2fs_prepare_compress_overwrite
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

when write compressed file with O_TRUNC, there will be a lot of
unnecessary check valid blocks in f2fs_prepare_compress_overwrite,
especially when written in page size, remove it.

This patch will not bring significant performance improvements, I test
this on mobile phone, use androbench, the sequential write test case was
open file with O_TRUNC, set write size to 4KB,  performance improved
about 2%-3%. If write size set to 32MB, performance improved about 0.5%.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cf935474ffba..b9ec7b182f45 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3303,9 +3303,17 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (f2fs_compressed_file(inode)) {
 		int ret;
+		pgoff_t end = (i_size_read(inode) + PAGE_SIZE - 1) >> PAGE_SHIFT;

 		*fsdata = NULL;

+		/*
+		 * when write pos is bigger than inode size ,f2fs_prepare_compress_overwrite
+		 * always return 0, so check pos first to avoid this.
+		 */
+		if (index >= end)
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
