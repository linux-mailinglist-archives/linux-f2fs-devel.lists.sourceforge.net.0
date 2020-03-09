Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EAD17DACD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Mar 2020 09:25:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jBDin-0005jk-So; Mon, 09 Mar 2020 08:25:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jBDik-0005ja-9q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Mar 2020 08:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hQYstR71oyoQihF9MrsLD3D1v0/LUYEXKiVVhl041e4=; b=kqY8+XNaSvJtE04IzbFeRvBReK
 S+2BAT+pkWdzr4q6RDiZ5zBzQupmzbq9QkkHY5n6FSQnGya4jqKZOUwc68XvDHuK6J5BCDMBNUQTe
 JlkcFergcY/l2A5wlTEY6fKha4OgNYA8VRs5GmMwwxCTjS0yhN6MgTo4zIH/efabI87o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hQYstR71oyoQihF9MrsLD3D1v0/LUYEXKiVVhl041e4=; b=HjTDV3BF04zVb9MFvVyVl/VYLY
 bgdKeFyKW1uQpEGhlnibQH7FzTkxCs81LhbeiLZ2jo5w8uo50wSGcxphhP0kSVGvPgI2GE6yQp8Uq
 tyLY/QPjlwu8wY3Miiyygk2j3OpTpVtgT3jV26Q6fxSDSWa9wUhQVkNaUdy0o53bWQBE=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jBDif-006Qa4-Lo
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Mar 2020 08:25:06 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 38DD2BE6200921C94290;
 Mon,  9 Mar 2020 16:24:50 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 9 Mar 2020
 16:24:49 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200305234822.178708-1-jaegeuk@kernel.org>
 <20200307002440.GA7944@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <55177f3a-ced2-2954-6f86-4f4f663d4bb8@huawei.com>
Date: Mon, 9 Mar 2020 16:24:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200307002440.GA7944@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jBDif-006Qa4-Lo
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix wrong check on
 F2FS_IOC_FSSETXATTR
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
Cc: kernel-team@android.com, Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/3/7 8:24, Jaegeuk Kim wrote:
> This fixes the incorrect failure when enabling project quota on casefold-enabled
> file.
> 
> Cc: Daniel Rosenberg <drosen@google.com>
> Cc: kernel-team@android.com
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
