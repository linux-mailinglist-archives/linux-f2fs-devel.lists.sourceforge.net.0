Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E092D552A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Dec 2020 09:17:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1knH8B-00082B-Gf; Thu, 10 Dec 2020 08:16:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1knH89-00081y-Eu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 08:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PpWWo72+Jl0Cxe8DvC0uwThy1sO5KvziThsTt0QkHR0=; b=DqtrFzOKAyRf9qtUOfGx8dLOG2
 At1Dn4V9CXr7LO0rxfyjov+9TjiZvVxORbTI1+byRfPUe81MwuFmGkJY1Iu7wcse/M/Wtp7wTQA4w
 ABUg4ReXodQkQ4pHVxTC1mM30n9PtcfKLxy3p8yxC0FPhCcV2XsawYXph4qqidhPHhWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PpWWo72+Jl0Cxe8DvC0uwThy1sO5KvziThsTt0QkHR0=; b=X9171iJLAGd2YXZDodw7RxmWQ6
 DXexZcLMQvzZxkfOuGJPCasSr690RaVbOjhfqHx9SrwudheyieTRMYYmDlMZiV6vF3rWILnR07nR/
 CvlUwADGngZukbfrNjJFmILs8S9PeQPteoL/PK9xwKPkJ230jDyN4QG3EMa8p5GAWN1Y=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1knH7z-008gr4-0e
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 08:16:53 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cs6Dp6585z7C3l;
 Thu, 10 Dec 2020 16:15:54 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 10 Dec
 2020 16:16:21 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20201208011910.3518929-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <868b629d-fb41-4474-e755-8e456b6121ad@huawei.com>
Date: Thu, 10 Dec 2020 16:16:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201208011910.3518929-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1knH7z-008gr4-0e
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: add compress/decompress commands
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/8 9:19, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added new commands, compress and decompress, to support
> F2FS_IOC_COMPRESS_FILE and F2FS_IOC_DECOMPRESS_FILE.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
