Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJoUJKDAs2lQagAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 08:45:36 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D44BB27EED3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 08:45:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDGyIgenVvQakZJCzWmUScsiGgjOE1XLF9eUqCTtsFY=; b=EDpSBIyu4PwzLYJBTSPYw9sGUo
	Ohqu196GGfPVlKIPKgxeH78hucwvPhtJ9f34gZ44MYPfiQDMIETW5bapmN32hcO/JO8G8j9+CscaG
	0zB5qqRRxW3Gl29TbXHCJKOxTfcMd/459+y+4mFVtAlgOtXjCnpgtck3mdPRISspzMtM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0xD6-00015h-46;
	Fri, 13 Mar 2026 07:45:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0xD5-00015Y-3g
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 07:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JluEX2fy3q6sHW+iiHUDpZmgjEkXn3vZdtpG8cRASbE=; b=irO7v+jn5wsh0uukX4N+7fMAAf
 weZ0F7T+crcTMyfsNNwmHiLjBsI7zxvUTVcaffPlLIu+qbS6FXgTGzDe1PRvuwzxZEZG2s9p1EjQf
 P+YVyU5+bPDPBE3JuIz1+wIEBViX12CrQ68gfcmv065XOwZKQ9zVY1V6YgzQjcniR5kY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JluEX2fy3q6sHW+iiHUDpZmgjEkXn3vZdtpG8cRASbE=; b=g+Uriar6tNTgbtEGMLLjLPmchP
 NgbiZvJUfqmSiKxALfn1j1CxMmt7EONxjAYZJ99zSpAiJay4Bmdjo9tU38UpA6J0Npq3Mh3gpcY6h
 3KEGmOmIThV2QaMELBJzJSL4khtW1TlC+Oe0k+knAKgt5DCT14012TJouLrQzoJIv0xw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0xD4-0008IA-Ci for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 07:45:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 65EBA60130;
 Fri, 13 Mar 2026 07:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E3DC19421;
 Fri, 13 Mar 2026 07:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773387915;
 bh=QLtG9/4GxAHmntod/5fYn/dD30apEMsSsw4oBgbFtM4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=MWrfL82MonORdKopFBeiEFy0saT1Qt+wRKYm54YEn1F3Sr2gSi6VUNKLMhV7NNk/1
 4xqk12pCZ14v5cuTjbufC1U0xuLNBMzmOXkhXr8LwIfJ5XB8yi3iVg2OYB51l8Zc9q
 iW32wFiFgNLRa0oi80uODdw4waK9l76SQ/rrAZnkUu35yN/sFKEa5YcmqfvhzJtF+j
 YIjIb7G2TNLEfD90v2SU5+RE7BU8HKIbFGqkLiJprcdATEstAXwXS9mItRyi1FNsXS
 uWC9kcBQ567MIApoqIST8H/sUade9JlLgqsR5bO8kwKrvy3qancY4KmpNQ+u3JqRj7
 WS67Q+E/Bb8/w==
Message-ID: <0b5bfbdd-fc2d-4dc2-91d3-9af1b5703a76@kernel.org>
Date: Fri, 13 Mar 2026 15:45:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kth5965@gmail.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20260224160654.448538-1-kth5965@gmail.com>
 <20260224165408.450957-1-kth5965@gmail.com>
 <9df7bc57-f0e1-4c7b-9ce1-0017eab62c2a@kernel.org>
 <20260309142509.75703-1-kth5965@gmail.com>
Content-Language: en-US
In-Reply-To: <20260309142509.75703-1-kth5965@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/9/2026 10:25 PM, kth5965@gmail.com wrote: > Hi Chao,
 > > Thanks for the comment. > > I took another look at the path, and I think
 you are right that my > current fix is too broad and may hide the [...] 
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
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0xD4-0008IA-Ci
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
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:kth5965@gmail.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:syzbot+fc026e87558558f75c00@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,fc026e87558558f75c00];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: D44BB27EED3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/9/2026 10:25 PM, kth5965@gmail.com wrote:
> Hi Chao,
> 
> Thanks for the comment.
> 
> I took another look at the path, and I think you are right that my
> current fix is too broad and may hide the real problem.
> 
> It looks like this happens in a more specific case, where an inode
> still has FI_INLINE_DATA set, but FI_DATA_EXIST is not set.
> 
> In that case, f2fs_truncate() goes into the inline conversion path,
> and f2fs_convert_inline_inode() grabs folio 0 before it checks
> whether there is real inline data to move.
> 
> Then f2fs_convert_inline_folio() does this:
> 
> 	if (!f2fs_exist_data(dn->inode))
> 		goto clear_out;
> 
> So for the empty-inline case, it returns success, but folio 0 seems to
> have already been added to the page cache by then.
> 
>  From what I can see, f2fs_grab_cache_folio() may create folio 0 and add
> it to inode->i_mapping when there is no folio at that index, so
> inode->i_data.nrpages becomes 1 there.
> 
> After that, f2fs_folio_put() only drops the ref, and the folio stays
> there. Because of that, clear_inode() later sees nrpages != 0 and
> hits the BUG.
> 
> This is the flow I am seeing:
> 
> f2fs_evict_inode()
>    -> truncate_inode_pages_final(&inode->i_data)
>       // nrpages = 0
> 
>    -> i_size_write(inode, 0)
>    -> f2fs_truncate(inode)
>       -> !f2fs_may_inline_data(inode)
>       -> f2fs_convert_inline_inode(inode)
>          -> f2fs_grab_cache_folio(inode->i_mapping, 0, false)
>             // folio 0 is inserted into page cache
>             // nrpages = 1
>          -> f2fs_convert_inline_folio(&dn, folio)
>             -> !f2fs_exist_data(inode)
>             -> clear_out
>          -> f2fs_folio_put(folio, true)
>             // only drops the ref
>             // folio stays in page cache
> 
>    -> clear_inode()
>       -> BUG_ON(inode->i_data.nrpages)

Hi,

Sorry for the late reply.

Yes, we may missed to truncate page #0 cache once we converted inline
inode.

The reason why we convert the inline inode is the inode may already
be corrupted (filesize is larger than MAX_INLINE_DATA(), and it has
FI_INLINE_DATA flag).

My question is: we should has ability to detect such corrupted inode
in sanity_check_inode(), however, I didn't find any log related to that,
any thoughts?

Thanks,

> 
> So it seems better to fix this in the inline conversion path,
> instead of truncating all page cache again at the end of eviction.
> 
> If you agree, I can send a new patch in that direction.
> 
> Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
