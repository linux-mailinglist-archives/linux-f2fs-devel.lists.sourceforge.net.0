Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E0852DDFC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 21:52:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrmC9-0008A6-B1; Thu, 19 May 2022 19:52:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nrmC7-0008A0-6Z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 19:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nv9/SuU2916Hj0d5tTFI7g4Zi3N/SgHz7tENHCwYVsU=; b=TjKdU8bIgKdEXMQ31r5A6pOu9E
 9Opv8hzESe9ANcL/T68lqdF8v07d0/O0jGxLo1xoUlvuPfzKmMbQucEk8VZc1nYLzDeSkL3l/x9dv
 +f4hDADWmEP6z1QRhvqXuycMx/lYhDVsHwtBysfyiD+ep4lEAvBiUnj8PfahszhyCMZ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nv9/SuU2916Hj0d5tTFI7g4Zi3N/SgHz7tENHCwYVsU=; b=a1C5xDSIKoi55KJdw45iX0L7Ti
 F4G5FAh8u9hY3kvI8a73DqEYzUgVK3jWAqikmDsgJMSCGJxAbMXrB1vv3E4nkW5VMdslUsjhd96f7
 bqMhN9K9/j5P26zfDtbY7H8ApQc5bf4QH6Vz/3P7vnnQxwPCxRMF3xhni8UgyQnSgHkM=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrmC6-0002C9-H9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 19:52:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 593FA1F45F0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652989934;
 bh=VomzjzzCFyvyKndjLIaMric6uaiVW6aQWxQEa6yjllU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=mAh/bLJUBl1G654LVZymUzj4D2nRiO5B7TzDI9MKL5pot6CI3nO9Z/2MErbEV6U6i
 3t0Vv5p0dqbf+3ndgIvNBIUh5EdMVZFPPyQlcYF+wtGS114BZ/aa31rWBOm7SfE+ES
 TTZZPb5XI6ADTDZcvWeUxl2Xl/CZrWlEE+br6x0vo8sSNcoWRp4VF7ytG2DZEj3USN
 pFpiC9ymg3G5z9Jc2Y3+dlwlLsBUpXjiRbMkycL+KAAPpAdxXRrCpELTmDDK88fLn7
 v6Sik/98VUwlGfGQOSOzquinEtZM14VHsYxIOyDpdcqH723upwTXSqo3Z8OgTMgAVd
 wnLTx6N676zZQ==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <20220519014044.508099-1-krisman@collabora.com>
 <20220519014044.508099-5-krisman@collabora.com>
 <YoW8yx9Fw9Rwiaja@sol.localdomain>
Date: Thu, 19 May 2022 15:52:10 -0400
In-Reply-To: <YoW8yx9Fw9Rwiaja@sol.localdomain> (Eric Biggers's message of
 "Wed, 18 May 2022 20:43:07 -0700")
Message-ID: <87h75lnvv9.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Wed, May 18, 
 2022 at 09:40:40PM -0400,
 Gabriel Krisman Bertazi wrote: >> Instead of reimplementing
 ext4_match_ci, use the new libfs helper. >> >> It should be fine to drop
 the fname->cf_name in t [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1nrmC6-0002C9-H9
Subject: Re: [f2fs-dev] [PATCH v6 4/8] ext4: Reuse generic_ci_match for ci
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

> On Wed, May 18, 2022 at 09:40:40PM -0400, Gabriel Krisman Bertazi wrote:
>> Instead of reimplementing ext4_match_ci, use the new libfs helper.
>> 
>> It should be fine to drop the fname->cf_name in the encrypted directory
>> case for the hash verification optimization because the only two ways
>> for fname->cf_name to be NULL on a case-insensitive lookup is
>> 
>>  (1) if name under lookup has an invalid encoding and the FS is not in
>>  strict mode; or
>> 
>>  (2) if the directory is encrypted and we don't have the
>>  key.
>> 
>> For case (1), it doesn't matter, because the lookup hash will be
>> generated with fname->usr_name, the same as the disk (fallback to
>> invalid encoding behavior on !strict mode).  Case (2) is caught by the
>> previous check (!IS_ENCRYPTED(parent) ||
>> fscrypt_has_encryption_key(parent)), so we never reach this code.
>
> The code actually can be reached in case (2), because the key could have been
> added between ext4_fname_setup_ci_filename() and ext4_match().

Hm, I see! I didn't understand it would be possible to add a key during
a lookup from your previous explanation, thanks for clarifying.

> I *think* your change doesn't make it any worse, since in such a case the name
> comparison is going to be comparing a no-key name to a regular one, which will
> very likely fail.  So adding an additional way for the match to fail
> seems fine.

Either way, no point in setting it for failure.  I will restore the
fname->cf_name != NULL check.

> It's hard to reason about, though.  f2fs does things in a much cleaner way, as
> I've mentioned before, since it decides which type of match it wants at the
> beginning, when initializing struct f2fs_filename.

Yes, this is quite confusing. Are these implementation documented
anywhere?

Thank you for the review!

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
