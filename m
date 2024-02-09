Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DBA84F372
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Feb 2024 11:31:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rYOA4-0007lo-PI;
	Fri, 09 Feb 2024 10:31:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rYOA2-0007li-Q3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Feb 2024 10:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NXsoi2c9P6bXLZRJQ+caQlFvzbgMJCiTh9Vvvp5s8tA=; b=Ymgki7qAd+NIettz4yAD4NBPI3
 B/9jncnTmwrFSpkwFfbIbyeent/UABtQTSE92f60zDId/E462UkoW17amwb9rW60ybNiYQMsbmN6e
 +YWpioOUgAVER/fi/smwQQnI6MQGcoO0iZ6UM5xh+SaV7xmjIMnjhdomnNTF+0t/t1bI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NXsoi2c9P6bXLZRJQ+caQlFvzbgMJCiTh9Vvvp5s8tA=; b=ie/2t5RuhhSb52ZlGGu8ou1LfW
 MBQRgvqP+4fuNiNOXyBVPFgq8RdT9pASD5hcXp7R32LmBExNmA+UyDy1e8CRymEIAEya5deNAAt/X
 4r7i8o5wUqKYP8bpD1wHO65TjW6nzzxr83wbAkvfswuR4gEttuqvnS1OpLu/nb7UnrJc=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rYO9y-0005ry-FM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Feb 2024 10:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707474655;
 bh=jNqkdKdn0JwaBXPN748/BkL+FwjFFKuIip9sMqyOPhw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vi7DW3tPlgmW0CjN8cMks0wpG+dd44UAH3ltMHDfmQt0ekovLv+js4f4/RSNxMflE
 wgTsM3+l1R4sh4LFuXhDwHUpMLArimD5z6ffaU+UkIuhWccYSmg573BTxM6LQAenCh
 Is6hjn7UgKLNI5QKe+5nkhWcguv7bLswqdLpLh4B89y2yYxlua2qWDLJVvc+mKIfFu
 XpBnP9kuLjERomwJdPDEjtlDwSjS1DQ2E3M4M3bnM2f4CJnbGsTf36RNod9JDeF7bR
 wh9Za7UvM+eEvl0Bgn1nEBgb4W+BQPhnJBo/SArrdCJTEhgiMJQnUmbNGQMcx8s8d6
 xQXwEodDwgZ8g==
Received: from [100.90.194.27] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DDBBE3781115;
 Fri,  9 Feb 2024 10:30:50 +0000 (UTC)
Message-ID: <ff492e0f-3760-430e-968a-8b2adab13f3f@collabora.com>
Date: Fri, 9 Feb 2024 12:30:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gabriel Krisman Bertazi <krisman@suse.de>
References: <20240208064334.268216-1-eugen.hristev@collabora.com>
 <20240208064334.268216-2-eugen.hristev@collabora.com>
 <87ttmivm1i.fsf@mailhost.krisman.be>
