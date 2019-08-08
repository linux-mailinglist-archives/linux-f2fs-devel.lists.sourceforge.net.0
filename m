Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C141285A60
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Aug 2019 08:18:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hvbkZ-0004I4-Tv; Thu, 08 Aug 2019 06:18:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hvbkZ-0004Hx-5y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Aug 2019 06:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CNiiteIodZ0elgbwLxkMBfWiWkmU7ea6RDN3Bn5cIE4=; b=f8krb2Y1Zha+i/gKIecRUaPrXb
 1rRBzKus2VYRhB84enqe6Tgfblyuy8gXDKZvKWL2guduWNaq59uw+QQF3mpoa4/YrzuGoeDPlG/RN
 fjm+TE5kHjdNVFGb+2dqxTWpdlmhJcLyEkgV849RXjBJtjYb59OCCiIfuERxx0wZbNnc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CNiiteIodZ0elgbwLxkMBfWiWkmU7ea6RDN3Bn5cIE4=; b=mYbEzObQzL63FlVbEwufb4+k9x
 vmZovpCMXzYvNTSEqM6wHWo5V5/aAiw8KbboR4mZPvHF1bjYUUsebVSB9eDLFiH4yRwgIt4+Wszht
 jDwIzt3sJoflFECZF2+YRrt3K2d2ixARl1/sGUnLWs5HhPCr5rVrt0bHzQzDDSUk8v1A=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hvbkW-00EkVg-T5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Aug 2019 06:18:11 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 53A80D5E323807A7AC4A;
 Thu,  8 Aug 2019 14:18:01 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 8 Aug 2019
 14:17:53 +0800
To: YueHaibing <yuehaibing@huawei.com>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <20190808020253.27276-1-yuehaibing@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4e1c457e-621f-e9bd-e625-3a9f27da2277@huawei.com>
Date: Thu, 8 Aug 2019 14:18:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190808020253.27276-1-yuehaibing@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hvbkW-00EkVg-T5
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix build error while CONFIG_NLS=m
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Haibing,

Thanks for the patch!

Out of curiosity, does Hulk Robot check linux-next git repo as well? This will
be more valuable if the bug can be found during development of related patch?

On 2019/8/8 10:02, YueHaibing wrote:
> If CONFIG_F2FS_FS=y but CONFIG_NLS=m, building fails:
> 
> fs/f2fs/file.o: In function `f2fs_ioctl':
> file.c:(.text+0xb86f): undefined reference to `utf16s_to_utf8s'
> file.c:(.text+0xe651): undefined reference to `utf8s_to_utf16s'
> 
> Select CONFIG_NLS to fix this.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 61a3da4d5ef8 ("f2fs: support FS_IOC_{GET,SET}FSLABEL")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
