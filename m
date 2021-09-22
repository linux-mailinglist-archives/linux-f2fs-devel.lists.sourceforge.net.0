Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D853414D3B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Sep 2021 17:38:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mT4KP-0003qC-FO; Wed, 22 Sep 2021 15:38:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mT4KO-0003q4-2b
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Sep 2021 15:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BJmor2MvLACKZs7qmJGYfhMZgKvIRPb0tHZx81Ve/uc=; b=IKy8+1tKly0tOZMBjihfxWItG3
 t1bacJ9qjKO8BIdIe6nzu5keS5Lp9tdqS788aElbSrCdnQvpb5BzPXgCi53Es4q5Aw59VDHWl7q2I
 ZLEHre67AMTxViUz/xwtyDEPxjZAwg7NGIEjnRZV3LgL9P1Ff7+cWxoDs6rxQgGRQlfQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BJmor2MvLACKZs7qmJGYfhMZgKvIRPb0tHZx81Ve/uc=; b=HPyWbkvc4g/uwB3TUPnJ8iefYC
 sFEPgrlna9LKYcYcmZjSppn0VkZpcXozVzdXWB8cG2ZF+QxlfU8vUAvEroIWxUP+kwvFg6ooFgJ1e
 qXnVxk6oJp5+2LKIipRMlwHd6G5GQhdJVItEEmA5FF9Ztw2kq3fujct2ig6zZIVApZXk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mT4KN-001n8W-HH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Sep 2021 15:38:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2E426105A;
 Wed, 22 Sep 2021 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632325106;
 bh=sLAEuM02C4QCweaybMs7XQEl3DnrzQCjZvYWaMErhow=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qkHvBqFP+n+i1FNhisynQVVPQt8Y2e7eC6KpSNNx4OjKP6Zk2SrFnMK792fWP6Uy0
 WED7+1UG14G/28P16G3fnZfxj4TGSkCW+Qw/jmmB+B4WOt6jKXGNY6LKJ16kJqdp//
 vtyYyozQaB+8qo4DyqZFaRPZeJuFfpyhfx6uXzW2eabSTg4HyJUfmSjl8RhkL521rA
 nR0dTESEwnnl28yepRByATEEWKNOoQr26kbjIgFhZGgHa9GJ7lrkS9WN8a2JNIYF3j
 8pT7oUa1fjPxNwkoFBck7+QTW0Ny2FHeqGgCql20c+OVWPscFbetwk4LGfJDjIcHgu
 DY1fnTrFvFPRQ==
To: Gao Xiang <hsiangkao@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210921143730.82649-1-hsiangkao@linux.alibaba.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <5a68db09-a5a4-6d53-65b8-3abaff6b174d@kernel.org>
Date: Wed, 22 Sep 2021 23:38:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210921143730.82649-1-hsiangkao@linux.alibaba.com>
Content-Language: en-US
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/9/21 22:37, Gao Xiang wrote: > Fix up a misuse that
 the filename pointer isn't always valid in > the ring buffer, and we should
 copy the content instead. > > Fixes: 0c5e36db17f5 ("f2fs: trace [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mT4KN-001n8W-HH
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix up f2fs_lookup tracepoints
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
Cc: LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/9/21 22:37, Gao Xiang wrote:
> Fix up a misuse that the filename pointer isn't always valid in
> the ring buffer, and we should copy the content instead.
> 
> Fixes: 0c5e36db17f5 ("f2fs: trace f2fs_lookup")
> Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
