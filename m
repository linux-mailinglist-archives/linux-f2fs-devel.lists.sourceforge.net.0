Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D20A1E53CC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2020 04:17:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1je87H-0002il-IG; Thu, 28 May 2020 02:17:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1je87F-0002iY-QS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 02:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PLRffL/NiSTR5Xqla5It9g3+LmlTJtD08lTCjMaH0XU=; b=Cm+/79rAq+Egrhz+mKu2P/MVE5
 B7KD6gXuQMb/4FstOtoX2RapdvlUfN5nMNKDYFcxexUONEA1mR66ZiA2F9BSZ76rT/mjUz92pVPAQ
 Y1j+mF6q7HvTESuFsjEt/W2wQsQcbCZAIsugX5vklkCG/g8o3QVl9fPzwN1JjnH6kre8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PLRffL/NiSTR5Xqla5It9g3+LmlTJtD08lTCjMaH0XU=; b=Sorv7QZK2jbULslBfTX/a8plHK
 /L7/SUBmwslz2SOr7Vx2A7cbFKIg9/2F8i5UTa0JP5hhp51tYOp+WHRpy36F+87cr/iagCkc5LNKg
 UAbMYvehTBLCj7vYWEey4VBCjI13Db85MVb0OSVIiqxVG1bUGkGQyTJrpPf9fBKB0hA0=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1je87E-00A85P-3S
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 02:17:53 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C900EC4ADDF2B4F880D7;
 Thu, 28 May 2020 10:17:44 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 28 May
 2020 10:17:42 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200527040231.70891-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e2ecd025-96aa-7f9d-49f7-a821ea18f9dd@huawei.com>
Date: Thu, 28 May 2020 10:17:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200527040231.70891-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1je87E-00A85P-3S
Subject: Re: [f2fs-dev] [PATCH] f2fs: protect new segment allocation in
 expand_inode_data
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/5/27 12:02, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Found a new segemnt allocation without f2fs_lock_op() in
> expand_inode_data(). So, when we do fallocate() for a pinned file
> and trigger checkpoint very frequently and simultaneously. F2FS gets
> stuck in the below code of do_checkpoint() forever.
> 
>   f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
>   /* Wait for all dirty meta pages to be submitted for IO */
>                                                 <= if fallocate() here,
>   f2fs_wait_on_all_pages(sbi, F2FS_DIRTY_META); <= it'll wait forever.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
