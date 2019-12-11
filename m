Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7260D11A341
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2019 05:00:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ietAu-0002bW-Cb; Wed, 11 Dec 2019 04:00:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yangtiezhu@loongson.cn>) id 1ietAs-0002bN-1t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 04:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SXh3KYgMsPS5RG5pnVp/ro4tCSM6bG5RdmmTkHZWnyM=; b=YUbofKV4n5WNLjJABuYIWxDaUM
 yqIreCjOgW7pChAPuPk5NZWpawJorelPeKty/0d1pZTXs7N1OgT8k+J2h2dz3Z0jhZ92aGrSrgC4t
 F6yHMWPy04Q4muN41Qwi8fK7zY9qLmvR+TutkAHkCZcJkJZIwy9Y5YW4rp/Zy+MjAvgo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SXh3KYgMsPS5RG5pnVp/ro4tCSM6bG5RdmmTkHZWnyM=; b=CO1jW56WE6MPQVT8l4fFGgHDVe
 xo9FI0M790cCwBdjaFZLm851wdSapx4TpRttOB6y6hJrshrmOFdZune3UqI2D0b14KauqFem2Qasf
 8C6IhO7h4nnQfwIm6kFANh4cmf4fJ/odbJn5fStodUvYGaq6C1Y922DPw0xoVfHReSeA=;
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1ietAn-000XcZ-1V
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 04:00:30 +0000
Received: from [10.130.0.36] (unknown [123.138.236.242])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxDxe3afBd0nEJAA--.6S3;
 Wed, 11 Dec 2019 12:00:08 +0800 (CST)
To: Eric Biggers <ebiggers@kernel.org>, Matthew Wilcox <willy@infradead.org>
References: <1576030801-8609-1-git-send-email-yangtiezhu@loongson.cn>
 <20191211024858.GB732@sol.localdomain>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <febbd7eb-5e53-6e7c-582d-5b224e441e37@loongson.cn>
Date: Wed, 11 Dec 2019 11:59:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20191211024858.GB732@sol.localdomain>
X-CM-TRANSID: AQAAf9DxDxe3afBd0nEJAA--.6S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4rXryxJFW5WFyDWF4DArb_yoW8Zr1UpF
 y5CFZYyF1IgFyUZF4vyw4fZF4Yvrs3XFyjy347K3s8AF1aqFnaqrW5Kr1093Z3JrZ5ZF1S
 gay3WFyYk398AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvEb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
 xwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjxU2rcTDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ietAn-000XcZ-1V
Subject: Re: [f2fs-dev] [PATCH v5] fs: introduce is_dot_or_dotdot helper for
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

On 12/11/2019 10:48 AM, Eric Biggers wrote:
> On Wed, Dec 11, 2019 at 10:20:01AM +0800, Tiezhu Yang wrote:
>> diff --git a/include/linux/namei.h b/include/linux/namei.h
>> index 7fe7b87..0fd9315 100644
>> --- a/include/linux/namei.h
>> +++ b/include/linux/namei.h
>> @@ -92,4 +92,14 @@ retry_estale(const long error, const unsigned int flags)
>>   	return error == -ESTALE && !(flags & LOOKUP_REVAL);
>>   }
>>   
>> +static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
>> +{
>> +	if (unlikely(name[0] == '.')) {
>> +		if (len == 1 || (len == 2 && name[1] == '.'))
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>   #endif /* _LINUX_NAMEI_H */
> I had suggested adding a len >= 1 check to handle the empty name case correctly.
> What I had in mind was
>
> static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
> {
> 	if (len >= 1 && unlikely(name[0] == '.')) {
> 		if (len < 2 || (len == 2 && name[1] == '.'))
> 			return true;
> 	}
>
> 	return false;
> }
>
> As is, you're proposing that it always dereference the first byte even when
> len=0, which seems like a bad idea for a shared helper function.  Did you check
> whether it's okay for all the existing callers?  fscrypt_fname_disk_to_usr() is
> called from 6 places, did you check all of them?
>
> How about keeping the existing optimized code for the hot path in fs/namei.c
> (i.e. not using the helper function), while having the helper function do the
> extra check to handle len=0 correctly?

Hi Eric,

Thank you for reminding me.  How about using the following helper for
all callers?

static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
{
         if (len == 1 && name[0] == '.')
                 return true;

         if (len == 2 && name[0] == '.' && name[1] == '.')
                 return true;

         return false;
}

Hi Matthew,

How do you think? I think the performance influence is very small
due to is_dot_or_dotdot() is a such short static inline function.

Thanks,

Tiezhu Yang

>
> - Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
