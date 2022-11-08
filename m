Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 150FD621037
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Nov 2022 13:19:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1osNZf-0003V2-RO;
	Tue, 08 Nov 2022 12:19:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1osNZe-0003Uo-QL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Nov 2022 12:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QosN7nLvVRUg4xwohVRqDrxUldpNmnuj2Kz/uAkrefM=; b=TEaVg2VPOWbr8m81NyreXTp26V
 QV9vo4RTxa1ZURmXVsc7AY7o5b8Ququ91D+7MEQ4GeQYS4KPjcQlh4n7e5cOWBkd12DhZy0It6btf
 3rnNUQ1sMHlJC0aY9AnNiqeJQNJcr4jRzl14xUTvL1b5tK5sSUtVz3GiIH+WM2OlGzpk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QosN7nLvVRUg4xwohVRqDrxUldpNmnuj2Kz/uAkrefM=; b=AEJhCkcm0k9lHAnozIntMSJkal
 bRVMeBCvh0G5WiQ9hTN9Zo9YjNoj/POr1LHC6CBrIbPtklgKYm4AF8FIz43krxpImNSLd9LSA1WMc
 NelFrqFGPudbnw1n/ijv+rt/NJvHg5KzGw7PuKOhGsoZBVWv5h0JZzy6cBPz3fR7rvUc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1osNZZ-0001e6-IA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Nov 2022 12:19:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC2B161509;
 Tue,  8 Nov 2022 12:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F39C433D6;
 Tue,  8 Nov 2022 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1667909952;
 bh=vaGB9U2rlqlyaopeED5o0EltCNuZ/88g3VWxR2AQADM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aTTlF5q1IAnQrmglZEz02guAWga8I32ZBQZzKM73aPY4G1+sgL0fzfX4ihcoAI8FU
 e2uHNi/BFhoWnVXyX5ZnSwDMHOKgejCJM3H98SDtWKCmlDZVBRCFg2ukWzT6JUbg0W
 Dpz6DwqikOlr8SpScMzIxE79PmEwfwYroEyapLo0=
Date: Tue, 8 Nov 2022 13:19:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Y2pJPTSzgnNk37oA@kroah.com>
References: <Y2lL+lSibGY9hPEE@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2lL+lSibGY9hPEE@sol.localdomain>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 07, 2022 at 10:18:34AM -0800, Eric Biggers wrote:
 > Stable maintainers,
 > > Please apply commit 4fa0e3ff217f775cb58d2d6d51820ec519243fb9
 > ("ext4,f2fs: fix readahead of verity data") to st [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1osNZZ-0001e6-IA
Subject: Re: [f2fs-dev] Please apply "ext4,
 f2fs: fix readahead of verity data" to stable
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jintao Yin <nicememory@gmail.com>,
 linux-fscrypt@vger.kernel.org, stable@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 07, 2022 at 10:18:34AM -0800, Eric Biggers wrote:
> Stable maintainers,
> 
> Please apply commit 4fa0e3ff217f775cb58d2d6d51820ec519243fb9
> ("ext4,f2fs: fix readahead of verity data") to stable, 5.10 and later.  It
> cherry-picks cleanly to 6.0 and 5.15.  I'll send it out manually for 5.10.

All now queued up, thanks.

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
