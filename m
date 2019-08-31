Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 192EAA41BC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Aug 2019 04:34:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3tDQ-0000Yi-G1; Sat, 31 Aug 2019 02:34:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhengbin13@huawei.com>) id 1i3tDO-0000YV-KI
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Aug 2019 02:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RIomFpr2Wb/2kosdYluuJ481wEEorS80o70BHUpPZvw=; b=S6/yYSCj9iZjqvzmv/Or4dRcZz
 Olyzr1qIfDnW9yVOdkogaUk5zAmITypvRepeu8aFnGK7tRM3EGlnINBmzyussY4qK7/Ud/EYl/vsF
 iLwdiNb47uQbQDvbR9kKXkORdfYxdlYjSmm0Z2fCkz8zfJ+qJGJe5LwAmWpcywKPTL7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RIomFpr2Wb/2kosdYluuJ481wEEorS80o70BHUpPZvw=; b=jKxB4wEJiq4v0XT0JXZtQSgppE
 djXfERU21GzylJT2FOzDQljbmatJ7S7xvUXdt5oCBwXAQ1Qxc0IUzEWN/gtKxrbEwJgO3n306Z9oi
 FsL057GMKieLBT0UR/otmeI+M9iuTRzLnTUHBxHytw6Hz+tRaYR+V+cRWuXG0hYcnKbY=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3tDN-004XeD-4a
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Aug 2019 02:34:10 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 03EA3DC61DD375236D0C;
 Sat, 31 Aug 2019 10:34:00 +0800 (CST)
Received: from [127.0.0.1] (10.184.213.217) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0;
 Sat, 31 Aug 2019 10:33:49 +0800
To: Chao Yu <yuchao0@huawei.com>, <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <1567216011-43066-1-git-send-email-zhengbin13@huawei.com>
 <01183b8e-3cbd-d7a9-38b8-320fca43f583@huawei.com>
From: "zhengbin (A)" <zhengbin13@huawei.com>
Message-ID: <bf99e560-ec3d-2360-3286-661172ee2eff@huawei.com>
Date: Sat, 31 Aug 2019 10:33:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <01183b8e-3cbd-d7a9-38b8-320fca43f583@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.184.213.217]
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
X-Headers-End: 1i3tDN-004XeD-4a
Subject: Re: [f2fs-dev] [PATCH] f2fs: Make f2fs_fname_setup_ci_filename
 static
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

On 2019/8/31 10:30, Chao Yu wrote:

> Hi Zheng,
>
> Thanks for the patch, the original patch is still in dev branch, I suggest we
> can merge it into original patch, do you mind that?
Agree with it
>
> Thanks,
>
> On 2019/8/31 9:46, zhengbin wrote:
>> Fix sparse warning:
>>
>> fs/f2fs/dir.c:142:6: warning: symbol 'f2fs_fname_setup_ci_filename' was not declared. Should it be static?
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: zhengbin <zhengbin13@huawei.com>
>> ---
>>  fs/f2fs/dir.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
>> index 9de688a..147fa5a 100644
>> --- a/fs/f2fs/dir.c
>> +++ b/fs/f2fs/dir.c
>> @@ -139,9 +139,9 @@ int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
>>  	return ret;
>>  }
>>
>> -void f2fs_fname_setup_ci_filename(struct inode *dir,
>> -					const struct qstr *iname,
>> -					struct fscrypt_str *cf_name)
>> +static void f2fs_fname_setup_ci_filename(struct inode *dir,
>> +					       const struct qstr *iname,
>> +					       struct fscrypt_str *cf_name)
>>  {
>>  	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
>>
>> --
>> 2.7.4
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>> .
>>
> .
>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
