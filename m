Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C038922B2CC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jul 2020 17:42:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jydMm-0007cH-L4; Thu, 23 Jul 2020 15:42:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <songfengcn@163.com>) id 1jydMk-0007by-Tv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jul 2020 15:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cvoPYJqfBs3AiOoH7FFE1EUPmvIfgvdWn+p5lETZqz0=; b=UZ09U1BvGxxS0dosre4jMDkm+d
 E2BGzk3rKAwltvlHwm6fAIb/eErRsQfcme3zkxFbBKyw55u/NGb1g4WW56753tu2UO12SjNlz8DnC
 9iyuwrdtqh2/vB7Mpf7j8cVHRi0OiSfK604f5XQ/jODLWpVw5pglJKK7PvAhbO9VE64w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References
 :In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cvoPYJqfBs3AiOoH7FFE1EUPmvIfgvdWn+p5lETZqz0=; b=EZ5jydXGWZQcmyNxyW74qmHTEB
 w8fuDpKLbc4INVOZEXJ2Gq52/2/CR2zBDocxK0sIIHNJHAMBGauEzfUKMoQc3nZG5yTeNtsNdNCnb
 R5y2EE3tC/WtDLVQk77pqB+sq3SFxabNc9P7urGZ5xf+56xsNc0xiybXYtCrETiQzXSI=;
Received: from m1355.mail.163.com ([220.181.13.55])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:DHE-RSA-AES256-SHA:256) (Exim 4.92.2) id 1jydMe-000RYh-OI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jul 2020 15:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=xMGRC
 He842IB2MjNA/wba5wNMl7OGehLFqufBXZfZMU=; b=PG7dIotM/a/AhCfZdZ9Uo
 CHxmGc4ztcnr1y4VtZECAvK1SvWZtCo9e6K4ZG50HQEmQldOWUupa0xbNHIPIRge
 ZP9P2TxfsshbCLZehorUfUGrCGWaTXJo9Dnl0H5jInk3LA0ajqrjVByMst8zK1+t
 lQG5aX2/jJOqXgGKX580A8=
Received: from songfengcn$163.com ( [114.222.189.160] ) by
 ajax-webmail-wmsvr55 (Coremail) ; Thu, 23 Jul 2020 23:26:01 +0800 (CST)
X-Originating-IP: [114.222.189.160]
Date: Thu, 23 Jul 2020 23:26:01 +0800 (CST)
From: "Song Feng" <songfengcn@163.com>
To: "Chao Yu" <yuchao0@huawei.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
In-Reply-To: <20200723102806.9662-1-yuchao0@huawei.com>
References: <20200723102806.9662-1-yuchao0@huawei.com>
MIME-Version: 1.0
Message-ID: <666af139.9663.1737c480519.Coremail.songfengcn@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: N8GowACndMwJrBlfwDhgAA--.59311W
X-CM-SenderInfo: pvrqwwphqju0i6rwjhhfrp/1tbiRAlqW1SIgShn7QAAsD
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (songfengcn[at]163.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [220.181.13.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1jydMe-000RYh-OI
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix use-after-free issue
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

At 2020-07-23 17:28:06, "Chao Yu" <yuchao0@huawei.com> wrote:

>From: Li Guifu <bluce.liguifu@huawei.com>
>
>During umount, f2fs_put_super() unregisters procfs entries after
>f2fs_destroy_segment_manager(), it may cause use-after-free
>issue when umount races with procfs accessing, fix it by relcating
typo issue: relcating -> relocating?
>f2fs_unregister_sysfs().
>
>[Chao Yu: change commit title/message a bit]
>
>Signed-off-by: Li Guifu <bluce.liguifu@huawei.com>
>Reviewed-by: Chao Yu <yuchao0@huawei.com>
>Signed-off-by: Chao Yu <yuchao0@huawei.com>
>---
> fs/f2fs/super.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>index 80cb7cd358f8..bf8bd64c8380 100644
>--- a/fs/f2fs/super.c
>+++ b/fs/f2fs/super.c
>@@ -1175,6 +1175,9 @@ static void f2fs_put_super(struct super_block *sb)
> 	int i;
> 	bool dropped;
> 
>+	/* unregister procfs/sysfs entries to avoid race case */
>+	f2fs_unregister_sysfs(sbi);
>+
> 	f2fs_quota_off_umount(sb);
> 
> 	/* prevent remaining shrinker jobs */
>@@ -1240,8 +1243,6 @@ static void f2fs_put_super(struct super_block *sb)
> 
> 	kvfree(sbi->ckpt);
> 
>-	f2fs_unregister_sysfs(sbi);
>-
> 	sb->s_fs_info = NULL;
> 	if (sbi->s_chksum_driver)
> 		crypto_free_shash(sbi->s_chksum_driver);
>-- 
>2.26.2
>
>
>
>_______________________________________________
>Linux-f2fs-devel mailing list
>Linux-f2fs-devel@lists.sourceforge.net
>https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
please check typo issue for comment: relcating->relocating?
_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
