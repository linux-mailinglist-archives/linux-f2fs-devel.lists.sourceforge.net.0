Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFBDD1A837
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 18:05:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEszOKxNcUk3wLCX4V2Ti2bjeY5dHCtMVAIWLG8UCF8=; b=W5qtn3RC/cO4oP+gSf3Fk835Vo
	bigR96Cj7/xW5EAy6Ad2oxSu4i2lFtGmpV37i4Fz4An47UWozdEw8EROAudRB56yh6DQBW3Nf3Ahs
	awfY0Zr8FhgUy8fANIbTQn5D8wJE0+69Bxob9NcQT8z3SBE54G2PuAB+uTpxRjZ6+2Uo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfhpx-0003PB-NA;
	Tue, 13 Jan 2026 17:05:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vfhpw-0003P3-BH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 17:05:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kVxqK6uhgPufrAr/6d+3Ard7b8jNcXlxOQlloe2k92Y=; b=lQJHIp+cCFs/4z1cQ7RiLqk1UM
 obUMRk8l/DlNi2GNp4GdtYX3ps/ETSKZUHwJFuk4cT1MXDnlHuR9rn2A5g7VNdJsplmayEfLKwfew
 aCaJg4r62zrKre6sT/DS5kHc3ZxRw77bBfmLM+kBRzH5NmdZkmc2UZ8M8pJe/evUcUAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kVxqK6uhgPufrAr/6d+3Ard7b8jNcXlxOQlloe2k92Y=; b=Bo5fVcecjgd6nJ3X6H1gAP0WW2
 RZO9FZaIpuh8DZpRhHqS6ANjUS4+Jmn2r/WRO/n02Yu7nr9/HcYk4tiipDBAF4OBGu3Xtsu1+fIgx
 lJR8RnTWNAxYyUvIBj6AolaLt210gGZKwAyNprqSY7rSf10inWdrgSJox+jKWfR5fNtY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfhpv-0007en-Ud for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 17:05:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D754D60017;
 Tue, 13 Jan 2026 17:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BDFC116C6;
 Tue, 13 Jan 2026 17:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768323937;
 bh=aqmoNqWtVgAcpIUZZw9iu4GHlM6fBGKiwmFvCSZDjNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bEFdbgZ+2AoJAKNzsXOceScIEDYLpc9fVSMVSxfPsa/F9uPxx4xSHYRRnU/iRCD0N
 JgJdj+XNcTaihzCY0yYWcpAmL65gfcICoI+0oKpRtpjFL5IGTpOzz3u8i5HaXo0lCd
 37xtaaP7B5+KlUNCK5l1zTaUif0WdlXLth2w5rg8yiJlQPDbFHAYRPIBUf8LcvkcPt
 ax1xaR6mTHxNpXiPkLtgUQSG1jtjV5qFaHryQ25ZBruF6aQJMWkYg3nLrpoVuUR1gX
 8PThTjc1sKwiZ6FJWXsaaG77VPsvvotXTDE8C52oju5l+JSN1Lc+570jPII7gojpTp
 0EEGZPLfeVPXQ==
Date: Tue, 13 Jan 2026 17:05:35 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aWZ7X9yig5TK2yNN@google.com>
References: <20260111100941.119765-1-nzzhao@126.com>
 <20260111100941.119765-2-nzzhao@126.com>
 <0aca7d1f-b323-4e14-b33c-8e2f0b9e63ea@kernel.org>
 <13c7c3ce.71fa.19bb1687da1.Coremail.nzzhao@126.com>
 <5158ff31-bd7b-4071-b2b1-12cb75c858dd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5158ff31-bd7b-4071-b2b1-12cb75c858dd@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/12, Chao Yu wrote: > On 1/12/2026 4:52 PM, Nanzhe Zhao
 wrote: > > > > At 2026-01-12 09:02:48, "Chao Yu" <chao@kernel.org> wrote:
 > > > > @@ -2545,6 +2548,11 @@ static int f2fs_read_data_large_fo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfhpv-0007en-Ud
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: add 'folio_in_bio' to handle
 readahead folios with no BIO submission
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
Cc: linux-fsdevel@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/12, Chao Yu wrote:
> On 1/12/2026 4:52 PM, Nanzhe Zhao wrote:
> > 
> > At 2026-01-12 09:02:48, "Chao Yu" <chao@kernel.org> wrote:
> > > > @@ -2545,6 +2548,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
> > > >    	}
> > > >    	trace_f2fs_read_folio(folio, DATA);
> > > >    	if (rac) {
> > > > +		if (!folio_in_bio) {
> > > > +			if (!ret)
> > > 
> > > ret should never be true here?
> > > 
> > > Thanks,
> > Yes.Need I send a v3 patch to remove the redundant check?
> 
> Yes, I think so.

Applied in dev-test with it.

> 
> Thanks,
> 
> > 
> > Thanks,
> > Nanzhe Zhao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