Content-Language: en-US
In-Reply-To: <87ttmivm1i.fsf@mailhost.krisman.be>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/8/24 20:38,
 Gabriel Krisman Bertazi wrote: > Eugen Hristev
 <eugen.hristev@collabora.com> writes: > >> From: Gabriel Krisman Bertazi
 <krisman@collabora.com> >> >> generic_ci_match can be used by c [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rYO9y-0005ry-FM
Subject: Re: [f2fs-dev] [RESEND PATCH v9 1/3] libfs: Introduce
 case-insensitive string comparison helper
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
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 Eric Biggers <ebiggers@google.com>, jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/8/24 20:38, Gabriel Krisman Bertazi wrote:
> Eugen Hristev <eugen.hristev@collabora.com> writes:
> 
>> From: Gabriel Krisman Bertazi <krisman@collabora.com>
>>
>> generic_ci_match can be used by case-insensitive filesystems to compare
>> strings under lookup with dirents in a case-insensitive way.  This
>> function is currently reimplemented by each filesystem supporting
>> casefolding, so this reduces code duplication in filesystem-specific
>> code.
>>
>> Reviewed-by: Eric Biggers <ebiggers@google.com>
>> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> 
> Hi Eugen,
> 
> Thanks for picking this up.  Please,  CC me in future versions.

Hello Gabriel,

Thanks for reviewing :)
> 
>> ---
>>  fs/libfs.c         | 68 ++++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/fs.h |  4 +++
>>  2 files changed, 72 insertions(+)
>>
>> diff --git a/fs/libfs.c b/fs/libfs.c
>> index bb18884ff20e..f80cb982ac89 100644
>> --- a/fs/libfs.c
>> +++ b/fs/libfs.c
>> @@ -1773,6 +1773,74 @@ static const struct dentry_operations generic_ci_dentry_ops = {
>>  	.d_hash = generic_ci_d_hash,
>>  	.d_compare = generic_ci_d_compare,
>>  };
>> +
>> +/**
>> + * generic_ci_match() - Match a name (case-insensitively) with a dirent.
>> + * @parent: Inode of the parent of the dirent under comparison
>> + * @name: name under lookup.
>> + * @folded_name: Optional pre-folded name under lookup
>> + * @de_name: Dirent name.
>> + * @de_name_len: dirent name length.
>> + *
>> + *
>> + * Test whether a case-insensitive directory entry matches the filename
>> + * being searched.  If @folded_name is provided, it is used instead of
>> + * recalculating the casefold of @name.
> 
> Can we add a note that this is a filesystem helper for comparison with
> directory entries, and VFS' ->d_compare should use generic_ci_d_compare.
> 
>> + *
>> + * Return: > 0 if the directory entry matches, 0 if it doesn't match, or
>> + * < 0 on error.
>> + */
>> +int generic_ci_match(const struct inode *parent,
>> +		     const struct qstr *name,
>> +		     const struct qstr *folded_name,
>> +		     const u8 *de_name, u32 de_name_len)
>> +{
>> +	const struct super_block *sb = parent->i_sb;
>> +	const struct unicode_map *um = sb->s_encoding;
>> +	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
>> +	struct qstr dirent = QSTR_INIT(de_name, de_name_len);
>> +	int res, match = false;
> 
> I know I originally wrote it this way, but match is an integer, so
> let's use integers instead of false/true.

With the changes below, 'match' is no longer needed
> 
>> +
>> +	if (IS_ENCRYPTED(parent)) {
>> +		const struct fscrypt_str encrypted_name =
>> +			FSTR_INIT((u8 *) de_name, de_name_len);
>> +
>> +		if (WARN_ON_ONCE(!fscrypt_has_encryption_key(parent)))
>> +			return -EINVAL;
>> +
>> +		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
>> +		if (!decrypted_name.name)
>> +			return -ENOMEM;
>> +		res = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
>> +						&decrypted_name);
>> +		if (res < 0)
>> +			goto out;
>> +		dirent.name = decrypted_name.name;
>> +		dirent.len = decrypted_name.len;
>> +	}
>> +
>> +	if (folded_name->name)
>> +		res = utf8_strncasecmp_folded(um, folded_name, &dirent);
>> +	else
>> +		res = utf8_strncasecmp(um, name, &dirent);
> 
> Similar to
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git/commit/?h=for-next&id=367122c529f35b4655acbe33c0cc4d6d3b32ba71
> 
> We should be checking for an exact-match first to avoid the utf8
> comparison cost unnecessarily.  The only problem is that we need to
> ensure we fail for an invalid utf-8 de_name in "strict mode".
> 
> Fortunately, if folded_name->name exists, we know the name-under-lookup
> was validated when initialized, so an exact-match of de_name must also
> be valid.  If folded_name is NULL, though, we might either have an
> invalid utf-8 dentry-under-lookup or the allocation itself failed, so we
> need to utf8_validate it.
> 
> Honestly, I don't care much about this !folded_name->name case, since
> utf8_strncasecmp will do the right thing and an invalid utf8 on
> case-insensitive directories should be an exception, not the norm.  but
> the code might get simpler if we do both:
> 
> (untested)

I implemented your suggestion, but any idea about testing ? I ran smoke on xfstests
and it appears to be fine, but maybe some specific test case might try the
different paths here ?

Let me know,
Eugen
> 
> if (folded_name->name) {
> 	if (dirent.len == folded_name->len &&
> 	    !memcmp(folded_name->name, dirent.name, dirent.len)) {
>             	res = 1;
> 		goto out;
>         }
> 	res = utf8_strncasecmp_folded(um, folded_name, &dirent);
> } else {
> 	if (dirent.len == name->len &&
> 	    !memcmp(name->name, dirent.name, dirent.len) &&
>             (!sb_has_strict_encoding(sb) || !utf8_validate(um, name))) {
>             	res = 1;
> 		goto out;
>         }
> 	res = utf8_strncasecmp(um, name, &dirent);
> }
> 
>> +
>> +	if (!res)
>> +		match = true;
>> +	else if (res < 0 && !sb_has_strict_encoding(sb)) {
>> +		/*
>> +		 * In non-strict mode, fallback to a byte comparison if
>> +		 * the names have invalid characters.
>> +		 */
>> +		res = 0;
>> +		match = ((name->len == dirent.len) &&
>> +			 !memcmp(name->name, dirent.name, dirent.len));
>> +	}
> 
> This goes away entirely.
> 
>> +
>> +out:
>> +	kfree(decrypted_name.name);
>> +	return (res >= 0) ? match : res;
> 
> and this becomes:
> 
> return res;
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
