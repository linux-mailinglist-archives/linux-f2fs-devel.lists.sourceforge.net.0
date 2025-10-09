Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54FBC74E9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 05:34:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pem+23dWRvuREhXUQz5k12Nc6iIxhQbsv427R4jaGV8=; b=a3KX5geGnN1Bce8xSsGgUjmZZ0
	AG5jFhPiWnTRrQwEKb0RWGA8XYufV8xyMbEjFQu3M3JQsVjngezxRYJtxuuc3ynEn1drZtTc1gwdT
	VdflHVNSYH8Lq1g0phkyHgq2ipMKgpwXZR/AggIcUlIbwa5qZv4j62IWAKQSNmxqUQ4c=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6hQV-0007jz-VM;
	Thu, 09 Oct 2025 03:34:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6hQU-0007jr-8X
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 03:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Wq94OdLSQPx0KfrC3Kqm070apcsb2hcVcBXajedwzI=; b=Ya4DbEN469ycgcfTRHam/xPo0u
 VMYmsimtcRAIAStCFeDympvpzPSKVz7m+q5HD8UxiWhIhydFZB20G+3C5Mscu/K1ij2USs+jLbhBm
 zh6T/HRL4udPXpqI0NTmwDWm21PEYrTNYWANGbp0mfIakdjt+EKOqjSQXz3zSztA4/Kg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1Wq94OdLSQPx0KfrC3Kqm070apcsb2hcVcBXajedwzI=; b=M6tTRmxazhykOeZ1/Yniz44n7u
 oa71IVuZbW80romXwekrJYJVGJi3+KCPBjnjkRh98PGOluSmJ2gTyz7W/3kT10lzvICQKIZI3jItp
 R1cc9/PkANwWz5Kvr07kh2xTvpTTHAtITm+CJJdefbV6r9JB13+BjD70TzhlYHxCLGTc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6hQT-000672-Mv for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 03:34:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2413C611E9;
 Thu,  9 Oct 2025 03:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0ECBC4CEE7;
 Thu,  9 Oct 2025 03:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759980874;
 bh=zQySicJyzHQVgMUqKbwHP7OwMs25Xmyd6FMcON63clo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=RH6h/V4LzvAFQvOGHVQ2ReUSAztcIIgNnTZI6HgBtL0oY+CicvyhuIYatvy14xFwk
 P8GGaviitDQx6U9ns/eFTL9bVRAO/XRdBj8Zy5mk78UQO+37ZJAiH5f6Rd8gsWNxVI
 JhyUe/KdUPA1EoitSXFo1DWJGzJ7tPdVk5Mo3lKgzS3U7FZ6kYHCRxaK8cD0DgkJOe
 Q72WWEZuGiS3QzAmDQgxX8/9Y5MXwPvNppIckVU8/pCIyTozmyF5IbD2gDwj4MLfFa
 rusQJx87owxAw7+zASR5N84tZG/hgmInIH75Yv3bHxIGsKAVw+YrMEAft510JQM1H5
 65UG6A9ZmxYdg==
Message-ID: <e6feb193-0d3d-4cbc-857b-7576db25e929@kernel.org>
Date: Thu, 9 Oct 2025 11:34:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mateusz Guzik <mjguzik@gmail.com>, brauner@kernel.org
References: <202509301450.138b448f-lkp@intel.com>
 <20250930232957.14361-1-mjguzik@gmail.com>
Content-Language: en-US
In-Reply-To: <20250930232957.14361-1-mjguzik@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/1/2025 7:29 AM, Mateusz Guzik wrote: > iput() calls
 the problematic routine, which does a ->i_count inc/dec > cycle. Undoing it
 with iput() recurses into the problem. > > Note f2fs should not be [...] 
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
X-Headers-End: 1v6hQT-000672-Mv
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't call iput() from
 f2fs_drop_inode()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, oliver.sang@intel.com, oe-lkp@lists.linux.dev,
 josef@toxicpanda.com, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/1/2025 7:29 AM, Mateusz Guzik wrote:
> iput() calls the problematic routine, which does a ->i_count inc/dec
> cycle. Undoing it with iput() recurses into the problem.
> 
> Note f2fs should not be playing games with the refcount to begin with,
> but that will be handled later. Right now solve the immediate
> regression.
> 
> Fixes: bc986b1d756482a ("fs: stop accessing ->i_count directly in f2fs and gfs2")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202509301450.138b448f-lkp@intel.com
> Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
