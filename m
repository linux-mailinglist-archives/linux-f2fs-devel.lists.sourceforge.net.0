Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CDAB1E600
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 11:55:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85uUsLSPRjRerEWL/6enqg6UPqQq98Jco6LqDtbkEVo=; b=ais4fQG6wD5Kwfu6sDM+70axYm
	AaY/7KnKybDWCZc22hh2B7A9808IKh6U8l5CFliMgimMv8VYhk6F7IAR421+wzY60QmiPUv2Np2ht
	rWnaN345qtrd8NPMoGAq+iIBRvg9vOBAB6A4Y6LxjXjqyputJENvIG881WVeJI+WjFRU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukJoo-0004qX-Kq;
	Fri, 08 Aug 2025 09:55:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ukJom-0004qR-0J
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 09:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pS18W6bvPNVp7Dn6rCyEwz5Ftk8GJBPFOp5SzYSWdD8=; b=VyjOFdkIlllgCy3j5kZb8KjF+V
 Fs8C1fJauqEuY/78QDgH4wW+UpOgpAiSn4PTDbFh0qwipOMDMaNo+ezOSVg7MFZ6JSz/X/5wOwljL
 n35Asf6dabBslBb49qYkM1xHvrV988p9mjdVJqhtn0E6RENF4bHAhA5Sa5Uj3yVblvlA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pS18W6bvPNVp7Dn6rCyEwz5Ftk8GJBPFOp5SzYSWdD8=; b=LjnY5hR1t82W1hOOkRJwCbVtCU
 zGSCEtjftHb1StjBrVWvdXcCK/6m2ZCRIcMIuOysA3ObBu8a01rVrd4gk/vqTi0dfMMWDb1FchCgC
 En1Up7MYWRcpcuFc38daG9BAdBVLbGAZGwA9XaQNr/SqWyEAzTk6uwa4RZyjVuTbJpu8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ukJol-00057y-Kg for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 09:55:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 407EC5C49F8;
 Fri,  8 Aug 2025 09:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA912C4CEED;
 Fri,  8 Aug 2025 09:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754646908;
 bh=kgpYzkkc9QBv25eLpNVRLprtqy4ju/PA00/LlkuHvpA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=AT0YrPr5ZgcMul/B7fsYnlxg+25IpvnpKd5Wa1xey8t0aB7MTZvc36cXdmR16X6Pf
 ybVd6n2N2cUqhLlqvUjHo30/eSoTVDjGQSyxzQC3l72GrUsn4K/7G2Sp7OfBU0LjHa
 mAhunjdPLf0XN/fi4PqRhzeCmYcWLaRvaXEDEoarD/HoiiH3y2P1/PL7uwTeLMCHFL
 Is+kpb0ERePcWvM+WWpmHygbqincjsTs6hn5EkvP685GL1HEZqxRFbudzF+xrroGKs
 DCjxqNRsD8qjzYeCh9fX0XMVolCLnWt4iTf5pWpaT5pd8wN8hlfYloKmXSEWb8kYxH
 8SWSEQDl6PXlg==
Message-ID: <19a5cdab-a0e9-46eb-903f-f9bf405804b9@kernel.org>
Date: Fri, 8 Aug 2025 17:55:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liao Yuanhong <liaoyuanhong@vivo.com>, jaegeuk@kernel.org
References: <20250808094801.250480-1-liaoyuanhong@vivo.com>
Content-Language: en-US
In-Reply-To: <20250808094801.250480-1-liaoyuanhong@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/8/2025 5:48 PM, Liao Yuanhong wrote: > Currently, we
 have encountered some issues while testing ZUFS. In > situations near the
 storage limit (e.g., 50GB remaining), and after > simulating fragmen [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ukJol-00057y-Kg
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: Add bggc_io_aware to adjust the
 priority of BG_GC when issuing IO
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/8/2025 5:48 PM, Liao Yuanhong wrote:
> Currently, we have encountered some issues while testing ZUFS. In
> situations near the storage limit (e.g., 50GB remaining), and after
> simulating fragmentation by repeatedly writing and deleting data, we found
> that application installation and startup tests conducted after idling for
> a few minutes take significantly longer several times that of traditional
> UFS. Tracing the operations revealed that the majority of I/Os were issued
> by background GC, which blocks normal I/O operations.
> 
> Under normal circumstances, ZUFS indeed requires more background GC and
> employs a more aggressive GC strategy. However, I aim to find a way to
> minimize the impact on regular I/O operations under these near-limit
> conditions. To address this, I have introduced a bggc_io_aware feature,
> which controls the prioritization of background GC in the presence of I/Os.
> This switch can be adjusted at the framework level to implement different
> strategies. If set to AWARE_ALL_IO, all background GC operations will be
> skipped during active I/O issuance. The default option remains consistent
> with the current strategy, ensuring no change in behavior.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
