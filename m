Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EAC376FFE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 May 2021 08:10:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lfGAr-0001Hu-Nd; Sat, 08 May 2021 06:10:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lfGAq-0001Hn-Lj
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 May 2021 06:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MpD1NWe3ToTY3isRcTVNV5x/sxGOkQlagmGtUChfm6o=; b=cWUuLTSOfloX7Azxr2euu3VNqF
 9V3zABoNXUoGwxKCUNJ6XMW7O5VevkEHzYviDZbEUC52jOmHMoaSCdvud32uM9hFTW7auBRH9CEGD
 AKdj9wXeCCZSyscWAAE9rYCXY+YK9UHT9a/2pusWKSRc1QeuryhoiF6wJ72MUfVf4rgk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MpD1NWe3ToTY3isRcTVNV5x/sxGOkQlagmGtUChfm6o=; b=mnAnGfZ47ztG4/NkeI5fk5SWfZ
 ZOpBq7e7VT7fq7Mt9NgobV0vts1fH3TLR1k+eXL0o2qjbKtcKV/4+nvTsHJEVAc5kw717BseJmlxd
 O2EmUSEYS+bYqOb4aEnJJa+HszRFS2v+H2uPQKeTuX23cP61cGqoYj1OCDOVrm6tdfX8=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lfGAm-00067E-FR
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 May 2021 06:10:49 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FccLK2xw9z1BK8d;
 Sat,  8 May 2021 14:07:53 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.498.0; Sat, 8 May 2021
 14:10:25 +0800
To: Michael Lass <bevan@bi-co.net>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20210501135241.947-1-bevan@bi-co.net>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0a628b3f-7289-c782-a6e6-5c7f5bb9cd92@huawei.com>
Date: Sat, 8 May 2021 14:10:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210501135241.947-1-bevan@bi-co.net>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: bi-co.net]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lfGAm-00067E-FR
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: update kernel version in
 superblock on forced check
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/1 21:52, Michael Lass wrote:
> In 1126e38 (fsck.f2fs: add --{no-}kernel-check to bypass kernel version diff or
> not) the automatic check on a kernel version change was made optional and
> disabled by default on non-Android systems. This also disabled the update of
> the kernel version stored in the superblock if --kernel-check is not given.
> Restore the update in case a full check is forced via -y or -f to properly
> reflect the version in the superblock.
> 
> Signed-off-by: Michael Lass <bevan@bi-co.net>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
