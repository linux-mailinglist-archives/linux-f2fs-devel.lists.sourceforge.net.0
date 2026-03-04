Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBSJFLEkqGl3ogAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 13:25:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 031641FFA9F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 13:25:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lZCD7fIlOiNREeMmt6xeq2uMjQX5utjGVPhXTLcCvA=; b=LtxdL0pg05aAHBNEjXPuVxPwGL
	L/xUL68tzsqDNh+nwDyiNou4lL4+KtKV22q6uWUKiuo9q2iIihj1eUmiZqXuvl5T9UFR1fMesVYRh
	JXcAOZes/9oCXF21ofTu0vFQ5j+g4UW6UJ3mR3xW5xlqQ6Rdg6PQc68JQIW61XCykdrc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxlHt-0004ch-9c;
	Wed, 04 Mar 2026 12:25:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxlHs-0004cb-2s
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 12:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hW4T+CmT7JhxAVA+q/eaPiDwKNcxmMe5tHf0KMBwqvo=; b=AfsErcjjsIZjR74VEvSOc2gn5i
 XH6IhRy7anDt2Q1KKZ54ayLEVRwQsw78ZzSEQCZDK+/3y5ObiU8YN33JWqvBx+iYgpi7gnSnsdeGv
 Vels5eCDRRbG7fgzSb+8lreIR16nVUOw+80lBuhePxsJJgHllUkP6OTVFhykOpxVM3AE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hW4T+CmT7JhxAVA+q/eaPiDwKNcxmMe5tHf0KMBwqvo=; b=J5FyVLFtTx/1vXtaSQX+OVRvld
 D7ad6I0ducAQqBU594h4s3pW5quc3B/F3WteZnjtjd9eFtGKuu/ppQtveEvMvqvAkxrK6nOrGkeFp
 FP7K4plk3yizQ35HSHSfrDA4IwSy3OcRQFX3piIejMpZZFyoIZQ1LcmzfGOxA3ZOXCM4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxlHr-0008OH-MZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 12:25:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 12D1560097;
 Wed,  4 Mar 2026 12:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0720C19423;
 Wed,  4 Mar 2026 12:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772627100;
 bh=xY8w/SLBNyQ0i8Q5a3+WjokCNIdJBW4jppsDD/caqoA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=BQAjgt6bglXbxe3YQfrnj/4MpMnyfGx0N7Ig4ujPmb1xLx+AtwDrF+T8tqOafsSqX
 3DNjvxuaCJ0L3lN8sTyKnphQUt4xlxdEUJBH5NGzRvBAz7vgwFZMNz/G0Df1/8H0Xj
 KWXlKbgmNjsKpRjqR3qkLj824c8j1Qk2INgrCZKZc4RjveFd82C3GF06yZ93gbHKQo
 dJ8HUbOkYf0FzY6/XpImz+UgNijtt1OS3p5iZHp0XyF3cgKYzzXZin2ChzUcD3MNEa
 M6ZZU7HMO9WlxIWJLyjAHU9Fe/WDZm+t2pU66AvEddoKYTuuIFUhq2RYTm2D5Kmh9v
 byNhs/pldiZqw==
Message-ID: <46c69e75-f797-4121-b740-afa1096132cd@kernel.org>
Date: Wed, 4 Mar 2026 20:24:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20260303170036.2242819-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20260303170036.2242819-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/4 01:00, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Reproduction: > truncate -s 512M overflow.img
 > ./out/host/linux-x86/bin/make_f2fs -g android -b 16384 -w 16384 -O [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxlHr-0008OH-MZ
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix heap-buffer-overflow of
 reading SSA from checkpoint area
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
Cc: Daeho Jeong <daehojeong@google.com>,
 Maxim Pleshivenkov <mpleshivenkov@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 031641FFA9F
X-Rspamd-Server: lfdr
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
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kernel-team@android.com,m:daehojeong@google.com,m:mpleshivenkov@google.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,android.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Action: no action

On 2026/3/4 01:00, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Reproduction:
> truncate -s 512M overflow.img
> ./out/host/linux-x86/bin/make_f2fs -g android -b 16384 -w 16384 -O packed_ssa overflow.img
> mkdir -p empty_dir
> export ASAN_OPTIONS=detect_leaks=0:abort_on_error=1
> ./out/host/linux-x86/bin/sload_f2fs -f empty_dir -t /data overflow.img
> 
> Result:
> ==306082==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x7df5201e2500 at pc 0x5567ea010583 bp 0x7ffc3386c210 sp 0x7ffc3386b9d8
> READ of size 16384 at 0x7df5201e2500 thread T0
> 
> Even though we can reduce the summary block to 4KB, we need to maintain
> backward compatibility for the checkpoint area. Therefore, the summary
> block there must match the block size, so it is correct to use F2FS_BLKSIZE.
> 
> Fixes: ad1357c34023 ("f2fs-tools: revert summary entry count from 2048 to 512 in 16kb block support")
> Reported-by: Maxim Pleshivenkov <mpleshivenkov@google.com>
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
