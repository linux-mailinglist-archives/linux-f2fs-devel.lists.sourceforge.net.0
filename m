Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BE711A04C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2019 01:57:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieqJK-0004ym-VM; Wed, 11 Dec 2019 00:57:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yangtiezhu@loongson.cn>) id 1ieqJI-0004yV-QK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 00:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e+Nwj11ZJAYzMkZ4gunR5WAKatxJ7MzJPCK/Mf6G9sI=; b=EOibTF9PtXtX4w/5UvwVb5L1WB
 pA7UlK9r77U6+ntSvrACfIuMQwHkgtoNBW9QiqaCwWyv/e+GOiWcQzuIC1nT1KpiO06wx/pBH5Mlk
 4j0i8F4AzYbvp129A2nZ11IkhtGPv44IyWRwuzU6A4eE+XhRHB79C1zyR18SNOE4S2Mc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e+Nwj11ZJAYzMkZ4gunR5WAKatxJ7MzJPCK/Mf6G9sI=; b=iFwwG6lOfpquvndN3dHmkadtL4
 PYDdn+zPVcyUDvs7otzr3dP1QwlLl5ZEDmsE/WDCMxTdurV3+w69z/0ZN1Xj7Rj17qZkPJrT1HUtg
 a5+RWSV8ho+6bjAuX2eYegibnFGDv+Lv5X6jFS4VFCHc6tSaUP0hdtqONEno46S2oWkk=;
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1ieqJE-000bvG-1g
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 00:57:00 +0000
Received: from [10.130.0.36] (unknown [123.138.236.242])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj9PAPvBdJ2MJAA--.34S3;
 Wed, 11 Dec 2019 08:56:41 +0800 (CST)
To: Eric Biggers <ebiggers@kernel.org>
References: <1575979801-32569-1-git-send-email-yangtiezhu@loongson.cn>
 <20191210191912.GA99557@gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <98a07d66-8479-f780-89ce-13a6d2c85efd@loongson.cn>
Date: Wed, 11 Dec 2019 08:56:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20191210191912.GA99557@gmail.com>
X-CM-TRANSID: AQAAf9Dxj9PAPvBdJ2MJAA--.34S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAw1UZFy3Zw1kWr4UAryDGFg_yoW5GrWDpF
 Z8JFyvyF4xGryUur1Ivr1fAF1Fv393Wr15Cr9xKa4UArnIqr1vqayfCw4Y93Z3XFWrWw4F
 gan8JFy5C345JFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvEb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
 xwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjxU2JKsUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ieqJE-000bvG-1g
Subject: Re: [f2fs-dev] [PATCH v4] fs: introduce is_dot_or_dotdot helper for
 cleanup
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
Cc: ecryptfs@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/11/2019 03:19 AM, Eric Biggers wrote:
> On Tue, Dec 10, 2019 at 08:10:01PM +0800, Tiezhu Yang wrote:
>> diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
>> index 3da3707..ef7eba8 100644
>> --- a/fs/crypto/fname.c
>> +++ b/fs/crypto/fname.c
>> @@ -11,21 +11,11 @@
>>    * This has not yet undergone a rigorous security audit.
>>    */
>>   
>> +#include <linux/namei.h>
>>   #include <linux/scatterlist.h>
>>   #include <crypto/skcipher.h>
>>   #include "fscrypt_private.h"
>>   
>> -static inline bool fscrypt_is_dot_dotdot(const struct qstr *str)
>> -{
>> -	if (str->len == 1 && str->name[0] == '.')
>> -		return true;
>> -
>> -	if (str->len == 2 && str->name[0] == '.' && str->name[1] == '.')
>> -		return true;
>> -
>> -	return false;
>> -}
>> -
>>   /**
>>    * fname_encrypt() - encrypt a filename
>>    *
>> @@ -255,7 +245,7 @@ int fscrypt_fname_disk_to_usr(struct inode *inode,
>>   	const struct qstr qname = FSTR_TO_QSTR(iname);
>>   	struct fscrypt_digested_name digested_name;
>>   
>> -	if (fscrypt_is_dot_dotdot(&qname)) {
>> +	if (is_dot_or_dotdot(qname.name, qname.len)) {
> There's no need for the 'qname' variable anymore.  Can you please remove it and
> do:
>
> 	if (is_dot_or_dotdot(iname->name, iname->len)) {

Hi Eric,

Thanks for your review, I will do it in the v5 patch.

>
>> diff --git a/include/linux/namei.h b/include/linux/namei.h
>> index 7fe7b87..aba114a 100644
>> --- a/include/linux/namei.h
>> +++ b/include/linux/namei.h
>> @@ -92,4 +92,14 @@ retry_estale(const long error, const unsigned int flags)
>>   	return error == -ESTALE && !(flags & LOOKUP_REVAL);
>>   }
>>   
>> +static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
>> +{
>> +	if (unlikely(name[0] == '.')) {
>> +		if (len < 2 || (len == 2 && name[1] == '.'))
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
> This doesn't handle the len=0 case.  Did you check that none of the users pass
> in zero-length names?  It looks like fscrypt_fname_disk_to_usr() can, if the
> directory entry on-disk has a zero-length name.  Currently it will return
> -EUCLEAN in that case, but with this patch it may think it's the name ".".
>
> So I think there needs to either be a len >= 1 check added, *or* you need to
> make an argument for why it's okay to not care about the empty name case.

Anyway, let me modify the if condition "len < 2" to "len == 1".

static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
{
         if (unlikely(name[0] == '.')) {
                 if (len == 1 || (len == 2 && name[1] == '.'))
                         return true;
         }

         return false;
}

I will send v5 patch as soon as possible.

Thanks,

Tiezhu Yang

>
> - Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
