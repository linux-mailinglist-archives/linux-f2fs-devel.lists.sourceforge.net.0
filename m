Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 565851B951A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2020 04:22:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jStPw-0004vt-NJ; Mon, 27 Apr 2020 02:22:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jStPu-0004vl-Sf
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Apr 2020 02:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fcZjYWKzPHDkEmtbPH4PslJ5P4CsEoJii90AzHOl0nY=; b=GXb8ZcKe/2ayfY7I/2tnWgqK15
 NTnDwIajP/hDEimAnNlUb3Kn81Rppfxs1aanyHIGO70van+CEXDhU9YTKa8Y3RENtee0YMEstr51e
 6u0jrUjcEujr9w+k+L2zG35hhw6y3zeJUKMs3Crdi0XUGQaiGWxS3ajU10J3GiNxm4xE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fcZjYWKzPHDkEmtbPH4PslJ5P4CsEoJii90AzHOl0nY=; b=MLmsiDbm7WYwNJZ3QLyfjBl9xf
 mm26/90yArYBsKOeujlnd7oRFWgT9J+v6AP5nxA/gbvV2RMkyqm+F/WPpK37Ithez5sYEfoQ0CaW+
 m2afyBmT22zbLRMZ1MTtS0INt1BhvmqAccVWqeX/dqDtGr4M4Or4DssR1A8+DT4durs4=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jStPr-00CGom-1S
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Apr 2020 02:22:42 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 800631DA473C558CD577;
 Mon, 27 Apr 2020 10:22:31 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 27 Apr
 2020 10:22:28 +0800
To: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
 <linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200426214925.10970-1-guoqing.jiang@cloud.ionos.com>
 <20200426214925.10970-6-guoqing.jiang@cloud.ionos.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <fc48f93d-b705-4770-0fd0-8807b3a74403@huawei.com>
Date: Mon, 27 Apr 2020 10:22:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200426214925.10970-6-guoqing.jiang@cloud.ionos.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jStPr-00CGom-1S
Subject: Re: [f2fs-dev] [RFC PATCH 5/9] f2fs: use set/clear_fs_page_private
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
Cc: david@fromorbit.com, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/4/27 5:49, Guoqing Jiang wrote:
> Since the new pair function is introduced, we can call them to clean the
> code in f2fs.h.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Chao Yu <chao@kernel.org>
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>

Acked-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
