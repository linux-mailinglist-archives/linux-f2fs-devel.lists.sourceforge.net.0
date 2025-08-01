Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A7FB17B6A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Aug 2025 05:31:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipYCa96wD4zvh+lNLzwdktrL7sPdYB1jXL16FsYKCl8=; b=KzoUy7PMXVYeafd5f7Tl5wD5xT
	Y9YPdsSw/zX4756W/r8vnVkG6kCJufTOmvnxyxPDZKZyOCHQab/6d3LlpCgNTgKmdAs03qNiVVGbN
	JEM8eBWOAGNtAp7E5Vy41W9Bl/34q4ia0WaJRXdCAT1Fv7pGTxp/4aekJfwipuHS0pQc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhgUG-0004Sq-R6;
	Fri, 01 Aug 2025 03:31:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uhgUB-0004Sg-Cr
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Aug 2025 03:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4IPHdqkx9eyHJ5fFHCRpGqIoil3nM7ZUjyDlrW9Hf/U=; b=d5rZJq0OrF0f+Er4A2IxUFlnXd
 kmPUwrIOXNb3w43J+T30qXFWgf2SwIECXJDte1463NXlbU33eU/gTO3rqZJ2KefL9FmCP4GPi5s8l
 M4mUXazv3FhJt58L9QcNVxdnyl8oP2UiPvdsWN1VnEaFgRYUHNNavD3EgN5Rj6DW+kXg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4IPHdqkx9eyHJ5fFHCRpGqIoil3nM7ZUjyDlrW9Hf/U=; b=e3vxwzaQkyks6FOasvvAZjEdlz
 V5G15r3OIMRbY5XY5iBH7Z0w5KjuySLxejEYyEnjhZMYRXmUCviRxB4FofSk4P3kiy/DSG/fxT3cr
 jxFlawqsiR5fYrwefE0HcQW8h6zm3vtxeykZW0aPW9b7ZQFg/MUQ3m0DgmHvrH26+9yE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhgU9-0002KM-I4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Aug 2025 03:31:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 424F143AF6;
 Fri,  1 Aug 2025 03:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DB8C4CEEB;
 Fri,  1 Aug 2025 03:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754019059;
 bh=rfHdzfNIx4FFOhlSKWxr5XWDxi7eS6+o/gMrmLuRlD4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=I9qed3Wo1+e/qJXZx6vNF26XjXunTywh6DJ2z61hqnDy+tTQ+4PGlGDsEYbc+Vsce
 Jr5MjOkWDFAiF3mCKn+vZmX+igAqJeGSyWFXk9aJ56d/W/d8qG/LGmrUrw3LKuwKvL
 d1GmUtiIXYTa4nikkAt7dfTb3U/jMRP4HMnzRsCqIdjYlEsO9WQBk6s3D8/Si+8rLj
 G/aDyJ3mDAX0qTNryCeL5PS0FYddua5eXO123MmEOynfsVU2Wst+6wgDn6Dcmv/g7e
 XvMqfJQh882Cffn2SlrKW64op1LYVe1vrhqvBLxqZ+h3TqzenmaUgEwEqFBvBlDCkN
 ecSqRS17MoL3A==
Message-ID: <38f94640-64be-4ec3-b077-1fbef31af184@kernel.org>
Date: Fri, 1 Aug 2025 11:30:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "mason.zhang" <masonzhang.linuxer@gmail.com>
References: <20250731151917.24800-1-masonzhang.linuxer@gmail.com>
Content-Language: en-US
In-Reply-To: <20250731151917.24800-1-masonzhang.linuxer@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/31/25 23:19, mason.zhang wrote: > Otherwise,
 the filesystem
 may unaware of potential file corruption. > > Signed-off-by: mason.zhang
 <masonzhang.linuxer@gmail.com> Reviewed-by: Chao Yu <chao@kernel.org> 
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
X-Headers-End: 1uhgU9-0002KM-I4
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add error checking in
 do_write_page()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/31/25 23:19, mason.zhang wrote:
> Otherwise, the filesystem may unaware of potential file corruption.
> 
> Signed-off-by: mason.zhang <masonzhang.linuxer@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
