Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 005CD734998
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 03:02:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qB3HT-0006Nk-EP;
	Mon, 19 Jun 2023 01:02:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qB3HK-0006NR-3g
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 01:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MVyBSUQ2iB9qNI6k6IHPJqpdw1mu4g9IVxUuYDcOul8=; b=Vfamx0Aw0ldnoyQmrzCP3ABsXo
 L2RaIrFjIxEqHKnigKYggOOMRYsOixni2AsvwWvG65rkRn/+xce4DQJ9zUX54KTutRF7Zof8B4nd1
 4VUusOIPFTr22TyJrFZn6PYKsPHxVpVMiK9ZGLG0Q0Qm4LPE9yBzXN8bCafW8u2b4gl8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MVyBSUQ2iB9qNI6k6IHPJqpdw1mu4g9IVxUuYDcOul8=; b=T45JKNzNx1xiQYIz0xea8lUrk2
 gWYhiw6CRK/JMu7cYwRii3hi48K6kQ3q7oRTHTGNCwgrSj1uivEK2bZ0KMu+hUJq5suiOUm2TIs2F
 7f26yd9rXSn1RMPiFc7HREarEwtHOf7w6aEAsABmd5jRcGxJtTIXIOo4almVyMFgGZKA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qB3HJ-0006jX-Hb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 01:01:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 28C8860DBA;
 Mon, 19 Jun 2023 01:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5629C433C0;
 Mon, 19 Jun 2023 01:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687136511;
 bh=RAEH/HZJxVt1SqbHjxeKJ/iamlj5YC4AzfMi22lYMk8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gbq+iFbNB0Zc/JrKRTUWGcNjQA1FWyS6GAXPr2dw8/YFQs40tchzbwPHykwW43oUi
 H/DPh8i/JJRiFTGWE2HfCbjC3gO6UUIevEz9lHmkHdVaARWjv/7JzBrIqtsPjGkoL3
 2owSK9cWkezqP3npodDc0Lb2WZkqBHi6X++GmLAFOrtNXOZvUK9TYRWHcs97uhKKFK
 KkKc2RiRlkzPn65Mp5C2pPt6ZQAI9YJc07Y4T8qwGqItTznNL4ZpFiY3ohwE+u58Jg
 5+N6dbLc3SGVK3ijNBcUlLqF8tKwJRdNm+TzX0UOqUZqahYP81ZwIklIBI1ZeAgjiD
 sp79mGSgFJP3w==
Message-ID: <60ba00c5-4f49-1b79-80a0-6d25c548e8db@kernel.org>
Date: Mon, 19 Jun 2023 09:01:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230613065911.4304-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230613065911.4304-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/13 14:59,
 Yangtao Li wrote: > Expend fallocate command
 to support more flags. > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qB3HJ-0006jX-Hb
Subject: Re: [f2fs-dev] [PATCH v3] f2fs_io: expend fallocate command
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

On 2023/6/13 14:59, Yangtao Li wrote:
> Expend fallocate command to support more flags.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
