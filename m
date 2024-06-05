Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 711048FC95C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jun 2024 12:49:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sEoCf-0005Mj-FL;
	Wed, 05 Jun 2024 10:49:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1sEoCd-0005MC-9u
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 10:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uidyc1DgMqTJeJdkLXlibeqhuJs2mN3qQeH5AV4lmpY=; b=IUQCzTueDLGXgD5/btc+s2iZ+B
 FGtorP5JfWs5tVZFZRVh3E6RInKcqkZdjotPDc41HPJXtGhHrid6p0s3sU/VkNPhv+7WN+G0s1l+6
 JHCYbfa7w2F05fWnsDOSA/cKi8t+3B+fDeAdQFZUoduIENLf1FvCg4Uy8UgK7qm/YtiQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uidyc1DgMqTJeJdkLXlibeqhuJs2mN3qQeH5AV4lmpY=; b=PjRf0Lrcpp4WDnOU9M1790tpZD
 QJveTSxYyNiC6chC6+nemVgGqVyNA0bZNvN98Yv1ddCJVAFSg9ajNznH+H2JuwOi87i6kdDaUxI3x
 KXzCeKuXCRfVAu+UMPkL/3FVbYVU1DTWVp1lmG7M+Ing8KXOifmMXJklbMY8/10ZxpIo=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sEoCe-0004Jo-6F for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 10:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717584540;
 bh=eSiAi6Lhsei8wwn034IBNlVxZz98AQlYvyQcTm/aRaQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F0mNudOFfUPF1KXvZCSn0/j69uNCHETC1I9e0ikxSJCN7QoT+O66CUDBBUdYHS3FD
 kplcyk6oJdQdjAtqWfCC36hPvNDJxV43c9iZx50eDh4tmkcveQagw2NdexZaSHcWCH
 GiZP12DhU7dAAtHe28fdjNLoEuz8jjN1ZmGIWbdHVDRGtoL48F2JlRKDZe83GWO6Zv
 Nk3kKwbhM0niJr3UwsgMjRkrpilNR/CyAowKrqnX3E/9N/s9Q7e5OE3QPTVugkgDiP
 qmCTE5YnN1GNeo+QwHzug5MdDBuqXKFZMEnhp7EIg0Veu9cMc7uMMibMoL1F5ejZrZ
 89BKQXWc7trFg==
Received: from [100.90.194.27] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0F01F37806BA;
 Wed,  5 Jun 2024 10:48:58 +0000 (UTC)
Message-ID: <690c503e-b5eb-4f0d-a7db-b23a5899f0fd@collabora.com>
Date: Wed, 5 Jun 2024 13:48:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gabriel Krisman Bertazi <krisman@suse.de>
References: <20240529082634.141286-1-eugen.hristev@collabora.com>
 <20240529082634.141286-5-eugen.hristev@collabora.com>
 <87cyowldpm.fsf@mailhost.krisman.be>
