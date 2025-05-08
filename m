Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B686AAF737
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 11:53:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sB4b50kjuVutEX+D5PJbcH4rAOXL4DlRNov3aTlIKZ8=; b=BHJyvrtXLbGY5PPAIsUxUqHw3K
	pWV8ygzPm+nnb5qlaUQZtLeI0BmvYCLQrUm9TFAEBU/+kw8o4KkXpvdFCAM1z2DNf+xrXYFJdFR2y
	3o80D5EK6oEJedVnBOSHnMeV8zjjdOcm/FXQNFPCRFruOttRvPmDVrvsPO4ujaUu/r9M=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCxwl-0002de-Qw;
	Thu, 08 May 2025 09:53:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCxwk-0002dW-JI
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 09:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jvjVn9Ym2YUK+OeJ0lipLrva5zWTf4GfkVL62eI1YTQ=; b=a+PpiPev+f5dS/Rcou+AZ8dov/
 btZGGPFY7MZ1/aYBYQlPSRuerG+Yqmy4RpdWUQrG07iiUxZ0UoaVjC8x3x6faSnDGs6Pt5F9HbOMB
 3fVj54TvAFS/T/8rzGLA79RMjVCQTQFmuSAQMveYz6TFIg83pUbhDGKPeMCIjTrjl75w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jvjVn9Ym2YUK+OeJ0lipLrva5zWTf4GfkVL62eI1YTQ=; b=aBc5cGO17zqczONp3o8bUqDAWS
 PRjVWj7kpsYow07xt3keIgFFHoZdVQ0LmMAU+bdDvuFbC696xSWRIPzXEgJhdFdPX+APBuNZkjxWg
 0/hx8WTUv9vk34jJVccFBsSV5lRKYvrGAlPDZCVT6NjmCezbXGNnE5ZConr8RxUIswvc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCxwk-0003Ah-32 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 09:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7D9F65C6127;
 Thu,  8 May 2025 09:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEDBC4CEE7;
 Thu,  8 May 2025 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746698016;
 bh=xMnMByYvNQo7L2wosGfUBr8ckLgWP+gGQe30dSqfKUw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ijOv3946950TjJrdY+TKc5NYy2nbhIwGn7u05PeREp6n+DuxEeBU7Uh9tKVxtx9+T
 2IazB/6pMEXxQ5OlGm7CuRVY7c0xGB6/Z7DXFWSCwkk4tFXc0kVvNkfzHs7Vgf9gtp
 cmBTL1iDeVIrixycRThzXFljL3IYPM/UygyqMcGejs6HVmRrCkG6jAkGkddzPcS6y9
 ydALNYlqHHvI5c6IOS3rvQfTBwlIQeSnUJ1ymN8XEUND0wEWph2mfY0hQ6WJ8CLPZo
 aUdn4OkM1/efAO2qZWcW0Qh9XsTj0WnH9Vbe5r8wVn0mVEIVcue/QS0qY6cXOJLgFd
 68hxhMu47DOzA==
Message-ID: <f4a01db1-0ae8-4822-a55e-3c41ea3ad998@kernel.org>
Date: Thu, 8 May 2025 17:53:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250508051520.4169795-1-hch@lst.de>
 <20250508051520.4169795-6-hch@lst.de>
Content-Language: en-US
In-Reply-To: <20250508051520.4169795-6-hch@lst.de>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/8/25 13:14, Christoph Hellwig wrote: > Always assign
 ret where the error happens, and jump to out instead > of multiple loop exit
 conditions to prepare for changes in the > __write_node_folio cal [...] 
 Content analysis details:   (-6.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
X-Headers-End: 1uCxwk-0003Ah-32
Subject: Re: [f2fs-dev] [PATCH 5/6] f2fs: simplify return value handling in
 f2fs_fsync_node_pages
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

On 5/8/25 13:14, Christoph Hellwig wrote:
> Always assign ret where the error happens, and jump to out instead
> of multiple loop exit conditions to prepare for changes in the
> __write_node_folio calling convention.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
