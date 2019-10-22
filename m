Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B51F5DFF7F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 10:35:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMpdy-0007WT-EG; Tue, 22 Oct 2019 08:35:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iMpdx-0007VH-4n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 08:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gQCeJmAcX+vGIxaTMZZgwJiUEuwB0KYzk43JUPVmGa8=; b=DKs5540hAV8njzpR/t7aKmON8R
 410aHGVKKO+qj8sTKkwyWKPCvePs9dRqyRNWGbLbYUU+Du1WwH/piznaQEvTCBYmxBGo64O0uG/Cz
 UXJZmM4qA0kVpv0yBC6XGxMnlUT/ORvhTUi4O0DPTwtiy4fghJux8ooecuHFHQDCzoGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gQCeJmAcX+vGIxaTMZZgwJiUEuwB0KYzk43JUPVmGa8=; b=iGk71jOyJYosPH+W7tSZtv9WPJ
 v+8UDyKlEU3k5BKj1E7uEWplSOfXsOvohJPsyD4SemPmqr7WcPJkvIyWubTFbjB0HE2+CWcFpeTC7
 vsvsqedqzFJ4c0mWbZm0jKdrtcjwuzS6uI/bK8zty0bUY7t/mTvRKi2atbdTNLwzhEfQ=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMpdu-00GZUe-1A
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 08:35:53 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B58507510F0CE3AED697;
 Tue, 22 Oct 2019 16:35:42 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 22 Oct
 2019 16:35:41 +0800
To: Randall Huang <huangrandall@google.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
References: <efddfbc3-bd31-b9fb-48de-decb01d01001@huawei.com>
 <20191018065622.66404-1-huangrandall@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <5b27d560-8699-97af-844d-72de8a7a754c@huawei.com>
Date: Tue, 22 Oct 2019 16:35:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191018065622.66404-1-huangrandall@google.com>
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
X-Headers-End: 1iMpdu-00GZUe-1A
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid memory leakage in
 f2fs_listxattr
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/10/18 14:56, Randall Huang wrote:
> In f2fs_listxattr, there is no boundary check before
> memcpy e_name to buffer.
> If the e_name_len is corrupted,
> unexpected memory contents may be returned to the buffer.
> 
> Signed-off-by: Randall Huang <huangrandall@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
