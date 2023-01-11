Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AABA666364
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jan 2023 20:17:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFgbI-0002Zc-St;
	Wed, 11 Jan 2023 19:17:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pFgbI-0002ZW-32
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 19:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r71nc4cOkD3E1SuBRi0K/GfeHn0iHXbyDHStAL21L+A=; b=IokZcTrV1cyMxZ7FfJsqQDzz3q
 lGRyM5FTWTFb5m2zc7Q4J5bBHXjrzILzKkVwe9qNOLxBn65XILM/jqdLy5BRvKqeUb/qIgJo1JaO0
 6RDE/hx/jlkvuZHto3PmB5LJxdRGBUUjGp1Vidd64S4MIsKYH8fDK+oZGMFZuwRanmks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r71nc4cOkD3E1SuBRi0K/GfeHn0iHXbyDHStAL21L+A=; b=BLltFDJfUIvqR/uuz9RJbnJfhG
 ctDgGtAsaBxk+mRwzIiCm46jDWzGx6jIq1orvjq9YoH29Iifjc1f+8F/gnOPCz3TarjP72H9d5sVX
 AOPaO5BTawE3xQ49hmAagea0gkcjzl7cHHTX5wioWNVMzdAu3yQNjRFlQD2sYyRl7kGY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFgbG-0001Cz-Db for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 19:17:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 30A71CE1BB1;
 Wed, 11 Jan 2023 19:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC93C433D2;
 Wed, 11 Jan 2023 19:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673464632;
 bh=sRbHWzESzzQyqWDjoUMBpL3B16QI+DxrTxxVS41/8zQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jnkstjhlof3uqxsUvMvQBHcGW0Joc5n8nRCU94fH+bOz2sEQNrZdLTcuRMQNWErCe
 2jHY/o6bwftD6irMTeZnOTBUxo52JyTxqx5EqKkGtYgpuvgzZwqjmFYqNkwucb51ZB
 cPw139UJS0UjvEIMp03OFaor2vGrSjv4CjYNFJyhwRRD/s0JnnTOx3Ljp5h4fTJlxp
 G3MyK/pee9aEzbQgHCpj9hvEQMFXgUx0F+V2HOt/nFpP+XRDvRSQA/WMlKQQ7WFDXT
 ggaLzvmDZUuZ1zmvJnltWKxUsknBngyDhSEmaMeTDuovCiAVWa9DQJkwLWgsIV5tk8
 kpyofALbBt0Nw==
Date: Wed, 11 Jan 2023 11:17:10 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y78LNobSXGF5N3tn@google.com>
References: <20230104112158.15844-1-frank.li@vivo.com>
 <Y7XRc+UiLBF/m3KW@google.com>
 <7378f01b-3f02-a81c-7266-c743381131fb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7378f01b-3f02-a81c-7266-c743381131fb@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/11, Chao Yu wrote: > On 2023/1/5 3:20,
 Jaegeuk Kim wrote:
 > > Hi Yangtao, > > > > These are all in dev-test branch, which means you
 don't need to stack up more > > patches on top of it. I just i [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pFgbG-0001Cz-Db
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: reset iostat_count in
 f2fs_reset_iostat()
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/11, Chao Yu wrote:
> On 2023/1/5 3:20, Jaegeuk Kim wrote:
> > Hi Yangtao,
> > 
> > These are all in dev-test branch, which means you don't need to stack up more
> > patches on top of it. I just integrated most of them into two original patches.
> > Could you please take a look at this?
> > 
> > c1706cc0cd72 f2fs: add iostat support for flush
> > acd6f525e01c f2fs: support accounting iostat count and avg_bytes
> 
> +#define IOSTAT_INFO_SHOW(name, type)					\
> +	seq_printf(seq, "%-23s %-16llu %-16llu %-16llu\n",	\
> +			name":", sbi->iostat_bytes[type],			\
> +			sbi->iostat_count[type],					\
> +			iostat_get_avg_bytes(sbi, type))			\
> 
> '\' doesn't align in column, otherwise it looks good to me.

Applied with the fix.

> 
> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
