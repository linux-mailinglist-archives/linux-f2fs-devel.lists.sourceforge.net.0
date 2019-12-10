Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CBB11804D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Dec 2019 07:20:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieYsm-0001jk-5l; Tue, 10 Dec 2019 06:20:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ieYsl-0001jY-6X
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Dec 2019 06:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L7ZwI6NAWYN/6ImDQ5QsmsHRNlvio44LSOG15Rs9RsY=; b=mKgun5RS6CYvRv3p+mMv67T6Ky
 vDZrcTi1FxFchSIX5tIUYnHhIheJWUmULFhCE6hUUu4v7sUqG3wtMMqqCDMJal5SzOhLPENOCi3cy
 Y6LAXX4lzkv6+bMbi6RzGkz5binhdC5nzG4vjHGPFamVIJ4Q0VKPH05ki0Mxt65bbHR0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L7ZwI6NAWYN/6ImDQ5QsmsHRNlvio44LSOG15Rs9RsY=; b=UqOit+7Q3jTVrUlV38fd2bNDgq
 yb7ctCZE7/gd8xUxIoVa/z2Axabv9GBAeEd9KIG44nrEd0w+dT8PMV7bdkyAkmHpVyBvp0nyRQMM9
 1wef2pNAt3kbyUMzOMlySshEGDdNZRK2ol0loRnt/QiYlJCvkhRr0rsea0lrRPBC+Jog=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieYsh-00G8qN-2j
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Dec 2019 06:20:27 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C5BBAE8131B8A882445F;
 Tue, 10 Dec 2019 14:20:15 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 10 Dec
 2019 14:20:11 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20191209222345.1078-1-jaegeuk@kernel.org>
 <20191209222345.1078-2-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0668612e-678c-e434-277b-d393b9933250@huawei.com>
Date: Tue, 10 Dec 2019 14:20:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191209222345.1078-2-jaegeuk@kernel.org>
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
X-Headers-End: 1ieYsh-00G8qN-2j
Subject: Re: [f2fs-dev] [PATCH 2/6] f2fs: declare nested quota_sem and
 remove unnecessary sems
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

On 2019/12/10 6:23, Jaegeuk Kim wrote:
> 1.
> f2fs_quota_sync
>  -> down_read(&sbi->quota_sem)
>  -> dquot_writeback_dquots
>   -> f2fs_dquot_commit
>    -> down_read(&sbi->quota_sem)
> 
> 2.
> f2fs_quota_sync
>  -> down_read(&sbi->quota_sem)
>   -> f2fs_write_data_pages
>    -> f2fs_write_single_data_page
>     -> down_write(&F2FS_I(inode)->i_sem)
> 
> f2fs_mkdir
>  -> f2fs_do_add_link
>    -> down_write(&F2FS_I(inode)->i_sem)
>    -> f2fs_init_inode_metadata
>     -> f2fs_new_node_page
>      -> dquot_alloc_inode
>       -> f2fs_dquot_mark_dquot_dirty
>        -> down_read(&sbi->quota_sem)
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
