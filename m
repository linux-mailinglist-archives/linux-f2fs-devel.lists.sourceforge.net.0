Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56909346C03
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Mar 2021 23:18:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOpMH-0007mZ-TI; Tue, 23 Mar 2021 22:18:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <shreeya.patel@collabora.com>) id 1lOpMG-0007mM-IJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 22:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WU9FkwOD6xqDjH9ihaHivF5xS9z4ct5zqnO3SAFTlYc=; b=hPXm3aY0R++CHL1tuTwyvWeYNI
 +6rcsl/LmAfAmi44OcgZO1bO2wd9ojErblnk0qikjL0q/S7IzlWxc0B+Y+VpsRVOsAfMdEGKyiq0X
 +w5gxCbFPnR65xSK/5iIbkJoWggXb3IQSpbKNxiVbKDdDktu47QOn/ln2wWrkswjzOIg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WU9FkwOD6xqDjH9ihaHivF5xS9z4ct5zqnO3SAFTlYc=; b=c7qvuHqgCYKXaqIax/wte8mWfo
 gAQ4nH9O6m5SzofNaKw5UBN8VY1E9GWYH6Q5EQ38qrCzSYWj7iGEurqnYedcJa/cNRFv9Cxesj4Uw
 9Y+2KsFSujlzolIWihlx0Bi3VYZgW25RSBYWLP/sATJPw2s8c+lGjg2dfpi5JwV+ZELc=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lOpM1-0006nr-Iq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 22:18:40 +0000
Received: from [IPv6:2401:4900:5170:240f:f606:c194:2a1c:c147] (unknown
 [IPv6:2401:4900:5170:240f:f606:c194:2a1c:c147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: shreeya)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2208F1F454D0;
 Tue, 23 Mar 2021 22:18:14 +0000 (GMT)
To: Eric Biggers <ebiggers@kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>
References: <20210323183201.812944-1-shreeya.patel@collabora.com>
 <20210323183201.812944-6-shreeya.patel@collabora.com>
 <87eeg5d4xb.fsf@collabora.com> <YFpPxCQiMLqctIuS@gmail.com>
From: Shreeya Patel <shreeya.patel@collabora.com>
Message-ID: <dd7dae42-6024-8868-3e3e-f6d672274682@collabora.com>
Date: Wed, 24 Mar 2021 03:48:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFpPxCQiMLqctIuS@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lOpM1-0006nr-Iq
Subject: Re: [f2fs-dev] [PATCH v3 5/5] fs: unicode: Add utf8 module and a
 unicode layer
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
Cc: tytso@mit.edu, drosen@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel@collabora.com,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 24/03/21 1:59 am, Eric Biggers wrote:
> On Tue, Mar 23, 2021 at 03:51:44PM -0400, Gabriel Krisman Bertazi wrote:
>>> -int unicode_validate(const struct unicode_map *um, const struct qstr *str)
>>> -{
>>> -	const struct utf8data *data = utf8nfdi(um->version);
>>> -
>>> -	if (utf8nlen(data, str->name, str->len) < 0)
>>> -		return -1;
>>> -	return 0;
>>> -}
>>> +struct unicode_ops *utf8_ops;
>>> +EXPORT_SYMBOL(utf8_ops);
>>> +
>>> +int _utf8_validate(const struct unicode_map *um, const struct qstr *str)
>>> +{
>>> +	return 0;
>>> +}
>>> -EXPORT_SYMBOL(unicode_validate);
>> I think that any calls to the default static calls should return errors
>> instead of succeeding without doing anything.
>>
>> In fact, are the default calls really necessary?  If someone gets here,
>> there is a bug elsewhere, so WARN_ON and maybe -EIO.
>>
>> int unicode_validate_default_static_call(...)
>> {
>>     WARN_ON(1);
>>     return -EIO;
>> }
>>
>> Or just have a NULL default, as I mentioned below, if that is possible.
>>
> [...]
>>> +DEFINE_STATIC_CALL(utf8_validate, _utf8_validate);
>>> +DEFINE_STATIC_CALL(utf8_strncmp, _utf8_strncmp);
>>> +DEFINE_STATIC_CALL(utf8_strncasecmp, _utf8_strncasecmp);
>>> +DEFINE_STATIC_CALL(utf8_strncasecmp_folded, _utf8_strncasecmp_folded);
>>> +DEFINE_STATIC_CALL(utf8_normalize, _utf8_normalize);
>>> +DEFINE_STATIC_CALL(utf8_casefold, _utf8_casefold);
>>> +DEFINE_STATIC_CALL(utf8_casefold_hash, _utf8_casefold_hash);
>>> +DEFINE_STATIC_CALL(utf8_load, _utf8_load);
>>> +DEFINE_STATIC_CALL_NULL(utf8_unload, _utf8_unload);
>>> +EXPORT_STATIC_CALL(utf8_strncmp);
>>> +EXPORT_STATIC_CALL(utf8_strncasecmp);
>>> +EXPORT_STATIC_CALL(utf8_strncasecmp_folded);
>> I'm having a hard time understanding why some use
>> DEFINE_STATIC_CALL_NULL, while other use DEFINE_STATIC_CALL.  This new
>> static call API is new to me :).  None of this can be called if the
>> module is not loaded anyway, so perhaps the default function can just be
>> NULL, per the documentation of include/linux/static_call.h?
>>
>> Anyway, Aren't utf8_{validate,casefold,normalize} missing the
>> equivalent EXPORT_STATIC_CALL?
>>
> The static_call API is fairly new to me too.  But the intent of this patch seems
> to be that none of the utf8 functions are called without the utf8 module loaded.
> If they are called, it's a kernel bug.  So there are two options for what to do
> if it happens anyway:
>
>    1. call a "null" static call, which does nothing
>
> *or*
>
>    2. call a default function which does WARN_ON_ONCE() and returns an error if
>       possible.
>
> (or 3. don't use static calls and instead dereference a NULL utf8_ops like
> previous versions of this patch did.)
>
> It shouldn't really matter which of these approaches you take, but please be
> consistent and use the same one everywhere.
>
>> + void unicode_unregister(void)
>> + {
>> +         spin_lock(&utf8ops_lock);
>> +         utf8_ops = NULL;
>> +         spin_unlock(&utf8ops_lock);
>> + }
>> + EXPORT_SYMBOL(unicode_unregister);
> This should restore the static calls to their default values (either NULL or the
> default functions, depending on what you decide).
>
> Also, it's weird to still have the utf8_ops structure when using static calls.
> It seems it should be one way or the other: static calls *or* utf8_ops.
>
> The static calls could be exported, and the module could be responsible for
> updating them.  That would eliminate the need for utf8_ops.


Hmmm yes, I think we are just using utf8_ops for getting the owner details
which we can now remove and instead pass it as an argument while 
registering the module.
Will make this change in v4. Thanks


>
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
