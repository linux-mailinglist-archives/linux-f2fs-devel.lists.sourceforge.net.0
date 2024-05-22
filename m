Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B858CC2C0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 May 2024 16:03:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s9mYd-0004xM-CL;
	Wed, 22 May 2024 14:03:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1s9mYc-0004xG-H0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 May 2024 14:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RrIaVn0okeZzURLHVrhvXTj1WWzGThPqCfazykDB+8o=; b=eQoehdxO3Vf9PKsUiwRC+eNatR
 C6yzT/7/fUUKxNkMWFTU2tiJEDsrnY8Onx3BsI2gx7gKqZWryujbyW8DQhfw/2I5ifZZ75+hMmyxA
 YJFEbg7QNWRaqMehXR+h7uSWK3XlT6A94ZXoNft4YkQJhF/ei8FKsfZrz5e0dQfemhQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RrIaVn0okeZzURLHVrhvXTj1WWzGThPqCfazykDB+8o=; b=f8LiG5HSffufRrXuPTsPFQn8Vr
 +jr3Hb6POyNfQgYIY/myOBXZrJPJRWkcsv9TDk6y+1w/Nnc6Az0RTZWfkWEyaLRte6yCm+Zj37Rbc
 fTwzfZ84RB/eQSXWsLHIt+DWg0t91mYFQDOUvYYdDV6FREN5WAeqBx03/vTibeDqX+lY=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s9mYd-0001wx-GB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 May 2024 14:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716386575;
 bh=7kTG5ts3OQOCh1/2XvqX0aVjJCkbUUXFDVmo08IThCA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RzWT3O3NZ1dwV9M2JHbVSngE4q1VPMGXCXBpUQq11qZ2XeiDQmS47vXNKh45ByruT
 Cm7JT6sfDFXS8Fa1W3bTnt3tZ9zNI/4VVsOPEWAheGA84yHB0+QR9/vD8ZNCY2muQ/
 v20AlPXWqnAAZMWBoRd+unQh0zXE48VBkyjei/Zf3ZYkSL3XFlGcPWwHE8Ok//AO6Q
 EPl3BQhtDjJXhDQI8sWI8BAIxBLQHJBirIfmH+vA9Mkyzu/ded0oeTF8nT7FYY4Trp
 PMDbOHmF6JipmDBsBTOZtMmW4ktp9wbt35v3TgXmqkNsRi9LocM4J3Mc0RmJzFxtxt
 SKCoSTO0+zKlA==
Received: from [100.90.194.27] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4991137821B3;
 Wed, 22 May 2024 14:02:54 +0000 (UTC)
Message-ID: <9afebadd-765f-42f3-a80b-366dd749bf48@collabora.com>
Date: Wed, 22 May 2024 17:02:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gabriel Krisman Bertazi <krisman@suse.de>,
 Eric Biggers <ebiggers@kernel.org>
References: <20240405121332.689228-1-eugen.hristev@collabora.com>
 <20240405121332.689228-4-eugen.hristev@collabora.com>
 <20240510013330.GI1110919@google.com> <875xviyb3f.fsf@mailhost.krisman.be>
Content-Language: en-US
In-Reply-To: <875xviyb3f.fsf@mailhost.krisman.be>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/13/24 00:27,
 Gabriel Krisman Bertazi wrote: > Eric Biggers
 <ebiggers@kernel.org> writes: > >> On Fri, Apr 05, 2024 at 03:13:26PM +0300,
 Eugen Hristev wrote: > >>> + if (WARN_ON_ONCE(!fscrypt_has_ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [46.235.227.194 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1s9mYd-0001wx-GB
Subject: Re: [f2fs-dev] [PATCH v16 3/9] libfs: Introduce case-insensitive
 string comparison helper
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
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/13/24 00:27, Gabriel Krisman Bertazi wrote:
> Eric Biggers <ebiggers@kernel.org> writes:
> 
>> On Fri, Apr 05, 2024 at 03:13:26PM +0300, Eugen Hristev wrote:
> 
>>> +		if (WARN_ON_ONCE(!fscrypt_has_encryption_key(parent)))
>>> +			return -EINVAL;
>>> +
>>> +		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
>>> +		if (!decrypted_name.name)
>>> +			return -ENOMEM;
>>> +		res = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
>>> +						&decrypted_name);
>>> +		if (res < 0)
>>> +			goto out;
>>
>> If fscrypt_fname_disk_to_usr() returns an error and !sb_has_strict_encoding(sb),
>> then this function returns 0 (indicating no match) instead of the error code
>> (indicating an error).  Is that the correct behavior?  I would think that
>> strict_encoding should only have an effect on the actual name
>> comparison.
> 
> No. we *want* this return code to be propagated back to f2fs.  In ext4 it
> wouldn't matter since the error is not visible outside of ext4_match,
> but f2fs does the right thing and stops the lookup.

In the previous version which I sent, you told me that the error should be
propagated only in strict_mode, and if !strict_mode, it should just return no match.
Originally I did not understand that this should be done only for utf8_strncasecmp
errors, and not for all the errors. I will change it here to fix that.

> 
> Thinking about it, there is a second problem with this series.
> Currently, if we are on strict_mode, f2fs_match_ci_name does not
> propagate unicode errors back to f2fs. So, once a utf8 invalid sequence
> is found during lookup, it will be considered not-a-match but the lookup
> will continue.  This allows some lookups to succeed even in a corrupted
> directory.  With this patch, we will abort the lookup on the first
> error, breaking existing semantics.  Note that these are different from
> memory allocation failure and fscrypt_fname_disk_to_usr. For those, it
> makes sense to abort.

So , in the case of f2fs , we must not propagate utf8 errors ? It should just
return no match even in strict mode ?
If this helper is common for both f2fs and ext4, we have to do the same for ext4 ?
Or we are no longer able to commonize the code altogether ?
> 
> Also, once patch 6 and 7 are added, if fscrypt fails with -EINVAL for
> any reason unrelated to unicode (like in the WARN_ON above), we will
> incorrectly print the error message saying there is a bad UTF8 string.
> 
> My suggestion would be to keep the current behavior.  Make
> generic_ci_match only propagate non-unicode related errors back to the
> filesystem.  This means that we need to move the error messages in patch
> 6 and 7 into this function, so they only trigger when utf8_strncasecmp*
> itself fails.
> 

So basically unicode errors stop here, and print the error message here in that case.
Am I understanding it correctly ?
>>> +	/*
>>> +	 * Attempt a case-sensitive match first. It is cheaper and
>>> +	 * should cover most lookups, including all the sane
>>> +	 * applications that expect a case-sensitive filesystem.
>>> +	 */
>>> +	if (folded_name->name) {
>>> +		if (dirent.len == folded_name->len &&
>>> +		    !memcmp(folded_name->name, dirent.name, dirent.len))
>>> +			goto out;
>>> +		res = utf8_strncasecmp_folded(um, folded_name, &dirent);
>>
>> Shouldn't the memcmp be done with the original user-specified name, not the
>> casefolded name?  I would think that the user-specified name is the one that's
>> more likely to match the on-disk name, because of case preservation.  In most
>> cases users will specify the same case on both file creation and later access.
> 
> Yes.
> 
so the utf8_strncasecmp_folded call here must use name->name instead of folded_name ?

Thanks for the review
Eugen



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
