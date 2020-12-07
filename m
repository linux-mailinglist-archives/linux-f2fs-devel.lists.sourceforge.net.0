Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C535E2D0C85
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 10:03:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmCQ5-0005oP-Fw; Mon, 07 Dec 2020 09:02:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1kmCQ3-0005nm-Su
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 09:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zno58vqjJbVfewJ5DUA0b/uuNggJx2/bwif/1vQ03hM=; b=RxQON5Sn4dSFN6w5x6BHHZkaJ5
 jUBsTKL6sEewlshm0cL9ebwg5UQPQAjRdMO93Zh2ZmwA/y3oC9ERQl40yBXybM8YqwA8cw0xD/57D
 9M0d/Y6dcdWbc/8WFMphb6of7ofdt7ehlAq1YfnsqARZNjveBrfZCoE+PJxp6z/ORFXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Zno58vqjJbVfewJ5DUA0b/uuNggJx2/bwif/1vQ03hM=; b=N
 pOZd76A3qvvAuCVslq3NLMb2knUa2tqchzTRZMCjFn3TV7a1Enf2kh808nyZAqPIHmjq4LvJA3+Om
 2sKlXNBMPycPmugYmwWneWlEfuQn1ws84KOqVbT5HAAyN/42aSXs5E0XWmjbPoo+YoYl8yS24LGBv
 XC6pfxHHm+ngNVL4=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmCPy-00582i-P0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 09:02:55 +0000
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4CqHPP2P9Zz52R8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Dec 2020 17:02:01 +0800 (CST)
Received: from DGGEMM423-HUB.china.huawei.com (10.1.198.40) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Mon, 7 Dec 2020 17:02:39 +0800
Received: from DGGEMM513-MBX.china.huawei.com ([169.254.1.120]) by
 dggemm423-hub.china.huawei.com ([10.1.198.40]) with mapi id 14.03.0487.000;
 Mon, 7 Dec 2020 17:02:29 +0800
From: "Qiujie (Jack)" <jack.qiu@huawei.com>
To: "Yuchao (T)" <yuchao0@huawei.com>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [f2fs-dev] [PATCH 2/3] f2fs: inline: set FI_DATA_EXIST improperly
Thread-Index: AdbMdIS9puhLBhNfQ2W57+IHe8yjmw==
Date: Mon, 7 Dec 2020 09:02:29 +0000
Message-ID: <9E81852FD51EDB42A790F24E63A53FC0B223D53E@dggemm513-mbx.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.176.36]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kmCPy-00582i-P0
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: inline: set FI_DATA_EXIST
 improperly
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> On 2020/12/5 15:40, Jack Qiu wrote:
> > Only set FI_DATA_EXIST when f2fs_inode has F2FS_DATA_EXIST.
> >
> > Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
> > ---
> >   fs/f2fs/inline.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c index
> > 0399531efcd3..4ee5b5510593 100644
> > --- a/fs/f2fs/inline.c
> > +++ b/fs/f2fs/inline.c
> > @@ -286,7 +286,8 @@ int f2fs_recover_inline_data(struct inode *inode,
> struct page *npage)
> >   		memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
> >
> >   		set_inode_flag(inode, FI_INLINE_DATA);
> > -		set_inode_flag(inode, FI_DATA_EXIST);
> > +		if (ri->i_inline & F2FS_DATA_EXIST)
> > +			set_inode_flag(inode, FI_DATA_EXIST);
> 
> This was done by recover_inline_flags(). it's fine to just remove
> set_inode_flag(FI_DATA_EXIST)?

Agreed, will fix in V2.

> Thanks,
> 
> >
> >   		set_page_dirty(ipage);
> >   		f2fs_put_page(ipage, 1);
> > --
> > 2.17.1
> >
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
