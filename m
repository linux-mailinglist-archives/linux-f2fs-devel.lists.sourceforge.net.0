Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CEE5AEE5A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Sep 2022 17:09:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVaCh-0006rg-Hf;
	Tue, 06 Sep 2022 15:09:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oVaCg-0006rW-7w
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 15:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XZP+3EbOJx10jvHUkLqeZoJ3tBn3JENVZrwMPwsnljk=; b=QKLojIgaVJQD2dmWIFlmM5OrKQ
 3+x376DQyA0//nnDV/cEzXZuU4HkxbOAHbEuRyaUJOlC1YkWH4wmkLkUsxpvnD3l3QBo7UWvvlXyH
 ORZORUQDocxL16SpznE3UiJyuOSKdXGkPPx7EW+/1BTXjQu7PMmooTS3ASDrcJ5pILmI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XZP+3EbOJx10jvHUkLqeZoJ3tBn3JENVZrwMPwsnljk=; b=Oxd2UuF+C0WiV6/F19oPsnvPqM
 QW8XwV6d9aQtedtKgSV5i1kV8puRmLg2lX/W+2V5qvcw9AnALDpDFobbhVKRdwsiXj5yYE/RdWar8
 oXzxvAgfGsOH2929+xIVYEqLNHB8B1Xexm4xIOlzr8ovB4DX2mUyJ9Q8UnvLIxjfjOTY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVaCf-0004Cz-9x for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 15:09:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11FCFB81908;
 Tue,  6 Sep 2022 15:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61208C433C1;
 Tue,  6 Sep 2022 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662476961;
 bh=FV91piF4ZeID7mpLQSFqYupHuN+3qDsgWgeUcj/uZOs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dH66mns4W2S8rBp+QMshYQesTvyRgTsnd0LKs9tvmfaBcAQGMtoLDO6l/gSvAmOog
 of0v+hU65XApnTLjDBTxKlaFu9e9Nb1QCSxhoV6f9GcXUydsrwE82yqsMHLUMvgeRZ
 ZnHlQybbsPGqifoIXjngWewLR0JGLseuEh6fMOsMpI8XwDV8Ycs7q+oAC9acbqwoLO
 JH1Dkku/dWpDPvKasN/djexjiGi0v8cTBIpt8wmjmwHWGP/AtSGzhlcj1q0BKJyQ40
 gzgRRnVK5uOU5O6yCFx3BQYGfTll1ejQoAHrNUOxNp/+WdTY4+DTJZr9WDEzia+gcI
 /Bwg11u+LthYg==
Message-ID: <faa8d9e8-f601-ebff-68f7-4e12862391de@kernel.org>
Date: Tue, 6 Sep 2022 23:09:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org
References: <20220815235052.86545-1-ebiggers@kernel.org>
 <20220815235052.86545-2-ebiggers@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220815235052.86545-2-ebiggers@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/16 7:50, Eric Biggers wrote: > From: Eric Biggers
 <ebiggers@google.com> > > As a step towards freeing the PG_error flag for
 other uses, change ext4 > and f2fs to stop using PG_error to track [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1oVaCf-0004Cz-9x
Subject: Re: [f2fs-dev] [PATCH v2 1/2] fscrypt: stop using PG_error to track
 error status
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/8/16 7:50, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> As a step towards freeing the PG_error flag for other uses, change ext4
> and f2fs to stop using PG_error to track decryption errors.  Instead, if
> a decryption error occurs, just mark the whole bio as failed.  The
> coarser granularity isn't really a problem since it isn't any worse than
> what the block layer provides, and errors from a multi-page readahead
> aren't reported to applications unless a single-page read fails too.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>   fs/crypto/bio.c         | 16 ++++++++++------
>   fs/ext4/readpage.c      |  8 +++++---
>   fs/f2fs/data.c          | 18 ++++++++++--------
>   include/linux/fscrypt.h |  5 +++--
>   4 files changed, 28 insertions(+), 19 deletions(-)

For f2fs part,

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
