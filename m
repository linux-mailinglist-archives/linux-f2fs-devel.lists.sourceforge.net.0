Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED1F20EB51
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2020 04:10:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jq5jH-0000zE-RL; Tue, 30 Jun 2020 02:10:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jq5jC-0000yU-6u
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 02:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HR5V8grss6hZdNQcTfJ1vgYE9nHisFi4KwlTn4xM+gs=; b=WosG6aT16HF+S9T+xJoLu9jNNk
 jHZPL4WPlIZbRwwW6wDn3fLV1EjKmLRNuVCzhyevoNaITIta0jKGUldeOGGLWIllDFp+YTtJPY63E
 oKzHvvxyE4LT4G/Sv2jgHeL1SP2GeVkLUoC0nh6Tj76ElTuerl7vKME41RYbMcSaCl0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HR5V8grss6hZdNQcTfJ1vgYE9nHisFi4KwlTn4xM+gs=; b=CCvrbfK1fXl19u6X0V5EP3g0gB
 4uTpFK6B87Lga/J5C3g3IbisMCZ+jhkLc/zWJiDI2dGV791TUP4hPx5PQl9r0ANAH5B5PJyIiBs4c
 SkVYmN6J49AMUHfU+ygR5KWvS1aSIxaBGtosNgF/JNJ2llbnGelyGGJbNOP3kKE8ccco=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jq5jA-002Zr9-7z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 02:10:30 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 767F9F4432087A4712BF;
 Tue, 30 Jun 2020 10:10:14 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 30 Jun
 2020 10:10:10 +0800
To: <jaegeuk@kernel.org>
References: <20200625124011.8072-1-fishland@aliyun.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <31f8ff95-ad11-cb1c-fbf8-a9ddd450499d@huawei.com>
Date: Tue, 30 Jun 2020 10:10:10 +0800
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
 for more information. [URIs: aliyun.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jq5jA-002Zr9-7z
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
Cc: Liu Song <fishland@aliyun.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

It looks we merge this patch with below wrong author, better to fix this

Liu Song via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>

On 2020/6/25 20:40, Liu Song via Linux-f2fs-devel wrote:
> stakable/stackable
> 
> Signed-off-by: Liu Song <fishland@aliyun.com>
> ---
>  fs/f2fs/dir.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index d35976785e8c..069f498af1e3 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -779,7 +779,7 @@ int f2fs_do_add_link(struct inode *dir, const struct qstr *name,
>  		return err;
>  
>  	/*
> -	 * An immature stakable filesystem shows a race condition between lookup
> +	 * An immature stackable filesystem shows a race condition between lookup
>  	 * and create. If we have same task when doing lookup and create, it's
>  	 * definitely fine as expected by VFS normally. Otherwise, let's just
>  	 * verify on-disk dentry one more time, which guarantees filesystem
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
