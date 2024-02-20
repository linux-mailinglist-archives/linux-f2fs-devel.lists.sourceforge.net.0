Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D8B85B414
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 08:37:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcKgV-0007EQ-5o;
	Tue, 20 Feb 2024 07:36:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rcKgT-0007EI-Si
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 07:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hMg3u/lCaBQz6zZhifqyWWw+4lDjPJ6FQ66fleME1Oc=; b=cUtQyhwxZ1wk+YGJ79K0TBe//x
 9a5FXIb6hCHa78RfwiUYnrdH+cey+ewfkrj/CI8oX0IdEqbvMmDyY2pPZrQ/prPIEcPa09vtER9mO
 FB/3rQvmtKmnXNLzAggEeib55FHR7mpxQJzo4ckO/kMzF+f54LToCsKBK7/WZlghzxSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hMg3u/lCaBQz6zZhifqyWWw+4lDjPJ6FQ66fleME1Oc=; b=i3FttUWxMeBUXcB+7cYHT+deKV
 IFt4V7DlXKmQWkEZyQGVs2s9EhrjCHkZVkYzsq7qzs4L+rNTE37LPjSqhGtqiObaMEXRVijuBLGpy
 HC8l4JZSiOr6ZXfJQ3dwiK5l9GxS0zVMXLcODidHojKr1vmgX6ve6TxQ9MQfai4aLgoo=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcKgO-0008BW-5K for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 07:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708414607;
 bh=mFSD/wFGr7jkZ9Vc1opThnXPxIp9JYkLSf/lZISocp4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q6A95PPJBIUtHUCT2w7izYRmIV2+dv1xuwysXTdFcO1C5vMnTjfQ/RS4p2ehZvAHw
 N44F1r0HL3GDdqcfbhwDwni1HtKy0rfgis5dKJ2Jhetv4rB9ug0PyMVYkydhWHUeOo
 eUd7GHy5td1IY3uY673aSys/XKFTI+FwhIta/TAN6+ygQURwb8e8FLZwKpVYeetBih
 sL5LAAdDqczBL0u9hDcBB2mVK5bofxismA848yszTtdyT7PwmMC8uW+jAqNl65j6yc
 cm6Kcshdk74TjG86xVTQAxCExKF+wOFP59h2HGKZy5i5eFu0YwTNJZeW7TMA5cRlhy
 YRc105s7+QKLw==
Received: from [100.90.194.27] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8BB1E37804B2;
 Tue, 20 Feb 2024 07:36:43 +0000 (UTC)
Message-ID: <fb32fc72-5434-4852-b7e9-f63fc03a8248@collabora.com>
Date: Tue, 20 Feb 2024 09:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gabriel Krisman Bertazi <krisman@suse.de>
References: <20240215042654.359210-1-eugen.hristev@collabora.com>
 <20240215042654.359210-4-eugen.hristev@collabora.com>
 <87zfw0bd6y.fsf@mailhost.krisman.be>
 <50d2afaa-fd7e-4772-ac84-24e8994bfba8@collabora.com>
 <87msrwbj18.fsf@mailhost.krisman.be>
