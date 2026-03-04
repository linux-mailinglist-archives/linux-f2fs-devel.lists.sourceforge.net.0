Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FW/KBr4p2l1nAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 10:15:06 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B261FD653
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 10:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHCQ29jXtjjFApVamk+WTwW3ietyxIE5CvESbm7X6T0=; b=AqD56CQnW58GuEQL7RxT4d74ZN
	I6AMxXKxD+5DcA94oN+kgRgLdD2pm8rSDjDOW36mNxE3wMdx4ir7taOEfN2HuLoEUXKBwe0GEtj3O
	YTCPQyOXqyvySwCXZo/+iGRhlGt0v3AQcnfs1d/kECxMks03F5RNHFSHOjUMg76/qopw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxiJs-0008Q6-JY;
	Wed, 04 Mar 2026 09:15:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxiJr-0008PH-8i
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 09:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0vxGBpxEUqFfrnWqtqj+lCWR8ZGsUjkg3jhv/DbhZ1w=; b=bYkbHc7zV7FN7EUysDgzQy8xjW
 6ijsoTxZ1ohden+obMTaRniVBXz7B51zluaXXwoYvo5QXkbrfowbufCxpcHbSIEDLBjtNw7ptUxjY
 ohdvWmyOrW4BRfaF2rPASdI+2h3rJNBtwO3uipxvKC6yRfcFrF4cWcAU0JjgIBo8UTvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0vxGBpxEUqFfrnWqtqj+lCWR8ZGsUjkg3jhv/DbhZ1w=; b=jFKYwTGmjjLMkAomEAzs85kZ0/
 810UkjrLlmSvrXIXZigMMhIKi0x/onBHhJ9ZdDuwTAO4gdG2b/KpQvJc3yUIj1Ul0JO51Kp9Gc6a1
 gobuF5cW7Sq2THljG9R+6kUXYztKTyOJiv4K2ZLPwiktl9jz/N/Fh0U6eYtM/yEs4MWg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxiJo-0006qg-Iw for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 09:15:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2BF2A408AC;
 Wed,  4 Mar 2026 09:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3571C2BC87;
 Wed,  4 Mar 2026 09:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772615695;
 bh=6otz9s28fFtepjsE/Io5UmhuIPxV7e5S+OhsPvLvnkE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=aks1YqfhWJdB49Tu1L0GlIPVSd8kAYoNhYzneK10zYcUsvoNats9iZDlxfEWEY3zF
 mQ2TWnP4kmbGGYTz0++m7+m1jG+0VYqIRIiItOCx4Vm47Th+ptl5euvHViv3qvDwLI
 DmM55uWiXwZI3D0W5p+sDK8WI0ZrbV6Xr8Xg2Snch268BpajTny3+eQK3PmmCvLF02
 9fbawoH2hdOAtIRi+lv4UaI/OF+k83RkE39/95goimgtPk3OmdEZwGoGoJzEP6c6hs
 WK0PACHrsixnwwwq5WGoAjYASgdwA3/VYqxYfKAvEChp001tg2Qw8nArQMejAJmpCt
 bgw3uwN7nQYLw==
Message-ID: <a77cebcf-5e9b-41a9-8c4f-f7feae63e61e@kernel.org>
Date: Wed, 4 Mar 2026 17:14:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260203133635.3942502-2-monty_pavel@sina.com>
 <20260203133635.3942502-4-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260203133635.3942502-4-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/2/3 21:36, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > When `fileinfo->fi_flags` does not have the
 `FIEMAP_FLAG_SYNC` bit set > and inline data has not been persis [...] 
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
X-Headers-End: 1vxiJo-0006qg-Iw
Subject: Re: [f2fs-dev] [PATCH 2/4] f2fs: fix incorrect file address mapping
 when inline inode is unwritten
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 62B261FD653
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,vm:email]
X-Rspamd-Action: no action

On 2026/2/3 21:36, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> When `fileinfo->fi_flags` does not have the `FIEMAP_FLAG_SYNC` bit set
> and inline data has not been persisted yet, the physical address of the
> extent is calculated incorrectly for unwritten inline inodes.
> 
> root@vm:/mnt/f2fs# dd if=/dev/zero of=data.3k bs=3k count=1
> root@vm:/mnt/f2fs# f2fs_io fiemap 0 100 data.3k
> Fiemap: offset = 0 len = 100
> 	logical addr.    physical addr.   length           flags
> 0	0000000000000000 00000ffffffff16c 0000000000000c00 00000301
> 
> This patch fixes the issue by checking if the inode's address is valid.
> If the inline inode is unwritten, set the physical address to 0 and
> mark the extent with `FIEMAP_EXTENT_UNKNOWN | FIEMAP_EXTENT_DELALLOC`
> flags.
> 

Cc: stable@kernel.org

> Fixes: 67f8cf3cee6f ("f2fs: support fiemap for inline_data")
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
