Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E612DBD6F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Dec 2020 10:21:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpT05-0003GN-RB; Wed, 16 Dec 2020 09:21:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kpT04-0003GC-Pp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Dec 2020 09:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YhYTj/0W44y8WRzI+bDEx5VIwTf2C3BEZWiEQ1DV3p0=; b=ReWlnM/EeD3N4L0AIAN1YOs59X
 EDI0xq9ywSH8aY/76TDC0Kecp4gEk5ASORzKDet4ssR6upI3XuNXqOytjb2Z0Ig/MaQTcdkTVYHfJ
 Bt8boIBqAVdJZ8lMI5KrUmL+eepf7a2/xQVRsrbRU0Imm2Yu04CQcPtJa+eos9RKt1Rg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YhYTj/0W44y8WRzI+bDEx5VIwTf2C3BEZWiEQ1DV3p0=; b=k9y+2+cKL1GFo/2mmHkIiMEcAE
 XqVOm5+JEzrEvYby0rzukHD7jefi94d2GnguWaAVuU1ITfHPuQ6N/jRmh0mhq1mQBtZu2eyLZFQCl
 Ek+Iv5oNMEhwhoqHJqaZu0Hm94Lhyl9KTE5HGYZzMs4XafmH3rYSaAcllImtoU5WFJ1o=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpSzz-00GBsy-UI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Dec 2020 09:21:36 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CwqNl1cLqzhpq1;
 Wed, 16 Dec 2020 17:20:39 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 16 Dec
 2020 17:21:13 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
References: <1607918093-204-1-git-send-email-guoweichao@oppo.com>
 <3a9ee603-5ad3-8ee5-7dff-d40bd47b3f9b@huawei.com>
Message-ID: <08854b69-717e-672e-de85-f1e41c6edd9e@huawei.com>
Date: Wed, 16 Dec 2020 17:21:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3a9ee603-5ad3-8ee5-7dff-d40bd47b3f9b@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kpSzz-00GBsy-UI
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to set inode->i_mode correctly for
 posix_acl_update_mode
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
Cc: fh@oppo.com, linux-f2fs-devel@lists.sourceforge.net, Bin
 Shu <shubin@oppo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

Do you remember why we use i_acl_mode to store acl related mode?
Can we get rid of it?

Thanks,

On 2020/12/16 17:16, Chao Yu wrote:
> On 2020/12/14 11:54, Weichao Guo wrote:
>> We should update the ~S_IRWXUGO part of inode->i_mode in __setattr_copy,
>> because posix_acl_update_mode updates mode based on inode->i_mode,
>> which finally overwrites the ~S_IRWXUGO part of i_acl_mode with old i_mode.
>>
>> Testcase to reproduce this bug:
>> 0. adduser abc
>> 1. mkfs.f2fs /dev/sdd
>> 2. mount -t f2fs /dev/sdd /mnt/f2fs
>> 3. mkdir /mnt/f2fs/test
>> 4. setfacl -m u:abc:r /mnt/f2fs/test
>> 5. chmod +s /mnt/f2fs/test
> 
> Good catch!
> 
>>
>> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
>> Signed-off-by: Bin Shu <shubin@oppo.com>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
