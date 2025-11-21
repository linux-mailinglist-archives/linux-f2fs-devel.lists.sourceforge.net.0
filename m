Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E52C7B313
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 19:03:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPipjxQTtse9UTyyt5R1dMnKJBLq//o+XCeg3rObY/w=; b=AIhZYFI+LVI5EhthtQRCTwxJnD
	U/SnGai8kudtdCiVTotk0naxqaSAZTvl4100GlRIvCxrODm9k3unTVnt1+Ps2XqtHTltlIiU3qKG3
	iUyxnX9e1FjKJx9BqWJOBuq3pRGJxxYFIB0+ixxwv1zAuWan1YeFK2xYErhCWxrBHXJI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMVU9-0002dP-Ew;
	Fri, 21 Nov 2025 18:03:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vMVU8-0002dJ-H3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 18:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HxseVhaWZ3YHIjgh3aRLKgUT5RqEhdtZjO7vZVJ+nMc=; b=ZQ7y6lyCxX1eVIVWOWML9mpx2L
 Kee2wYaOdgu5zPwf+3aKjaxhhGMVlnmyrALR4MeZUNYAv5auq230U7yyEk7emVAfk8MYXXi32cFQq
 56BVthKILdAYPPCjv+pe6YJPI6ehWcpu2jJBjW1b4lqBlq2rMEwCW+lz5YHy1ZmH0gZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HxseVhaWZ3YHIjgh3aRLKgUT5RqEhdtZjO7vZVJ+nMc=; b=WfIbUEWaIRhxKxe04/KQ9BxKrD
 /5GkVvs5UWf1QmFMXTV8PizpGi85vbkv/7aXo1Tns2jWaCX46ezqaptZsSw1cWGGBCpntVzZhrtTJ
 5H9JF6/EvNKuDk0yHz/8cFXpvBQ+A4e/7CdPWr0W4702oMA+bhEID86ajeZbv2tKyiM4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMVU8-0007v1-31 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 18:03:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 62F8260139;
 Fri, 21 Nov 2025 18:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3109C4CEF1;
 Fri, 21 Nov 2025 18:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763748226;
 bh=2KHDvGRFx1nvx1KKxzOyRySXNWpSsia1GYIFIFRFikY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q5UsYSw4M1gb0s6Ql3jFMq3QnL/p8LDGHG7NTwaiSd8vvD/itXu7rdTcIyIKpguQM
 bGxsPYOkrCI+c07Mi/mLFHy+Nad5/G58f6t5DIrEBfz3JtRIq/omY1qNzyItoeYH5t
 OimlBg+85ynwWIZBtgak9mLmYWfV9oYhFlVRNZPiS8AiCk7UbE1i5PiIz30NRdXrgZ
 bg1DTJ4ZVDKpCjyImphse5QZSgUec6d6j1+8TARN8B6A6Aaxq7jW6RuEpZkGGUC0Rn
 Io7bJpa3XYUGcII/bw5LnS58bpBcMo1KgA2LjtI2FGT7gsfNLad61D03swBkNAWoyI
 IbXsUcQjG1+tQ==
Date: Fri, 21 Nov 2025 18:03:44 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <aSCpgMvrvA_hR4VB@google.com>
References: <20251121014811.1971698-1-jaegeuk@kernel.org>
 <aSB3kcsneAS94DgU@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aSB3kcsneAS94DgU@casper.infradead.org>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/21, Matthew Wilcox wrote: > On Fri, Nov 21, 2025 at
 01:48:11AM +0000, Jaegeuk Kim wrote: > > This patch adds a desired folio order
 in file_ra_state in order to get > > non-zero-order allocation [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMVU8-0007v1-31
Subject: Re: [f2fs-dev] [PATCH] mm/readahead: add a desired folio order for
 readhead
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/21, Matthew Wilcox wrote:
> On Fri, Nov 21, 2025 at 01:48:11AM +0000, Jaegeuk Kim wrote:
> > This patch adds a desired folio order in file_ra_state in order to get
> > non-zero-order allocation for readahead.
> 
> Why?  Does it not ramp up quickly enough for you?
> 
> I see a lot of patches from you that say what the patch does but very
> little about why.  Please explain yourself more.

Yeah, let me revisit the patches and post another version that uplifts
code into mm/fs with what I'm trying to address.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
