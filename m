Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD3BAC8E95
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 May 2025 14:53:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrsS8iVE+o0kQJKh5PJyU1vb7kSL0mkSdP0Vo5XkdkU=; b=ldxwaT2R2FVufYqxbtZXrV2JGS
	981visHJSGu35gqeUcBoPYfoq5e3kQL1pAWhEYyLJeI6LcesnVt7ynEQd1IuvAMFjz3GjzfjpeKqf
	Io03jtNNRsTG3h40zShOKjfzdT7qcbRXC5w4/PSBUJ3jP1Ncs5IEUeUXyeValHyDrlWM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKzEd-0005CM-D8;
	Fri, 30 May 2025 12:53:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uKzEc-0005C8-40
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 May 2025 12:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LPxsZCpkQCL0Tm6uGykQ2YrrphxCPcQQrdRumNjURu4=; b=ZDPFLCIhDARQ3myMMPMths1+j1
 /9wQUlQw3aZ5WD79BMOgpQyJe9h5dV8Wr3KGrRyYq6OGfkIntf4j/d8NXgd0e/RifXxfhV/OyLN2Q
 iPNgB6SxYPVw3k3fzXRK6NWWmTwMrIEsNvjtUsNBuZzCItRzdCn0DoZOjjF3zJ0B3ZdM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LPxsZCpkQCL0Tm6uGykQ2YrrphxCPcQQrdRumNjURu4=; b=MkybMo7pKERuJ/QZ2V612ziaQn
 2jHc0+vBQsauUMSmTvJ7goV8HFJBaD9MknyvP3w+eNmLJKuoXfbB9NErGhoi20GuGhwODG/3fJ30u
 aNKni6KKMNdLwNJS5tmu3WrGBqD8fgkuHm00Yl+KN2b6h7w/kViYCln8D6Aeb1YVVHKI=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKzEb-0007O7-Ep for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 May 2025 12:53:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CC7E8A4EF34;
 Fri, 30 May 2025 12:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05FFAC4CEEB;
 Fri, 30 May 2025 12:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748609586;
 bh=SEikAtc7gEUD30o/zg/MQXV7dFuimQdgUgpDmBrr7OE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=bJjTNXGsVjKoduYFHsYbRmQB84krmxxZ4lK3HWTQB/4KUA3KcpO6/8dUEmkS2qHQM
 aAWMm55KQIBewZ57UUTOnd5XeGGnMTUkXT9ITm/InqOWc8lpy9yAZWbyqMlGMP1VHf
 y2OzCc73rgBs7LcBJ1pl3lhj53TSMcIgY3AjxeiwdeCd2MTC/fIcUO0OESalfEjLEm
 g0ERtqh0ZSVTYwyJA6LlutLWkeaO4vSb0PfZe43iaeCCMFvI32rSB8qsMcnG/c/qib
 dyUmy1RtN2OGvzMcxNozmxCia/WG1xWxWebEb8YMfaCCur/pBNTKsaOmY53k2CmD3D
 09wJwUtlbicBw==
Message-ID: <bd236bb4-ce45-47da-97da-4da12424a536@kernel.org>
Date: Fri, 30 May 2025 20:53:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jan Prusakowski <jprusakowski@google.com>, Zorro Lang <zlang@kernel.org>, 
 fstests@vger.kernel.org
References: <20250530092349.3407742-1-jprusakowski@google.com>
Content-Language: en-US
In-Reply-To: <20250530092349.3407742-1-jprusakowski@google.com>
X-Headers-End: 1uKzEb-0007O7-Ep
Subject: Re: [f2fs-dev] [PATCH v1] f2fs/004: avoid race condition in test
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/5/30 17:23, Jan Prusakowski via Linux-f2fs-devel wrote:
> In current implementation the atomic write may not start before
> the direct write and the test fails.
> 
> The patch adds a delay after starting the atomic write process
> so it has a chance to actually start wrtiting data and set the
> internal state of the file correctly.
> 
> Signed-off-by: Jan Prusakowski <jprusakowski@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
