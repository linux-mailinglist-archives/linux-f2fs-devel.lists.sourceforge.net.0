Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 354A4CFBCE0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 04:09:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTqlcvalck24ohV3m3fIrU8qLtquoQvHeLx5bD3Zhv8=; b=Ct4ouHUR7n9sn+2js2Q8uDqhS5
	zlApC6z75Q1OHwoD2lRQbGlENjnmnj/9WI7FApLZi2E1Pndx6jtsNSOWsJfqyHUEiyAQjrWAAWXYE
	cThcFTcN9dRl2UToXrRMSW1uFSY/h9GwwBGt+HwWmbz3YHfHf+LVkhNcQ4rpEK4hDrjo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdJuz-0001uG-Vq;
	Wed, 07 Jan 2026 03:09:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vdJux-0001uA-Vz
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jiosP9DpJSXFVpn3D5z0fabwFabmVwAdwWJnke2G2Cs=; b=gKgYuIB9lPBR3Twc7QiDzx1UDk
 XLNQxr40Xr0ao7aTvQg2wsrDeObR7xUoSY0lmLb1WGYJlUEsiRHZIT/IcfhSdjOCYkBXE09gkHcim
 iedTFSJT5CHwkcSn+cplb+lRABZHtYQMJbaol1OT2VmAqIV7bdSmeYanTmLxFS3FdAHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jiosP9DpJSXFVpn3D5z0fabwFabmVwAdwWJnke2G2Cs=; b=ebi4YESHw9MxXTFPcC2LWUI7yb
 Pvbj2dEQYos5k42o8aOeucLJuVmy0n2CNFltTHHtKKoW2oHIdgabmPsgXo5X4fx0yEnJ836LgqBnU
 tz9RpoBt6nwIbpgIwFVI3P2ZR2GxvNI/yYGw/Bat+JpiScyEvKln4P3bLR6IpSxMk8gg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdJux-0003cZ-El for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:09:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DB75541AB7;
 Wed,  7 Jan 2026 03:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2BEC116C6;
 Wed,  7 Jan 2026 03:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767755332;
 bh=87dNdUNN2virltNHFfyr21vp2fuJcOmqOPe8cvIurxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RgVVA47QDHiFCrJXDZSY5O6e+vOGCH8CAy4dzWBQpnVW/X212xUQQdvP3MFzGdHm6
 T25vB9GG2kOvZVs7eV0ugV0bC5kcEXosdmimwO1rfs3UUMR0lw97JuHOTDYaU3/a2N
 K6bPi7LLa92m+vHCdFLeGhNFJfx1ui6zpMW2gH3RDcAFCc5ePUAkPAOqGo3aUvznyP
 Ey2VtOOYfs/4ttQlyUrXInGMxAnjHMRw/zBTUbKi3i18lQOIopW1hQaEBkyQuvdIuB
 aO/WjED1xT2x1x4mOteH12TjvUYe2qKb3mcKtOEg5UZ3rIeY/OgrioLbf92YSbCp/m
 cuyLb/UcCIUNA==
Date: Wed, 7 Jan 2026 03:08:50 +0000
To: Nanzhe Zhao <nzzhao@126.com>
Message-ID: <aV3OQu3ea5-DgzmT@google.com>
References: <20260105153101.152892-1-nzzhao@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260105153101.152892-1-nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Nanzhe, fyi - I applied the beginning two patches first.
 Thanks, Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: checkpatch.pl]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdJux-0003cZ-El
Subject: Re: [f2fs-dev] [PATCH v1 0/5] f2fs: fix large folio read corner
 cases for immutable files
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

Hi Nanzhe,

fyi - I applied the beginning two patches first.

Thanks,

On 01/05, Nanzhe Zhao wrote:
> When reading immutable, non-compressed files with large folios enabled,
> I was able to reproduce readahead hangs while reading sparse files with
> holes and heavily fragmented files. The problems were caused by a few
> corner cases in the large-folio read loop:
> 
>   - f2fs_folio_state could be observed with uninitialized field
>     read_pages_pending
>   - subpage accounting could become inconsistent with BIO completion,
>     leading to folios being prematurely unlocked/marked uptodate.
>   - NULL_ADDR/NEW_ADDR blocks can carry F2FS_MAP_MAPPED, causing the
>     large-folio read path to treat hole blocks as mapped and to account
>     them in read_pages_pending.
>   - in readahead, a folio that never had any subpage queued to a BIO
>     would not be seen by f2fs_finish_read_bio(), leaving it locked.
>   - the zeroing path did not advance index/offset before continuing.
> 
> This patch series fixes the above issues in f2fs_read_data_large_folio()
> introduced by commit 05e65c14ea59 ("f2fs: support large folio for
> immutable non-compressed case").
> 
> Testing
> -------
> 
> All patches pass scripts/checkpatch.pl.
> 
> I tested the basic large-folio immutable read case described in the
> original thread (create a large file, set immutable, drop caches to
> reload the inode, then read it), and additionally verified:
> 
>   - sparse file
>   - heavily fragmented file
> 
> In all cases, reads completed without hangs and data was verified against
> the expected contents.
> 
> Nanzhe Zhao (5):
>   f2fs: Zero f2fs_folio_state on allocation
>   f2fs: Accounting large folio subpages before bio submission
>   f2fs: add f2fs_block_needs_zeroing() to handle hole blocks
>   f2fs: add 'folio_in_bio' to handle readahead folios with no BIO
>     submission
>   f2fs: advance index and offset after zeroing in large folio read
> 
>  fs/f2fs/data.c | 54 +++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 36 insertions(+), 18 deletions(-)
> 
> 
> base-commit: 48b5439e04ddf4508ecaf588219012dc81d947c0
> --
> 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
