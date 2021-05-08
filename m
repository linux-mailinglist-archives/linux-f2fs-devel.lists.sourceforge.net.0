Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 129B937701D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 May 2021 08:31:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lfGUs-0000jJ-U2; Sat, 08 May 2021 06:31:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lfGUq-0000jB-DH
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 May 2021 06:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7KAHUoM/ZWMN4NrD5XeBqTZAxyizpihTAqZmmIlbyBE=; b=Aac4I7Et4csFiWH2Wh/Zx+aEGO
 YtErQ6tCOPqo3KhYhfhs0kEYyXMaFCJ8A7S46lPlCAPa9MBbEcfg0KyTVCDRxe5d/n2al5Rlc2HFM
 9JAJrhsEEqk0TH93QPx+sylMokZSxIoCprztNJ+w6aksQsj5wYTdkCxXcJMKXvDDeu6Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7KAHUoM/ZWMN4NrD5XeBqTZAxyizpihTAqZmmIlbyBE=; b=MhC+m98HLMvNOcPCjjYa38bqXB
 mOfDbc65VLp+A0025Qs0ZH76QeiCSYhmw1OuNoRn6VHVIyU3bG+Aq7l6Ke2PQ55RZG7Ih8unOK6Oc
 P+tI+pWtaHldkUTw4QGXdtMbOwOLK/IGdMILeQpjZjY7vxppV+z90pHuGU/kcVNXcKOI=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lfGUh-00078I-Fg
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 May 2021 06:31:28 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FccpD5q5dzkX9C;
 Sat,  8 May 2021 14:28:36 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.498.0; Sat, 8 May 2021
 14:31:12 +0800
To: Seung-Woo Kim <sw0312.kim@samsung.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210507111224.29887-1-sw0312.kim@samsung.com>
 <CGME20210507110917epcas1p4a2d7ebd7e2fd8cc630fdf627ad73a003@epcas1p4.samsung.com>
 <20210507111224.29887-2-sw0312.kim@samsung.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <37005c84-d93e-fd0b-af16-ce9f1260c0f2@huawei.com>
Date: Sat, 8 May 2021 14:31:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210507111224.29887-2-sw0312.kim@samsung.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lfGUh-00078I-Fg
Subject: Re: [f2fs-dev] [RESEND][PATCH 2/2] mkfs.f2fs: fix memory leak in
 not enough segments error path
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
Cc: linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/7 19:12, Seung-Woo Kim wrote:
> In not enough segements error path of f2fs_write_check_point_pack(),
> cp_payload is not freed. Fix the error path.
> 
> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
