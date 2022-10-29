Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 796BF611F78
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Oct 2022 04:55:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooc0T-0000Nq-HI;
	Sat, 29 Oct 2022 02:55:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ooc0J-0000Ne-PY
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 02:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oeVD5oPHqWoiUtjD2AtOqAk1TASSmZBVZTaDlKdryaw=; b=gfJYzJ5/jYvolOUy4oAQH6I2Wv
 v5bcjvZclgGbGA4wKuzmQCBIlbwMPV5qugsDnAw/0IUgjFxwh8UAA+bikscSK76SLGFdnttVZcLGH
 /3pUJnmQtNvQLTVACBG/xiWKbBa8Ah6PFCilYR+rY0Ukpk+YE+mPYgKQD9enPCGoYo7A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oeVD5oPHqWoiUtjD2AtOqAk1TASSmZBVZTaDlKdryaw=; b=SUqTbWZ68t1KXOR0zFOalMCrRT
 Mir/XSOfH3/syCM2sEUDjpAO3xPpPkSYULIaPG6k+x/q/PMSW7PHhsniGLfXzRP5GAptZosqa0Fjy
 e2xh57HlOyo+IpKSou2j2Nm210VInqfmqQ0b4bPSRxlmny3z18eGYI1lRtC2iPaGzOTc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooc0F-0045pg-Iu for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 02:55:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32FC062B5A;
 Sat, 29 Oct 2022 02:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE97CC433C1;
 Sat, 29 Oct 2022 02:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667012114;
 bh=4p6l9uU/+Q4/g298HdI5bm5iguuaGyzOH1SBYsIlANQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LLAM5JooYqDcii3mtr/+UTqz1yiDZ5B2cHI1w/i4iqkkMRFbe0AJnHQ0AXF0oH1TS
 2omUhxKhMChiSAqr9jXLwogD7RCNiQST0GMIaOp0UXyVjjsvisFHEHs0qZJ8dlvFhm
 6yyB7C8kHpr3STNT6wI59d0kSHor8UOjtIgulwjwdpdYk1QVEPkJhusnxGCQgYC59g
 zdK6hqY09mgHMG/dDk26AIS0aSpRFOqyj8sGk2Z+6qiZQhvPrFPm0trekZkYnzeusV
 vzByR81eeH7B+HVgLC8+nUZYVXoNG/88+BcqCKTGwwcYId2caUYxY6LaaInMrZnjgC
 WDuI97LQ1pWyA==
Message-ID: <56fbc5fb-4c82-005c-5cc9-84dfaeddf106@kernel.org>
Date: Sat, 29 Oct 2022 10:55:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Mukesh Ojha <quic_mojha@quicinc.com>, jaegeuk@kernel.org,
 mhiramat@kernel.org
References: <1666861961-12924-1-git-send-email-quic_mojha@quicinc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1666861961-12924-1-git-send-email-quic_mojha@quicinc.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/27 17:12, Mukesh Ojha wrote: > commit 18ae8d12991b
 ("f2fs: show more DIO information in tracepoint") > introduces iocb field
 in 'f2fs_direct_IO_enter' trace event > And it only assigns the [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooc0F-0045pg-Iu
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: fix the assign logic of iocb
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
Cc: quic_pkondeti@quicinc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/27 17:12, Mukesh Ojha wrote:
> commit 18ae8d12991b ("f2fs: show more DIO information in tracepoint")
> introduces iocb field in 'f2fs_direct_IO_enter' trace event
> And it only assigns the pointer and later it accesses its field
> in trace print log.
> 
> Unable to handle kernel paging request at virtual address ffffffc04cef3d30
> Mem abort info:
> ESR = 0x96000007
> EC = 0x25: DABT (current EL), IL = 32 bits
> 
>   pc : trace_raw_output_f2fs_direct_IO_enter+0x54/0xa4
>   lr : trace_raw_output_f2fs_direct_IO_enter+0x2c/0xa4
>   sp : ffffffc0443cbbd0
>   x29: ffffffc0443cbbf0 x28: ffffff8935b120d0 x27: ffffff8935b12108
>   x26: ffffff8935b120f0 x25: ffffff8935b12100 x24: ffffff8935b110c0
>   x23: ffffff8935b10000 x22: ffffff88859a936c x21: ffffff88859a936c
>   x20: ffffff8935b110c0 x19: ffffff8935b10000 x18: ffffffc03b195060
>   x17: ffffff8935b11e76 x16: 00000000000000cc x15: ffffffef855c4f2c
>   x14: 0000000000000001 x13: 000000000000004e x12: ffff0000ffffff00
>   x11: ffffffef86c350d0 x10: 00000000000010c0 x9 : 000000000fe0002c
>   x8 : ffffffc04cef3d28 x7 : 7f7f7f7f7f7f7f7f x6 : 0000000002000000
>   x5 : ffffff8935b11e9a x4 : 0000000000006250 x3 : ffff0a00ffffff04
>   x2 : 0000000000000002 x1 : ffffffef86a0a31f x0 : ffffff8935b10000
>   Call trace:
>    trace_raw_output_f2fs_direct_IO_enter+0x54/0xa4
>    print_trace_fmt+0x9c/0x138
>    print_trace_line+0x154/0x254
>    tracing_read_pipe+0x21c/0x380
>    vfs_read+0x108/0x3ac
>    ksys_read+0x7c/0xec
>    __arm64_sys_read+0x20/0x30
>    invoke_syscall+0x60/0x150
>    el0_svc_common.llvm.1237943816091755067+0xb8/0xf8
>    do_el0_svc+0x28/0xa0
> 
> Fix it by copying the required variables for printing and while at
> it fix the similar issue at some other places in the same file.
> 
> Fixes: 18ae8d12991b ("f2fs: show more DIO information in tracepoint")
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
