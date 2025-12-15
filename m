Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1068FCBC34C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Dec 2025 02:47:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ms7NECbG/tpITlDaPAoTMFzO0WLLGeRKJVl1jdkXAU=; b=WAiM6CP4gXqPCjbhqpPQsIpyWa
	uz+/o4HiruX2isdJr50OlvWng8nnvQJ/KVfA99EA6wBXcrep+57Oil6pMux5d2Ve9GAfHOpwQJcrc
	9Aq2FRVh+cGbfGLrrOM63xlCmzIBjRcRRsjvo0ajpoaCy0if+8o+Yw8t679eNvjpoR1Q=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vUxfo-0000t4-Pi;
	Mon, 15 Dec 2025 01:46:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vUxfm-0000sw-Ue
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Dec 2025 01:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FMPreLr3Xnpc4WoVo6ZFbehSPtse7cRnUvR+ctzFB9c=; b=BD96pMWLUJHpxdGVzJABPBNdQr
 HI7qwRE5IfXob93BDtwuDI/yZsKce+peX0jOWb04U+rWLQJbYadh1hLIb8kZIL/R5wcA3ud1eC+es
 +y6J9X5BgzGQWCD/VMJTfPjhJhpSSh7cRaeXhvriq7/X5S1D0nlq78xrSgvVTPrY/lxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FMPreLr3Xnpc4WoVo6ZFbehSPtse7cRnUvR+ctzFB9c=; b=SrQF3VxNPvWm6D8bnNNnJ0tbuT
 lRm37W7Lzyry+jg4JIiLGB5MgRQspiV3NdBBkmtlapRkqQN+0GSnRhs7D0drIVb9zfVAWCREMFgdP
 PIEZW0ay3Joh9hug7fg4/yHqLlzpWqyZJFpEoUz/sGFe3ZjnWqrF6PYB/w5U6c9rrJmU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vUxfn-0006KQ-9o for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Dec 2025 01:46:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 69ED660197
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Dec 2025 01:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7C7C4CEFB;
 Mon, 15 Dec 2025 01:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765763200;
 bh=FMPreLr3Xnpc4WoVo6ZFbehSPtse7cRnUvR+ctzFB9c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=EMSYfl0NzYrCsI8rDvfeBE0HcSvcEZpl90l49kxUtRNSg17+ZPRVPjWD+kr8YKimB
 sWx3cI+nurHrcm3bez/yHCyo8oyaSzEr5t0LRAGrYng9zeT/p7neA9wXaCkSgJUW16
 1PkYQQaV3LEW0mQsu2cLUJ2ugVazH4Gc9UqbIT8KUrwQCa1KWw4e/VOhFFdPzprSBb
 yOUVcjPnY6xM8QRdLB1A4OMdIfhwHlpW6HXfL9oM9NA2qg1/ARkr3NmpBTysRn7tEd
 ah/ovUUgQWJpafCpOkIRe6BfsCfmZW6cTFrHPGSJ5L1m2vyzh0IhEL5K6oQAUQoz45
 pYAwGLZFG+Z6g==
Message-ID: <a97c3bfd-f242-4233-a086-2268f9f5bc87@kernel.org>
Date: Mon, 15 Dec 2025 09:46:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20251212001411.3901279-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20251212001411.3901279-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/12/25 08:14, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu
 <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vUxfn-0006KQ-9o
Subject: Re: [f2fs-dev] [PATCH] Fix to get the right IO bandwidth
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/12/25 08:14, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
