Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D5420EABE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2020 03:18:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jq4ux-0005Lf-6n; Tue, 30 Jun 2020 01:18:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jq4uv-0005LW-Kd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 01:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ltAHpRVx6jjOSE71rZ47b1LkZG2S2jVlmMudFvMs9Qw=; b=V0LkPtJoYboBZTFgWfu8/VBllZ
 6G8KV/p29RIWJRby0kOsCuHeOl4o8k46vOx/b2/MD6meN8jzilAl8BKCg3KNRKnGYEV2fv4M/pWvi
 O9TAY3ZshV2RJK3wK/lvZ6QoDN4xKqBcuHDiExZCivLU+zDbzbJO1PgtU9Z2gM6CFJB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ltAHpRVx6jjOSE71rZ47b1LkZG2S2jVlmMudFvMs9Qw=; b=RfXujIL3I6Iw5kfPtK/KUGyufD
 CfgCh7gJAbSIBz5D2ocaeJZ6zP0/pIPtrqTMOgUZUBOHO7TGWjqj3UwdxCMqtfOmVORrMzIhHKQGV
 K7IuvsCGQ8xOa036GQeMy23kPyafMPYcB/NoA1pEvHJd5WFRLMuVdxi4ghy2ATLKramE=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jq4ut-005Wtu-EA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 01:18:33 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0C4E0792D763124CADE7;
 Tue, 30 Jun 2020 09:18:22 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 30 Jun
 2020 09:18:21 +0800
To: Eric Sandeen <sandeen@redhat.com>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, Jonathan Corbet <corbet@lwn.net>
References: <c8271324-9132-388c-5242-d7699f011892@redhat.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <31275d10-37c3-db32-9d0d-f78f1dd4fe0d@huawei.com>
Date: Tue, 30 Jun 2020 09:18:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c8271324-9132-388c-5242-d7699f011892@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jq4ut-005Wtu-EA
Subject: Re: [f2fs-dev] [PATCH] doc: cgroup: add f2fs and xfs to supported
 list for writeback
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
Cc: linux-xfs <linux-xfs@vger.kernel.org>, cgroups@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/30 3:08, Eric Sandeen wrote:
> f2fs and xfs have both added support for cgroup writeback:
> 
> 578c647 f2fs: implement cgroup writeback support
> adfb5fb xfs: implement cgroup aware writeback
> 
> so add them to the supported list in the docs.

Thanks for the fix.

> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Acked-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
