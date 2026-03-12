Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KSWML4TsmnKIQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 02:15:42 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFB426BDDD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 02:15:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXXQxhPUh+7g0P37kARRVpnh9aGRUzTJZyoJWenD6gA=; b=Emjov3yNtwkTRZivJKHwT6vLZW
	5JpsyPRkgVcvuQwO6KxOpKLjFUc+ozLtrvaDupnQiqSFQFQNhvzoalWn5pD+ws2dMsSyT3loozzZK
	Do9s3MUnkIs1VVR73Q1Pc5raJxgzqA7lyYSU1UHk9Pk9kQEDW1xs1ePto4yGMyFCPbXA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0UeI-0001Cg-SF;
	Thu, 12 Mar 2026 01:15:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0UeD-0001CW-VG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 01:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KWwxCEJt0hD1bt+2j77pViQbMs+/izK082vQDT9/msw=; b=RXlxIssHRyXxRXdUPJXFKfvwY+
 XOvvJS/Jwh5MeEy/BYigoBKdu1vZs3f3Yn+knP07z8tYYDfIZ9Oy14SgK8KGQa4e9QOQW5vlhuQwo
 SFw+PI+T5TD/nBlm7dGRqc8SBSmz+UMrvpnyyMHoHGO1ZFy41xhTLXdbmUgOb4purU5M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KWwxCEJt0hD1bt+2j77pViQbMs+/izK082vQDT9/msw=; b=P9gCcOy8eHS/HML5+EDggGWHSR
 NtcuNSElVl1pnS1++qAA4W15p3j7Yhu2XQFoq79/NB4v2gJOmC9K3q+/VUHu5pmzs9MnxfYw3GCSM
 ObV+q8paC8206QXfEgN3V34j6IcmR18b7ImO5o7Ik1cUymVCrPq4fPdo322sozm8kma0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0UeD-00037u-Dv for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 01:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A50C16012B;
 Thu, 12 Mar 2026 01:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1172C4CEF7;
 Thu, 12 Mar 2026 01:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773278122;
 bh=gJjqzU6Xtepxc6JM8FqsXQFbGaGLC4qjjou0nyOKxzw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=QPm19NXKU71xSnEFrzZN7W3H+SyFwIRhHDowl+GC1xpI1RvRIPlCc+auuBRur5c3s
 uP5t925XZ7U6/emHLLTbFF1r02ZV3jpWddfMMik+H+jXkC7LHp04avh+ZPBrG0OSSw
 hvJoA0tZSegu+f+dslfknNbQ1iG6B50Ub3/I+gR/6OgXFsByY+oQz0iwoPdOzHiaa4
 Rx2bD7vmlaU4ZSzI5LIt+PCdzjjNuTg6y8H4tZg4n/1bJy9Y8FWo1ef5Q/gsQFIMnH
 bEu81zsBIcXSS2mcdoCUyFABQu/B6me/w8FLNVcF72xGc8rwmGGyq3cG/oXXhx+YFa
 AKjrNUAp8f3Lw==
Message-ID: <4f348e52-5911-4e37-b9be-d6f06418fb5a@kernel.org>
Date: Thu, 12 Mar 2026 09:15:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <2026022422-robotics-conform-9b68@gregkh>
 <dd4b275e-4db9-4951-9db2-9eaf4aef48ec@kernel.org>
 <abG03yz64OhRossb@google.com>
Content-Language: en-US
In-Reply-To: <abG03yz64OhRossb@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/12 02:30, Jaegeuk Kim wrote: > On 03/09, Chao Yu
 wrote: >> On 2/24/26 09:04,
 Greg Kroah-Hartman wrote: >>> f2fs_convert_inline_inode()
 holds the page lock of the inline data page >>> and the [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0UeD-00037u-Dv
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix potential deadlock in
 f2fs_convert_inline_inode
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:gregkh@linuxfoundation.org,m:stable@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 0EFB426BDDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/12 02:30, Jaegeuk Kim wrote:
> On 03/09, Chao Yu wrote:
>> On 2/24/26 09:04, Greg Kroah-Hartman wrote:
>>> f2fs_convert_inline_inode() holds the page lock of the inline data page
>>> and then calls f2fs_lock_op(), which acquires cp_rwsem in read mode.
>>> At the same time, f2fs_write_checkpoint() can acquire cp_rwsem in write
>>> mode and then will wait for page locks, like during
>>> f2fs_write_node_pages() or data flushing, leading to a deadlock.
>>
>> - f2fs_convert_inline_inode		- f2fs_write_checkpoint()
>>   - f2fs_grab_cache_folio page #0
>> 					 - block_operations
>> 					  - f2fs_lock_all
>>   - f2fs_lock_op
>> 					  - f2fs_sync_node_pages
>> 					   - flush_inline_data
>> 					    - f2fs_filemap_get_folio page #0
> 
> flush_inline_data -> f2fs_filemap_get_folio(FGP_LOCK|FGP_NOWAIT) does not
> wait for the lock, right?

Oh, I missed that, that explain why I never hit such deadlock. :)

Thanks,

> 
>>
>> It seems true, although I didn't hit such deadlock.
>>
>> To Jaegeuk, what do you think?
>>
>>>
>>> Fix this by acquiring the lock_op before locking the page. This ensures
>>> the correct lock ordering, op before page, and avoids the deadlock.
>>>
>>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>>> Cc: Chao Yu <chao@kernel.org>
>>> Cc: stable <stable@kernel.org>
>>> Assisted-by: gkh_clanker_2000
>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> ---
>>>
>>> This issue was found by running a tool to compare a past kernel CVE to
>>> try to find any potential places in the existing codebase that was
>>> missed with the original fix.  I do not know if this patch or text
>>> really is correct, but the code paths seems sane.
>>>
>>> Note that the majority of the changelog text came from an untrusted and
>>> experimental LLM model that is known for making crap up.  So it might be
>>> totally lying here, and if so, I am very sorry for wasting anyone's time
>>> and I'll just go back to running this on code that I actually understand
>>> and know how to verify myself, but I figured it was worth at least
>>> asking you all about it.
>>>
>>> fs/f2fs/inline.c | 10 ++++++----
>>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
>>> index 0a1052d5ee62..98bc920a4f35 100644
>>> --- a/fs/f2fs/inline.c
>>> +++ b/fs/f2fs/inline.c
>>> @@ -232,12 +232,14 @@ int f2fs_convert_inline_inode(struct inode *inode)
>>>   	if (err)
>>>   		return err;
>>>   
>>> -	folio = f2fs_grab_cache_folio(inode->i_mapping, 0, false);
>>> -	if (IS_ERR(folio))
>>> -		return PTR_ERR(folio);
>>> -
>>>   	f2fs_lock_op(sbi, &lc);
>>>   
>>> +	folio = f2fs_grab_cache_folio(inode->i_mapping, 0, false);
>>> +	if (IS_ERR(folio)) {
>>> +		f2fs_unlock_op(sbi, &lc);
>>> +		return PTR_ERR(folio);
>>> +	}
>>> +
>>
>> It will be better to adjust the unlock order in between cp_rwsem and folio lock?
>>
>> out:
>> 	f2fs_folio_put(folio, true);
>> 	f2fs_unlock_op(sbi, &lc);
>>
>> Thanks,
>>
>>>   	ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
>>>   	if (IS_ERR(ifolio)) {
>>>   		err = PTR_ERR(ifolio);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
