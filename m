Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBC89569C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2019 07:17:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzwWS-00043c-1W; Tue, 20 Aug 2019 05:17:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gaoxiang25@huawei.com>) id 1hzwWR-00043W-Jh
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 05:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=itDyOzf9ZXdO2waun8fgkDKoPOftBXymzlsnSS0wgJI=; b=hWB/YlqLaxz63yL1+eYn3nsWLW
 BP6uMLJUexb4ZhB5hAotJ+UV9Mp0ChE0Mrc+bmBe5LkfmeUcmsN7WdqgFSDhR9UdUJ2cvaGVVkLCr
 VDIYvlGmqh2DQOQd0YNjZi4dQL9J/L9FVA/8ahR328rIfM+sX3cHE7Kc4SyheBbq+N5k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=itDyOzf9ZXdO2waun8fgkDKoPOftBXymzlsnSS0wgJI=; b=TGdfSu/awVwtQa8zOYd4JoGbi0
 9fcfMISDtshDK94B9Kbsd/7xHCtwHhIJ4xZp9BE39G753t4Q94Cqf7hr4i9O3EIjU5ydg6dut8MKf
 IuH69mvTdINkV5wS1de3zekPGm0V9RjTfgf3sWyXgxN7cfdy/jEFixLBIiHaQLXz37Mg=;
Received: from szxga01-in.huawei.com ([45.249.212.187] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzwWN-00CkBP-Mf
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 05:17:31 +0000
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id 28422F56875F54F8473E;
 Tue, 20 Aug 2019 13:17:14 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 20 Aug 2019 13:17:13 +0800
Received: from architecture4 (10.140.130.215) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 20 Aug 2019 13:17:13 +0800
Date: Tue, 20 Aug 2019 13:16:36 +0800
From: Gao Xiang <gaoxiang25@huawei.com>
To: Chandan Rajendra <chandan@linux.ibm.com>
Message-ID: <20190820051635.GF159846@architecture4>
References: <20190816061804.14840-1-chandan@linux.ibm.com>
 <20190816061804.14840-6-chandan@linux.ibm.com>
 <1652707.8YmLLlegLt@localhost.localdomain>
 <20190820051236.GE159846@architecture4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820051236.GE159846@architecture4>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.140.130.215]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hzwWN-00CkBP-Mf
Subject: Re: [f2fs-dev] [PATCH V4 5/8] f2fs: Use read_callbacks for
 decrypting file data
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
Cc: hch@infradead.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fscrypt@vger.kernel.org, adilger.kernel@dilger.ca,
 chandanrmail@gmail.com, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Aug 20, 2019 at 01:12:36PM +0800, Gao Xiang wrote:
> Hi Chandan,
> 
> On Tue, Aug 20, 2019 at 10:35:29AM +0530, Chandan Rajendra wrote:
> > On Friday, August 16, 2019 11:48 AM Chandan Rajendra wrote:
> > > F2FS has a copy of "post read processing" code using which encrypted
> > > file data is decrypted. This commit replaces it to make use of the
> > > generic read_callbacks facility.
> > > 
> > > Signed-off-by: Chandan Rajendra <chandan@linux.ibm.com>
> > 
> > Hi Eric and Ted,
> > 
> > Looks like F2FS requires a lot more flexiblity than what can be offered by
> > read callbacks i.e.
> > 
> > 1. F2FS wants to make use of its own workqueue for decryption, verity and
> >    decompression.
> > 2. F2FS' decompression code is not an FS independent entity like fscrypt and
> >    fsverity. Hence they would need Filesystem specific callback functions to
> >    be invoked from "read callbacks". 
> > 
> > Hence I would suggest that we should drop F2FS changes made in this
> > patchset. Please let me know your thoughts on this.
> 
> Add a word, I have some little concern about post read procession order

FYI. Just a minor concern about its flexibility, not big though.
https://lore.kernel.org/r/20190808042640.GA28630@138/

Thanks,
Gao Xiang

> a bit as I mentioned before, because I'd like to move common EROFS
> decompression code out in the future as well for other fses to use
> after we think it's mature enough.
> 
> It seems the current code mainly addresses eliminating duplicated code,
> therefore I have no idea about that...
> 
> Thanks,
> Gao Xiang
> 
> > 
> > -- 
> > chandan
> > 
> > 
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
