Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 176F9379D91
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 05:18:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgIuh-0004nv-Rv; Tue, 11 May 2021 03:18:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lgIug-0004nn-Ev
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 03:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k4K15d15QIeoAGQhM1+buAEy8fVKmeqxfmBmNuFn3uI=; b=X3lz9V36XYTqjbUMHJnO+lE7Li
 z9yVW1IT6n88bSZxS/JaJJS4peMij/iR+3+/a6d5bVC7Tw0rwKXiJZcFjtwn/G5gVXrMhvxKF6ZR3
 zeSs5XgbQY4BvToiefglgKJKjG6v0rrisoXyftxHcU2t2b+bMNV/8JU6qlIPEPVBJiao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k4K15d15QIeoAGQhM1+buAEy8fVKmeqxfmBmNuFn3uI=; b=QEmSXI1N7xF7KeFHAa/Zd7B0Wp
 qa3h06CCwweDnilSZ11bhhK9quus8CVZ0vfyNHpWF51GCl2llSUsZ3PK8ssaA293jNJ7i1qfr9UnM
 YAP7MUd4Qi6xJAc24umrBmlcaIuC8TYAo2W4uDRiHG9XxfYe2HH08aelnn/VlURHoaig=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgIuY-0006v7-J4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 03:18:27 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfNN02q3Fz1BLB4;
 Tue, 11 May 2021 11:15:28 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 11 May
 2021 11:18:05 +0800
To: Seung-Woo Kim <sw0312.kim@samsung.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <CGME20210510085419epcas1p1e16c3966fc1b7b9f28a797eaa588f3ba@epcas1p1.samsung.com>
 <20210510085726.12663-1-sw0312.kim@samsung.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9d2ea472-59c8-2a83-a7be-620635d00c4e@huawei.com>
Date: Tue, 11 May 2021 11:18:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210510085726.12663-1-sw0312.kim@samsung.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lgIuY-0006v7-J4
Subject: Re: [f2fs-dev] [PATCH 1/2] fsck.f2fs: fix memory leak caused by
 fsck_chk_orphan_node()
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

On 2021/5/10 16:57, Seung-Woo Kim wrote:
> With invalid node info from fsck_chk_orphan_node(), orphan_blk
> and new_blk are not freed. Fix memory leak in the path.
> 
> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
