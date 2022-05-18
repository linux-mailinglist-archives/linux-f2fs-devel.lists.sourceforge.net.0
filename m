Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3D252C67B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 00:44:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrSOu-0006HS-Dx; Wed, 18 May 2022 22:44:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nrSOt-0006HM-41
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 22:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v+jQ8lksoSOm2BI5qkN12urSXZNmbI4L65nnyDWam6s=; b=J58fhGfYwCRpinuYEGO0Nwf1Ao
 8u6+yU2JGbKWcnXafZIg4Kh2VBevAjcz4JrudAWdPghPSuLdXlYrNxufCEQk7LGg1c6EKfDo20epC
 eW3mTliM4Vq6TJzPzqHtb4w07QwNRqlnC5nlLoyfojSx3xROm1OQwi8bvmlfNWvTKwGk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v+jQ8lksoSOm2BI5qkN12urSXZNmbI4L65nnyDWam6s=; b=UHNBj8fsnGgZ+ynMDXw7kogs3W
 kYjevjgUPyO8PDJ/OoEwpIMbzvZXRKjFglq7A5MtAhFuxNNlgfqowzwOe2Euk4BzxKGvResdWjScU
 TqmzbXIKT+YQXU3tMe4gsbPncFENrRjZQKGjGDBPZhzqfgqJR4Ytl6VlihG0qT1V2LVk=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrSOo-007fsN-Ak
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 22:44:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id B71A21F4146F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652913844;
 bh=L6dcGbgKc06/HeCG0OXaln8NHyKNVJM5rCJPx8KRzX8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=KNT1FFohHdRtRTp+AxVrNQY54YG1ZzolgQE6Cm876E340Uw367n3y1zt/8elfGMba
 Jbz6glAnCadF6mVtkUTQio5RKipW3OHJxXmDT1VGWoIPaet0Qh9/9LLUFAA+rD8rFF
 400MFbuFGgfOTJNPMnFT4B+nXKhOI04zgQWSaWrQ0Z4ckbTqCt7zSlcAqASfaPbIdX
 AfYY/V/mD7I/IIUrn4EnyTtD3GcN9sAEeRs7AP3wtrklA6xP6TKpLs2KmufjALS5jb
 BLwboAsGAqXY8zfOuRabbAp++/POZo0EcvlHuq5m/9TwMW1ESoaPPuHCbkqyUOCEic
 FewEtzRBjPJIQ==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <20220518172320.333617-1-krisman@collabora.com>
 <20220518172320.333617-5-krisman@collabora.com>
 <YoVHDdMYx5Lbn7aP@sol.localdomain>
Date: Wed, 18 May 2022 18:44:00 -0400
In-Reply-To: <YoVHDdMYx5Lbn7aP@sol.localdomain> (Eric Biggers's message of
 "Wed, 18 May 2022 12:20:45 -0700")
Message-ID: <87pmkawjf3.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Wed, May 18, 
 2022 at 01:23:16PM -0400,
 Gabriel Krisman Bertazi wrote: >> Instead of reimplementing
 ext4_match_ci, use the new libfs helper. >> >> Signed-off-by: Gabriel Krisman
 Bertazi <krisman@c [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nrSOo-007fsN-Ak
Subject: Re: [f2fs-dev] [PATCH v5 4/8] ext4: Reuse generic_ci_match for ci
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Wed, May 18, 2022 at 01:23:16PM -0400, Gabriel Krisman Bertazi wrote:
>> Instead of reimplementing ext4_match_ci, use the new libfs helper.
>> 
>> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>> ---
> [...]
>>  int ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
>>  				  struct ext4_filename *name)
>>  {
>> @@ -1432,20 +1380,25 @@ static bool ext4_match(struct inode *parent,
>>  #if IS_ENABLED(CONFIG_UNICODE)
>>  	if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent) &&
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
>> +		if (IS_ENCRYPTED(parent) &&
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
>> +		return ret;
>>  	}
>
> This needs an explanation for why it's okay to remove
> 'fname->cf_name.name != NULL' from the condition for doing the hash comparison
> for an encrypted+casefolded directory entry.

Hi Eric,

The reason is that the only two ways for fname->cf_name to be NULL on a
case-insensitive lookup is 1) if name under lookup has an invalid
encoding and the FS is not in strict mode; or 2) if the directory is
encrypted and we don't have the key.  For case 1, it doesn't
matter, because the lookup hash will be generated with fname->usr_name,
the same as the disk (fallback to invalid encoding behavior on !strict
mode).  Case 2 is caught by the previous check
(!IS_ENCRYPTED(parent) || fscrypt_has_encryption_key(parent)), so we
never reach this code.

I'll add the above rationale to the commit message.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
