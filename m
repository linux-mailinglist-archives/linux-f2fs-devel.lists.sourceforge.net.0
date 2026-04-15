Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IA3SBd0l4Gn8cwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Apr 2026 01:57:17 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B3D4091AE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Apr 2026 01:57:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRtJ3eITa3DdNMcoO54ivkPIwJLw7n+SolJvlY6kdjE=; b=jLjQcp60/vw7K1DJ28GuQHJaEg
	4o6rT/fVonHz5VCbPJMkKyusHn4N5YCZlvhFXdFQ8tJU5Ged60XTF/3u1Ti04aNOzXa655bDhbRIR
	Zj/FGsD68lwNpfJGaV8FswrtRx5O7ZQRbpf7sG07DjvbCvFgTRJJr6Xe+t+fb9fboN3s=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wDA6S-0000zJ-4Q;
	Wed, 15 Apr 2026 23:57:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1wDA6Q-0000z5-NG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Apr 2026 23:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VjhMg+XTJ8vD1knZMk0780PDEOcpk7IUgKgH5FGYA44=; b=APNWmNlFzc1mqpdLMXRxoFUv1u
 JiO8n0GshIFudh0W50JfQpb4LCZJxW4u6/oe5i2RuAwg374VNZr7+RDk/rdhjLced+WZ3wRXbyaRJ
 y9IR3E9SBPUf2caK2MdEz/wC+B8peJsvcguOaVsMtn9q6Sm72x/NMujIW4Hj+baiWbJA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VjhMg+XTJ8vD1knZMk0780PDEOcpk7IUgKgH5FGYA44=; b=gTAyzuWRBQx0DRJpJOJEHkHX2D
 KV03pNOip2Tja3ELcPGThEQut1CHnC1BgvSNDuBSBpGUebs+Hkmtmx2slMJcnkd753LIhde8fi/2K
 PTuEYWUorJnCY80xUl+4a6/6BL1LuVEb2DVjtpwWQrlMgHuYn2xehwEEAVLtLsN/OrVs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wDA6R-0003wC-2h for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Apr 2026 23:57:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 44C9960120;
 Wed, 15 Apr 2026 23:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FA5C19424;
 Wed, 15 Apr 2026 23:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776296991;
 bh=bhzPcr54kj93Lar47tpSoGS//g7BeP0fXCsSgCGIxx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ge9QbkzscZBvCjcBhgKDz2GqrcXm/RrpTicTJ1C2AxNrzFCS+cW8ACjvA07sMrKqC
 xczyLQTyKLi34rLkm0xjlzT2PHoDxArNE0y3v6NHbmv8nEVa5BTRhUTBUb07fCTh82
 Q4xApYXqDybkAxwRJDqeViTN8mLxeZ5xw7bMwla0ea4V1SVp18q7wo7MQ1+kL2AvkV
 vliMPs6Hvdt97hstZPQ3/HWpfeCPidYKckDGF/xGw5r1yT4fTBoXvrL/ShTbuJUbcq
 6EdGABII3cr46jiuv2XfvazrXocFUOk3aNhbgl6MU74pARV3gd5SXMf/zoQHSHSjfM
 6Akb1rdBni93Q==
Date: Wed, 15 Apr 2026 16:49:50 -0700
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20260415234950.GC114184@frogsfrogsfrogs>
References: <20260409134538.3692605-1-jaegeuk@kernel.org>
 <adhPZxtbZxgU-37v@google.com> <ad30g9xMs9wNJhFb@infradead.org>
 <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <aeAK8mFxzgMOepmZ@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aeAK8mFxzgMOepmZ@google.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 15, 2026 at 10:02:26PM +0000, Jaegeuk Kim wrote:
 > On 04/15, Matthew Wilcox wrote: > > On Wed, Apr 15, 2026 at 04:44:04PM
 +0000, Jaegeuk Kim wrote: > > > On 04/14, Christoph Hellwig wrote: [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wDA6R-0003wC-2h
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: another way to set large folio by
 remembering inode number
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Akilesh Kailash <akailash@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 43B3D4091AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 10:02:26PM +0000, Jaegeuk Kim wrote:
> On 04/15, Matthew Wilcox wrote:
> > On Wed, Apr 15, 2026 at 04:44:04PM +0000, Jaegeuk Kim wrote:
> > > On 04/14, Christoph Hellwig wrote:
> > > > Please add the relevant mailing lists when adding new user interfaces.
> > > > 
> > > > And I'm not sure hacks working around the proper large folio
> > > > implementation are something that should be merged upstream.
> > > 
> > > Cc'ed linux-api and linux-fsdevel onto the patch thread with a proposal that
> > > I'm not sure it's acceptable or not. 
> > 
> > You haven't sent a proposal.  This is a reply to a reply to a reply of a
> > patch.  There's no justification for why f2fs is so special that it
> > needs this.  What the hell is going on?  You know this is not the way to
> > get code merged into Linux.
> 
> I added two ideas in that email. Have you even tried to understand?

You want to establish "user.fadvise" as an extended attribute containing
a bitmask.  The sole bit defined in that attribute means "use large
folios", but you also have to change the file mode and set the IMMUTABLE
bit for it to actually do anything.

Meanwhile, you can't actually persist any of the fadvise(2) advice
flags, so the xattr name doesn't even make sense.  Maybe you meant to
call it "user.madvise" since the closest thing I can think of is
MADV_HUGEPAGE?

I've understood enough.  YUCK.

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
