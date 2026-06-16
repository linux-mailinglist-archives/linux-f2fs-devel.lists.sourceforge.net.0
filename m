Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DZTDH8K7MGoDWwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 04:58:10 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 398E568B944
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 04:58:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=i0uVhVqr;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=izmvxHof;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=IL7HgX00;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=RMAPy1Zd;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+O8KlDhTQrZzj9eBlWHC02/Xb8IIaLbpiglej7U5KJI=; b=i0uVhVqry/kgDaznl86YMHfCGE
	sDSjazEh5KypmfKLzcvogy2W0XrPPuHxYw/QS+mwUcXEBSxTYgIhsKABfh7DZCocVTkbE/n7s2LH3
	eauPOQk8/pdAcpufNq71WI+19WYStbR4S2vNW5hk47UqWITN/R509XqRyHju6fzA2JoY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZK0A-0007nR-Dr;
	Tue, 16 Jun 2026 02:58:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZK09-0007nJ-4O
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 02:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vl3O63GUD8JadTXpBNvqiNKvx8/w5mkGJGi0G0VzTA0=; b=izmvxHofAwtfX7TgZhFv59b4T9
 mguFPyzY6aHji4SC/83yt2hfgl5JwRy6DGpd2nHRWDU6wWUN4V3QTfB9gEt4G6k24uHQ1y43isw0s
 z9n/x/OTkRhcVbo/j6inq6svsMERBWCcSGOyzu5Bif25pe6qhS20zT/xmJ3TYtMw9AE0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vl3O63GUD8JadTXpBNvqiNKvx8/w5mkGJGi0G0VzTA0=; b=IL7HgX00+Vbwk/YRFSEAJ3sUFK
 0G9O8530TSEuoKM5f/UN2S6sY9lnEEzfNOYWQSzgHuK4kpmUowVSLfb6NIyX8+ai8k4CXLQ8nxvCx
 Os03Lud72fdR4uyveRHuThH1BDFr95QUZ4cLnBan/6BScZacZPlP9MK9RKB95oafU1H4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZK05-0001DS-Lf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 02:58:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D69E64373E;
 Tue, 16 Jun 2026 02:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F1D1F00A3F;
 Tue, 16 Jun 2026 02:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781578675;
 bh=Vl3O63GUD8JadTXpBNvqiNKvx8/w5mkGJGi0G0VzTA0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=RMAPy1Zd5FvsVTAkG/gUeGBDASHVe+XTLDHBzyRu2s7J/swSXn1CJl8h1Bv+JfXTM
 NLpmwinqd9fa/zauo1LkVwKB+oWcvQGAq3T/WERiUCOsB9j2iQQYg40XkMKILyBfDn
 fJNVzALi5Yj/CMKeAgWfT/okHKwwAshtx3j6+u2DUwx14kiXM+p9TOyv00gXeG54uo
 UzulhVXBAVrE7IMEcqS86X58JCV5GbxD4og8hm2maTFMadIO37IDNiclVAPUlAxHX9
 BQIrePRYs1d19n58yg9D3mF5p+VHOwNRvl5WiqYOoe0R5/ZeyEF9un2gOQjEHNu1EJ
 XY821svi1P8hw==
Message-ID: <11147e4f-74c3-4eef-8060-195267f7f390@kernel.org>
Date: Tue, 16 Jun 2026 10:57:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260603154933.16368-1-sam.moelius@trailofbits.com>
 <e7ff2e57-b81f-4195-8e33-062e77b080fe@kernel.org>
 <ajAZK_e2Em415hME@google.com>
Content-Language: en-US
In-Reply-To: <ajAZK_e2Em415hME@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/15/26 23:24, Jaegeuk Kim wrote: > On 06/15,
 Chao Yu wrote:
 >> On 6/3/26 23:49, Samuel Moelius wrote: >>> Inline dentry conversion copies
 names out of the inline dentry area >>> before checking th [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wZK05-0001DS-Lf
Subject: Re: [f2fs-dev] [PATCH] f2fs: validate inline dentry name lengths
 before conversion
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
Cc: open list <linux-kernel@vger.kernel.org>,
 Samuel Moelius <sam.moelius@trailofbits.com>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
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
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:sam.moelius@trailofbits.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[trailofbits.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 398E568B944

On 6/15/26 23:24, Jaegeuk Kim wrote:
> On 06/15, Chao Yu wrote:
>> On 6/3/26 23:49, Samuel Moelius wrote:
>>> Inline dentry conversion copies names out of the inline dentry area
>>> before checking that each recorded name length fits in the available
>>> filename slots.
>>>
>>> A corrupted image can therefore make the conversion path read past
>>> the inline filename storage while building the regular dentry block.
>>>
>>> Validate each inline dentry name length against the inline filename
>>> area before copying it.
>>>
>>> Assisted-by: Codex:gpt-5.5-cyber-preview
>>> Signed-off-by: Samuel Moelius <sam.moelius@trailofbits.com>
>>> ---
>>>  fs/f2fs/inline.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
>>> index 7aabfc9b43cb..4584dfbe3fb8 100644
>>> --- a/fs/f2fs/inline.c
>>> +++ b/fs/f2fs/inline.c
>>> @@ -507,6 +507,10 @@ static int f2fs_add_inline_entries(struct inode *dir, void *inline_dentry)
>>>  			bit_pos++;
>>>  			continue;
>>>  		}
>>> +		if (unlikely(le16_to_cpu(de->name_len) > F2FS_NAME_LEN ||
>>> +			     bit_pos + GET_DENTRY_SLOTS(le16_to_cpu(de->name_len)) >
>>> +			     d.max))
>>> +			return -EFSCORRUPTED;
>>
>> 	err = -EFSCORRUPTED;
>> 	goto punch_dentry_pages;
> 
> Applied with it.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
>>
>> Thanks,
>>
>>>  
>>>  		/*
>>>  		 * We only need the disk_name and hash to move the dentry.
>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