Content-Language: en-US
In-Reply-To: <87msrwbj18.fsf@mailhost.krisman.be>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/19/24 16:55,
 Gabriel Krisman Bertazi wrote: > Eugen Hristev
 <eugen.hristev@collabora.com> writes: > >> On 2/16/24 18:12, Gabriel Krisman
 Bertazi wrote: >>> Eugen Hristev <eugen.hristev@collabora. [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rcKgO-0008BW-5K
Subject: Re: [f2fs-dev] [PATCH v10 3/8] libfs: Introduce case-insensitive
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

On 2/19/24 16:55, Gabriel Krisman Bertazi wrote:
> Eugen Hristev <eugen.hristev@collabora.com> writes:
> 
>> On 2/16/24 18:12, Gabriel Krisman Bertazi wrote:
>>> Eugen Hristev <eugen.hristev@collabora.com> writes:
>>>
>>>> From: Gabriel Krisman Bertazi <krisman@collabora.com>
>>>>
>>>> generic_ci_match can be used by case-insensitive filesystems to compare
>>>> strings under lookup with dirents in a case-insensitive way.  This
>>>> function is currently reimplemented by each filesystem supporting
>>>> casefolding, so this reduces code duplication in filesystem-specific
>>>> code.
>>>>
>>>> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>>>> [eugen.hristev@collabora.com: rework to first test the exact match]
>>>> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
>>>> ---
>>>>  fs/libfs.c         | 80 ++++++++++++++++++++++++++++++++++++++++++++++
>>>>  include/linux/fs.h |  4 +++
>>>>  2 files changed, 84 insertions(+)
>>>>
>>>> diff --git a/fs/libfs.c b/fs/libfs.c
>>>> index bb18884ff20e..82871fa1b066 100644
>>>> --- a/fs/libfs.c
>>>> +++ b/fs/libfs.c
>>>> @@ -1773,6 +1773,86 @@ static const struct dentry_operations generic_ci_dentry_ops = {
>>>>  	.d_hash = generic_ci_d_hash,
>>>>  	.d_compare = generic_ci_d_compare,
>>>>  };
>>>> +
>>>> +/**
>>>> + * generic_ci_match() - Match a name (case-insensitively) with a dirent.
>>>> + * This is a filesystem helper for comparison with directory entries.
>>>> + * generic_ci_d_compare should be used in VFS' ->d_compare instead.
>>>> + *
>>>> + * @parent: Inode of the parent of the dirent under comparison
>>>> + * @name: name under lookup.
>>>> + * @folded_name: Optional pre-folded name under lookup
>>>> + * @de_name: Dirent name.
>>>> + * @de_name_len: dirent name length.
>>>> + *
>>>> + *
>>>
>>> Since this need a respin, mind dropping the extra empty line here?
>>>
>>>> + * Test whether a case-insensitive directory entry matches the filename
>>>> + * being searched.  If @folded_name is provided, it is used instead of
>>>> + * recalculating the casefold of @name.
>>>> + *
>>>> + * Return: > 0 if the directory entry matches, 0 if it doesn't match, or
>>>> + * < 0 on error.
>>>> + */
>>>> +int generic_ci_match(const struct inode *parent,
>>>> +		     const struct qstr *name,
>>>> +		     const struct qstr *folded_name,
>>>> +		     const u8 *de_name, u32 de_name_len)
>>>> +{
>>>> +	const struct super_block *sb = parent->i_sb;
>>>> +	const struct unicode_map *um = sb->s_encoding;
>>>> +	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
>>>> +	struct qstr dirent = QSTR_INIT(de_name, de_name_len);
>>>> +	int res;
>>>> +
>>>> +	if (IS_ENCRYPTED(parent)) {
>>>> +		const struct fscrypt_str encrypted_name =
>>>> +			FSTR_INIT((u8 *) de_name, de_name_len);
>>>> +
>>>> +		if (WARN_ON_ONCE(!fscrypt_has_encryption_key(parent)))
>>>> +			return -EINVAL;
>>>> +
>>>> +		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
>>>> +		if (!decrypted_name.name)
>>>> +			return -ENOMEM;
>>>> +		res = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
>>>> +						&decrypted_name);
>>>> +		if (res < 0)
>>>> +			goto out;
>>>> +		dirent.name = decrypted_name.name;
>>>> +		dirent.len = decrypted_name.len;
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * Attempt a case-sensitive match first. It is cheaper and
>>>> +	 * should cover most lookups, including all the sane
>>>> +	 * applications that expect a case-sensitive filesystem.
>>>> +	 *
>>>
>>>
>>>> +	 * This comparison is safe under RCU because the caller
>>>> +	 * guarantees the consistency between str and len. See
>>>> +	 * __d_lookup_rcu_op_compare() for details.
>>>> +	 */
>>>
>>> This paragraph doesn't really make sense here.  It is originally from
>>> the d_compare hook, which can be called under RCU, but there is no RCU
>>> here.  Also, here we are comparing the dirent with the
>>> name-under-lookup, name which is already safe.
>>>
>>>
>>>> +	if (folded_name->name) {
>>>> +		if (dirent.len == folded_name->len &&
>>>> +		    !memcmp(folded_name->name, dirent.name, dirent.len)) {
>>>> +			res = 1;
>>>> +			goto out;
>>>> +		}
>>>> +		res = !utf8_strncasecmp_folded(um, folded_name, &dirent);
>>>
>>> Hmm, second thought on this.  This will ignore errors from utf8_strncasecmp*,
>>> which CAN happen for the first time here, if the dirent itself is
>>> corrupted on disk (exactly why we have patch 6).  Yes, ext4_match will drop the
>>> error, but we want to propagate it from here, such that the warning on
>>> patch 6 can trigger.
>>>
>>> This is why I did that match dance on the original submission.  Sorry
>>> for suggesting it.  We really want to get the error from utf8 and
>>> propagate it if it is negative. basically:
>>>
>>>         res > 0: match
>>>         res == 0: no match.
>>>         res < 0: propagate error and let the caller handle it
>>
>> In that case I will revert to the original v9 implementation and send a v11 to
>> handle that.
> 
> Please, note that the memcmp optimization is still valid. On match, we
> know the name is valid utf8.  It is just a matter of propagating the
> error code from utf8 to the caller if we need to call it.
> 


Okay, I am changing it.

By the way, is this supposed to work like this on case-insensitive directories ?

user@debian-rockchip-rock5b-rk3588:~$ ls -la /media/CI_dir/*cuc
ls: cannot access '/media/CI_dir/*cuc': No such file or directory
user@debian-rockchip-rock5b-rk3588:~$ ls -la /media/CI_dir/*CUC
-rw-r--r-- 1 root root 0 Feb 12 17:47 /media/CI_dir/CUC
user@debian-rockchip-rock5b-rk3588:~$ ls -la /media/CI_dir/cuc
-rw-r--r-- 1 root root 0 Feb 12 17:47 /media/CI_dir/cuc
user@debian-rockchip-rock5b-rk3588:~$


basically wildcards don't work.

Thanks,
Eugen


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
