Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F18AD7733
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jun 2025 17:58:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWbDQspCJNorDEHmapHRjLTHRVILDx1sDShAWHpvQBE=; b=KZznsXv80xev9VYKmlB8LnbbdR
	1d55l0Zc7Y/tThjnW+veu0QQoLBIfOHPiwZE1PACDp4qa+ZGE+ST4jdVLp1v7X/6nuOTqZTZI27qx
	rnrG+yFysFQrAsHuzAPVRkzFM8H6lEwZEVmTuKqyrx5UcfdnKoiqlfe/E1eDDy+SsyU8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPkJT-0004kh-2a;
	Thu, 12 Jun 2025 15:57:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uPkJR-0004kZ-DU
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 15:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4z+D/UgYtlOWF66jR6A0YgXZX5ISab2an1bqEm7grZE=; b=WvA96MgcH/GM1fs81Jf3NSntZL
 b49XYk1PZtmpeKO2oDV/7dGp/LHFHJRZJJWIkLVEbp/J0mpDEhidJRoe/Mrt6wzBQd2f9dAancDXW
 m+YIOSmqtWgB8/tD1JtIM6eLGBxU5IIUS8dsBVC/OGOPNlZaXDJ07yDMFi/UclDLTp/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4z+D/UgYtlOWF66jR6A0YgXZX5ISab2an1bqEm7grZE=; b=IBnZalI+QM3Iadlj9KpI+7hOD2
 7R0Vvd/BMvazuS/1wSZkMU6zFEkF94P1p7hTXR/ni6tPA0VNWc41eUt9Zbp/z99sUaqON9q5eVV/b
 jB+EXTsPTpDoNf5qoFmM9BWmiWfI6PawwGnCBfsyNk/u4XsBsvVxkuaKYliN7qJNLlSk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPkJQ-0003oc-Qe for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 15:57:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 29D19A51E58;
 Thu, 12 Jun 2025 15:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E397C4CEEB;
 Thu, 12 Jun 2025 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749743865;
 bh=I+yj5RaeRFm4XV7nYay72iV3VtIk9fY58cl2ElhN9GY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kj3syDB7EWGXmmPQEn6faQJJCP8Zx4/ZbWfx7JOkjzRF0b8VXypiFh+vqdaR8hl+p
 ioh5TDwlCz6GFe+gIMxEfYVqfpLapRk1/3/fdNPt56AIGQrTtOVSuQlX6VXMXgbPgz
 1H1mS98XcOEm0C/62bgT59L+f+uAFOvphLCOqS1N5Ff2+I9VbhNd/R7nmixjuliDT+
 0ECTov3sUQ13ituxxnl50KKaOAe7VR/jHdHqVUmefGy91C/DN+y0FzI6a5iphvbODD
 q/NVOs5UaO1MPd6POp4EdPrhAFHt+ixI/0LAvQGsIFBVVj8kPrXJc2LfkO+5YDX4IB
 YlD+RzbQxcOtg==
Date: Thu, 12 Jun 2025 15:57:43 +0000
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Message-ID: <20250612155743.GA3529549@google.com>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com> <20250612062521.GA1838@sol>
 <aEqU0iU1tBrLEYUq@gcabiddu-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aEqU0iU1tBrLEYUq@gcabiddu-mobl.ger.corp.intel.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 12, 2025 at 09:50:26AM +0100, Giovanni Cabiddu
 wrote: > On Wed, Jun 11, 2025 at 11:25:21PM -0700, Eric Biggers wrote: >
 > ... > > > FWIW, here's what happens if you try to use the Intel QA [...]
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
X-Headers-End: 1uPkJQ-0003oc-Qe
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

On Thu, Jun 12, 2025 at 09:50:26AM +0100, Giovanni Cabiddu wrote:
> On Wed, Jun 11, 2025 at 11:25:21PM -0700, Eric Biggers wrote:
> 
> ...
> 
> > FWIW, here's what happens if you try to use the Intel QAT driver with dm-crypt:
> > https://lore.kernel.org/r/CACsaVZ+mt3CfdXV0_yJh7d50tRcGcRZ12j3n6-hoX2cz3+njsg@mail.gmail.com/
> 
> /s/happens/happened/
> 
> ... and it got fixed
> https://lore.kernel.org/all/20220506082327.21605-1-giovanni.cabiddu@intel.com/

But it reached users in the first place, including stable kernels.  And
apparently the issues were going on for years and were known to the authors of
the driver
(https://lore.kernel.org/linux-crypto/91fe9f87-54d7-4140-4d1a-eac8e2081a7c@gmail.com/).

We simply don't have issues like this with the AES-NI or VAES XTS code.

And separately, QAT was reported to be much slower than AES-NI for synchronous use
(https://lore.kernel.org/linux-crypto/0171515-7267-624-5a22-238af829698f@redhat.com/)

Later, I added VAES accelerated AES-XTS code which is over twice as fast as
AES-NI on the latest Intel CPUs, so that likely widened the gap even more.

Yet, the QAT driver registers its "xts(aes)" implementation with priority 4001,
compared to priority 800 for the VAES accelerated one.  So the QAT one is the
one that will be used by fscrypt!

That seems like a major issue even just from a performance perspective.

I expect this patch will significantly improve fscrypt performance on Intel
servers that have QAT.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
