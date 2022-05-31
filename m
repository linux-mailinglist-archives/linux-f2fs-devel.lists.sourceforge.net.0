Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB424538C84
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 May 2022 10:09:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nvwwK-0005Dn-FW; Tue, 31 May 2022 08:09:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nvwwJ-0005Dh-53
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 08:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZtMiojetBpHua/5bnI1YomxXNJ35+TU0jlPD8vWgSjs=; b=KDylTMARjSYRoo2SrV8XURgbKA
 IR3mCHjsETgoXUs8SZnzbW2OcZd4yr6RKavcSl7Adbf+2wXgAiBTu4O50q4E7G2Ib38cKy2CQacPo
 ly41BNujeOm69de8mU2hz4PYxjbGjydlDjIudQWJ/ntNC2wjC86ggC55cR7Oontgdz9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZtMiojetBpHua/5bnI1YomxXNJ35+TU0jlPD8vWgSjs=; b=QtHCUpGF5izRaCskxebHXlwD/P
 jy4oqZdb2cCWfbETu/tYm7EhL1NqTjSV9ZNsW2n/Ugg1Yt45sOyJplRoOCoPb24Z8fqlYMa72OntV
 CG8Z5SVmRKBf53QKLLm2KLNfgDBMjRN3rxWQ19JoTXIl0z5rGFn1qFtQVGxCwEESCejA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nvwwJ-009GvT-AX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 08:09:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EEC1461222;
 Tue, 31 May 2022 08:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BB3C385A9;
 Tue, 31 May 2022 08:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653984553;
 bh=4dQtquz8rVMavXHRf8F4BEaei3Z5MRS3ycZq2+aGL1Q=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=EflYlqUdG30oqLN7RVMH3z1QIJLJlbptSEkbBlTG5SzSlhvq/VOt/UbRdIQTHT8w5
 7sNJ1HnKYsbpSnFOGZjBl3W+0yzK9G/nx/N9p2fcAkLMopC6q4sgpSf7xay1X7+DaR
 Fhs/DSbHHdbfim55sQJ4FjTmGT/tIGBY/Kf0B+TqUV8b1lKIoEjXCDVDpAVvpZeh6K
 k7Qz//k7hohTlU8WFjcSeDp+HaE13CUow/5CrFq+pmmz5W4NZU6krG7vxfbKaJjC9L
 rYwmptzsj2FxUJdv1Bl/7Zt0uOpAw0WWS43Z+kQ/3KR4faWfFOZYy3XSWJNZrGzdEQ
 ++5rv8WCtFdwg==
Message-ID: <b6b34ec0-b4e0-92ce-3d50-62654dfb3b30@kernel.org>
Date: Tue, 31 May 2022 16:09:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Jack Qiu <jack.qiu@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20220531011656.608641-1-jack.qiu@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220531011656.608641-1-jack.qiu@huawei.com>
X-Spam-Score: -8.6 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/31 9:16, Jack Qiu via Linux-f2fs-devel wrote: >
 Current error handling is at risk of page leaks. However, we dot't seek >
 any failure scenarios, just use f2fs_bug_on. > > Signed-off-by: Jack [...]
 Content analysis details:   (-8.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nvwwJ-009GvT-AX
Subject: Re: [f2fs-dev] [PATCH] f2fs: optimize error handling in
 redirty_blocks
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/31 9:16, Jack Qiu via Linux-f2fs-devel wrote:
> Current error handling is at risk of page leaks. However, we dot't seek
> any failure scenarios, just use f2fs_bug_on.
> 
> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
