Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2556B859B5B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Feb 2024 05:23:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rbvBF-0007lI-8s;
	Mon, 19 Feb 2024 04:23:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rbvBD-0007kx-7L
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 04:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cRJhDU1Nm/XvUjvwANak2/TMMlruXM+DCMcYYoNmpoM=; b=JCX/QtFbkdhHQ7KIN95KpEs73N
 4aMuHR9YdqctrvYIOE/8MojXa0XI++r9RHJKesbJjxRRmfjgTnx/tlL3HYKUNNfmrMVNePawTTeOm
 yGsle4C2HRr2HRvPC6ZlKlFDYbRKiWnvpWnV51rq53fz1aFoYMfOd+nV3LEGfIoernJo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cRJhDU1Nm/XvUjvwANak2/TMMlruXM+DCMcYYoNmpoM=; b=GDpkOr2+9k1hhS+M0Q/HhIeBKr
 OoXvsqymaUIbUAANdw+56mb6JZewlPSngbE1IlXAT+gky9l5/+EUXVR4c1zx11gdECcvqYW7uJzJ4
 sV7DsQE6KbkQYRzl089mXQqWKxtSwZPkRN6zB3M9HaguRkiB6C8Smfc/STEGTtWIamlc=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rbvB8-0001HO-Ta for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 04:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708316564;
 bh=0JHBMWAUkowmtNSWsrBK/zyksAWGdlugbpz9GiUqyMU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oxp1pZ80yVOnzJZx6j1IH73rbFJ+kzuLApp1kH7LHO3bC5KNsH5OyU5eBfqlul4AU
 t+AzlckgqIATYUiR3tBHAaeEKG2ey3M+ujyaSbahlRun763btXnqISdds2sfUj/X/O
 CfFUpcuOf7TpOlNS5MIZARHtgHwW1cDehAL+KqjnW6IdSH7Y/fRw/+7YzHSIUFO5tr
 1MXS2gt1ek/TneWwu1iCKafGv8v2LCQ4j1AqRyFFUcAOO2hZoWYKWpr/VhCUySf6Pg
 9RMI/BbURzO8ELu0YLZOxUDBdjFuk+hTiTEPuNxzt9cZpJQ3COscFertFjTrNXpcLw
 u9S/aKKWICAqA==
Received: from [100.90.194.27] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 54BCB3780EC6;
 Mon, 19 Feb 2024 04:22:40 +0000 (UTC)
Message-ID: <50d2afaa-fd7e-4772-ac84-24e8994bfba8@collabora.com>
Date: Mon, 19 Feb 2024 06:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gabriel Krisman Bertazi <krisman@suse.de>
References: <20240215042654.359210-1-eugen.hristev@collabora.com>
 <20240215042654.359210-4-eugen.hristev@collabora.com>
 <87zfw0bd6y.fsf@mailhost.krisman.be>
