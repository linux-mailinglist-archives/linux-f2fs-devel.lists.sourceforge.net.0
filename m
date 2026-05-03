Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCTvMS389mnBawIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 09:41:33 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 933D04B4CDE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 09:41:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:To:References:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFdaDn3jt40fix8z8Ag9nWAtJUzXp6lAbQF1AV0L6Z4=; b=Rbmwb/FsT4PG57MoguIrsiiJuQ
	Pb1q0qdzPxPLR7ZyrD4ra2IkeAVPzbtJJqmN6ReUU4tj8U0P3HkI8xth53XEPHuwHDY+Cdf9Sbn0J
	UwkmIepAqbKhZqHQkWrxtFP/omCaO0HU/wEELeL+rpL4Yna6cwfkQWcajin4dqwy87u0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wJRSD-0001e3-BW;
	Sun, 03 May 2026 07:41:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dxdt@dev.snart.me>) id 1wJRSC-0001dx-2Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 07:41:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 To:From:References:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LqhWSDCINRPUJBq0NQp54xI0NhCzqPhP9E4SCq7zTsk=; b=HHqGS+CJt0HpBDeS/H3Kr2BEDI
 IJgNaijqUC/KT+KifAPRHVjOmGSwCHX50Aquw7oSDG+2ORc8IjstB+MJhkgDoDXCZzzRNFvtNfhYL
 M3fZ0dUyLyXffwhmlbCwMuGK65aGWTQQUWGX5DVvTjZrO5zeIXrPA6jpVMX9A/nIP0sM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:To:From:References:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LqhWSDCINRPUJBq0NQp54xI0NhCzqPhP9E4SCq7zTsk=; b=lk0609ger+pNbvAQaTk2u/ZL4w
 xD+CzqJQa65klCAAD3JOjCyVzcqMLW1JJyPUHhPISb0QGAumYoyvS4KFeSNUkJXcmOHYPiQ2M3d2A
 +pXM0aqq9/PNMN4Qu5OUIV2ODtzRSussCH/WckLn3xpYLggK7qt/Q/GNfEt9Xjj9vgmU=;
Received: from embla.dev.snart.me ([54.252.183.203])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wJRS8-0003L6-3N for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 07:41:25 +0000
Received: from embla.dev.snart.me (localhost [IPv6:::1])
 by embla.dev.snart.me (Postfix) with ESMTP id 26A761D490;
 Sun,  3 May 2026 07:41:09 +0000 (UTC)
Received: from [192.168.1.18] ([182.226.25.243])
 by embla.dev.snart.me with ESMTPSA id rQP5MRX89mnzmQAA8KYfjw
 (envelope-from <dxdt@dev.snart.me>); Sun, 03 May 2026 07:41:09 +0000
Message-ID: <b6c3cbf5-d8da-4157-9b75-918633bbef1d@dev.snart.me>
Date: Sun, 3 May 2026 16:41:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
References: <69f6f8c5.050a0220.1584b9.0044.GAE@google.com>
Content-Language: en-US, ko
Autocrypt: addr=dxdt@dev.snart.me; keydata=
 xjMEYmJg1hYJKwYBBAHaRw8BAQdAf5E+ri1XLtjqYbZdHOyc8oS+1/XJ5bSlbx5WHXmVBZzN
 IERhdmlkIFRpbWJlciA8ZHhkdEBkZXYuc25hcnQubWU+wpQEExYKADwWIQQn/Jn96EMUaIoF
 X+T/ldyyrZpWaAUCYmJg1gIbAwULCQgHAgMiAgEGFQoJCAsCBBYCAwECHgcCF4AACgkQ/5Xc
 sq2aVmjJZwD8COjPlUwccrlRvbNQ6f87DWchtYO0o8W2DNRM3RLps0EA/jEhIbRV6AsyC8jr
 30Ut3aJ3/mO/6G4sLj7OvkEEBH0MzjgEYmJg1hIKKwYBBAGXVQEFAQEHQFpgtIgaByv9lIEY
 EmpavMO0pYjtu7TMJynwdnGYkN9LAwEIB8J4BBgWCgAgFiEEJ/yZ/ehDFGiKBV/k/5Xcsq2a
 VmgFAmJiYNYCGwwACgkQ/5Xcsq2aVmhFCwEA0kM9VyYB4bLCM7+SuXUUH+5Ec99Nj4RXxFad
 Key9GuwA/2BZK6bNyrLSfEk2JDRoskqf7OIL0wa6JOD5SrBnMe8E
To: syzbot <syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com>,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, chao@kernel.org,
 jaegeuk@kernel.org, jannh@google.com, linkinjeon@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, pfalcato@suse.de, sj1557.seo@samsung.com,
 syzkaller-bugs@googlegroups.com, vbabka@suse.cz
In-Reply-To: <69f6f8c5.050a0220.1584b9.0044.GAE@google.com>
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/3/26 16:27, syzbot wrote: > Hello, > > syzbot has tested
 the proposed patch and the reproducer did not trigger any issue: > >
 Reported-by:
 syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com > [...] 
 Content analysis details:   (1.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [182.226.25.243 listed in dnsbl-2.uceprotect.net]
X-Headers-End: 1wJRS8-0003L6-3N
Subject: Re: [f2fs-dev] [syzbot] [mm?] [exfat?] [f2fs?] memory leak in
 __kfree_rcu_sheaf
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
From: David Timber via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: David Timber <dxdt@dev.snart.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 933D04B4CDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=9645c21cfd1d3e8f];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,m:Liam.Howlett@oracle.com,m:akpm@linux-foundation.org,m:chao@kernel.org,m:jaegeuk@kernel.org,m:jannh@google.com,m:linkinjeon@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:lorenzo.stoakes@oracle.com,m:pfalcato@suse.de,m:sj1557.seo@samsung.com,m:syzkaller-bugs@googlegroups.com,m:vbabka@suse.cz,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[dxdt@dev.snart.me];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cae7809e9dc1459e4e63];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]

On 5/3/26 16:27, syzbot wrote:
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>
> Reported-by: syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com
> Tested-by: syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         66edb901 Merge tag 'v7.1-p3' of git://git.kernel.org/p..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=11fb7082580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=9645c21cfd1d3e8f
> dashboard link: https://syzkaller.appspot.com/bug?extid=cae7809e9dc1459e4e63
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=17f2f326580000
>
> Note: testing is done by a robot and is best-effort only.

The error message might be misleading.

 1. the report is done after f2fs attempted to mount the corrupt image,
    not before
 2. f2fs exhibits undefined behaviour, evident from the fs attempting to
    do I/O out of blockdev bounds

This might have been cause by f2fs corrupting memory in which case the
leak report is invalid.

Davo



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
