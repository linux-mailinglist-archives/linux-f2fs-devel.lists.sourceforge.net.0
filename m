Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE26898A68
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Apr 2024 16:50:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rsOQO-0007fp-Mf;
	Thu, 04 Apr 2024 14:50:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rsOQN-0007fj-U9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Apr 2024 14:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j4IzGw5M7fVQM80Gsb3miLdHgF3FriVH4ehEoQKT2Gw=; b=jFMrUvKxGlzfuNCVHfX0Ljiv0L
 76QMzE0htxVgqTaoKFD36l5Gdz8xd7oeawYd6jH2OAoEiI0dWTG0eJ2jIKyO1ARRESeTOYf1Qt/jp
 BdMKBgnLEiY8Wg2ZCW7Gc1r3/g02O/fhUNfHJQ4H9Fx6A45XLTZggYihHm9RKYuYWB6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j4IzGw5M7fVQM80Gsb3miLdHgF3FriVH4ehEoQKT2Gw=; b=Y11UOgBNBj/2ea4Qoqsr32Wr/W
 BWkJ1f/LGciTjdCWIrDEWrCbOWaQd9WV8PN/KQjnWvQRZmFP83A5EjDktsiCaFJO9xfnUXR5JI7A5
 ZY3PbO1txtTHd3qrBIOvlW8WmGL3VthAuzEfGVvLGhiFuryO8mHAfMoJUOEnDCPqpqVw=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rsOQL-0000GP-Vs for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Apr 2024 14:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712242231;
 bh=p7JS/JW9XXD3bMddSLVFax+q5+sw7d8SB0tPzkZxUCE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=4cb+Da5eqnTgzFsMbel5Czpg0yxMD9Cj6yJ2vpwTHOXdMEdIBz4CBhF+/ZsV+CU6i
 Dk2sHOTPShK29ZAITPiisvwR8WhbQ2JgohSYFVuE3atePxhCp7ww/igdnqJQkOW8Un
 7IvkkSaxe0q17rJYaLc01oPe0QTES7GWBRGv/MFT0oTMkzf5obDgSfbP1I2lukorpr
 gsSkEKfmZ97OxTIzC2WnAjno0669RcFpLpB2MjDH2iYFFV/6H6OwEWz/0yhmoCgjIT
 XVoSirLSNumhV/WWVNvJPdNEgUHdD3qmJ7qUsK82aCTGhw477PwEJFKWa4XEJwkNCc
 wYernkhbmyP0g==
Received: from [100.90.194.27] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 29A043780029;
 Thu,  4 Apr 2024 14:50:30 +0000 (UTC)
Message-ID: <e6d1ad0b-719a-4693-bd34-bea3cf6e4fa2@collabora.com>
Date: Thu, 4 Apr 2024 17:50:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: krisman@suse.de, Eric Biggers <ebiggers@kernel.org>
References: <20240402154842.508032-1-eugen.hristev@collabora.com>
 <20240402154842.508032-8-eugen.hristev@collabora.com>
 <20240403042503.GI2576@sol.localdomain>
Content-Language: en-US
In-Reply-To: <20240403042503.GI2576@sol.localdomain>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/3/24 07:25, Eric Biggers wrote: > On Tue, Apr 02, 2024
 at 06:48:40PM +0300, Eugen Hristev via Linux-f2fs-devel wrote: >> If the
 volume is in strict mode, generi c_ci_compare can report a broken > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rsOQL-0000GP-Vs
Subject: Re: [f2fs-dev] [PATCH v15 7/9] f2fs: Log error when lookup of
 encoded dentry fails
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
From: Eugen Hristev via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu, jack@suse.cz,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/3/24 07:25, Eric Biggers wrote:
> On Tue, Apr 02, 2024 at 06:48:40PM +0300, Eugen Hristev via Linux-f2fs-devel wrote:
>> If the volume is in strict mode, generi c_ci_compare can report a broken
>> encoding name.  This will not trigger on a bad lookup, which is caught
>> earlier, only if the actual disk name is bad.
>>
>> Suggested-by: Gabriel Krisman Bertazi <krisman@suse.de>
>> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
>> ---
>>  fs/f2fs/dir.c | 15 ++++++++++-----
>>  1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
>> index 88b0045d0c4f..64286d80dd30 100644
>> --- a/fs/f2fs/dir.c
>> +++ b/fs/f2fs/dir.c
>> @@ -192,11 +192,16 @@ static inline int f2fs_match_name(const struct inode *dir,
>>  	struct fscrypt_name f;
>>  
>>  #if IS_ENABLED(CONFIG_UNICODE)
>> -	if (fname->cf_name.name)
>> -		return generic_ci_match(dir, fname->usr_fname,
>> -					&fname->cf_name,
>> -					de_name, de_name_len);
>> -
>> +	if (fname->cf_name.name) {
>> +		int ret = generic_ci_match(dir, fname->usr_fname,
>> +					   &fname->cf_name,
>> +					   de_name, de_name_len);
>> +		if (ret == -EINVAL)
>> +			f2fs_warn(F2FS_SB(dir->i_sb),
>> +				"Directory contains filename that is invalid UTF-8");
>> +
> 
> Shouldn't this use f2fs_warn_ratelimited?

f2fs_warn_ratelimited appears to be very new in the kernel,

Krisman do you think you can rebase your for-next on top of latest such that this
function is available ? I am basing the series on your for-next branch.

Thanks

> 
> - Eric
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com
> This list is managed by https://mailman.collabora.com



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
