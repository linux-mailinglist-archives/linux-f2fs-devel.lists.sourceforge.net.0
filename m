Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5752D1FB9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Dec 2020 02:09:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmRVo-0006F2-R2; Tue, 08 Dec 2020 01:09:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmRVn-0006Eo-EJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 01:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OAPxyuiiJk+kuF4VfNpzI4cNiIzyVQqu/RdaPTZdLX0=; b=GExhyEvuMDrBnoQTU43Y/jsjxR
 N1VqcUds6l4Qps9RKEoyPqL2ST1fGK7Y7xth2hKqEnYG417VY3462ooTyUf/v2Vd8eiFuMPr32CTP
 Qglf52yEs4mYNG+rfNTkIXM3hN2WvTM5lpaSlDFG5USNsvh9FPWOKxrFC47s0cA6aqEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OAPxyuiiJk+kuF4VfNpzI4cNiIzyVQqu/RdaPTZdLX0=; b=J7bkh+fmXwOdELoMsr1JbMOzZw
 yTQTxZV02K9Fnh6RZQjs7VhGv37P/txdKxoGcfLYFaDz507I2RKK3KCSQNC6U9LI0zJZrrHqUVLBU
 ocB3qcVUSbKw0EOF4eqCc4opClzt5MDmc/b3vXhtCUhlitwr0UHn79t51i3AMUBqjoOg=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmRVi-005zi9-Tb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 01:09:51 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CqhsC00Hfz7B2B;
 Tue,  8 Dec 2020 09:09:02 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 8 Dec 2020
 09:09:32 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20201207095609.73825-1-yuchao0@huawei.com>
 <X85xlc2Q0gnBywBE@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d7d906c1-a503-b5f0-4eca-d468213242ab@huawei.com>
Date: Tue, 8 Dec 2020 09:09:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X85xlc2Q0gnBywBE@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kmRVi-005zi9-Tb
Subject: Re: [f2fs-dev] [PATCH RESEND] f2fs: compress: deny setting
 unsupported compress algorithm
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/8 2:16, Eric Biggers wrote:
> On Mon, Dec 07, 2020 at 05:56:09PM +0800, Chao Yu wrote:
>> If kernel doesn't support certain kinds of compress algorithm, deny to set
>> them as compress algorithm of f2fs via 'compress_algorithm=%s' mount option.
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>> no changes, just rebase on dev branch.
> 
> This doesn't apply to the dev branch anymore.

Maybe you apply patches with wrong order?

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/log/?h=dev

> 
>>   fs/f2fs/super.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index e0fe72f1d2c8..662e59f32645 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -936,9 +936,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>>   			if (!name)
>>   				return -ENOMEM;
>>   			if (!strcmp(name, "lzo")) {
>> +#ifdef CONFIG_F2FS_FS_LZO
>>   				F2FS_OPTION(sbi).compress_algorithm =
>>   								COMPRESS_LZO;
>> +#else
>> +				f2fs_info(sbi, "Image doesn't support lzo compression");
>> +#endif
> 
> These info messages don't make sense.  It's not the filesystem image that
> doesn't support the algorithm, but rather the kernel that doesn't.
> 
> Also, shouldn't these be warnings instead of "info"?

Correct.

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
