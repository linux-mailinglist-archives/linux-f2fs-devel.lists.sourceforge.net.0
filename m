Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EB1651B88
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Dec 2022 08:25:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7Wzs-0004F7-GF;
	Tue, 20 Dec 2022 07:25:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p7Wzr-0004Ex-0k
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Dec 2022 07:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+5cdzz3t3JYDB3i5mAjk6l7Kr7UjT/DaSMh8g1cE4ho=; b=aZThlJzDYnnA6uro61nPHonxxE
 uAwlap7a0L31Udt3lI10zECQH/puwmyODyQbrsHxc+CThm6DwGXU8RuBGY16kb2qTOUgOwz5mZCU2
 Hc24dMGDE9HwBd9F0nc6CnWcuXdhqXiTtuOHC2oYg0Z+yxq7o+ENfsp9H94SF+9oreT4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+5cdzz3t3JYDB3i5mAjk6l7Kr7UjT/DaSMh8g1cE4ho=; b=cURFc2ozKdp+lX2lA9h2EpXvPc
 GBbhK+rYWuOZN+rRupYJyP3ztjJgt/T44mwJuMXU1cw6/qxemN5zCmjVtcEygjl36ZYb2lOgBBEsb
 9XJtUcfK7OqZ1uHrDwoqGQVp/u4t+4K9ZKd78H87kac5VOm8YaMmONkQ/EAoKXJFt+ME=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7Wzk-0007TD-I4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Dec 2022 07:25:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EAB37B80B4A;
 Tue, 20 Dec 2022 07:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85303C433D2;
 Tue, 20 Dec 2022 07:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671521091;
 bh=fic7UtMekVGEyz7xE6CP02+SrSkeyzgkK1qckUpJxvo=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=BgCC8unpIs6R9kXkB5SLbQ0dhtZZTWyvqbAMbGoTcTfehE9vDNoJUdFpaW4zq31DR
 +UZcfx5gdsxhRR5a40U2Wrlpt29QpnyGwVD/YgVLfAOLHV6Pr/eBjvUWcSd/5VYuN8
 xCCDVsMKwVkiihX9ZHZ9lXJIRd78Ng0+wUcHnpvtEeZXjGASC5e2vxl2ADfAbOXjHY
 wB7g0XiqfjM7Y5IsuwiZMPJHANDPtNtY7P79f4s1q123xaYECW8+StaIEQ/48JsdQK
 LsVqm5Xa/XfqgzZAq4lhVvEhqGM4PVMM9cUu08D3zszOviLDAVGfrmNrlBNUPgbsB3
 WwXbTxYq0ga2Q==
Message-ID: <4414ea75-7fd9-258c-789a-3026c1117630@kernel.org>
Date: Tue, 20 Dec 2022 15:24:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221219132517.17576-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221219132517.17576-1-frank.li@vivo.com>
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/19 21:25, Yangtao Li wrote: > There is no need
 to additionally use f2fs_show_injection_info() > to output information.
 Concatenate
 time_to_inject() and > __time_to_inject() via a macro. In [...] 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p7Wzk-0007TD-I4
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: merge f2fs_show_injection_info()
 into time_to_inject()
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

On 2022/12/19 21:25, Yangtao Li wrote:
> There is no need to additionally use f2fs_show_injection_info()
> to output information. Concatenate time_to_inject() and
> __time_to_inject() via a macro. In the new __time_to_inject()
> function, pass in the caller function name. And in order to avoid
> this inline function is not expanded causing __builtin_return_address(0)
> return address of of time_to_inject(), mark time_to_inject() as
> __always_inline.

IMO, we'd better have a good reason (maybe performace related) to change
inline to __always_inline, rather than avoiding printed message change
due to compile option.

> -static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
> +#define time_to_inject(sbi, type) __time_to_inject(sbi, type, __func__)
> +static __always_inline bool __time_to_inject(struct f2fs_sb_info *sbi, int type,
> +								    const char *func_name)

How about:

#define time_to_inject(sbi, type) __time_to_inject(sbi, type, __func__,	\
					__builtin_return_address(0))
static inline bool __time_to_inject(struct f2fs_sb_info *sbi, int type,
				const char *func, const char *parent_func)

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
