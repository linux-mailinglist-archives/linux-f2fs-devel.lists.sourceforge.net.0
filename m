Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJxCB8yFp2m5iAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 02:07:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AD01F9126
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 02:07:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tNDHnwtweFv7Z//H42xCQ7O26Y0O974ixCLzYJSKf4=; b=c5jm7lA7QpxiZ1+QIIvNX1CyXW
	TPXpJavGbD79J/9D+CbRgibu4m9gswX/MBKvRmb38BXGsGrU6fGTMcblvdIJWN8Dbqx6YljBZyAE7
	eQtJLSkNzhfLbl3SemcFjbpLuIMSIFglMeyE5O2i0QQAFrXFmYRNaNqoXxOSqwtAVCJc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxahl-0006bC-BG;
	Wed, 04 Mar 2026 01:07:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxahj-0006b4-6D
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 01:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xwblp2r8GlKOSMxV8aepURgNI1Hd15KROA43/VwWcsM=; b=QKMNnEvA8+U2TsVEy5SMh9aoNX
 tht8kEtESvUPzJ92zRENDTVOjGXg91kzrj0nFJ+fzJTLw7cbAEMgbzPo38H2y73fjbb2hPQ1uENlk
 8SUTxrRFRdIRMmktSv57+upIFW3C4bLwkKrmDC3VNIp2JBbmocyojSUsKsCCEgKM8W8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xwblp2r8GlKOSMxV8aepURgNI1Hd15KROA43/VwWcsM=; b=ZoJR8iPXlhUQana3feM/kNrdE6
 fWm5Uq7hXXM5ns1To/z8dSs1hyfacB698bGel6KuM1Luk1IuNlMljSvc0/b1WTYvBa95rjRyjuLO8
 u0FmykYgDAY6W849jw7SauTUZDG7g3Ggc5jMupk07uM4l6mQus0mbrP1HPYgBCW5T8Oc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxahi-0006Tv-Mz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 01:07:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5D2A4446F7;
 Wed,  4 Mar 2026 01:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66941C116C6;
 Wed,  4 Mar 2026 01:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772586425;
 bh=ELrq2BQCywlvcGrbaKftMUplevHelhmFZ+Jko/AEX6E=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=N7YeMaT4nRxQOIu6IBYPyPmvVJ2lzkfFJFrH0my+04SnPhr/uC1veAOQtY534KOHc
 OY5SrMiJqzSd83NmYEAKuxxnD1KGLXyUVXyGHDPPMz4xTvk38md/SXgVZLHlgJ3lDF
 xCXDHLEWa7th12Zeodp/RG2BeANVh42wgheZodRB6uTNSTJgXEINZknpOxWRdTImI5
 QMWSQyAl4+ulcp5FgyFzriON3BXsaYy9Vs+T7OWFT6c3GCusNeWdnJARJbzwx0UOFe
 4y/T3wsv6ylGM2hpDjywhR1fko/EC98Ot39CV7GML+zZ/mvHAPful7rF5ZZL9EZMAS
 g6DdhJu+4jVWw==
Message-ID: <3f2fa6be-5000-4d36-998e-cfbe500cdb01@kernel.org>
Date: Wed, 4 Mar 2026 09:06:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Biggers <ebiggers@kernel.org>,
 syzbot <syzbot+cf7946ab25b21abc4b66@syzkaller.appspotmail.com>
References: <69a75fe1.a70a0220.b118c.0014.GAE@google.com>
 <20260304003551.GC57956@quark>
Content-Language: en-US
In-Reply-To: <20260304003551.GC57956@quark>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/4 08:35, Eric Biggers wrote: > On Tue, Mar 03, 2026
 at 02:25:37PM -0800, syzbot wrote: >> BUG: memory leak >> unreferenced object
 0xffff888127f70830 (size 16): >> comm "syz.0.23", pid 6144, [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxahi-0006Tv-Mz
Subject: Re: [f2fs-dev] [syzbot] [fscrypt?] [f2fs?] memory leak in
 fscrypt_setup_filename
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
Cc: tytso@mit.edu, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: C2AD01F9126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:syzbot+cf7946ab25b21abc4b66@syzkaller.appspotmail.com,m:tytso@mit.edu,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:jaegeuk@kernel.org,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cf7946ab25b21abc4b66];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

On 2026/3/4 08:35, Eric Biggers wrote:
> On Tue, Mar 03, 2026 at 02:25:37PM -0800, syzbot wrote:
>> BUG: memory leak
>> unreferenced object 0xffff888127f70830 (size 16):
>>    comm "syz.0.23", pid 6144, jiffies 4294943712
>>    hex dump (first 16 bytes):
>>      3c af 57 72 5b e6 8f ad 6e 8e fd 33 42 39 03 ff  <.Wr[...n..3B9..
>>    backtrace (crc 925f8a80):
>>      kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
>>      slab_post_alloc_hook mm/slub.c:4520 [inline]
>>      slab_alloc_node mm/slub.c:4844 [inline]
>>      __do_kmalloc_node mm/slub.c:5237 [inline]
>>      __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5250
>>      kmalloc_noprof include/linux/slab.h:954 [inline]
>>      fscrypt_setup_filename+0x15e/0x3b0 fs/crypto/fname.c:364
>>      f2fs_setup_filename+0x52/0xb0 fs/f2fs/dir.c:143
>>      f2fs_rename+0x159/0xca0 fs/f2fs/namei.c:961
>>      f2fs_rename2+0xd5/0xf20 fs/f2fs/namei.c:1308
> 
> The following commit added a call to f2fs_setup_filename() without a
> matching call to f2fs_free_filename():
> 
>      commit 40b2d55e045222dd6de2a54a299f682e0f954b03
>      Author: Chao Yu <chao@kernel.org>
>      Date:   Wed Feb 7 15:05:48 2024 +0800
> 
>          f2fs: fix to create selinux label during whiteout initialization
> 
> Chao, do you want to handle fixing this?

Oh, my bad, let me fix this ASAP.

Thanks Eric for the reminder.

Thanks,

> 
> - Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
