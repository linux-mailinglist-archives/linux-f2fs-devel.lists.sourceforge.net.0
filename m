Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B897349A49
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Mar 2021 20:32:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPVi7-0006cw-0p; Thu, 25 Mar 2021 19:32:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1lPVi5-0006cl-By
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 19:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eSvkCo381eqVAbjV/h519ZlM/cXYTRD5G2N2zBo22Yk=; b=hqzCFr0bQRK+CTk91ymGcJm4kx
 aN/n+sUQlrj5OXDsfyiG8WOT6vKhf9qdfTN3dN7qmvYrSr4r8UQyF2tiGgkB47apUlR1qQ+qGwpFn
 xz6Cwzp+0UFSZWgMdXFHCFQdjBLyVcvZkn4jknPxifMgRfP/Ou33bJl0nkKGZ32CIPNw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eSvkCo381eqVAbjV/h519ZlM/cXYTRD5G2N2zBo22Yk=; b=XCWRP1+iZdxmPj95wLlTdDskAd
 R/9WZRIsys9Q5a+3LxZasTaGpULvUnywXaVhnM1Wk1NzPiv7Mz7YfM2hDmQooV4W/rrryE7M81U2p
 JX60hvf+9dBIq3NqlEiyn4FVD00XRWHd82smBZpoUsLkXp496NKHboD1/cxQskPNSd3I=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lPVi0-0005U1-Dw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 19:32:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 0A0F11F46850
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <20210325000811.1379641-1-shreeya.patel@collabora.com>
 <20210325000811.1379641-3-shreeya.patel@collabora.com>
 <YFziza/VMyzEs4s1@sol.localdomain>
Date: Thu, 25 Mar 2021 15:31:42 -0400
In-Reply-To: <YFziza/VMyzEs4s1@sol.localdomain> (Eric Biggers's message of
 "Thu, 25 Mar 2021 12:21:49 -0700")
Message-ID: <878s6bt4gx.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1lPVi0-0005U1-Dw
Subject: Re: [f2fs-dev] [PATCH v4 2/5] fs: Check if utf8 encoding is loaded
 before calling utf8_unload()
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
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Thu, Mar 25, 2021 at 05:38:08AM +0530, Shreeya Patel wrote:
>> utf8_unload is being called if CONFIG_UNICODE is enabled.
>> The ifdef block doesn't check if utf8 encoding has been loaded
>> or not before calling the utf8_unload() function.
>> This is not the expected behavior since it would sometimes lead
>> to unloading utf8 even before loading it.
>> Hence, add a condition which will check if sb->encoding is NOT NULL
>> before calling the utf8_unload().
>> 
>> Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
>> ---
>>  fs/ext4/super.c | 6 ++++--
>>  fs/f2fs/super.c | 9 ++++++---
>>  2 files changed, 10 insertions(+), 5 deletions(-)
>> 
>> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
>> index ad34a37278cd..e438d14f9a87 100644
>> --- a/fs/ext4/super.c
>> +++ b/fs/ext4/super.c
>> @@ -1259,7 +1259,8 @@ static void ext4_put_super(struct super_block *sb)
>>  	fs_put_dax(sbi->s_daxdev);
>>  	fscrypt_free_dummy_policy(&sbi->s_dummy_enc_policy);
>>  #ifdef CONFIG_UNICODE
>> -	utf8_unload(sb->s_encoding);
>> +	if (sb->s_encoding)
>> +		utf8_unload(sb->s_encoding);
>>  #endif
>>  	kfree(sbi);
>>  }
>
>
> What's the benefit of this change?  utf8_unload is a no-op when passed a NULL
> pointer; why not keep it that way?

For the record, it no longer is a no-op after patch 5 of this series.
Honestly, I prefer making it explicitly at the caller that we are not
entering the function, like the patch does, instead of returning from it
immediately.  Makes it more readable, IMO.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
