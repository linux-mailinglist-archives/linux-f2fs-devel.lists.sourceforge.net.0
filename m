Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC2BBAE49
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Sep 2019 09:05:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iCIPU-0004aj-80; Mon, 23 Sep 2019 07:05:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iCIPT-0004ab-7s
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Sep 2019 07:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ro9rwTZYnKE9SR8LoV5qmNgmw17sPIgWjUsCKWI0zV0=; b=E3PZMUah2puu9mtevpiGbyHaNL
 /BvKkOCExouyVovbxmXTTpoWogT2kTK4Q3YMMIqi0h5LZkydKXx7OFTAnwgeqqLpT2vAMw0QvhQlQ
 PDcErLEHSIHy6ieUV5sBwOaVvvmNrhSbw0uHSB1FgZ5zaz/kXSRZt/fXDcgMvmlRMZIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ro9rwTZYnKE9SR8LoV5qmNgmw17sPIgWjUsCKWI0zV0=; b=hYVZyuiLkct96MTZS1C1Cq1JHG
 now/3hd78raToJhmd/laIuAprmoeljc9YDqv8WcDMRQfBY4lARgTdkh5x7NcCR4DqrYeyIRyJGXB0
 5kFB4Dbxz2DjIlSkQ6ujwKbIZgab6OaRwVD8F5qOnf4fjK/wEhL0o6xbtsKxPKMncoSc=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iCIPP-004u65-VG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Sep 2019 07:05:23 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2B199A78823A2977EAA0;
 Mon, 23 Sep 2019 15:05:13 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 23 Sep
 2019 15:05:04 +0800
To: sunqiuyang <sunqiuyang@huawei.com>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>,
 <jaegeuk@kernel.org>
References: <20190923042235.37286-1-sunqiuyang@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c9ab08c2-cc87-1dbd-694b-e014a2029f9a@huawei.com>
Date: Mon, 23 Sep 2019 15:04:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190923042235.37286-1-sunqiuyang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.0 PDS_TONAME_EQ_TOLOCAL_SHORT Short body with To: name matches
 everything in local email
 -0.9 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iCIPP-004u65-VG
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: check total_segments from devices
 in raw_super
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

On 2019/9/23 12:22, sunqiuyang wrote:
> From: Qiuyang Sun <sunqiuyang@huawei.com>
> 
> For multi-device F2FS, we should check if the sum of total_segments from
> all devices matches segment_count.
> 
> Signed-off-by: Qiuyang Sun <sunqiuyang@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
