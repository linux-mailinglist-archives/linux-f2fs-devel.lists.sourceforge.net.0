Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1N/wAmtqUGoqygIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 05:43:39 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 325E07370B8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 05:43:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=b02QJ6V8;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=K1rc7b14;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=j7fZLGqf;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Uqcaer3a;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+rMZzfDUzeVNSOMGcW3UTWyMbRqTG+v52lVKvu9ivo=; b=b02QJ6V86Vu1VCSN03LviwKu3i
	pPH1X0qp33zuKVLXsGWDRqW/1+qJ9orBjhdtSpMssqyHuHpARBXCy+n7x7QdjtKyRnzCn8iVWzk/5
	7jSNGeuODPg8Qv5paju+AHQcyTnt7hOMjSqAcvxI0E+k8K6QGb5XRsEzWJWlloPMzKM8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wi29C-0001Id-Bi;
	Fri, 10 Jul 2026 03:43:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wi29A-0001IW-WD
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 03:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xuYS8THmyYUSl2Qqg8gYlHRD7unJ1BcuRR6075KH6Xg=; b=K1rc7b14MUiykHzRlxa1jNxKlD
 HeSMSKFchbavIR6Wnm7JI6W047yekGqsE5Hhlw7Z9avp5bad9/Za2cluXrvNB9dS9GE+53gTWU1pa
 8x+PwQCbIH7gfYiD5srBqhLbiHdqHgfqRzU/S9/8r62DJLkQdBUs0jeGB9PRUEvswotM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xuYS8THmyYUSl2Qqg8gYlHRD7unJ1BcuRR6075KH6Xg=; b=j7fZLGqfq6IBD3+BueM9hJECE4
 DxHYiKIzENtkN1YCQAHAmEXxUZjDKg7kLPeKJKpIUTHfq0LGmhJ7KcEL+1VcyNDu/JyFUFtN76TJn
 YGWPNWPENBOy2L41xKuGvsUpM18w5+usIViJeWIpAk3VCrDDXyn5FNCBSh/4Mz6USYzY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wi29A-0003I5-FF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 03:43:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2477043E28;
 Fri, 10 Jul 2026 03:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5E91F000E9;
 Fri, 10 Jul 2026 03:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783654998;
 bh=xuYS8THmyYUSl2Qqg8gYlHRD7unJ1BcuRR6075KH6Xg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=Uqcaer3ap/mgJj9U2AHtLCA72UK1iVC4pDGswJpTwFbte4RJiywSuQAahHljjGpt4
 5eNUd9WFiXqPnJFgVrMXkHYzQJn4H6zO9T3SirS4MqntpPYpvZHEeyvttv6zh6+k1W
 j1pIE6o3LawAiWx4Yp4GWjfODQUZyj2oTEOf/cRGYSToxC6UlzBtZeR31EiHUXmNV2
 Nkq0WgdQd3aNk0LzupuM3mls/x8NAgMmFA8Wfqn1qOntiSa/OFGeXSL7EPP5mX2K0O
 B6OsvGr93Vy3Hr84qbDAtHLDOFiFxCgwYGs25pwknihEnfRu4c2N9nfau0E2UnMt4Y
 uqp6Y3oespW4g==
