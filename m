Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95352502549
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Apr 2022 08:06:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfF6J-00032M-4I; Fri, 15 Apr 2022 06:06:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nfF61-000326-MD
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Apr 2022 06:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7krNVv0p3+9I1IJ2ob2IpWEJtnE8gMFshxhEHEbwVi0=; b=Y1V0eOs++Zwmxk4QQydrgmtaQI
 GpLGyREMPjBJjK4LkupMtqBmIXAonOA1bunRbrfh6CbE2tPTfKi5YQocPyYOt9SpPrIoE0NMBiKFc
 uQzJYipP1g7zXuf/lTxFg566YimnVV++7XxISbMpU1BwT/Z+FOkmzgYCGjzBc5pynGqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7krNVv0p3+9I1IJ2ob2IpWEJtnE8gMFshxhEHEbwVi0=; b=LDiiqbPdpfq8xG9xwxnOOcRQMX
 8aTG44yB63+OCfyue1XlmMUWzMa7a3uZVtt+uYatt0/fvdSa9QXoB62rWzP9pU5Mt3iclDupaYXYZ
 hMRGUIhePgTHQ1KWgtaJ6rnkeBiTfJXA6iLlpvXMK2oweVdFu7IEFvLnpo+v1YxzASMI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfF5u-0004sn-Nf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Apr 2022 06:06:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C3E56B82C28;
 Fri, 15 Apr 2022 06:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7C1C385A5;
 Fri, 15 Apr 2022 06:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650002757;
 bh=9EJhFefwP87g2Uo3Oggk8GnCc1MvRsQNaYRMX+E6OlI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nJvO+I+kj0S28xHKtAtzlaDSeUgXcZ6vY7yXZdc/I7E2R70uRoE2BMsXVX58+Q58x
 BGhdCFyT8dsdwesoXTxMh4tRo298oG3419M4ussseOy8xQdpzzQuhKX8LhQFkjSnnt
 UoW+2i6zPFW0HfPFmm1lmde3ZrAnstA9FUAqO6xDWhzPMCOUJnflapK0LFUdpIDOjH
 SQmLkbA9ThmO6M6dXAnPKJ97F7sr3Vg8aTbXmPqZpIwyOVsmLT55sDm5Dn1Hd5JgG6
 e+JAABNTasxIHVzld23/0w3TMUtTF6hFwJG4vd7Tm8HZ9fdCNu/kzcEV+P3pDLqBgk
 TqKJmb3hJ1e2w==
Message-ID: <a81d5949-e775-f15b-1800-2736d0a3ccd6@kernel.org>
Date: Fri, 15 Apr 2022 14:05:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220412122040.3555423-1-jakobkoschel@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220412122040.3555423-1-jakobkoschel@gmail.com>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/12 20:20, Jakob Koschel wrote: > In preparation
 to limit the scope of a list iterator to the list > traversal loop, the usage
 of the list iterator variable 'next' should > be avoided past th [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nfF5u-0004sn-Nf
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: Remove usage of list iterator
 pas the loop for list_move_tail()
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
Cc: linux-kernel@vger.kernel.org, "Bos, H.J." <h.j.bos@vu.nl>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 linux-f2fs-devel@lists.sourceforge.net, Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/4/12 20:20, Jakob Koschel wrote:
> In preparation to limit the scope of a list iterator to the list
> traversal loop, the usage of the list iterator variable 'next' should
> be avoided past the loop body [1].
> 
> Instead of calling list_move_tail() on 'next' after the loop, it is
> called within the loop if the correct location was found.
> After the loop it covers the case if no location was found and it
> should be inserted based on the 'head' of the list.
> 
> Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
