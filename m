Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB5C20C571
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jun 2020 04:36:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpNB9-0006Ip-Af; Sun, 28 Jun 2020 02:36:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jpNB7-0006Ic-Tb
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 02:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z1Vp/bJWYk7b1oS1Pp6gd2fLoh7c3RqdsjTV0zwczm0=; b=iPacigeW/ODAyUf0mmA7iKC55I
 x515bKoWHt+I3ZL0oywVRpNsjJitKada4QEZ3ybBiIjfNwB+e0GqR8ZHoOfHhkUBXevMI/nBqC3Hm
 qNQLOR0BiDMAeNbqvcVnXEgXMvPk3/O9VgMuS8rS79cZ+fDygOTfjkaeUifUIsWmTiq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z1Vp/bJWYk7b1oS1Pp6gd2fLoh7c3RqdsjTV0zwczm0=; b=EpiXvEXEm7ZHcI2845phWm/jQm
 tN9e3jYbYEJCa+0BSL+2PlZlco7ve4ffMeP75PmlWp+M+//Ulyz66Prm09em7Hv1uJ7Qet5xM97Yq
 p8dIzs7U51cpRtQychGhLeZMHWcSB1jskGbOWNnKy9uDOy+XLC9X1fJqj+0YKfQNQfnk=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpNB5-003n8O-PM
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 02:36:21 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2F3D3E5B1BB10A3D258D;
 Sun, 28 Jun 2020 10:36:08 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sun, 28 Jun
 2020 10:36:04 +0800
To: Liu Song <fishland@aliyun.com>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <20200625124011.8072-1-fishland@aliyun.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e94a9a7c-a2b0-92d2-601e-a0ce6f2ebc84@huawei.com>
Date: Sun, 28 Jun 2020 10:36:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200625124011.8072-1-fishland@aliyun.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jpNB5-003n8O-PM
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix typo in comment of f2fs_do_add_link
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

On 2020/6/25 20:40, Liu Song via Linux-f2fs-devel wrote:
> stakable/stackable
> 
> Signed-off-by: Liu Song <fishland@aliyun.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
