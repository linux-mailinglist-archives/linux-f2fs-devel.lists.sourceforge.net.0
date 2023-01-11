Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD69665D47
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jan 2023 15:06:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFbkc-0000lG-Ly;
	Wed, 11 Jan 2023 14:06:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pFbkY-0000l5-G3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 14:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LDGNQ16SX54uGE6EwOdoDmuyZNHxLe9XpWi+NpfeQys=; b=R6m8ob/4N2GfZ5W0uzp8DpPR8c
 awcqrlplCA7ffCvtcgjHttBXEfqFbMGJ1JgZW5TN8KeJN+eqXnnJTHoav19DBuWrFf3lvFYJsEgkj
 n6CFNmBIVyOVVxWhvQhgd9oInxUwXNDBRUczWd//ls/omgZlE0eK7c4Y4jt8O4ngqpfI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LDGNQ16SX54uGE6EwOdoDmuyZNHxLe9XpWi+NpfeQys=; b=T/gRMv+mbZ3d3VsFq79Av/7rQ7
 MlkHxwdAGie7FXkV59+OegpOtThmSnu9oI0G5uO7VPLRFuNPDjJpFXaiseX536/8ycoMT6ff5sLAJ
 22bkQEplTWs4NGpZHfhvmYAmB/o9FnWYUJM+PgyppQWNinw9jDv3dHycUNq3NdWzZ/X8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFbkS-0005bC-Pq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 14:06:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5A0B61D3A;
 Wed, 11 Jan 2023 14:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAB1C433D2;
 Wed, 11 Jan 2023 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673445988;
 bh=1/WxTmG8XkF0x5JjcCvVsXAgoeqkHdknYzulROmr7KM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oVSfpKENZBMsFEuN9u/YMqjxSkjFMju2PRaLPugkRDcbwEW781ZeO292HPHWvG672
 9vxymakNumXkBgu8BzfVzr2re2AjyxoeutgVje6XkxEvRtDM1ix6tuAmG6HwNcreCC
 Tjbmf2T5RsxBnNxIRkXRms/h3Yce0HPVGlFGVW3CXVJMFXbQRyEUwlQD1rmloLkFfv
 rbvryZERYe6346KCbHcXlsWzNTO4pW7KmxXw0q/1SerdHqysYnlW82N6dhwS2Qm9f8
 oad//AuWiBMeZOjFGld4OYqeQ9t/5IcFI8KTe9elgKhGtkks/5c4yzZSCb9k0+rlWL
 K2KU1YPhroXxw==
Message-ID: <7378f01b-3f02-a81c-7266-c743381131fb@kernel.org>
Date: Wed, 11 Jan 2023 22:06:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Yangtao Li <frank.li@vivo.com>
References: <20230104112158.15844-1-frank.li@vivo.com>
 <Y7XRc+UiLBF/m3KW@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y7XRc+UiLBF/m3KW@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/5 3:20, Jaegeuk Kim wrote: > Hi Yangtao, > > These
 are all in dev-test branch, which means you don't need to stack up more >
 patches on top of it. I just integrated most of them into two ori [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pFbkS-0005bC-Pq
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/1/5 3:20, Jaegeuk Kim wrote:
> Hi Yangtao,
> 
> These are all in dev-test branch, which means you don't need to stack up more
> patches on top of it. I just integrated most of them into two original patches.
> Could you please take a look at this?
> 
> c1706cc0cd72 f2fs: add iostat support for flush
> acd6f525e01c f2fs: support accounting iostat count and avg_bytes

+#define IOSTAT_INFO_SHOW(name, type)					\
+	seq_printf(seq, "%-23s %-16llu %-16llu %-16llu\n",	\
+			name":", sbi->iostat_bytes[type],			\
+			sbi->iostat_count[type],					\
+			iostat_get_avg_bytes(sbi, type))			\

'\' doesn't align in column, otherwise it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
