Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEnXF9E+gmmVQgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 19:30:41 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA06DD99F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 19:30:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6n9YbOdg0jVhRr5ezaA5fqBi/BbGLs6hJXLKoGgve20=; b=PUWeJXUQXx2wgyFL2e5gAYFHgE
	WT0VDwx7iA4F/ErYMrDPMu0XI5b+7niUvdi3Ae+8wBvk5/alQlXqxi+La3y3o18FMuvYvEp2x4OjP
	RZBsa3JuB8nrY2k8luXYbshW+mA681eqO1V8HhfTTPvlWoH8cKOgnQbpU5ZLaXLtaxE8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vnLAM-0005MO-Lz;
	Tue, 03 Feb 2026 18:30:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vbabka@suse.cz>) id 1vnLAK-0005ME-HI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 18:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oUJSBz9YfynC+iGlMIj3lZdp588PvIwvXy4YD3LexCo=; b=JZmUs7CdqEjxfxGBzI+MY+61cO
 4wJTPVit4oqtlBD5qzRLawS9M3dkyAGZXHitmic5XJImU2HiSRem3va8hta/D34R6/GAeoyj7bWwx
 h0NXj+ZBfE5/HJlefLYJbHWxMlAQ/d3OfJxKDpQK1xuVgCHzRcB+neASxOIEzbyfc3Hw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oUJSBz9YfynC+iGlMIj3lZdp588PvIwvXy4YD3LexCo=; b=feEm5AjXiJU3i84GzGlxQXxLlr
 twSZ8pWyJArpcVq9ACgtHQO8YyhP8y6CX+mWEnKI2noXq1rYADK9vBiURQLW5l7lvvlLIAxJiNK2E
 rCby27CGiq9G62Mxk+obpcj39St9WoP8hIRLYzYrMMQKcefHt8ODy0KB0yLpU/6oFNNQ=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vnLAJ-00073a-Jl for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 18:30:20 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E41443E6D0;
 Tue,  3 Feb 2026 18:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770143408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oUJSBz9YfynC+iGlMIj3lZdp588PvIwvXy4YD3LexCo=;
 b=BMp0LuU6c7tESb/HwI8YWgpAgaqRM5VBaoTI6PpyN0hEz5nmO+0wBRFXL0LFTD4wf+qHav
 HFVzs0iDbjc/XPiPXKkTO1zWZClkqF2sH5FvInXKlmhvsGEjJQ8RuPD3QhRmVT1UYA7Tni
 Rd2jPvgI+blpt3ZXaDKFfCi17HJ2OMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770143408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oUJSBz9YfynC+iGlMIj3lZdp588PvIwvXy4YD3LexCo=;
 b=/jianvj6eZ6jroFLLEXpskoB0on5wdunnaNV675eJ7wsLUsBcK3tmtWPpjizl0wWmLefyw
 IPfUQFEQGp2DWyCA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=1xqZqDho;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=ZGVRnDb4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770143407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oUJSBz9YfynC+iGlMIj3lZdp588PvIwvXy4YD3LexCo=;
 b=1xqZqDhoroY+aWb+YP4sj8N2OVG7zUUNNQjcEDfMDroz2db8qqPhEd5RTMpB8ZzmWPsW8i
 yykjFFC9sRAtSIQzcwXcoc1g5j/hZbe5I2culWruG7Xc3pbo6OiF/2hlDg4pVI8tNvjiPv
 z/AJqvkwcLdwEd+i9yUq8ZGd5+PD5KQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770143407;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oUJSBz9YfynC+iGlMIj3lZdp588PvIwvXy4YD3LexCo=;
 b=ZGVRnDb4u8RrkKi2WfehmiHmUmk2lo4RNtEV2jf0cLif9mz7nx3rFYHFNCcIAP0Si240n4
 Rx6uIlrZPg6ZeiBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B6EF73EA62;
 Tue,  3 Feb 2026 18:30:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IGVOLK8+gmkiJwAAD6G6ig
 (envelope-from <vbabka@suse.cz>); Tue, 03 Feb 2026 18:30:07 +0000
