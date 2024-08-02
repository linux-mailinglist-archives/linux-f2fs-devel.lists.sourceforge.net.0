Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BC09459F0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Aug 2024 10:32:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sZnhX-0003KA-Cj;
	Fri, 02 Aug 2024 08:31:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sZnhW-0003K1-1m
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Aug 2024 08:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yJjI/AgDQVOrrJUBg73gYW38rAWmdcyjZcKSUXNRwtg=; b=lRNCLu122g5cct0A4l7A70/cp3
 y45wvTQhsXAxY9+IfQYuFi9LA3xvCW8hgVJCAO7cE9VJ+YjmxYv7IZsq7RkwCgzfQDRuzgD1bXux4
 F4FaxPyiVS3Pxhgip9tKx9b6+nCor49Xzshs6EStiF4NPS0Y65cawA7Fu8WMvlvWnM8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yJjI/AgDQVOrrJUBg73gYW38rAWmdcyjZcKSUXNRwtg=; b=KsAGMvchIhszE8/wn4L0Vd/Vz/
 9naIrpN6/f6bS47BB7hnq1NkzaWxL8mskpVHyMrbMr2FoqFYEVeMWbCcX9iNNSRmFONSRerUcg0zt
 AYdMjsInYjbPB+bdDYrUgk9/5f+ye5ldWSUp/UgtpdVmSSiyj868uojfqRwZfMRUvLz0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sZnhU-0001Xk-Rq for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Aug 2024 08:31:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7DC32629D9;
 Fri,  2 Aug 2024 08:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BAC4C32782;
 Fri,  2 Aug 2024 08:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722587503;
 bh=ATqdkeQXUqqjv4Hb5DHIWAQGElZkG2G8qJ9sP9ylcOw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j6cPlJKBVmi2TKsUogd1nvWUTsm3GNXG97hfwGDKB8WOxkrwpoNo0lsW1AOHn2J0J
 P3PdDQ/fJN6L5qch4NnLWT6hWc/drsn/hmw4ybt39Tnvb8f1orHfbkTVO4kh7Nbcbj
 2W9AeeT9YN1ULOgg6sDigmLidRDw4HYBSx2q0xtT9sc4JTOsTdAzX8k2BM2tf+WEvB
 ON0dZruZCw90jVcxGbPUwILeaKrw4odTbL0uo/vfh61aSZg0D7BODOGjnqw3ukjoQ5
 DNu+o0usq+VeH380cK2i5iniv7kEYN02xmeKwbEJrmT9gA2h1g5p1pT6KmRqkE9qzi
 LRt6ajwBDbTiA==
Message-ID: <be8af273-0956-47a5-9a85-ce74a5504217@kernel.org>
Date: Fri, 2 Aug 2024 16:31:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1722476031-22106-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1722476031-22106-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/1 9:33,
 Zhiguo Niu wrote: > Use F2FS_BYTES_TO_BLK(bytes)
 and F2FS_BLK_TO_BYTES(blk) for cleanup > > Signed-off-by: Zhiguo Niu
 <zhiguo.niu@unisoc.com>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sZnhU-0001Xk-Rq
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up val{>>,<<}F2FS_BLKSIZE_BITS
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
Cc: Hao_hao.Wang@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/1 9:33, Zhiguo Niu wrote:
> Use F2FS_BYTES_TO_BLK(bytes) and F2FS_BLK_TO_BYTES(blk) for cleanup
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
