Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08500710248
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 May 2023 03:20:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1zeg-0006fe-Ss;
	Thu, 25 May 2023 01:20:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q1zec-0006fY-Pv
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 01:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MeQX9GQuQI/P0IqDnhiu31vwLsT2S8bb3wJu0jrEfqM=; b=h59chjEEJLltdPNuNBHIioU7qw
 38ttnHDHzBijVDnHKRQjFTSlO76HsUSzllJoIhpCrNhkAY011EnLgMAlIO7W1rRqEzSsW89lUdb22
 h3sITUlpDMa1IBIhhp9InOkIumPaa5vZbDd7NfQwRjRjDD2Xx4ZgwHEXWphVhWD6nkCM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MeQX9GQuQI/P0IqDnhiu31vwLsT2S8bb3wJu0jrEfqM=; b=K5jbtZDxaBj/Ey74g8vKnZJtOs
 A38mk3yp/fLNiMLLMfX4mZMSX/ByHBDDM4KskZv3exoJX4GIu9ucejYjs/lHQKmSQP3H8NZY7iSfI
 fIlXuNDrYpW5SEayx5QAsYLs39Qr54dX5pChIA+8tKvMjkfT0aCreJ9SxSScE0omETEs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1zec-001oOQ-JX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 01:20:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 019D5641B2;
 Thu, 25 May 2023 01:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEFCC433EF;
 Thu, 25 May 2023 01:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684977625;
 bh=a+sFiytLmWFLgtD3pXWApwYX6qLc2CEd0ajOsXXioqA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j3zVaJqyzpaKy7t8PPtnTOkfVXEuRR6axKjNtnG0nenSvIoNSCshn+Q/apuv+rHck
 xWcRUAr5NTELSYPDZWib2+qlrWaH83HUHnLegjju1frA/kP+hRKIvOaTZ7+DRT/aph
 p7zEphT7DYCROIaFcpaKPEH2SyDJSBrOKZDnrIBRoog/8rjMBolZhFmmQRw6BnsItf
 4Y6mUmqtwrUHHPX2nRyvMlBpmAlvVwLJ/GRfQOxKP9Zs9N5ddVxA7g3JWMd6x8/SdF
 E6aDyVNBPqgtJ1PKqFRj341WMT25eqF6kwsNKNnE7NziuvOppJxbx4sf/k4wPxdpAl
 EZG70beI8mBbw==
Message-ID: <e6a36b71-045e-4e95-f539-fd88b289e703@kernel.org>
Date: Thu, 25 May 2023 09:20:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Daejun Park <daejun7.park@samsung.com>
References: <CGME20230508081042epcms2p8a637deae7de1829f54614e09d5fde5e5@epcms2p8>
 <20230508081042epcms2p8a637deae7de1829f54614e09d5fde5e5@epcms2p8>
 <ZFqWr3sSYMsHtHAC@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZFqWr3sSYMsHtHAC@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/10 2:53, Jaegeuk Kim wrote: > On 05/08, Daejun Park
 wrote: >> v5 -> v6 >> Added trace_f2fs_iostat support for zone reset command.
 >> >> v4 -> v5 >> Added f2fs iostat for zone reset command. [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q1zec-001oOQ-JX
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: add async reset zone command support
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 Seokhwan Kim <sukka.kim@samsung.com>, beomsu kim <beomsu7.kim@samsung.com>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/10 2:53, Jaegeuk Kim wrote:
> On 05/08, Daejun Park wrote:
>> v5 -> v6
>> Added trace_f2fs_iostat support for zone reset command.
>>
>> v4 -> v5
>> Added f2fs iostat for zone reset command.
>>
>> v3 -> v4
>> Fixed build error caused by unused function.
>>
>> v2 -> v3
>> Modified arguments to be correct for ftrace parameter.
>> Changed __submit_zone_reset_cmd to void return.
>> Refactored the f2fs_wait_discard_bio function.
>> Fixed code that was previously incorrectly merged.
>>
>> v1 -> v2
>> Changed to apply the optional async reset write pointer by default.
> 
> Don't add the history in the patch description.
> 
>>
>> This patch enables submit reset zone command asynchornously. It helps
>> decrease average latency of write IOs in high utilization scenario by
>> faster checkpointing.
>>
>> Signed-off-by: Daejun Park <daejun7.park@samsung.com>

Except the change log, it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