Content-Language: en-US
In-Reply-To: <87cyowldpm.fsf@mailhost.krisman.be>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/4/24 22:17,
 Gabriel Krisman Bertazi wrote: > Eugen Hristev
 <eugen.hristev@collabora.com> writes: > >> From: Gabriel Krisman Bertazi
 <krisman@collabora.com> >> >> Instead of reimplementing ext4_ma [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: entry.name]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [46.235.227.194 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [46.235.227.194 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sEoCe-0004Jo-6F
Subject: Re: [f2fs-dev] [PATCH v17 4/7] ext4: Reuse generic_ci_match for ci
 comparisons
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
 ebiggers@google.com, jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/4/24 22:17, Gabriel Krisman Bertazi wrote:
> Eugen Hristev <eugen.hristev@collabora.com> writes:
> 
>> From: Gabriel Krisman Bertazi <krisman@collabora.com>
>>
>> Instead of reimplementing ext4_match_ci, use the new libfs helper.
>>
>> It also adds a comment explaining why fname->cf_name.name must be
>> checked prior to the encryption hash optimization, because that tripped
>> me before.
>>
>> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
>> Reviewed-by: Eric Biggers <ebiggers@google.com>
>> ---
>>  fs/ext4/namei.c | 91 +++++++++++++++----------------------------------
>>  1 file changed, 27 insertions(+), 64 deletions(-)
>>
>> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
>> index ec4c9bfc1057..20668741a23c 100644
>> --- a/fs/ext4/namei.c
>> +++ b/fs/ext4/namei.c
>> @@ -1390,58 +1390,6 @@ static void dx_insert_block(struct dx_frame *frame, u32 hash, ext4_lblk_t block)
>>  }
>>  
>>  #if IS_ENABLED(CONFIG_UNICODE)
>> -/*
>> - * Test whether a case-insensitive directory entry matches the filename
>> - * being searched for.  If quick is set, assume the name being looked up
>> - * is already in the casefolded form.
>> - *
>> - * Returns: 0 if the directory entry matches, more than 0 if it
>> - * doesn't match or less than zero on error.
>> - */
>> -static int ext4_ci_compare(const struct inode *parent, const struct qstr *name,
>> -			   u8 *de_name, size_t de_name_len, bool quick)
>> -{
>> -	const struct super_block *sb = parent->i_sb;
>> -	const struct unicode_map *um = sb->s_encoding;
>> -	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
>> -	struct qstr entry = QSTR_INIT(de_name, de_name_len);
>> -	int ret;
>> -
>> -	if (IS_ENCRYPTED(parent)) {
>> -		const struct fscrypt_str encrypted_name =
>> -				FSTR_INIT(de_name, de_name_len);
>> -
>> -		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
>> -		if (!decrypted_name.name)
>> -			return -ENOMEM;
>> -		ret = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
>> -						&decrypted_name);
>> -		if (ret < 0)
>> -			goto out;
>> -		entry.name = decrypted_name.name;
>> -		entry.len = decrypted_name.len;
>> -	}
>> -
>> -	if (quick)
>> -		ret = utf8_strncasecmp_folded(um, name, &entry);
>> -	else
>> -		ret = utf8_strncasecmp(um, name, &entry);
>> -	if (ret < 0) {
>> -		/* Handle invalid character sequence as either an error
>> -		 * or as an opaque byte sequence.
>> -		 */
>> -		if (sb_has_strict_encoding(sb))
>> -			ret = -EINVAL;
>> -		else if (name->len != entry.len)
>> -			ret = 1;
>> -		else
>> -			ret = !!memcmp(name->name, entry.name, entry.len);
>> -	}
>> -out:
>> -	kfree(decrypted_name.name);
>> -	return ret;
>> -}
>> -
>>  int ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
>>  				  struct ext4_filename *name)
>>  {
>> @@ -1503,20 +1451,35 @@ static bool ext4_match(struct inode *parent,
>>  #if IS_ENABLED(CONFIG_UNICODE)
>>  	if (IS_CASEFOLDED(parent) &&
>>  	    (!IS_ENCRYPTED(parent) || fscrypt_has_encryption_key(parent))) {
>> -		if (fname->cf_name.name) {
>> -			if (IS_ENCRYPTED(parent)) {
>> -				if (fname->hinfo.hash != EXT4_DIRENT_HASH(de) ||
>> -					fname->hinfo.minor_hash !=
>> -						EXT4_DIRENT_MINOR_HASH(de)) {
>> +		int ret;
>>  
>> -					return false;
>> -				}
>> -			}
>> -			return !ext4_ci_compare(parent, &fname->cf_name,
>> -						de->name, de->name_len, true);
>> +		/*
>> +		 * Just checking IS_ENCRYPTED(parent) below is not
>> +		 * sufficient to decide whether one can use the hash for
>> +		 * skipping the string comparison, because the key might
>> +		 * have been added right after
>> +		 * ext4_fname_setup_ci_filename().  In this case, a hash
>> +		 * mismatch will be a false negative.  Therefore, make
>> +		 * sure cf_name was properly initialized before
>> +		 * considering the calculated hash.
>> +		 */
>> +		if (IS_ENCRYPTED(parent) && fname->cf_name.name &&
>> +		    (fname->hinfo.hash != EXT4_DIRENT_HASH(de) ||
>> +		     fname->hinfo.minor_hash != EXT4_DIRENT_MINOR_HASH(de)))
>> +			return false;
>> +
>> +		ret = generic_ci_match(parent, fname->usr_fname,
>> +				       &fname->cf_name, de->name,
>> +				       de->name_len);
>> +		if (ret < 0) {
>> +			/*
>> +			 * Treat comparison errors as not a match.  The
>> +			 * only case where it happens is on a disk
>> +			 * corruption or ENOMEM.
>> +			 */
>> +			return false;
>>  		}
>> -		return !ext4_ci_compare(parent, fname->usr_fname, de->name,
>> -						de->name_len, false);
> 
> With the changes to patch 3 in this iteration, This could become:
> 
> /*
>  * Treat comparison errors as not a match.  The
>  * only case where it happens is disk corruption
>  * or ENOMEM.
>  */
> return ext4_ci_compare(parent, fname->usr_fname, de->name,
> 		       de->name_len, false) > 0;
> 

Do you mean

return generic_ci_match(parent, fname->usr_fname,
		       &fname->cf_name, de->name,
		       de->name_len) > 0;

?

Because ext4_ci_compare was obsoleted with this series.

Thanks,
Eugen


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