Message-ID: <f1ad5d3d-f4c5-498f-8378-a5efff74a458@kernel.org>
Date: Fri, 10 Jul 2026 11:43:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
References: <64ce7a28-992d-4d20-bbb1-b76943911ab4@kernel.org>
 <20260710011534.2307696-3-zhaonanzhe@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260710011534.2307696-3-zhaonanzhe@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/10/26 09:15, Nanzhe Zhao wrote: >> If the function is
 global, it needs to add f2fs_ prefix, otherwise it will >> pollute global
 namespace. > > Got it. Then folio_has_ffs() should also have a f2fs [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wi29A-0003I5-FF
Subject: Re: [f2fs-dev] [RFC PATCH 3/9] f2fs: support regular file buffered
 writes on large folios
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
Cc: Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Dev Jain <Dev.Jain@arm.com>, David Hildenbrand <David.Hildenbrand@arm.com>,
 linux-f2fs-devel@lists.sourceforge.net, Bo Zhang <zhangbo56@xiaomi.com>,
 Kalesh Singh <kaleshsingh@google.com>, Ryan Roberts <Ryan.Roberts@arm.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Pengfei Li <lipengfei28@xiaomi.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhaonanzhe@xiaomi.com,m:baohua@kernel.org,m:jyescas@google.com,m:Dev.Jain@arm.com,m:David.Hildenbrand@arm.com,m:linux-f2fs-devel@lists.sourceforge.net,m:zhangbo56@xiaomi.com,m:kaleshsingh@google.com,m:Ryan.Roberts@arm.com,m:jaegeuk@kernel.org,m:lipengfei28@xiaomi.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 325E07370B8

On 7/10/26 09:15, Nanzhe Zhao wrote:
>> If the function is global, it needs to add f2fs_ prefix, otherwise it will
>> pollute global namespace.
> 
> Got it. Then folio_has_ffs() should also have a f2fs_ prefix, right?
> Hmmmm, then should all previous ffs_* helper functions be called
> f2fs_ffs*, or f2fs_fs*? (f2fs_fs means the abbreviation of

It will be better to clean up w/ that, I guess for previous helpers in
upstream, we can clean up w/ a separated patch.

> f2fs_folio_state.) Or do you have a better naming idea?

I guess you can focus on your newly introduced function name first.

ffs_test_blk_uptodate -> f2fs_ffs_blk_test_uptodate?

> 
>>> +static bool f2fs_find_next_need_read_block(const struct folio *folio,
>>
>> Since it's static, we can get rid of f2fs_ prefix,
>>
>> find_next_invalid_block() will be better? not sure.
> 
> I think just calling it find_next_need_read_block() or
> folio_find_next_need_read_block() is better?

I think "invalid" indicates non-uptodate status of the block, it needs to
be read later.

> 
> Because this function is actually implemented to only read the first
> subpage or the last subpage in the folio which is written by partial
> write and is still not uptodate. The subpages in the middle that are fully
> covered by block-size writes are skipped from read.
> 
> I know prepare_write_begin skips read for fully covered order-0 folio.
> I want to avoid potential performance regression where large folio write_begin
> would read fully-covered middle subpages while the old order-0 folio path would
> skip such reads.
> 
> 
>>> +		if (!f2fs_lookup_read_extent_cache_block(inode, index,
>>> +						 &dn.data_blkaddr)) {
>>> +			if (IS_DEVICE_ALIASING(inode))
>>> +				return -ENODATA;
>>> +
>>> +			set_new_dnode(&dn, inode, NULL, NULL, 0);
>>> +			err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
>>> +			get_dn = true;
>>> +			if (err)
>>> +				goto out;
>>
>> Missed to call f2fs_put_dnode(&dn) in the loop?
> 
> Both the error path and the normal path will eventually reach the out label path,
> and out will call f2fs_put_dnode(&dn) if get_dn is true.
> Or am I missing something?

For above case: both head and tail has partial updated data, then we call
f2fs_get_dnode_of_data() twice, but call f2fs_put_dnode() once?

> 
>>> +		err = submit_bio_wait(bio);
>>
>> If we didn't call f2fs_submit_read_bio(), we may miss to handle tracepoint,
>> iostat and blk_crypto stuff?
> 
> Yes, But for large folio I think we need a sync read helper here, instead of
> directly switching to f2fs_submit_read_bio(). The helper should keep the synchronous
> write_begin semantics, while still going through f2fs trace/iostat and
> blk-crypto submission handling. I know iomap use submit_bio_wait for large folio
> buffered write.

Yes, please figure out a helper here to cover all trace/iostat/blk-crypto
functionality.

Thanks,

> 
> Thanks,
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
