Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97595CFB908
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 02:17:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGhH0TsiZ4ClLwGaxxuiyqG63xVWa9dihGEEyllucGg=; b=S1DIL8OGlv4tEq54hF/LKjC+FZ
	E+iFZQl8LTbJA8x+9T4wFoVxhjQ3Ommv7OOXpNPvgwkTOgMcHVmN+mKuZ53tkJpiR8MKwbJENRObH
	ozwmzWZY20Ua7ORZ36gwFfGD2VTgWbVP2qab3Tgnc7C4S0jKR6pMXrcLjMlb+wvhu2g4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdIAV-000821-FS;
	Wed, 07 Jan 2026 01:16:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vdIAT-00081u-DS
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 01:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vy7RReOo7tluBCkaeHoFlJIRwNfwx1RZfNiP2+g42WU=; b=mhjrHvaCQ/vR76+PUMK+Rhx143
 y+CGlv43wwCHPSTzWt3rSTpkvINEV7UPDGNVzM7eXDgQn2ba11NS4QMZMCuVlN+6yLPrjOXg4245a
 Pp93TkUgs4n8HMfLh3QuGTsKqrTg7pyf3PnHQqtxL4XeXHKEoKUDluVDrWEd/hPaXh8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vy7RReOo7tluBCkaeHoFlJIRwNfwx1RZfNiP2+g42WU=; b=ghymfetUGHgwFE7STXO/76o5H3
 EPKDK7GUWzI7GC0HwxBN+UForDgmkdcT4IIfzriUYghKsQ69HoqWsr8HEbZINJOoaoRq4ctsnjdKC
 Y7lvK/HPyPxNtAGETYF5smYBua0iT1epQnnzBQhyBCmg1xoSxp12REKNqQd2M280ABho=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdIAS-0000HP-SZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 01:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4D9AF6013B;
 Wed,  7 Jan 2026 01:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DC5C116C6;
 Wed,  7 Jan 2026 01:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767748606;
 bh=xKtV6AOaYVPWBBxqvPFR38c99Xn4erhfv9E/aQPjHoA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Ff3gEjVqn2FeA+tVN0uBp1kAY0JBEo55Jc3TiRFvKGoweIGk0EDuP8Pe7XIcDJjyI
 LhLPpASYqlifTUcDFetU1d8ccUiKaXZphx4QrhcFZrQ+YpD0knbHCkkpl0cWN8dZxH
 64xcVB++tJyExZAJQlMSCb1QU+TV4tx6b1I10wPHT/KEMdBN0NW1gcA5lCMWkof65M
 wGgrg1tmlrj+ob4ImdoEu/RWfqULiOt5Fz7Jie8uxENVIeo78HThvkBac/uPMUaISj
 sRluATBjt2GlGe46JJhS92jn6SvX0lyUX68Y8Dl3hzKWUmeTcKMpDbTgPyp7fLh5nU
 15iDEvl2/51UQ==
Message-ID: <c83f9368-e962-440c-9107-ba76ca71602a@kernel.org>
Date: Wed, 7 Jan 2026 09:16:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nanzhe Zhao <nzzhao@126.com>
References: <20260105153101.152892-1-nzzhao@126.com>
 <20260105153101.152892-5-nzzhao@126.com>
 <5ca2ef6a-ce46-4d80-b2e0-ff35c628e0ba@kernel.org>
 <6a3d4e52.402.19b95df7350.Coremail.nzzhao@126.com>
Content-Language: en-US
In-Reply-To: <6a3d4e52.402.19b95df7350.Coremail.nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/7/2026 8:33 AM, Nanzhe Zhao wrote: > Hi Chao yu: > At
 2026-01-06 17:31:20,
 "Chao Yu" <chao@kernel.org> wrote: >>>> diff --git a/fs/f2fs/data.c
 b/fs/f2fs/data.c >>>> index 66ab7a43a56f..ac569a3969 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdIAS-0000HP-SZ
Subject: Re: [f2fs-dev] [PATCH v1 4/5] f2fs: add 'folio_in_bio' to handle
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Kim Jaegeuk <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/7/2026 8:33 AM, Nanzhe Zhao wrote:
> Hi Chao yu:
> At 2026-01-06 17:31:20, "Chao Yu" <chao@kernel.org> wrote:
>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>> index 66ab7a43a56f..ac569a396914 100644
>>>> --- a/fs/f2fs/data.c
>>>> +++ b/fs/f2fs/data.c
>>>> @@ -2430,6 +2430,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>>>>    	unsigned nrpages;
>>>>    	struct f2fs_folio_state *ffs;
>>>>    	int ret = 0;
>>>> +	bool folio_in_bio = false;
>>>
>>> No need to initialize folio_in_bio?
> 
> Agreed. It's redundant since we reset it to false for each new folio before processing.
> 
>>>> @@ -2539,6 +2542,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>>>>    	}
>>>>    	trace_f2fs_read_folio(folio, DATA);
>>>>    	if (rac) {
>>>> +		if (!folio_in_bio) {
>>>> +			if (!ret)
>>>> +				folio_mark_uptodate(folio);
>>>> +			folio_unlock(folio);
>>>> +	}
>>>
>>> err_out:
>>> 	/* Nothing was submitted. */
>>> 	if (!bio) {
>>> 		if (!ret)
>>> 			folio_mark_uptodate(folio);
>>> 		folio_unlock(folio);
>>>
>>>                  ^^^^^^^^^^^^
>>>
>>> If all folios in rac have not been mapped (hole case), will we unlock the folio twice?
> 
> Are you worried the folio could be unlocked once in the if (rac) { ... } block and then
> unlocked again at err_out:? If so, I think that won't happen.
> 
> In such a case, every non-NULL folio will be unlocked exactly once by:
> 
> if (!folio_in_bio) {
>         if (!ret)
>                 folio_mark_uptodate(folio);
>         folio_unlock(folio);
> }
> Specifically, after the last folio runs through the block above, the next call:
> 
> folio = readahead_folio(rac);
> will return NULL. Then we go to next_folio:, and will directly hit:
> 
> if (!folio)
>         goto out;
> This jumps straight to the out: label, skipping err_out: entirely.
> Therefore, when ret is not an error code, the err_out: label will never be reached.
> 
> If ret becomes an error code, then the current folio will immediately goto err_out;
> and be unlocked there once.
> 
> If rac is NULL (meaning we only read the single large folio passed in as the function argument),
> we won't enter the if (rac) { ... goto next_folio; } path at all, so we also won't go to next_folio
> and then potentially goto out;. In that case, it will naturally be unlocked once at err_out:.
> Or am I missing some edge case here?

Nanzhe,

Oh, yes, I think so, thanks for the explanation.

Thanks,

> 
> Thanks,
> Nanzhe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
