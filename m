Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB65B73D0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 17:16:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oY7eB-0000DZ-QF;
	Tue, 13 Sep 2022 15:16:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oY7eA-0000DM-Lr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 15:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PyNkXQj9csRFSISCiW7phBUcxUkMrhX7zaPlsbO12y0=; b=iCu+xloEVuVWkIGa9D4YGJd1WP
 akSOMzDje4Kblv6jQLv/UEzpx+/9M8rY+Xc3ktyGNNuioLaRVgUB02ZjtFzxziT9AdpiB2IcyJYKH
 pH4SNvia+urtV4ejgXncmJHkNsY0hGyAiA8oApCVIBDd59tjUqv+gRbyWuiFXvdPn3cU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PyNkXQj9csRFSISCiW7phBUcxUkMrhX7zaPlsbO12y0=; b=cBL77npavSaNRfYnZpzYRgJt4D
 uyyRGPMF7q6ZOzrz74Dwo8YZ5gyr37aYHxhW08vZoI+yYo+QKjsKnjm9YuaY6VDHo+WxHms8GQmo/
 FzXSui6myehJrSWTNN8BbjvlX7O8ZEJzgvd8fJizExNuEk9YpL3d62QY1Ind6qqUDuEQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oY7e9-0071PT-Ug for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 15:16:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC303614D9;
 Tue, 13 Sep 2022 15:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92F3C433C1;
 Tue, 13 Sep 2022 15:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663082171;
 bh=TRhvgutL1EySgBuRhk+eWZqDTQ6EUt1+sn/lznv941g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ofkihlTBHgCdomNj8pb8NwGEH7Y/t3+ooCNDQyviFGE0Nr/2lyntvE5qU2AYpUgf9
 AFA48V7CdFyqYe+bwRlbOl/0JwPBr+PuHyeM72yjvkMummAjFMDgqVKaLhXN3p9PXV
 4qnf77IPa0jrt+Oj0IkMY7Ze9Flvdcv1BBbLVDz2nI1mzePBdr1u0No74duRJbIUZh
 ZjOzp+8hSX89XKzI/XNaZ+R6fsTYxdkv5MSvZ6UAgo5Dxyb+mnRinnKo2M0v9+cxaf
 8NgZs4p25yuCAY/q5Aauj8RJhUnfgT19FTNuAmnQaFWzaq36rQ4vCC+an/yIPQ9U1e
 IZ69lN10wwpLA==
Message-ID: <f7f780c3-a414-f198-95de-08362bfa5257@kernel.org>
Date: Tue, 13 Sep 2022 23:16:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Christian Brauner <brauner@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220909091744.933297-1-brauner@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220909091744.933297-1-brauner@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/9 17:17, Christian Brauner wrote: > A while ago
 we introduced a dedicated vfs{g,
 u}id_t type in commit > 1e5267cd0895 ("mnt_idmapping:
 add vfs{g,u}id_t"). We already switched > over a good pa [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oY7e9-0071PT-Ug
Subject: Re: [f2fs-dev] [PATCH] f2fs: port to vfs{g,
 u}id_t and associated helpers
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Seth Forshee <sforshee@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/9/9 17:17, Christian Brauner wrote:
> A while ago we introduced a dedicated vfs{g,u}id_t type in commit
> 1e5267cd0895 ("mnt_idmapping: add vfs{g,u}id_t"). We already switched
> over a good part of the VFS. Ultimately we will remove all legacy
> idmapped mount helpers that operate only on k{g,u}id_t in favor of the
> new type safe helpers that operate on vfs{g,u}id_t.
> 
> Cc: Seth Forshee (Digital Ocean) <sforshee@kernel.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Chao Yu <chao@kernel.org>
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
