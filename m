Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51291223523
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jul 2020 09:05:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jwKRG-0000SX-Gx; Fri, 17 Jul 2020 07:05:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jwKRF-0000SQ-Hh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 07:05:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UZzWbzfEUAE/8wlqRSMzvP5c781WRZyRo6YRYzJ9mag=; b=ZicIk5K62NKiEuJ0wiaZw7Ssba
 uAV+sL379XeO01uzjBNEC9IUVpyJFRYClwCsTuNMs5WMKbunWD8ynIeetxMhOSeiQe2KMMm46pwZh
 mCaWb9Gt8XcO54cRXq4Nv0hfq0D4pyaLsLMvWuup5166FcQs84AarKF9+5ymVJdJWeBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UZzWbzfEUAE/8wlqRSMzvP5c781WRZyRo6YRYzJ9mag=; b=d4FdY/KxKM7bp6K+CJt5tVn6pG
 e2s5Rd3Yyx/sGlxPBBfzYh2ic0nUMJSd9P5Th83Wm028w4FyJaohkMoZ1uhrYA7LNrfmyt4JQJrlx
 Ecx9Wjz2dBkGWTxBgC1yrlD36Q7+oMMFP71FbeRU1Wpo3cxbXZsew0Rab506SVXmLfy0=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jwKRD-00433L-97
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 07:05:45 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6554D58FBC5CDADFDF01;
 Fri, 17 Jul 2020 15:05:27 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 17 Jul
 2020 15:05:23 +0800
To: Aravind Ramesh <aravind.ramesh@wdc.com>, <jaegeuk@kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>,
 <hch@lst.de>
References: <20200716125656.3662-1-aravind.ramesh@wdc.com>
 <20200716125656.3662-2-aravind.ramesh@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <50e9491f-6d05-1f37-4ea8-05c2ddff97e1@huawei.com>
Date: Fri, 17 Jul 2020 15:05:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200716125656.3662-2-aravind.ramesh@wdc.com>
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
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwKRD-00433L-97
Subject: Re: [f2fs-dev] [PATCH v3 1/1] f2fs: support zone capacity less than
 zone size
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
Cc: niklas.cassel@wdc.com, Damien.LeMoal@wdc.com, matias.bjorling@wdc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/16 20:56, Aravind Ramesh wrote:
> NVMe Zoned Namespace devices can have zone-capacity less than zone-size.
> Zone-capacity indicates the maximum number of sectors that are usable in
> a zone beginning from the first sector of the zone. This makes the sectors
> sectors after the zone-capacity till zone-size to be unusable.
> This patch set tracks zone-size and zone-capacity in zoned devices and
> calculate the usable blocks per segment and usable segments per section.
> 
> If zone-capacity is less than zone-size mark only those segments which
> start before zone-capacity as free segments. All segments at and beyond
> zone-capacity are treated as permanently used segments. In cases where
> zone-capacity does not align with segment size the last segment will start
> before zone-capacity and end beyond the zone-capacity of the zone. For
> such spanning segments only sectors within the zone-capacity are used.
> 
> During writes and GC manage the usable segments in a section and usable
> blocks per segment. Segments which are beyond zone-capacity are never
> allocated, and do not need to be garbage collected, only the segments
> which are before zone-capacity needs to garbage collected.
> For spanning segments based on the number of usable blocks in that
> segment, write to blocks only up to zone-capacity.
> 
> Zone-capacity is device specific and cannot be configured by the user.
> Since NVMe ZNS device zones are sequentially write only, a block device
> with conventional zones or any normal block device is needed along with
> the ZNS device for the metadata operations of F2fs.
> 
> A typical nvme-cli output of a zoned device shows zone start and capacity
> and write pointer as below:
> 
> SLBA: 0x0     WP: 0x0     Cap: 0x18800 State: EMPTY Type: SEQWRITE_REQ
> SLBA: 0x20000 WP: 0x20000 Cap: 0x18800 State: EMPTY Type: SEQWRITE_REQ
> SLBA: 0x40000 WP: 0x40000 Cap: 0x18800 State: EMPTY Type: SEQWRITE_REQ
> 
> Here zone size is 64MB, capacity is 49MB, WP is at zone start as the zones
> are in EMPTY state. For each zone, only zone start + 49MB is usable area,
> any lba/sector after 49MB cannot be read or written to, the drive will fail
> any attempts to read/write. So, the second zone starts at 64MB and is
> usable till 113MB (64 + 49) and the range between 113 and 128MB is
> again unusable. The next zone starts at 128MB, and so on.
> 
> Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
