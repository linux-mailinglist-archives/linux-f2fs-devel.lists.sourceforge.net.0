Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B71349AF6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Mar 2021 21:26:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPWYi-0000TP-Jk; Thu, 25 Mar 2021 20:26:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <shreeya.patel@collabora.com>) id 1lPWYh-0000TD-KP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 20:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LppD/SjMkqjDj0YcUWQH207k5VvHrfBLDIWrq4mkh6g=; b=eNgMEE/CiIpIZ59kAURPK8MRpb
 g9d1vr1f5C3gq/rsVC+v49Tw9iQIO0/JYvnI+qe5EygkwZen1mycNn+ScV+Q7mZPKjfXxy/MaSW+S
 gyranYggq0oSb7ViRpDNZKeSFwGl1tzm3D/krMEQEXdekw2LE6cLqRNa4zVemP7TgIBw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LppD/SjMkqjDj0YcUWQH207k5VvHrfBLDIWrq4mkh6g=; b=UndBzwHXN+LMhH9eBYqOXPi3vG
 zURNx1rjiGHeLgaZditk7q8Ju3NLp+iO8ZfUDs3+iA8OxE1p7RGhWxCzmgw4bAWtyCWqwnGma+nkx
 djcJttCpKvT9x39EnLhPNGtA18CO7vvWWOY/XLjStlNTNMIVFXBB0Y2CPiRWE0bPcfSI=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lPWYd-00B9cI-FL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 20:26:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shreeya) with ESMTPSA id 407901F4684B
To: Eric Biggers <ebiggers@kernel.org>
References: <20210325000811.1379641-1-shreeya.patel@collabora.com>
 <20210325000811.1379641-6-shreeya.patel@collabora.com>
 <YFznIVf/F68oEuC6@sol.localdomain>
From: Shreeya Patel <shreeya.patel@collabora.com>
Message-ID: <2db48ab8-1297-e044-dcec-6c8b8875fdb0@collabora.com>
Date: Fri, 26 Mar 2021 01:56:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFznIVf/F68oEuC6@sol.localdomain>
Content-Language: en-US
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lPWYd-00B9cI-FL
Subject: Re: [f2fs-dev] [PATCH v4 5/5] fs: unicode: Add utf8 module and a
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
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org, krisman@collabora.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 26/03/21 1:10 am, Eric Biggers wrote:
> On Thu, Mar 25, 2021 at 05:38:11AM +0530, Shreeya Patel wrote:
>> Also, indirect calls using function pointers are easily exploitable by
>> speculative execution attacks, hence use static_call() in unicode.h and
>> unicode-core.c files inorder to prevent these attacks by making direct
>> calls and also to improve the performance of function pointers.
> I don't think you need to worry about avoiding indirect calls to prevent
> speculative execution attacks.  That's what the mitigations like Retpoline are
> for.  Instead my concern was just that indirect calls are *slow*, especially
> when those mitigations are enabled.  Some of the casefolding operations are
> called a lot (e.g., repeatedly during path resolution), and it would be
> desirable to avoid adding more overhead there.
>
>> diff --git a/fs/unicode/Kconfig b/fs/unicode/Kconfig
>> index 2c27b9a5cd6c..2961b0206b4d 100644
>> --- a/fs/unicode/Kconfig
>> +++ b/fs/unicode/Kconfig
>> @@ -8,7 +8,16 @@ config UNICODE
>>   	  Say Y here to enable UTF-8 NFD normalization and NFD+CF casefolding
>>   	  support.
>>   
>> +# UTF-8 encoding can be compiled as a module using UNICODE_UTF8 option.
>> +# Having UTF-8 encoding as a module will avoid carrying large
>> +# database table present in utf8data.h_shipped into the kernel
>> +# by being able to load it only when it is required by the filesystem.
>> +config UNICODE_UTF8
>> +	tristate "UTF-8 module"
>> +	depends on UNICODE
>> +	default m
>> +
> The help for UNICODE still says that it enables UTF-8 support.  But now there is
> a separate option that people will need to remember to enable.
>
> Please document each of these options properly.
>
> Perhaps EXT4_FS and F2FS_FS just should select UNICODE_UTF8 if UNICODE, so that
> UNICODE_UTF8 doesn't have to be a user-selectable symbol?


It is not a user-selectable symbol. It depends on UNICODE and if someone 
enables it,
by default UNICODE_UTF8 will be enabled as a module.


>> +DEFINE_STATIC_CALL(validate, unicode_validate_static_call);
>> +EXPORT_STATIC_CALL(validate);
> Global symbols can't have generic names like "validate".  Please add an
> appropriate prefix like "unicode_".
>
> Also, the thing called "unicode_validate_static_call" isn't actually a static
> call as the name suggests, but rather the default function used by the static
> call.  It should be called something like unicode_validate_default.
>
> Likewise for all the others.


Thanks for your reviews, I'll make the change suggested by you in v5.


>
> - Eric
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
