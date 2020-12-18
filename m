Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BEA2DDC89
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Dec 2020 02:06:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kq4EF-0007lR-9i; Fri, 18 Dec 2020 01:06:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kq4ED-0007lJ-JH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 01:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JTEVLzIO6rEPanr2dgQVi/ZSGNAoaoz8lHgNYjWfvIY=; b=XVK9jrNx2qeLIEPr5xpzedrO7e
 njUKLgtOAvsfhiLS4DRqQ4DmqpzxYEJnhHG3RHCTUN63rn20c42enAJjpDjoecYVZ8wP6w+4PBc4J
 FBLGrbvQyuuQCAE8rvCm8E57P7qSMsHXzoPhGywH7q6odpN7b31rRICDUYwkBDNrYI0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JTEVLzIO6rEPanr2dgQVi/ZSGNAoaoz8lHgNYjWfvIY=; b=QG2auMME8lbRaGXizmDWqZim1Z
 /0kY+4SoARkFMNmGhEupHHSzV4dynkaeAx4OUuYGjMLVzWO/1LUoddMl8X49qNoo9ILFWO8gl8jFB
 5k5p7dJD+QYocfOlP9ETYfZoIzetL+o605PgVI9/htskDAzPckwHhdD9iUQQv72SPRTI=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kq4E0-000ip0-16
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 01:06:41 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CxrJX67dXz7C3S;
 Fri, 18 Dec 2020 09:05:32 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 18 Dec
 2020 09:06:05 +0800
To: Satya Tangirala <satyat@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>
References: <20201217151013.1513045-1-satyat@google.com>
 <20201217151013.1513045-2-satyat@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <84319aff-1b78-ecbc-635e-bad990ed5d4e@huawei.com>
Date: Fri, 18 Dec 2020 09:06:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201217151013.1513045-2-satyat@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kq4E0-000ip0-16
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs-tools: Introduce metadata
 encryption support
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/17 23:10, Satya Tangirala via Linux-f2fs-devel wrote:
> Introduce native metadata encryption support for f2fs. All blocks
> other than the super block (and its redundant copy) are encrypted with the
> specified metadata encryption key and algorithm. The IV for each block is
> its block number in the filesystem.

The same question as kernel side patchset, for node block, why not using its
nid as IV value?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
