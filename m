Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D7ACF0932
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 04:21:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JghYwKOHsZb5Zikt/N8i3oy8t9e2qAxnR3aq1XlspT0=; b=jIuCWZUdQgb7de6gbylXd3BtqK
	27qZjA+/7XsPwd7/jHSzNgUpxt1+ygZ02hJuAS7FXQ0b2piARrJwjxFLce7LIxFaXevUvqse6BhYT
	iEUZHgr+7yOM6QjL+Cvov75tksv2kLePNFMD3Veyj020XFJphe81NbnD0L9H9XftTRWo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcEfq-0003I7-VF;
	Sun, 04 Jan 2026 03:20:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vcEfp-0003I1-It
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 03:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Z/DgKNB3MVVWxeV4tf+forbqz+lURTKlMhik/mlSoo=; b=i8LC7l7CF1u/el4IfgD3MQ+1qc
 ZFLv9dzws7s/+w8zBHJbZL4swKmt9JRt1zvCFIFyMPvQDcb/ur8ZY+LpEflWXszdKzYefaZowXQxC
 2k6qhCOnUunbQ61e1epUgmwkvhgn8w0xCyNGlPi9IrJvE8xtXVXRcoBteQDTyIALfsKM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8Z/DgKNB3MVVWxeV4tf+forbqz+lURTKlMhik/mlSoo=; b=F2Sy6J2x8POSHj87wNvyZdPF/i
 EVf+1FYosHX8iXyJmMbuSYcA4d4hJDcSjm/q+2qnq4bH0Zr1gmjcDimJ4tg2iFz8Vmoxgjo08fgSa
 o7UQ8uu2X7T9ZOh0zO6fum1cHMqEgQc6r9inM4yurjA2wRzC8ohcfdMbXxjABBoHhXKg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcEfo-0007QT-69 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 03:20:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0BB9160017;
 Sun,  4 Jan 2026 03:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A9DC4CEF7;
 Sun,  4 Jan 2026 03:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767496844;
 bh=docKMmc0VR5dmjWUdAB2Vta8AaFQPvJ08yVISnVbnrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WL3uCsYswzadGDaLTGGC8zX6v/IeVPkptDULPDx2g7gHHFD0XogF7eE574nfLrPOe
 IP49fSm9a372IMuc8pL/c3R5KUz8e3+UCMohP/N9YzIxLs5KNkOEaCOhApth2fQ3lb
 duSpWNC8/8LWWzTITN+qb0e71/EM9scWEbOAy7CA3aaRHE8RiUuwjhTa6GSNG9HV7M
 2iNwQhuXApr0uxxnTW9VMltwHhkwe+CZGLIImMbMdSgZqqC7lPWP4IDoLiBpseIqnd
 5LDbQpwk7QcxIOb0avlbaZk++O0hnuLtl97aKIffv+9Au5TPCW8fFB92sjqaBzfoL6
 U43N9DAHApVmA==
Date: Sun, 4 Jan 2026 03:20:42 +0000
To: Nanzhe Zhao <nzzhao@126.com>
Message-ID: <aVncihATY3KXN59M@google.com>
References: <20251120235446.1947532-1-jaegeuk@kernel.org>
 <0153ff69-789d-4fe1-a89c-0c607a9a7d6c@kernel.org>
 <aS3s98fgy80_xDuK@google.com> <aS4W7NBYFPwP6KEQ@google.com>
 <aS5RG6IQ8AlXrLwT@google.com>
 <0bf2eedd-eebb-440b-96f5-72ac3a68b608@kernel.org>
 <aThslGwzpYmEXzU5@google.com>
 <a7f7efde-53e3-48c3-9caf-9410b018b1e1@126.com>
 <aVdkSZeuwzsNq7pE@google.com>
 <16d92acc.17ac.19b837e5d80.Coremail.nzzhao@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16d92acc.17ac.19b837e5d80.Coremail.nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/03, Nanzhe Zhao wrote: > Dear Kim: > Thanks for your
 quick reply! > > I applied the two bug fixes on my local branch and found
 that > I still couldn't pass my test of generating and reading a he [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcEfo-0007QT-69
Subject: Re: [f2fs-dev] [PATCH 1/2 v4] f2fs: support large folio for
 immutable non-compressed case
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

On 01/03, Nanzhe Zhao wrote:
> Dear Kim:
> Thanks for your quick reply!
> 
> I applied the two bug fixes on my local branch and found that
> I still couldn't pass my test of generating and reading a heavily
> fragmented file.
> 
> The root cause is that current code will treat hole blocks as mapped
> blocks as well and mistakenly increment read_pages_pending, resulting
> task hung in readahead.
> 
> Inside f2fs_map_blocks():
> 
> /* DIO READ and hole case, should not map the blocks. */
> if (!(flag == F2FS_GET_BLOCK_DIO && is_hole && !map->m_may_create))
> 	map->m_flags |= F2FS_MAP_MAPPED;
> 
> it will have map->m_flags marked with F2FS_MAP_MAPPED in non-DIO and
> no blocks creation context for NULL_ADDR and NEW_ADDR, except for
> holes mapped to an unallocated dnode.
> 
> Personally, I think a better fix is to add a helper function
> f2fs_block_needs_zeroing(). The condition could be: return true if the
> current blkaddr is NULL_ADDR or NEW_ADDR.
> 
> Then we can reverse the order of the checks under the got_it: label:
> first `if (f2fs_block_needs_zeroing()) ...`, and then `else if
> (map->m_flags & F2FS_MAP_MAPPED)`, while keeping all the logic inside
> those statements unchanged.
> 
> For the parameters of f2fs_block_needs_zeroing(), I think we can pass
> `struct f2fs_map_blocks` directly, because it already contains all the
> information we need. Also, if we later want to support batching
> contiguous physical block mappings and bio additions inside the loop,
> this signature should be more extensible.
> 
> If you think this approach makes sense, I can send a patch to fix all
> three bugs. Thank you.

I think that's feasbile. Could you please post a patch to discuss further?

Thanks,

> 
> Best regards,
> Nanzhe Zhao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
