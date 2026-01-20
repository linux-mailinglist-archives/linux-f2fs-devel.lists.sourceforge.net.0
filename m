Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEZwM/yvb2nMKgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 17:40:28 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6025247C6B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 17:40:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGSS3Ad+HVKNV+MnRKVX06B19tvJz2sxBdeZOECL06g=; b=jpcFzdJFxK9Wa4osKMpnPIMCD4
	IqRFTX4z4wTnw9ZSu8mnoyNduDvE05uAWKb13XMIFF0SVD1BK7wmQYEJDuuniceePv9JGX6Bapzhq
	wHb+S61bRXRVGsyoQv2t4eNh+ltLvS/QpXONCbVEIn4wgwcAq2gePGtW3F1NpJPsP2/U=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viAp9-0003Su-3z;
	Tue, 20 Jan 2026 12:27:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1viAp7-0003So-Iz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 12:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dhak6n/a8Q/VPjZVF4p8nn8NFlx+WLnUCMbcRAw3hRg=; b=LZ70rpwNreh2AVvgzo1n9jyFaU
 80RzEwPkQKjc+ZSQC+c/WFKSpTV4j6IrXCdtj0uj0Ao3OQfQtt+0z5n2K7tDjh8hjhTU2jyUr7XFS
 1ZbM3QBGKUxh3y8ax7T0Wjtb7gOfxZeTzIpAsW1gGGru00cbf3E/D1WTuIoB//md8eBU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dhak6n/a8Q/VPjZVF4p8nn8NFlx+WLnUCMbcRAw3hRg=; b=bTkUUAYVhVK7Pc9ce1Nd8R5fHl
 XD6HVqcnWOwNQMz1ejjNgXPfh4eC8JQ/sJE8x2CNStT2t3FNlVWmci8EBfWq4SP+QQWiqT9fBuJN4
 NCymgNZrkKQMYMkPOIeVUgm6NGyYJDxNB8AE+YV50qR7il14ubt5bGLHq2EUkLN4O8fo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viAp7-00023b-5O for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 12:27:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 746A260008;
 Tue, 20 Jan 2026 12:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD352C19422;
 Tue, 20 Jan 2026 12:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768912014;
 bh=VPEYyaKzDkDDZlF/oxtM8lm+/5HZ+Ypwfj1mXk9p7vU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=oUdYLWk4GWxOMMpCPLXxtCNBFgEdSj9p2ji0BomgayC1Qk7/UlfAxSqUU/I/A9ztX
 L9oC9o0itKB7cjGUD+dzBbxQwAKEQ+bO32FON7betl5+rMen3thQ4MRX4oS4MyYsIK
 ilyJsi7lS5oqDaDgdQBDJYJ4wOBKIFBG5QInq/t61xB3UNZKVEAgFG5nVFNznzqki4
 xMGlwNei5MbSQE0ZI53csYVvZ7+ZNFKZqo12yzKjJSzf2SzjwHu26l+kzZoxLnrH1Q
 OxgFYjpVN8bxuHvfk9GrbNQ6ifF1XYhtzIEIbx4pHVSf37pdkhrDd3HFTW/ejJX1S4
 ehMFzQj5gtFqg==
Message-ID: <c0a36dce-4fa6-4ed2-a5ba-82267fe81eb1@kernel.org>
Date: Tue, 20 Jan 2026 20:26:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: liujinbao1 <jinbaoliu365@gmail.com>, jaegeuk@kernel.org
References: <20260114083705.944024-1-jinbaoliu365@gmail.com>
Content-Language: en-US
In-Reply-To: <20260114083705.944024-1-jinbaoliu365@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/14/2026 4:37 PM, liujinbao1 wrote: > From: liujinbao1
 <liujinbao1@xiaomi.com> > > During SPO tests, when mounting F2FS, an -EINVAL
 error was returned. > The issue originates from the f2fs_recover [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1viAp7-00023b-5O
Subject: Re: [f2fs-dev] [PATCH v3] fsck.f2fs: Check and clear invalid dent
 flag during recovery
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, Sheng Yong <shengyong1@xiaomi.com>,
 liujinbao1 <liujinbao1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jinbaoliu365@gmail.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:shengyong1@xiaomi.com,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,4.run:url];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 6025247C6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/14/2026 4:37 PM, liujinbao1 wrote:
> From: liujinbao1 <liujinbao1@xiaomi.com>
> 
> During SPO tests, when mounting F2FS, an -EINVAL error was returned.
> The issue originates from the f2fs_recover_inode_page function's
> check, where old_ni.blk_addr != NULL_ADDR under the conditions of
> IS_INODE(folio) && is_dent_dnode(folio).
> Clear dent flag of the node block to fix this issue.
> Test Step:
> 1.Modify files and induce SPO to generate fsync inode list.
>   blkaddr: 0x15828, ino: 1378, is_inode: 1, is_fsync: 2, is_dent: 0
> 
> 2.Use inject.f2fs to set dent flag for a fsync inode.
>   inject.f2fs --cp 0 --mb flag --idx 2 --val 7 /dev/vda
>   Info: inject blkaddr[2] flag of cp 2: 0x3 -> 0x7
> 
> 3.Boot verification, System fails to mount during recovery:
>   f2fs_recover_inode_page:ino: 1378, ni.blkaddr: 0x1581a,
>   old_ni.blk_addr != NULL_ADDR
>   F2FS-fs (vda): Cannot recover all fsync data errno=-22
> 4.Run fsck
>   fsck.f2fs -f /dev/vda
>   [ASSERT] (f2fs_find_fsync_inode:3924) --> Invalid dent flag:
>   blkaddr: 0x15828, ino: 1378, is_dent: 4, nat entry blkaddr: 0x1581a
>   [FIX] (f2fs_find_fsync_inode:3931) --> Clear dent flag: blkaddr: 0x15828, ino: 1378
> After this fix, the system boots normally.
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> Signed-off-by: Jinbao Liu <liujinbao1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
