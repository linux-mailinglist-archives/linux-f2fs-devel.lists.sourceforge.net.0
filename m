Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D63AE72D6C7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 03:17:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8sew-0001MO-Is;
	Tue, 13 Jun 2023 01:17:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q8sev-0001MI-J7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 01:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JCXS9RVoWyQ8tZ3zvAkVoHvfNuKfvf65GpYZMhV+OkI=; b=H/HWw1lMMNpbEkmeMamPahMs2T
 LAwtEDIf3lGfOUozxVvYxQyVDGByIg2sk3aEH/KH6Zyvr4r4jlitDQc+hre6/NiFWlRJ28KAQAiMO
 WSXYrq6k19zP3Rbrj9LPLkuxWbkI2TAhycm1Ap9l9MiKMauyrBY1KAVxLU2I4sif+770=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JCXS9RVoWyQ8tZ3zvAkVoHvfNuKfvf65GpYZMhV+OkI=; b=E/d8pNKeU/86OPJgmnfjQe3dpe
 afTOq8EGiVt9tgXHtDIvqicziGIT2lVffGdLUBk+aMd4cBxhaBmXoNWLQCCBCF+40bh+t3PZVnVTj
 x59Pg3yvtAsPJQO/oYeJTbvJ7z2m4glKy8i2RmTwQdltIOy0OE7Quj6abwtodKQdm6g4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8sev-000786-Id for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 01:17:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3144161EAE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Jun 2023 01:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADEBC433EF;
 Tue, 13 Jun 2023 01:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686619035;
 bh=qVogE3ETyDqc7JCGQluQKPrp6D7FuS4h1RFfsCpPrSU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ffPlAexSWwbkkSJDdzmHrcbNQiJxgkfy7hAaUlPNYCILAevymwGE+SkEn1uc1DcXo
 uUFsJVJyVNJZiPOxPsQpPEOYZZheoi2kyZRJBzCEnsIn35Gj6lT37psr8g7xUVF3vO
 92YxsfVLfyYmDtevYO4VN6FKthiB8k+ZhxrXyUXLn5JUvNbkkIHJCc12K7NOF6Jfq9
 QcQOWxef23522JrweyPa2MSe8chc9LqvZR//rs0pBe9N8wg8jIVLOeAFk5KlStHADU
 kojwR5fYoxI3qaxx0oKAZFKUcLfXqJ74i4TQMi9SzHj1VmhhRVWr66sEXbEwIWsOug
 WiwCnwRipPpPw==
