Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C51A0223609
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jul 2020 09:37:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jwKvn-0000t2-7f; Fri, 17 Jul 2020 07:37:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jwKvl-0000su-3j
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 07:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vBLr7V6KNlt0JF0EVD+QWJABeRUYHtr9XgBveqkDIzk=; b=B/YEMCud0f2e9S5GUwMyadSQmw
 alWJpGAxDgLftTHKSDHlfom9hcVUZhL1N1StWLr+pkYxmI71xA8kT5P7qM8Y0bGcKGIVZSoY5ilfW
 2RowwvN3m8GeHQpL87LaDHmZ5aDrpHkPhJHXz0HnLLjYLxhHaB0psg3MwqbhZ881z3KU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vBLr7V6KNlt0JF0EVD+QWJABeRUYHtr9XgBveqkDIzk=; b=ERGDUVqBOkhh5ZthGvgX24+nvl
 Wf1rn1UQsPSBBWV/bjZGh+osJNGVjFFx+I2j81Z8t/c80YfOoaWpruREUlfMACkX3DcPksF5XiGTJ
 m2klhs+WcSguFYbGJl8VDpPNVrqhuEwWu8in77zctKhzSkTfX4g2qlvYx2Jop1jTKa58=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jwKvj-0074ZT-5r
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 07:37:17 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 417AAD16100E7E4D07E4;
 Fri, 17 Jul 2020 15:37:05 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 17 Jul
 2020 15:37:00 +0800
To: Aravind Ramesh <aravind.ramesh@wdc.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200702155427.13372-1-aravind.ramesh@wdc.com>
 <20200702155427.13372-3-aravind.ramesh@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <5bae3194-9818-8013-9dcd-a95c1497e054@huawei.com>
Date: Fri, 17 Jul 2020 15:37:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200702155427.13372-3-aravind.ramesh@wdc.com>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwKvj-0074ZT-5r
Subject: Re: [f2fs-dev] [PATCH 2/2] fsck.f2fs: validate free seg count on
 zns device
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
Cc: matias.bjorling@wdc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/2 23:54, Aravind Ramesh wrote:
> NVMe Zoned Namespace devices can have zone-capacity less than zone-size.
> Zone-capacity indicates the number of usable blocks in a zone, if
> zone-capacity is less than zone-size, then the segments which start
> at/after zone-capacity are considered unusable. Only those segments
> which start before the zone-capacity are considered as usable and added
> to the free_segment_count and free_segment_bitmap of the kernel.
> 
> Allow fsck to find the free_segment_count based on the zone-capacity and
> compare with checkpoint values.
> 
> Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>

It's better to merge these two related patch into one, otherwise, it
looks good to me.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
