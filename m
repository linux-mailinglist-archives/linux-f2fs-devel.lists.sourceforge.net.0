Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3102F453A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Jan 2021 08:33:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzaea-0005Bd-OQ; Wed, 13 Jan 2021 07:33:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kzaeZ-0005BW-85
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Jan 2021 07:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yQFkPKJTUfOIL2IPH2EsTD58WtyhfEeDqrtYYi8Kjas=; b=DDQI62yLWGY/gItqiJMiIxgqkg
 TEpXDaPEXG/+cD+ZQ59nWVKu9r+1vCS35P+REfs4e+zhmkxz/+FYr/qrhAZFNo50fx1MI4/x3ho0g
 fqaLivf8qn47Tpr/Ilsl7HsxKpmihFXvuCnttQzxPi3rdZwjY8i97c06XkkvYcqzrPEM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yQFkPKJTUfOIL2IPH2EsTD58WtyhfEeDqrtYYi8Kjas=; b=SD60prvF5U43ChiGmUvFdEVu/s
 +tWkjsFLBjz+xAa797kzD646+yMdFO8jSfetqiC2c1THE3pJgB6ty2jfiX8NxjyW64lylDGjq1dr5
 QSRyqTcqLsi7pCrtiqoPf8CECj7yQ+ZDm24jmXh35XN7aEtnWDy2t20EmD0rre/O/ny4=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzaeP-007mvs-3b
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Jan 2021 07:33:15 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DFzds1ZdRzMH4M;
 Wed, 13 Jan 2021 15:31:29 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 13 Jan
 2021 15:32:41 +0800
To: Chengguang Xu <cgxu519@mykernel.net>, <jaegeuk@kernel.org>,
 <chao@kernel.org>
References: <1610515314-28505-1-git-send-email-cgxu519@mykernel.net>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <41b0db01-33bc-5fcc-b5f5-8564247e0c32@huawei.com>
Date: Wed, 13 Jan 2021 15:32:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1610515314-28505-1-git-send-email-cgxu519@mykernel.net>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kzaeP-007mvs-3b
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to use per-inode maxbytes
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

On 2021/1/13 13:21, Chengguang Xu wrote:
> F2FS inode may have different max size, e.g. compressed file have
> less blkaddr entries in all its direct-node blocks, result in being
> with less max filesize. So change to use per-inode maxbytes.
> 

Suggested-by: Chao Yu <yuchao0@huawei.com>

> Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
