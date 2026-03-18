Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL0LH7Eeuml8RwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 04:40:33 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F282B5890
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 04:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFmf7A6HedulIvGvnagzmgjNMmAFDK0zxjJ6SRvQH8E=; b=NuYObnzU23uM2esXZ0CUms5RGh
	QbcSa9i4X/6MuEsyIKfHmAfSeaBsTNpFkD02oPhPOfOxfcY9W3JnIs66aJcemkekNnLsDBBhtwaD/
	zmrEiebxtvhoGlJ+Q82vcvoJnmXTfD098W20wL1vZKe7VkuU6J78NsJDzVRxZY6wQGxg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2hlf-0001Ug-Ls;
	Wed, 18 Mar 2026 03:40:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w2hle-0001UZ-A3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 03:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XNcor91Thb1B/ZJrMxXlS+0l2AjsfvFESaM4n19GKHo=; b=jaoQlHY2P1HdMmRxpHW1QRYvVs
 OvMICv6mozJt5Vae5oUD5R5ZeVLW2Wg1elea8QfCLfQN2ytdghCAxupLFxadsNZLJZsBxBq383ElZ
 8pEaoW2JiqlutVQdoY9c1XCiqBA9qegN7Aa0MjAQN1UC9xkPLGLdRc6gTF1i58F/BmFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XNcor91Thb1B/ZJrMxXlS+0l2AjsfvFESaM4n19GKHo=; b=DXvN7iiw1h88hzLujtjBA1EPSm
 cnKrDcxtyDY67rTpxktc5e/HGUbF6f+T9zTBqyxoMtiWtpbj8jddV3r5wkpPRXM8xZ1PPpXNoyXBa
 V/k69xmiHLy/LQhuMeeKGZPghgvB5jP1jza5EFkUJl79s7o0yM6Wz6DSIjt9mRMsdrcU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2hld-00057Q-SF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 03:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3363F60054;
 Wed, 18 Mar 2026 03:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FA3C19421;
 Wed, 18 Mar 2026 03:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773805210;
 bh=OXMUnIxJ+VFx0JKn/GRXL++ZXg6KH3cw2Oj787ZBwwQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=p6L3O0yV4tf4Mw36cWBeZLUdoQ1j69bHxrD0uTlJN1sbeiY1mPRiGpBmP6AvGlBT4
 Uuua2n/qzw7JMhBu5puMH89jLEd3Q0aT+pYh368ZwHhwdKkeG0Q2H/uNZ/fNva65TI
 6CweUQpyPXFZ0op1wZ9PDD8vcQwTE/5I+bIv3aBlfp04QckMogyO4axNCgh72GF8GZ
 vxyNVgEUeL2jkQZ3ifky1aHqQo4fdsf+WwhwPPAqmqTe5KrQ0devWC9Xt9bGpHGQIn
 68YVkjDxR1UNWUTmCGXT/m0Cvm5EcdlFztnRWBezw21zpAaM+MWdBGv3WAVTEtaU9w
 RftK/A66/tXsQ==
Message-ID: <b044d785-cf71-4186-b208-c375c605893b@kernel.org>
Date: Wed, 18 Mar 2026 11:40:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kth5965@gmail.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <9df7bc57-f0e1-4c7b-9ce1-0017eab62c2a@kernel.org>
 <20260317152838.26664-1-kth5965@gmail.com>
Content-Language: en-US
In-Reply-To: <20260317152838.26664-1-kth5965@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On 2026/3/17 23:28, kth5965@gmail.com wrote: > Hi Chao, 
 > > I checked the repro again based on your comment and added some debug
 > logs around the related paths. > > What I saw was roughly as follows. [...]
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
X-Headers-End: 1w2hld-00057Q-SF
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: evict: truncate page cache before
 clear_inode
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
Cc: linux-kernel@vger.kernel.org,
 syzbot+fc026e87558558f75c00@syzkaller.appspotmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS(0.00)[m:kth5965@gmail.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:syzbot+fc026e87558558f75c00@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,fc026e87558558f75c00];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: C1F282B5890
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 2026/3/17 23:28, kth5965@gmail.com wrote:
> Hi Chao,
> 
> I checked the repro again based on your comment and added some debug
> logs around the related paths.
> 
> What I saw was roughly as follows.
> 
> There was already an abnormal inline state in the read path:
> inline flag: set
> data_exist: clear
> blocks: present
> 
> This case was not rejected by sanity_check_inode(). From what I saw,
> the inline sanity check does an early return when inode_has_blocks()
> is true, so I think this case was skipped there. I think this may also
> explain why there was no sanity warning in the log.
> 
> After that, in the eviction path, i_size was already reduced to 0, but
> f2fs_truncate() still entered the inline conversion path, and
> f2fs_convert_inline_inode() created folio 0 in the page cache first.
> 
> Then f2fs_convert_inline_folio() handled the empty inline case as
> success because of !f2fs_exist_data(inode), and the created folio 0
> remained in the page cache. Because of this, nrpages stayed 1 right
> before clear_inode().

The root cause that you pointing out make sense to me. Thanks for the debug
and analysis!

> 
>  From this, I think there may be two possible directions for fixing
> this:
> 
> 1. prevent folio 0 from being created at all in the empty inline case,
>     or delay folio creation until it is actually needed
> 2. detect or guard this abnormal inline state earlier, in sanity check
>     or before that stage

IMO, I think we need to fix both two places:

2) helps to detect this in early stage, so that we can know target inode is
corrupted via log and error number returned.

However, during 2) process, we will still call into f2fs_evict_inode(), and
do inline conversion eventually, so we need to implement 1) to avoid remained
page #0 cache, IIUC.

What do you think?

Thanks,

> 
> At this point, both directions seem possible to me. I wanted to ask
> which direction you think would be more appropriate.
> 
> If there is anything else I should check, please let me know.
> 
> Thanks.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
