Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3B45BBD7A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 18 Sep 2022 12:46:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oZrow-00036v-PS;
	Sun, 18 Sep 2022 10:46:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oZrov-00036X-2I
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 18 Sep 2022 10:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XeHnYmgWAnFIubN2sMEai49+dMU55IgbWL1zY3PDquY=; b=MZ+BmRYspWN2Z8HibRuD/9yYkg
 31meyz5ZVyi60z1CUjA4K93MBEwXAj3VQptm4Yf52HdGjEGjwGONBjjH7k2ld0kyKgLX6MlFJ/Qh3
 3naKdK+qN5ngR34yiVNIPAKFUcYixXrwKJMra4970v8S1tvxf3UKH9tQT8wqm0SYG/F0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XeHnYmgWAnFIubN2sMEai49+dMU55IgbWL1zY3PDquY=; b=K449ZJ1vwYoIGgjQPxPinQaZsK
 4GjzqH6cEABGxsZw0/Yt0Ekl10JsAtMJs8MaigkG5jcQuPBbPqxbdNp00TKwGXM7zgU7d9yCxIWth
 B2Y6sAMNtg0pLH/BvCq/Gx0Krk8fOe1zBQ5AaguudN8E0n33IoW+nnxt4IorKTH5i+yE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oZrou-0003tE-F2 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 18 Sep 2022 10:46:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C66E6149F;
 Sun, 18 Sep 2022 10:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CDCC433D6;
 Sun, 18 Sep 2022 10:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663497994;
 bh=e9wjOexKOMZlNfO2dtAok28ecRUy7RXg/LqRFMPfn2Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LjXO3ek+jRqpqfYPEiOW1kZqL/hitHf2jpNakDKaXFwBhi+4RJGZTEMvFKNcn+YHw
 31tt+NBITY/L7a3FNk1s3IGNlGO8M6HuAvU9ZIoqkt6WhzFj8XIbO6nUx53vESQfTH
 DFitXmS1aS507bnuzLFJ+9GfpKJtQptolYlCr+LCo1us2xvFnAJrP8hTr2aqD8Ells
 UM1jDIT5tNdofNBp0hE+ItX9QOO80/SQ+1qujDeUNarLf2S/j7zbaPqbBHvIrWFECX
 OfWYzFy3PUCsWUFly/F5RC8kbwUUS9qNn/FuUg65mVzy2qJH7/6Eek91bgEMfr3908
 usJLAJEd04ZqQ==
Message-ID: <41bd8ec3-4509-cb0d-3542-5d8905eacb49@kernel.org>
Date: Sun, 18 Sep 2022 18:46:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, jaegeuk@kernel.org
References: <20220914013322.45272-1-zhangqilong3@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220914013322.45272-1-zhangqilong3@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/14 9:33, Zhang Qilong wrote: > ERROR: code indent
 should use tabs where possible > ERROR: spaces required around that ':' >
 ERROR: incorrect tab > > Found serveral code type errors when revi [...] 
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
X-Headers-End: 1oZrou-0003tE-F2
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: code clean and fix a type error
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

On 2022/9/14 9:33, Zhang Qilong wrote:
> ERROR: code indent should use tabs where possible
> ERROR: spaces required around that ':'
> ERROR: incorrect tab
> 
> Found serveral code type errors when review the code and fix it.
> There is no function change.
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
