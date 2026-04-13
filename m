Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP0dKINy3WkgeQkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Apr 2026 00:47:31 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A9F3F4075
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Apr 2026 00:47:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoeMHwz2CXgqD9foruQXJuHMY/t/Z9eFyxy9RAhw1q0=; b=l+mpjvxv68JCSB18qaDHx+6N0B
	FipQI2PXHEgMUbOOx9qra06mO4Hm6F5RMO2q0i2FkItgWNr2KvkfMlJ4evVxJZPSxtrtRLSZwBhdC
	GRi6A1rvinY9Uu3FA704B3ii/rXa/W4APhSMgkhSs6iQf/KEe5PX6Kyuvr7lm9X5sLDk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wCQ41-0005VQ-T1;
	Mon, 13 Apr 2026 22:47:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wCQ40-0005VK-VW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 22:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=72Ck8//wWhXz9s8uAFJctt5DmDg9/B70EJAbFuH3/lA=; b=m48CPy1PH+2Utn0JmO+/YI2k+p
 vh66UAPArV+AMAoERujs7o3UGFe2IKCRQoZFeBEUo8r9UY6wjkgCKOvF30OZQHhspx16rfzds5Or8
 bt1ps2x4lYSa4a5tNIkiGHjAMlBjbE3nUHjjsTC90mKmHZaR8WqEELGj8qgf+C4oKsmQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=72Ck8//wWhXz9s8uAFJctt5DmDg9/B70EJAbFuH3/lA=; b=m8QTvOGt90eGvXCuFvSZpPirvK
 J9eThZbyw76gEakpefSdQoh3v3Jh48Qwbndln7dUjhj/RZrUJjnosimP55lYFXU+RDbY6HzZ2mN/8
 jGoGlpPnp//N/MdcbqpYP36F4n63MY19oWIa8ufhr11IZ659cDlSTCXmZ52B6Ujbflj8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wCQ40-00058n-Id for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 22:47:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4AE35418D5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Apr 2026 22:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E15EC2BCAF;
 Mon, 13 Apr 2026 22:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776120443;
 bh=PBJPML5TBMWM87+bWX2GivtKR9lgNeG0jmnaOaw+fo8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ggm2pcEb6HtsWCEHl7guOnOOpQ1lwohuMHDhEePL1ne2uAOd0yd0+WK7S72A55Aft
 gCWgS8awDkko0oae0YULL7cZ7GKxaFwgS46JaR148irtVTCnHe0eY0fEbh6HzmAD3j
 9GUeJmekC/V6E5y2bU6q5SAZ6gDfYgzq3eYvK3acnRjWE4EkMIyati+v1Q/b4M7on8
 hW6Z79Kb79OBYW8WAnc++BmjbK2Vf+1vFqK3d1eJ/6myw6iPHws46Jy+lULW3u1C0C
 YvN3309+UQHfQ5Q/SqaQFxEfZrvTYgUtTux7Ja1fHseAtydwa2XsXntidglpacwXIy
 J7QMQcKG1ERww==
Date: Mon, 13 Apr 2026 22:47:21 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <ad1yedxHjn_IhgKV@google.com>
References: <20260406154940.2407853-1-jaegeuk@kernel.org>
 <adaasm42rLxRY2GN@google.com>
 <116344cd-c591-42c9-9593-2e999c2029d8@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <116344cd-c591-42c9-9593-2e999c2029d8@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/13, Chao Yu wrote: > On 4/9/2026 2:13 AM, Jaegeuk Kim
 via Linux-f2fs-devel wrote: > > Let's check mmap writes onto the large folio, 
 since we don't support writing > > large folios. > > > > Revie [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wCQ40-00058n-Id
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: do not support mmap write for large
 folio
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Queue-Id: 78A9F3F4075
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 04/13, Chao Yu wrote:
> On 4/9/2026 2:13 AM, Jaegeuk Kim via Linux-f2fs-devel wrote:
> > Let's check mmap writes onto the large folio, since we don't support writing
> > large folios.
> > 
> > Reviewed-by: Daeho Jeong <daehojeong@google.com>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> > 
> >   - log v2:
> >    : add comments
> > 
> >   fs/f2fs/file.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 2c4880f24b54..c0220cd7b332 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -82,7 +82,12 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
> >   	int err = 0;
> >   	vm_fault_t ret;
> > -	if (unlikely(IS_IMMUTABLE(inode)))
> > +	/*
> > +	 * We only support large folio on the read case.
> > +	 * Don't make any dirty pages.
> > +	 */
> > +	if (unlikely(IS_IMMUTABLE(inode)) ||
> > +	    mapping_large_folio_support(inode->i_mapping))
> >   		return VM_FAULT_SIGBUS;
> 
> The code itself looks good, since it's an impossible case, should we
> use f2fs_bug_on(, mapping_large_folio_support()) to catch any bug case
> rather than just returning error here w/o log?

Instead of kernel panicing for the production, I'd leave a kernel message first.

> 
> Thanks,
> 
> >   	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
