Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9264C89137B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Mar 2024 07:12:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rq5TP-0002W9-Ry;
	Fri, 29 Mar 2024 06:12:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rq5TO-0002Vu-3z
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Mar 2024 06:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1wLBmipmNtmLyml3VqQ6f+BOyQ9vH/hMg1V0zcv1V0w=; b=JkA6DK+MHbaszGI8h7XpaF1iM/
 y9AQ8sb5rWvCnVzxKaZi7EHvMS7RnRg9M432FunBTS2ISIg+bAr8ufkqq6Iq5tpZiQow4AUv59IUz
 2rppTFCPV12Lsn3yaSBeiUoIO3I1iKt4DYW0mvsRc+Wfvj1+LVVF0PTVB89kUBVuKrWw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1wLBmipmNtmLyml3VqQ6f+BOyQ9vH/hMg1V0zcv1V0w=; b=Et8VAAEye1ptoBcoQsAmzf+WN+
 BWgJxIgvF1FrWVuj2v8QqzOlsoeTLeqshD+g2K6q1x43EvMcQdxZwMTvygORfs8FDctRcq152QCjH
 ezx3GazZkP2oZmen6T/uPAfDHxcggcS8RVrj1WbYnD1MAiA7sahL0mvbyEm7Voo2qnUI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rq5TN-0003ae-RV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Mar 2024 06:12:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7AAF2CE28DB;
 Fri, 29 Mar 2024 06:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12D2C433C7;
 Fri, 29 Mar 2024 06:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711692724;
 bh=nViNlG+k83BRarAWiFwh0vdzjQxl1IIHESNxB85xLrM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vOgKwuuaZlx09jwqLXxq0EJ9Yxu4+tBmKwr3XOLs/SY1KTpwOrVNJ9zwUKPLOz1+k
 Ut2vf2ofvJlp5hKp0agF6rtLQEpMg2mWZGgsc+3qFhlzk8Qg1qWhWDcqvMN0T5wLxK
 6yNRFMcCjwu/6300GYiE2KsLf0aOB/xtdSxd7g7hv3Wukz/UCew4Q3ZJTbvJSH3lFX
 z+qK3wk1aUGm6iZgGVRkFlE4TZsTo+Q8r/CO0kRDeNbUwezUI9+WfZKyK+EqezgYMg
 Lwonz8fRCNVi/xDJXXuCS1vCytCf1E9498REllcklpyefhs33bOTYgi5r57iMStJh+
 NaT4zogz49MUg==
Message-ID: <17202690-ace2-4a88-92c2-2149f434fa56@kernel.org>
Date: Fri, 29 Mar 2024 14:11:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1711529620-17576-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1711529620-17576-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/27 16:53, Zhiguo Niu wrote: > A length that exceeds
 the real size of the inode may be > specified from user,
 although these out-of-range
 areas > are not mapped, but they still need to be che [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rq5TN-0003ae-RV
Subject: Re: [f2fs-dev] [PATCH V3] f2fs: fix to adjust appropirate
 defragment pg_end
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/27 16:53, Zhiguo Niu wrote:
> A length that exceeds the real size of the inode may be
> specified from user, although these out-of-range areas
> are not mapped, but they still need to be check in
> while loop, which is unnecessary.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