Message-ID: <d9dc2ee1-283d-4467-ad36-a6a4aa557589@suse.cz>
Date: Tue, 3 Feb 2026 19:30:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
References: <CAHPqNmwK9TY5THsXWkJuYCdt7x+mZHPq65AUOLZJeMp-FdAMvA@mail.gmail.com>
 <aYBiza9L1hmhmXbb@hyeyoo>
 <fwutwpejyptpo6gqv75zanqciv3fmxvillomwcjvtz4auebbc2@vazub2ct7pa2>
 <aYHFZ5OxfL4j-_ze@hyeyoo> <aYIh1wPm7BrId9dk@infradead.org>
 <6f5881df-0e0b-4278-808b-7c0cffa12a30@suse.cz>
 <aYIpVq-jTKyTQE8G@infradead.org>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <aYIpVq-jTKyTQE8G@infradead.org>
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/3/26 17:59, Christoph Hellwig wrote: > On Tue, Feb 03, 
 2026 at 05:55:27PM +0100, Vlastimil Babka wrote: >> On 2/3/26 17:27, Christoph
 Hellwig wrote: >> > On Tue, Feb 03, 2026 at 06:52:39PM +0900, [...] 
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
X-Headers-End: 1vnLAJ-00073a-Jl
Subject: Re: [f2fs-dev] [Kernel Bug] WARNING in mempool_alloc_noprof
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
Cc: Vernon Yang <vernon2gm@gmail.com>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 roman.gushchin@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-mm@kvack.org, linux-fscrypt@vger.kernel.org, syzkaller@googlegroups.com,
 Harry Yoo <harry.yoo@oracle.com>, cl@gentwo.org, rientjes@google.com,
 Jaegeuk Kim <jaegeuk@kernel.org>, akpm@linux-foundation.org,
 =?UTF-8?B?5p2O6b6Z5YW0?= <coregee2000@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:vernon2gm@gmail.com,m:tytso@mit.edu,m:roman.gushchin@linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-mm@kvack.org,m:linux-fscrypt@vger.kernel.org,m:syzkaller@googlegroups.com,m:harry.yoo@oracle.com,m:cl@gentwo.org,m:rientjes@google.com,m:jaegeuk@kernel.org,m:akpm@linux-foundation.org,m:coregee2000@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[16];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[vbabka@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,linux.dev,vger.kernel.org,lists.sourceforge.net,kernel.org,kvack.org,googlegroups.com,oracle.com,gentwo.org,google.com,linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[vbabka@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid]
X-Rspamd-Queue-Id: 5EA06DD99F
X-Rspamd-Action: no action

On 2/3/26 17:59, Christoph Hellwig wrote:
> On Tue, Feb 03, 2026 at 05:55:27PM +0100, Vlastimil Babka wrote:
>> On 2/3/26 17:27, Christoph Hellwig wrote:
>> > On Tue, Feb 03, 2026 at 06:52:39PM +0900, Harry Yoo wrote:
>> >> Maybe the changelog could be rephrased a bit,
>> >> but overall LGTM, thanks!
>> > 
>> > 
>> > No, that does not make sense.  If mempool is used with __GFP_RECLAIM in
>> > the flags it won't fail, and if it isn't, GFP_NOFAIL can't work.
>> 
>> So that means as long as there's __GFP_RECLAIM, __GFP_NOFAIL isn't wrong,
>> just redundant.
> 
> Given how picky the rest of the mm is about __GFP_NOFAIL, silently
> accepting it where it has no (or a weird and unexpected) effect
> seems like a disservice to the users.

OK then. But I don't think we need to add checks to the mempool hot paths.
If somebody uses __GFP_NOFAIL, eventually it will trickle to the existing
warning that triggered here. If it's using slab then eventually that will
reach the page allocator too. Maybe not with some custom alloc functions,
but meh.

This f2fs_encrypt_one_page() case is weird though (and the relevant parts
seem to be identical in current mainline).
It uses GFP_NOFS, so __GFP_RECLAIM is there. It only adds __GFP_NOFAIL in
case fscrypt_encrypt_pagecache_blocks() already failed with -ENOMEM.

That means fscrypt_alloc_bounce_page() returns NULL, which is either the
WARN_ON_ONCE(!fscrypt_bounce_page_pool) case (but the report doesn't include
such a warning), or mempool_alloc() failed - but that shouldn't happen with
GFP_NOFS?

(Also the !fscrypt_bounce_page_pool is therefore an infinite retry loop,
isn't it? Which would be truly a bug, unless I'm missing something.)

Ah but fscrypt_encrypt_pagecache_blocks() can also return -ENOMEM due to
fscrypt_crypt_data_unit() returning it.

And there theoretically in v6.12.11 skcipher_request_alloc() could return
-ENOMEM. In practice I assume this report was achieved by fault injection.
But that possibility is gone with mainline commit 52e7e0d88933 ("fscrypt:
Switch to sync_skcipher and on-stack requests") anyway.

I think the whole "goto retry_encrypt;" loop in f2fs_encrypt_one_page()
should just be removed.




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