Content-Language: en-US
In-Reply-To: <87zfw0bd6y.fsf@mailhost.krisman.be>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/16/24 18:12,
 Gabriel Krisman Bertazi wrote: > Eugen Hristev
 <eugen.hristev@collabora.com> writes: > >> From: Gabriel Krisman Bertazi
 <krisman@collabora.com> >> >> generic_ci_match can be used by [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rbvB8-0001HO-Ta
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

On 2/16/24 18:12, Gabriel Krisman Bertazi wrote:
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
>> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>> [eugen.hristev@collabora.com: rework to first test the exact match]
>> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
>> ---
>>  fs/libfs.c         | 80 ++++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/fs.h |  4 +++
>>  2 files changed, 84 insertions(+)
>>
>> diff --git a/fs/libfs.c b/fs/libfs.c
>> index bb18884ff20e..82871fa1b066 100644
>> --- a/fs/libfs.c
>> +++ b/fs/libfs.c
>> @@ -1773,6 +1773,86 @@ static const struct dentry_operations generic_ci_dentry_ops = {
>>  	.d_hash = generic_ci_d_hash,
>>  	.d_compare = generic_ci_d_compare,
>>  };
>> +
>> +/**
>> + * generic_ci_match() - Match a name (case-insensitively) with a dirent.
>> + * This is a filesystem helper for comparison with directory entries.
>> + * generic_ci_d_compare should be used in VFS' ->d_compare instead.
>> + *
>> + * @parent: Inode of the parent of the dirent under comparison
>> + * @name: name under lookup.
>> + * @folded_name: Optional pre-folded name under lookup
>> + * @de_name: Dirent name.
>> + * @de_name_len: dirent name length.
>> + *
>> + *
> 
> Since this need a respin, mind dropping the extra empty line here?
> 
>> + * Test whether a case-insensitive directory entry matches the filename
>> + * being searched.  If @folded_name is provided, it is used instead of
>> + * recalculating the casefold of @name.
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
>> +	int res;
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
>> +	/*
>> +	 * Attempt a case-sensitive match first. It is cheaper and
>> +	 * should cover most lookups, including all the sane
>> +	 * applications that expect a case-sensitive filesystem.
>> +	 *
> 
> 
>> +	 * This comparison is safe under RCU because the caller
>> +	 * guarantees the consistency between str and len. See
>> +	 * __d_lookup_rcu_op_compare() for details.
>> +	 */
> 
> This paragraph doesn't really make sense here.  It is originally from
> the d_compare hook, which can be called under RCU, but there is no RCU
> here.  Also, here we are comparing the dirent with the
> name-under-lookup, name which is already safe.
> 
> 
>> +	if (folded_name->name) {
>> +		if (dirent.len == folded_name->len &&
>> +		    !memcmp(folded_name->name, dirent.name, dirent.len)) {
>> +			res = 1;
>> +			goto out;
>> +		}
>> +		res = !utf8_strncasecmp_folded(um, folded_name, &dirent);
> 
> Hmm, second thought on this.  This will ignore errors from utf8_strncasecmp*,
> which CAN happen for the first time here, if the dirent itself is
> corrupted on disk (exactly why we have patch 6).  Yes, ext4_match will drop the
> error, but we want to propagate it from here, such that the warning on
> patch 6 can trigger.
> 
> This is why I did that match dance on the original submission.  Sorry
> for suggesting it.  We really want to get the error from utf8 and
> propagate it if it is negative. basically:
> 
>         res > 0: match
>         res == 0: no match.
>         res < 0: propagate error and let the caller handle it

In that case I will revert to the original v9 implementation and send a v11 to
handle that.

Eugen
> 
> 
>> +	} else {
>> +		if (dirent.len == name->len &&
>> +		    !memcmp(name->name, dirent.name, dirent.len) &&
>> +		    (!sb_has_strict_encoding(sb) || !utf8_validate(um, name))) {
>> +			res = 1;
>> +			goto out;
>> +		}
>> +		res = !utf8_strncasecmp(um, name, &dirent);
>> +	}
>> +
>> +out:
>> +	kfree(decrypted_name.name);
>> +	return res;
>> +}
>> +EXPORT_SYMBOL(generic_ci_match);
>>  #endif
>>  
>>  #ifdef CONFIG_FS_ENCRYPTION
>> diff --git a/include/linux/fs.h b/include/linux/fs.h
>> index 820b93b2917f..7af691ff8d44 100644
>> --- a/include/linux/fs.h
>> +++ b/include/linux/fs.h
>> @@ -3296,6 +3296,10 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
>>  extern int generic_check_addressable(unsigned, u64);
>>  
>>  extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
>> +extern int generic_ci_match(const struct inode *parent,
>> +			    const struct qstr *name,
>> +			    const struct qstr *folded_name,
>> +			    const u8 *de_name, u32 de_name_len);
>>  
>>  static inline bool sb_has_encoding(const struct super_block *sb)
>>  {
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
