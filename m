Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4718635919C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Apr 2021 03:46:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lUgDo-000719-Qs; Fri, 09 Apr 2021 01:46:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lUgDn-00070Z-BX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Apr 2021 01:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LUBLkwKDzLXVjmHGWkdQT6ho0sN/B7HGvxxOLSiG7xk=; b=dUY1IsJN3bR9RPq+34UZmgTR2L
 zlXTFEixJa2nCvMGps7qVu4qCyoAUqzpB7K+W2qFkb4eycMjnY+FfQPu0orq5FwWSWW8IKOdfgrdR
 IbiPwlH/9J0ipsuKWUYHXuxbuJ+ZMjt4+Br1IcWdYbwb+2ezYGgdYxLNGYU/9h4HVbSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LUBLkwKDzLXVjmHGWkdQT6ho0sN/B7HGvxxOLSiG7xk=; b=X7thYpPuRoNwJePGuVp+7Vv+zE
 2OJABALi9mhjeX/QQNbgPDzakkGWRerEtUla5C3n/95AAzvw31qCJbwIn7Hyn6bIPpmOw+J/6NC5B
 cKxF0Z50yAgSHorx5Z98JsGu0duxnFeH0HDMa9zmRfaFiO4SnapI4/6IpbRaQswse6DY=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lUgDb-00032a-Le
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Apr 2021 01:46:06 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FGgrh3zMnz9vd4;
 Fri,  9 Apr 2021 09:43:32 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 9 Apr 2021
 09:45:37 +0800
To: Jia Yang <jiayang5@huawei.com>, <linux-f2fs-devel@lists.sourceforge.net>, 
 <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20210408075014.2362887-1-jiayang5@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7abf8d37-82e3-439b-1f21-ec4bebb7b6e7@huawei.com>
Date: Fri, 9 Apr 2021 09:45:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210408075014.2362887-1-jiayang5@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: checkpatch.pl]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lUgDb-00032a-Le
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: Fix inappropriate spaces
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/4/8 15:50, Jia Yang wrote:
> Fix checkpatch.pl check:
> 
> ERROR: spaces required around that ':'
> ERROR: spaces required before the open parenthesis '('
> ERROR: spaces prohibited before that ','
> 
> Signed-off-by: Jia Yang <jiayang5@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