Message-ID: <1188a53e-abfb-8fe2-6337-3845ac103d61@kernel.org>
Date: Tue, 13 Jun 2023 09:17:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230531014055.3904072-1-chao@kernel.org>
 <ZId9Cw8eqgj417gz@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZId9Cw8eqgj417gz@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/13 4:16, Jaegeuk Kim wrote: > On 05/31, Chao Yu
 wrote: >> There are several issues in sanity_check_inode(): >> - The code
 looks not clean, it checks extra_attr related condition >> dispersiv [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8sev-000786-Id
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: do more sanity check on inode
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/13 4:16, Jaegeuk Kim wrote:
> On 05/31, Chao Yu wrote:
>> There are several issues in sanity_check_inode():
>> - The code looks not clean, it checks extra_attr related condition
>> dispersively.
>> - It missed to check i_extra_isize w/ lower boundary
>> - It missed to check feature dependency: prjquota, inode_chksum,
>> inode_crtime, compression features rely on extra_attr feature.
>> - It's not necessary to check i_extra_isize due to it will only
>> be assigned to non-zero value if f2fs_has_extra_attr() is true
>> in do_read_inode().
>>
>> Fix them all in this patch.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - describe current problem in commit message
>>   fs/f2fs/f2fs.h  |   2 +
>>   fs/f2fs/inode.c | 108 +++++++++++++++++++++++++++++++-----------------
>>   2 files changed, 72 insertions(+), 38 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 7e406da8b4b3..619ad49993ce 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -3413,6 +3413,8 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
>>   	((is_inode_flag_set(i, FI_ACL_MODE)) ? \
>>   	 (F2FS_I(i)->i_acl_mode) : ((i)->i_mode))
>>   
>> +#define F2FS_MIN_EXTRA_ATTR_SIZE		(sizeof(__le32))
>> +
>>   #define F2FS_TOTAL_EXTRA_ATTR_SIZE			\
>>   	(offsetof(struct f2fs_inode, i_extra_end) -	\
>>   	offsetof(struct f2fs_inode, i_extra_isize))	\
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>> index 0a1748444329..1e49009831c1 100644
>> --- a/fs/f2fs/inode.c
>> +++ b/fs/f2fs/inode.c
>> @@ -300,41 +300,79 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>>   		return false;
>>   	}
>>   
>> -	if (f2fs_sb_has_flexible_inline_xattr(sbi)
>> -			&& !f2fs_has_extra_attr(inode)) {
>> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
>> -		f2fs_warn(sbi, "%s: corrupted inode ino=%lx, run fsck to fix.",
>> -			  __func__, inode->i_ino);
>> -		return false;
>> -	}
>> -
>> -	if (f2fs_has_extra_attr(inode) &&
>> -			!f2fs_sb_has_extra_attr(sbi)) {
>> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
>> -		f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
>> -			  __func__, inode->i_ino);
>> -		return false;
>> -	}
>> -
>> -	if (fi->i_extra_isize > F2FS_TOTAL_EXTRA_ATTR_SIZE ||
>> +	if (f2fs_has_extra_attr(inode)) {
>> +		if (!f2fs_sb_has_extra_attr(sbi)) {
>> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
>> +				  __func__, inode->i_ino);
>> +			return false;
>> +		}
>> +		if (fi->i_extra_isize > F2FS_TOTAL_EXTRA_ATTR_SIZE ||
>> +			fi->i_extra_isize < F2FS_MIN_EXTRA_ATTR_SIZE ||
>>   			fi->i_extra_isize % sizeof(__le32)) {
>> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
>> -		f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_extra_isize: %d, max: %zu",
>> -			  __func__, inode->i_ino, fi->i_extra_isize,
>> -			  F2FS_TOTAL_EXTRA_ATTR_SIZE);
>> -		return false;
>> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_extra_isize: %d, max: %zu",
>> +				  __func__, inode->i_ino, fi->i_extra_isize,
>> +				  F2FS_TOTAL_EXTRA_ATTR_SIZE);
>> +			return false;
>> +		}
>> +		if (f2fs_sb_has_flexible_inline_xattr(sbi) &&
>> +			f2fs_has_inline_xattr(inode) &&
>> +			(!fi->i_inline_xattr_size ||
>> +			fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
>> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
>> +				  __func__, inode->i_ino, fi->i_inline_xattr_size,
>> +				  MAX_INLINE_XATTR_SIZE);
>> +			return false;
>> +		}
>> +		if (f2fs_sb_has_compression(sbi) &&
>> +			fi->i_flags & F2FS_COMPR_FL &&
>> +			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
>> +						i_compress_flag)) {
>> +			if (!sanity_check_compress_inode(inode, ri))
>> +				return false;
>> +		}
>> +	} else {
>> +		if (f2fs_sb_has_flexible_inline_xattr(sbi)) {
> 
> Modified to combine else if.

Better, thanks.

Thanks,

> 
>> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, run fsck to fix.",
>> +				  __func__, inode->i_ino);
>> +			return false;
>> +		}
>>   	}
>>   
>> -	if (f2fs_has_extra_attr(inode) &&
>> -		f2fs_sb_has_flexible_inline_xattr(sbi) &&
>> -		f2fs_has_inline_xattr(inode) &&
>> -		(!fi->i_inline_xattr_size ||
>> -		fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
>> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
>> -		f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
>> -			  __func__, inode->i_ino, fi->i_inline_xattr_size,
>> -			  MAX_INLINE_XATTR_SIZE);
>> -		return false;
>> +	if (!f2fs_sb_has_extra_attr(sbi)) {
>> +		if (f2fs_sb_has_project_quota(sbi)) {
>> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
>> +				  __func__, inode->i_ino, F2FS_FEATURE_PRJQUOTA);
>> +			return false;
>> +		}
>> +		if (f2fs_sb_has_inode_chksum(sbi)) {
>> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
>> +				  __func__, inode->i_ino, F2FS_FEATURE_INODE_CHKSUM);
>> +			return false;
>> +		}
>> +		if (f2fs_sb_has_flexible_inline_xattr(sbi)) {
>> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
>> +				  __func__, inode->i_ino, F2FS_FEATURE_FLEXIBLE_INLINE_XATTR);
>> +			return false;
>> +		}
>> +		if (f2fs_sb_has_inode_crtime(sbi)) {
>> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
>> +				  __func__, inode->i_ino, F2FS_FEATURE_INODE_CRTIME);
>> +			return false;
>> +		}
>> +		if (f2fs_sb_has_compression(sbi)) {
>> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
>> +				  __func__, inode->i_ino, F2FS_FEATURE_COMPRESSION);
>> +			return false;
>> +		}
>>   	}
>>   
>>   	if (f2fs_sanity_check_inline_data(inode)) {
>> @@ -358,12 +396,6 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>>   		return false;
>>   	}
>>   
>> -	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
>> -			fi->i_flags & F2FS_COMPR_FL &&
>> -			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
>> -						i_compress_flag))
>> -		return sanity_check_compress_inode(inode, ri);
>> -
>>   	return true;
>>   }
>>   
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
