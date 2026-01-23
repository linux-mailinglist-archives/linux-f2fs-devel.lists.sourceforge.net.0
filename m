Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE4MNTf0cmmhrQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 05:08:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E274703FF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 05:08:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5q3H3bGAVZncjw+OJg9JzhVz+RR1u5pyNyMHED/l7oU=; b=Tcy6CxnATlE1pdFlA3aBUFf9HG
	W2dKqkIBw0IRLWRxoBnN/gfNiPiafnI/zBD+4/mKAsqQ2tHnPeKcMiJ0g/r3LfESQuHjRSBu/BdaJ
	ZNJafDUlyzjbMv6qMtAI7NLS6v9nreK9z308SD4DBxq9SDmKBWbxWkLUCehE9E4US2eI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj8T6-0001OP-KW;
	Fri, 23 Jan 2026 04:08:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vj8T6-0001OJ-2j
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 04:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zMXttB3o1px7UtPahuumjb2f7+4KxLCMcPpnXnR0ss8=; b=lPVlR1tqegUTOofhdI3Zrgjxy4
 CuDuTSaFBrnNSKWhKiT0BWwXFVsF+9UssRaSUixNPJWLzrD8zV+FQXnxYKI3nnH+LzD2o62ysiU7E
 uSa0uVX5v1+YL1J284DXu/dkBSAl0Au886pykp83cfMKB0V6CYw2Ve7eSPSHPZ8uGxDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zMXttB3o1px7UtPahuumjb2f7+4KxLCMcPpnXnR0ss8=; b=mpPBkOjFszbtqvHoF+Y5KVxqs6
 ZJkla7NvGGEnSyW92ZI71CWHJ3/DKySWpHjUdKdL5KBx3qUfndkKGE+eRlmRkDKWeRgCZKniuRzpO
 PlM11njEU3JuHWQTV+To/Q0s3eT/GCesnTenzm2KJ0Wbgs2Pg1vZHwm3nvHGXGW9se+E=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj8T5-0003zb-M0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 04:08:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 02E15601ED;
 Fri, 23 Jan 2026 04:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525D7C4CEF1;
 Fri, 23 Jan 2026 04:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769141293;
 bh=T/HYvcY7VYFetxiMmPBkWe1rxWLD89ZdhJPfSk242Ik=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=c15z6QdumavZYAnmXinL3OE/e6AbtEKRUaSuxjNH9u1G3E3WiofXkTDs4z7js+ow1
 3DCiEE/zgh6lH4y9B84ZQ6d4GN551CdiIjzP45AUTpBaq6HK55RyTlm8FwisKGf6ZQ
 LOaRByZclSk6tcvZq8f/eMiLpA73nK720axo2BJF6ltBOEjwSk5dSjyd3X29KruIu8
 EGdCfFQDcEMTzTOXGV3mObH3csgkSwiTczrvKjXHKn6EeAY2pb4/U2L42YDTnqNNBp
 vtGszcKPBszVfxwCYL+HO3pTwSiEG2v2mlsGDUNjFKdC9OO1WKRbck3VLsvlaIgimh
 m8oRQ3aA4YDcQ==
Message-ID: <88894e46-f2e9-4d14-90c9-d6cda51abfcb@kernel.org>
Date: Fri, 23 Jan 2026 12:08:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joanne Chang <joannechien@google.com>, Zorro Lang <zlang@kernel.org>,
 fstests@vger.kernel.org
References: <20260108022501.754320-1-joannechien@google.com>
Content-Language: en-US
In-Reply-To: <20260108022501.754320-1-joannechien@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/8/2026 10:25 AM,
 Joanne Chang wrote: > generic/735 attempts
 to create a file with nearly 2^32 blocks. However, > some filesystems have
 a maximum file block limit below this threshold. > For insta [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vj8T5-0003zb-M0
Subject: Re: [f2fs-dev] [PATCH v3] common/rc: add _require_blocks_in_file
 helper
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
Cc: Christoph Hellwig <hch@infradead.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joannechien@google.com,m:zlang@kernel.org,m:fstests@vger.kernel.org,m:hch@infradead.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.979];
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
X-Rspamd-Queue-Id: 7E274703FF
X-Rspamd-Action: no action

On 1/8/2026 10:25 AM, Joanne Chang wrote:
> generic/735 attempts to create a file with nearly 2^32 blocks. However,
> some filesystems have a maximum file block limit below this threshold.
> For instance, F2FS is limited to approximately 2^30 blocks due to the
> capacity of the inode. So add _require_blocks_in_file helper to skip the
> test in such cases.
> 
> The helper uses a hardcoded constant instead of a programmatic method,
> so that bugs which affect the maximum file size are not masked.
> 
> Signed-off-by: Joanne Chang <joannechien@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
