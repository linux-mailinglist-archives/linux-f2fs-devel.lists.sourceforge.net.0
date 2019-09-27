Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E7BFFF4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Sep 2019 09:23:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iDkbD-0003au-JN; Fri, 27 Sep 2019 07:23:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iDkbC-0003an-68
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Sep 2019 07:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iXsCTpE99ZSpLXh8FvXL+YuQbndw8Y4MQy9YlgUQrnY=; b=QP8Js+qZQBlXYjFQOK2+vaYGz6
 kcTkez7FivmbfMp55y3uiQHOuPVcNFMTCANiaetlx+UH5UKYIhb+RGjoL/ySwaisZpB5UAz3eVMWs
 odn1CEtgdJxOoX4aX4eucALCD9x3FfXJoQ+plX+t0CCF823X4OK3aXBOJf9r3o6rEs5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iXsCTpE99ZSpLXh8FvXL+YuQbndw8Y4MQy9YlgUQrnY=; b=PCJRnkxJMsZH2U5Fn/Jfcd8m3v
 5iDs71M/5mp8kremWmwmGzEweC/87KGg7SOu+OGr39IinSpru0Or/thGYKrVr50L71gRE/RxnjoVL
 dOGmEScGaXMauKVoFq9LBTNLNspaDjD+ZrDj1/TjO5Tb7+R+82wQwsfEcBcL7GuzGGn8=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iDkb9-0085ZH-TV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Sep 2019 07:23:30 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E20B1F9514C1464BB5A1;
 Fri, 27 Sep 2019 15:23:20 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 27 Sep
 2019 15:23:18 +0800
To: Chengguang Xu <cgxu519@zoho.com.cn>, <jaegeuk@kernel.org>,
 <chao@kernel.org>
References: <20190927013548.14843-1-cgxu519@zoho.com.cn>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2a261cbe-7999-22cc-83d6-449a72b68729@huawei.com>
Date: Fri, 27 Sep 2019 15:23:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190927013548.14843-1-cgxu519@zoho.com.cn>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: zoho.com.cn]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iDkb9-0085ZH-TV
Subject: Re: [f2fs-dev] [PATCH] f2fs: mark recovery flag correctly in
 read_raw_super_block()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/9/27 9:35, Chengguang Xu via Linux-f2fs-devel wrote:
> On the combination of first fail and second success,
> we will miss to mark recovery flag because currently
> we reuse err variable in the loop.
> 
> Signed-off-by: Chengguang Xu <cgxu519@zoho.com.cn>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
