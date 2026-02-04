Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHNjHp+Zg2lnpwMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Feb 2026 20:10:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B69EBECC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Feb 2026 20:10:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QwmWN/bjB7mivYzRmrTFwMLAHvzlhCPoyft1r86USo=; b=OOEzFR9lXLC/R4+ZMYVmnmuKbQ
	3PZkZ0M4Hq1Xh1Vd+rirFTRdBfrIlW6TKWGJqp66893bYeIAM5dOzT47WQV2cnuXMCCxfzwqpJBLY
	UvP3mocBIEl6Z1Wa4PyAtrPzXBUDdoYY4II5ervJltgSrDLv/XauPEOuXAptHHDg6Osk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vniGS-0002kh-P5;
	Wed, 04 Feb 2026 19:10:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vniGF-0002jm-80
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Feb 2026 19:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qDygt9b0t7ZzLBEATOD7cMQIy8qvNtTnpogBxkpI+zY=; b=QlIvD8UEQyeDFQtH9hzpGlMjhk
 1LfXnpXrKvpbVJ7Bf/TJnAaTffGTp7eiQ21ii0dbSLJqNuod4EbIo85m6EK1FeK/jE0hxWxDM8t/N
 Lnb1l5/wkpDHj9+r/NeIHBeBwk+24GlDUiFCG6y3uc+Xegbbcjb8iMsnDz51Me3zu4Ao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qDygt9b0t7ZzLBEATOD7cMQIy8qvNtTnpogBxkpI+zY=; b=PlYe5FMXxwMlibt/sZHy3T9173
 FNjYlMT2Q6wHR6plbVo8QULfaMzMcUB2S0FIFa5vFOEyLn8VEf8iIbNGEG4rE6bpjBjOTb+Kbl+6q
 HSKjVITgjlBn0V7Gfscw7vBEVIVANY36M/qi+8ER1Ih1Js/DtE0BvJYCOxWIRc302dXI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vniGE-0000xn-To for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Feb 2026 19:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qDygt9b0t7ZzLBEATOD7cMQIy8qvNtTnpogBxkpI+zY=; b=JuPJrE7G8oGQ8Uf9ZVQGZNBVEI
 EIja7uvXDVHUSIGY47Rm7dVgq1nOJ0haG5lS163RX8BHcbpp4xab1LR4wzrMmKA5mbhkPmZnUMkpF
 ZX2qIgWJ7iOtgCQx4CLQ23IUvesIGpxEZQwyO54sER8+lbWXgZTXgvBOiOYo32AiL/+RUugUtQtFr
 OeeEUIWW1eT8hQgoYawQEqz9NHzELcEeDsC+g9ZDE1dGCUFfrObhlZlzM8qd9zibmSWaci3sXAlci
 rZH5E1UkngseT5Q0NgcZBzXIGm+ZHykd444E68L8YxTNLVEhOtFmg5sxhZaeCOxSNKSpFc/874NVX
 kQ/0IjQA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vniFx-00000002V0z-2vYj;
 Wed, 04 Feb 2026 19:09:41 +0000
Date: Wed, 4 Feb 2026 19:09:41 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <aYOZdUTrvIjq82AE@casper.infradead.org>
References: <20260202060754.270269-1-hch@lst.de> <20260202211423.GB4838@quark>
 <aYNdmk1EE5etfUYE@casper.infradead.org> <20260204190218.GA2193@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204190218.GA2193@sol>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Feb 04, 2026 at 11:02:18AM -0800, Eric Biggers wrote:
 > Aligning to the opening bracket is the usual style as agreed on by the
 > kernel community. Says who? I've been part of the kernel community since
 1997. I've never heard of such a thing. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vniGE-0000xn-To
Subject: Re: [f2fs-dev] fsverity speedup and memory usage optimization v5
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=casper.20170209];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 26B69EBECC
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 11:02:18AM -0800, Eric Biggers wrote:
> Aligning to the opening bracket is the usual style as agreed on by the
> kernel community.

Says who?  I've been part of the kernel community since 1997.  I've
never heard of such a thing.

> It's 2026.  We generally shouldn't be formatting code manually.  We have
> better things to do.

I agree!  Stop changing it unnecessarily.

> If you're going to insist on ad-hoc formatting of argument lists, you'll
> need to be more specific about where and how you want it to be done.  It

Two tabs.  That's it.




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
