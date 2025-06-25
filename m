Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F613AE8CA9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 20:39:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mtYEt5zEdr9Rq9sk6JkRrt2DKO4DZKZRQVv/f8JeNI=; b=aq45S+0wq7X6CsGsusPzqm6sgx
	CcNopcktWN8Au+2rrgAqvt81lXSsxxeRBC5mXCkDCFB6pQRAxYilfd8Aw5IzXlrCQkeGQ3dmBsOoL
	EJwRDEt3NvuRID2eFB1xkT5cwiYRhBAXXHCcIrXH8dhxYjMr8xXF6N+bMThjIbNDX5LM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUV1e-0000dK-GE;
	Wed, 25 Jun 2025 18:39:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uUV1d-0000dE-2R
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 18:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lf/gt+1Qj5853DGziX2FWW6NuGF+8XTYFSBydnxuhII=; b=Es0pw9BxFN2V5wSnpBZ3+wxooa
 bWmQNHfpZoKCe3qCOy1xtvGH6MwtUaTaeFzNPnqjgScPeHRG2D6kA+yM0TSAG065WYUXRagCMfNeS
 oYKoPV9LZn48YcA8iBov1P8JzSO5JL4pDPqnN4cQnrFQXWwXe9nnt5IGh2OX4+ymeF8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Lf/gt+1Qj5853DGziX2FWW6NuGF+8XTYFSBydnxuhII=; b=Ks51e5mCHLAchF/DgIRURo4dhf
 aS3XzeRBh+GUnWDSTdtE+Gcr1T1nlmaWsZdikJeqQv9WlTylhOZVzo+0XVW6btIKL9Hkj1s3JH0lN
 IQT7mJCl7Js6TfMWvWCIHorRyARVUa1HMxbFIeGQJyoUdQXqmgoFm5EzK9Dsv8+8faxA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uUV1c-0006fb-NL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 18:39:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E026F5C5C94;
 Wed, 25 Jun 2025 18:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3C0C4CEEA;
 Wed, 25 Jun 2025 18:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750876747;
 bh=WRHYPzI57hddDK7CE8Wr1nJ8heCzKe+3hF0K0wP3ejc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q3gbLHlg+Xr2KnUs3hglU2onJJoUGSlohkLlIO0HiHKEfzcHm7gbBX7ehcf6RPYV/
 +lZdqAI4YsE3A8mHgnUfSM9Qr3Uqr4VhCyGtockNTKWG0+lc/YO91ybT2218qYd9B8
 jOIucmU2Yi99l/8qd4aJIkS2fkjuIddv1w1bJOwL0xgoqCDcWZy9KQ2abe8KvHwn3Y
 BpA+FSQrIB4THuqB3RMyQi/a0HkIxNqAHE5vcpF0mV4D0ZBT/g9VXKCrxMjPY5B9lC
 SRv0AlpeaFxq62qgpTMg5AGtCYq6KdpB/doP2ovkMnfKnZJimNdBjGwPNThRlOjZ0r
 N27ijJqi/rVSg==
Date: Wed, 25 Jun 2025 11:38:31 -0700
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20250625183831.GA1703@sol>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com> <20250612062521.GA1838@sol>
 <20250625063252.GD8962@sol> <20250625124445.GC28249@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625124445.GC28249@mit.edu>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 25, 2025 at 08:44:45AM -0400,
 Theodore Ts'o wrote:
 > On Tue, Jun 24, 2025 at 11:32:52PM -0700, Eric Biggers wrote: > > > > That
 was the synchronous throughput. However, submitting multiple [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uUV1c-0006fb-NL
Subject: Re: [f2fs-dev] [PATCH] fscrypt: don't use hardware offload Crypto
 API drivers
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, Simon Richter <Simon.Richter@hogyros.de>,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 25, 2025 at 08:44:45AM -0400, Theodore Ts'o wrote:
> On Tue, Jun 24, 2025 at 11:32:52PM -0700, Eric Biggers wrote:
> > 
> > That was the synchronous throughput.  However, submitting multiple requests
> > asynchronously (which again, fscrypt doesn't actually do) barely helps.
> > Apparently the STM32 crypto engine has only one hardware queue.
> > 
> > I already strongly suspected that these non-inline crypto engines
> > aren't worth using.  But I didn't realize they are quite this bad.
> > Even with AES on a Cortex-A7 CPU that lacks AES instructions, the
> > CPU is much faster!
> 
> I wonder if the primary design goal of the STM32 crypto engine is that
> it might reduce power consumption --- after all, one of the primary
> benchmarketing metrics that vendors care about is "hours of You Tube
> watch time" --- and decryptoing a video stream doesn't require high
> performance.
> 
> Given that the typical benchmarketing number which handset vendors
> tend to care about is SQLite transactions per second, maybe they
> wouldn't be all that eager to use the crypto engine.  :-)
> 

My STM32MP157F-DK2 board (with screen removed) is pulling 1.5W regardless of
whether it's running the benchmark with the STM32 crypto engine or with the NEON
bit-sliced code.  However, the NEON bit-sliced code finishes 5 times faster.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
