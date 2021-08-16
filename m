Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E173ECCB3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Aug 2021 04:37:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFSV9-0008Uq-HD; Mon, 16 Aug 2021 02:37:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mFSV8-0008Ui-Dl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 02:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cls/2DDFA1CUHuAayBrpBt9Td2o6oz75uJ1M/39tRt8=; b=f1+JBZCmy2D45AYby+2B6oFJn1
 kusa4ESfgj4cGxSD5QjMqAQXPkyNG+yBMETuuQTRrsIrsAmgF1vbeKhU82cO46/x8fG2e2m1FlvEl
 Uyd1oOWahNxVs+FA2xIAzBsKT6Ca/qXdp5qgfiFzzcVoBrbXasdf/75R5git0elVC4fY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cls/2DDFA1CUHuAayBrpBt9Td2o6oz75uJ1M/39tRt8=; b=ZQCcKXsJxTWNh4TSoAUHqhKh+K
 57pCuD+nAKUT3Jt53mKDaRPjnQOiXg94YxoMa3kuTTt2eEhpnBAt54iTham5bpD6uX8NEGNWMmRIx
 qvNrvBZYGe4gq8ji3BD5uvBVaZccXUp48EBZ0lqi0O0b/X3ILjgExYH/VArAT9jbldCM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFSV7-007mqo-BM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 02:37:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BECDC6142A;
 Mon, 16 Aug 2021 02:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629081436;
 bh=WUD/8DbvF7bDWOd5JN9Kis9LnXnRA5Voh0Ka+8+qxDY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=upx9YR5t+qTBvxn52SAMoTzCYrJM93lUnea3J8A/m2EGuiNA4mmlZlijw5rAyY2Y+
 M8qs0TZKd4oKBQywnFw45LLzMStkniyBXBDwvnaBNXjH9M3BqvTmxJYITAHdeFEGaW
 k79Zn0OnqkHuZorut0YH9w9n302cqHkLxUefUbxLWr5QFFc2pQVEctT9A/eDDMlYDT
 u7CnOp5Gk3CHdG4/r5hQ6qumsG++cHm9V5Mx4Ii7sBc+Zh1msdnVLyEJejbTgIpa6J
 n2zt99YkREb//9hjOVy6HDjzDWuBEI1KsQsx17mJ+q5cDU7hBjvrPfCRsE+Gvj8xRF
 l2HtDK9jcLcKQ==
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20210814175840.115938-1-frank.li@vivo.com>
 <20210814175840.115938-2-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <90179e25-5ab7-bf66-2692-9715de8cb56e@kernel.org>
Date: Mon, 16 Aug 2021 10:37:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210814175840.115938-2-frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.9 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mFSV7-007mqo-BM
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix description about main_blkaddr
 node
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/15 1:58, Yangtao Li wrote:
> Don't leave a blank line, to keep the style consistent
> with other node descriptions.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
