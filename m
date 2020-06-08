Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF87C1F1120
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jun 2020 03:42:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ji6nd-0006ok-KQ; Mon, 08 Jun 2020 01:42:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ji6nW-0006nU-Iq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jun 2020 01:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wH80DpPqKDAOz/+jIrea2LPlGKwcOZZH5ckjq5n44hM=; b=Zyq0odCRra6RCmKJhCEs9iD7LK
 qYTxFobLktC38BSN8td8iJ6HjBfCQKlAzg8HDtDsW8uzlJaOc2q71PwBe+EII9Yiy7HRzsXu5mJ6J
 J7Vzvqh0Sxm0L0VLINl2o9aNe354wdN2cicwFFPi3eMvHtJVTrFGEvcVKKA5o4vCLA4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wH80DpPqKDAOz/+jIrea2LPlGKwcOZZH5ckjq5n44hM=; b=bvTi6Hh7AU/Lus0qUcFSSU5iPd
 l5dYI/jem+Ynytl3L2/dahGGENfVNOJXAseEHQ831kRPigDk/grsRuFGlFWEvB/q1tJk4khiXcF/m
 2dun1YUMGcz5oelsXR5NAVXxkPfFGyTcEDcr+alI+Bt6OgyIPKhmXgwEfTtBWU6VXyRY=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ji6nV-00FYK7-B0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jun 2020 01:41:58 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2B368121B37DE8895072;
 Mon,  8 Jun 2020 09:41:49 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 8 Jun 2020
 09:41:45 +0800
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>
References: <cover.1591137229.git.mchehab+huawei@kernel.org>
 <52f851cb5c9fd2ecae97deec7e168e66b8c295c3.1591137229.git.mchehab+huawei@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <1f9b6b21-4593-8b72-1726-b65a5fd77e10@huawei.com>
Date: Mon, 8 Jun 2020 09:41:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <52f851cb5c9fd2ecae97deec7e168e66b8c295c3.1591137229.git.mchehab+huawei@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ji6nV-00FYK7-B0
Subject: Re: [f2fs-dev] [PATCH 1/2] fs: docs: f2fs.rst: fix a broken table
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/3 6:38, Mauro Carvalho Chehab wrote:
> As reported by Sphinx:
> 
> 	Documentation/filesystems/f2fs.rst:229: WARNING: Malformed table.
> 	Text in column margin in table line 126.
> 
> 	====================== ============================================================
> 	background_gc=%s       Turn on/off cleaning operations, namely garbage
> ...
> 	test_dummy_encryption
> 	test_dummy_encryption=%s
> 	                       Enable dummy encryption, which provides a fake fscrypt
> 	                       context. The fake fscrypt context is used by xfstests.
> 	                       The argument may be either "v1" or "v2", in order to
> 	                       select the corresponding fscrypt policy version.
> 
> This table is now broken, as some texts are bigger than a
> column. While it would be feasible to fix it by adding two extra
> positions at the table, it would still output something wrong,
> as "test_dummy_encryption" would appear on a separate row.
> 
> So, the best solution here seems to remove the table markup.
> 
> The html and PDF output won't be as nice as a table, but it will
> still be reasonable.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
