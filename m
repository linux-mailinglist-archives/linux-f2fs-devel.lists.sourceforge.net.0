Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8338A448178
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Nov 2021 15:21:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mk5WT-0007zH-4N; Mon, 08 Nov 2021 14:21:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mk5WR-0007zA-Qm
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Nov 2021 14:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U191eI839LnaEJlLEz/Kc454FNyPFU8ahUCPbx9deCg=; b=HKihxuRf0UDR4uNzsdrX0PezUt
 h4XtHx2QNHcMjvmFwedAbzl60G+LUuxsVIrSVKlFG0CMQzVkcz8LeBSsVlfguVfWuPDSgERx0dpiv
 YHzxeHtOcUqFTv5BEHHxs5GFQW61/Rk1AuXESvXNv5tXOM9c1jsnGWuW1yHu1uM/QHzY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U191eI839LnaEJlLEz/Kc454FNyPFU8ahUCPbx9deCg=; b=YrGr3PWcpwdVePIjEB+EwwFkzN
 w4rIwUl4GT6A3d0tHotU83Z/7CE9o6h/gQ3o/3HEhjMDuj080k/UzqV8flhrFIS3UGgydHI2xzGjS
 G+JmGkPY1XNPBiR3feeU4HXXD+XGomwdGLVOScIkr/0BFFs3tgCBRAQnr8rPnR0bvjrg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mk5WR-0069OT-7p
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Nov 2021 14:21:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40A6B610A8;
 Mon,  8 Nov 2021 14:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636381269;
 bh=cdbdWDGv8W9RlSBT0ulyvcIqyAKmC+AoCNkcFvU49Sk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PD1ODTyIMCQwelWZH8CTicUx3+NMJBUi8VCwSSrhdh4zq98ttD7aYOVq/PVgSPO9r
 LeOthKk3pjs9kwVtT18dEdnCurQFKsElbLoWVHoIpSuqS9U64Kx3sHHrDSM7X+h0OK
 escIRKYD0nIkFuryO/6lRgvhfWySmCgPfLWwXBxCI6d2cL5drCc5fpiQHJSDBs3+H+
 wS4cGQy302GO4kPehym5cayTEw/e3D3yoBQ14ikolahAj20GUWDt2/4eQS4WSQqXl6
 fOJOf0lLm8F9ZME+BhvErfJrgRwf2FqBgyz5tAWLYt7RuypkFNBIJwgRwRg9jYSuNk
 LXB+u3SlLNUcg==
Message-ID: <1e1ab7dd-2f44-1878-2faa-42ba3fd1f8db@kernel.org>
Date: Mon, 8 Nov 2021 22:21:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20211108035459.40139-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211108035459.40139-1-changfengnan@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/8 11:54, Fengnan Chang wrote: > In my test, serial
 io for compress file will make multithread small write > performance drop
 a lot. > > I'm try to fingure out why we need __should_serialize [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mk5WR-0069OT-7p
Subject: Re: [f2fs-dev] Do we need serial io for compress file?
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/11/8 11:54, Fengnan Chang wrote:
> In my test, serial io for compress file will make multithread small write
> performance drop a lot.
> 
> I'm try to fingure out why we need __should_serialize_io, IMO, we use __should_serialize_io to avoid deadlock or try to
> improve sequential performance, but I don't understand why we should do this for

It was introduced to avoid fragmentation of file blocks.

> compressed file. In my test, if we just remove this, write same file in multithread will have problem, but parallel write different files in multithread

What do you mean by "write same file in multithread will have problem"?

Thanks,

> is ok. So I think maybe we should use another lock to allow write different files in multithread.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
