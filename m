Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D03EC0FC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2019 11:06:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQToe-0001es-5s; Fri, 01 Nov 2019 10:06:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iQToc-0001eL-KO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 10:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aGih0enTHD8cCKoeWNvOZZsWAV3ZuUgTmX81bqIw/co=; b=W9Q0bPzt+04nVJKF+NkHUuw1I3
 nqdj+nzO4omO7cuD/2uy308XfYfHjRR9WFyH2w4PezU82bmp/i8YOq2f3SYn7+vQfdH41KAC4QAkj
 3QzcYeG1sdQxdiIiN9tzu/CQEdb3UxABrFmkJmTL5dKpbhYXPgrPMslrJNWlgn8hsd9w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aGih0enTHD8cCKoeWNvOZZsWAV3ZuUgTmX81bqIw/co=; b=Rohj+s9F1mxtj5sA7Riv4OLXci
 B8hNa6Z47JRrYAhk8l5cuNHyWNhOyOP1fezOe/5Md3Wa0zmU01tpjp0D67HdJI4pY0xnNRcZxs72O
 6cFUfQiKDt1syr7/nOW/Q0Wr3axX/1Nm89uIjccPlcS6CrQT6OP/71p5buKReAHCmZMA=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQToa-00DiwI-An
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 10:05:58 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 263B1D67FC4C1998E218;
 Fri,  1 Nov 2019 18:05:49 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019
 18:05:46 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20191029092730.109428-1-yuchao0@huawei.com>
 <20191031160105.GC60005@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <33c09ea0-b521-77b7-dd84-a3ede003a793@huawei.com>
Date: Fri, 1 Nov 2019 18:05:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191031160105.GC60005@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iQToa-00DiwI-An
Subject: Re: [f2fs-dev] [RFC PATCH v2] f2fs: support data compression
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/11/1 0:01, Jaegeuk Kim wrote:
>> +f2fs-$(CONFIG_FS_COMPRESSION) += compress.o
> CONFIG_F2FS_FS_COMPRESSION?

Fixed.

> 
>> +#ifdef F2FS_FS_COMPRESSION
> Do we need this?

Ditto.

> 
>> +bool f2fs_is_compress_backend_ready(struct inode *inode)
>> +{
>> +	if (!f2fs_compressed_file(inode))
>> +		return true;
> #ifdef F2FS_FS_COMPRESSION
>> +	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
> #else
> 	return -EOPNOTSUPP;
> #endif

Ditto, I kept return value as boolean.

> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
