Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFEB2A3F49
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 09:50:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZs1c-0004rP-So; Tue, 03 Nov 2020 08:50:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kZs1Z-0004qU-Px
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 08:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qsbyzQy/SNKZNPnrAV1I0ubh1CF2F1xc8rWy+VybJIw=; b=Lk1v5HoG6EbVkpF4ZWRM2bXEJe
 19Kc4dowRlHJmbQEQzDVyXMyS6LtM6bc7FAVdeMRKZuS4p9tb2sYcKjGYtcxun6UwrxIogwposnKR
 MSy/x4W4m0oTn/MeCXdoBTOrTZsvKlO4Q69VnM1oDyBjkJTgnBQqi5H01AEtie/MQh5w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qsbyzQy/SNKZNPnrAV1I0ubh1CF2F1xc8rWy+VybJIw=; b=XPJbprm8awMY21MbY6pjOWLy6D
 s6CPkz2kiWjNx5WOeFdHS3Y+cogCClysZPHmXikq8BIz4pjQQeXfe6QaiS0AKxrOatkNbD6OwsZDU
 yzFEo3OxyPARMhjiiMjotWPScM761XHHNSt4OdWG5/3OTmEVCV301ZjZrVZKd+SrehwQ=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZs1T-007Ugq-4i
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 08:50:41 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQNGm0GWrzLt4H;
 Tue,  3 Nov 2020 16:28:48 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 3 Nov 2020
 16:28:50 +0800
To: <daejun7.park@samsung.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "chao@kernel.org" <chao@kernel.org>
References: <CGME20201103064039epcms2p30ecac0e7cefff0d50745f2e2e61ce38e@epcms2p3>
 <20201103064039epcms2p30ecac0e7cefff0d50745f2e2e61ce38e@epcms2p3>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <609445f8-de3b-eb79-449c-020125799449@huawei.com>
Date: Tue, 3 Nov 2020 16:28:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201103064039epcms2p30ecac0e7cefff0d50745f2e2e61ce38e@epcms2p3>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kZs1T-007Ugq-4i
Subject: Re: [f2fs-dev] [PATCH] f2fs: change write_hint for hot/warm nodes
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
Cc: yongmyung lee <ymhungry.lee@samsung.com>,
 Jieon Seol <jieon.seol@samsung.com>, Sang-yoon Oh <sangyoon.oh@samsung.com>,
 Sung-Jun Park <sungjun07.park@samsung.com>,
 Mankyu PARK <manq.park@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Keoseong Park <keosung.park@samsung.com>,
 SEUNGUK SHIN <seunguk.shin@samsung.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Jinyoung CHOI <j-young.choi@samsung.com>,
 Jaemyung Lee <jaemyung.lee@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/3 14:40, Daejun Park wrote:
>>From 818a76a9aee5bf225565264274d211edb07bae7d Mon Sep 17 00:00:00 2001
> From: Daejun Park <daejun7.park@samsung.com>
> Date: Tue, 3 Nov 2020 15:30:26 +0900
> 
> 
> In the fs-based mode of F2FS, the mapping of hot/warm node to
> WRITE_LIFE_NOT_SET should be changed to WRITE_LIFE_SHORT.
> 
> As a result of analyzing the write pattern of f2fs using real workload,
> hot/warm nodes have high update ratio close to hot data.[*]
> However, F2FS passes write hints for hot/warm nodes as WRITE_LIFE_NOT_SET.
> 
> Furthermore, WRITE_LIFE_NOT_SET is a default value of write hint when it is
> not provided from the file system.
> In storage, write_hint is used to distinguish streams (e.g. NVMe).
> So, the hot/warm node of F2FS is not distinguished from other write_hints,
> which can make the wrong stream seperation.
> 
> * Liang, Yu, et al. "An empirical study of F2FS on mobile devices." 2017
> IEEE 23rd International Conference on Embedded and Real-Time Computing
> Systems and Applications (RTCSA).

Could you please update Documentation/filesystems/f2fs.rst as well?

Thanks,

> 
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> ---
>   fs/f2fs/segment.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 1596502f7375..7b42bb10c6c3 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3208,7 +3208,7 @@ enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
>   				return WRITE_LIFE_EXTREME;
>   		} else if (type == NODE) {
>   			if (temp == WARM || temp == HOT)
> -				return WRITE_LIFE_NOT_SET;
> +				return WRITE_LIFE_SHORT;
>   			else if (temp == COLD)
>   				return WRITE_LIFE_NONE;
>   		} else if (type == META) {
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
