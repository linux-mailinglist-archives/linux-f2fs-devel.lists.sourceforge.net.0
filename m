Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE8DC8399F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 08:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uhir/eDfkP388mxXgxJVl+GaKjd/a0xzoZcA1QLm7jo=; b=bHsGCUwn4yN14Py9jEV3HXAeVc
	h8vfyele+TjCHD/XkB0QQHWXP+YaNzo9wbmONcxzvSlVl5Sun3oKYkRRBnIuYNkThLFLWfWC6Omid
	h7IK5FagousHoJWxQFFHR909gxmBChVbDbPCeAVAcpyzg15sPXmAXXizNsyNoopeMVxg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNn39-0007u3-Pz;
	Tue, 25 Nov 2025 07:01:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vNn38-0007tu-CU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 07:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7MN62d6JAU+d6QWOVJTP1/OAloCgtT1IHq0/oqriZtQ=; b=BC103GzmsqyPqUQpaQlwkRUGM3
 3u5XiEej1HIs4RW+K18earlUy6B4sAlFPLQXBTHtfHYf5q/QesBCg3geNrL+IIHAwYEI0USKQdvPe
 VQq7EVwwUNZozzPli6VFTBa2YaYfrwtfInzNzUhVgfzJb8t/6ivBULS8L1lp54uvFj0g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7MN62d6JAU+d6QWOVJTP1/OAloCgtT1IHq0/oqriZtQ=; b=PheiRakXdcJIRuAc99JvgW/Vkk
 epPyc//1e0pnDYboPzFjyCfO/Bnn9NkOSzxO4xW/28gRuWHB2INyB2SPi5soZZrwsv/URqjVy19PU
 DrvqZMOh+PcID3VRKfJxQO8N5nFcxkqn0PY2fdgrl7VDdxHi3n0XGi2uYDiovSBykyTI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNn37-0001LA-Qm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 07:01:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7298D43F4A;
 Tue, 25 Nov 2025 07:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA507C4CEF1;
 Tue, 25 Nov 2025 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764054067;
 bh=Py/yKFzljt2DhPmtMoBY17kjqUq5NBpk0xnkHKfEN+g=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=avgYWEHT2FZCUmDQIdW/j2WsJRxoVa8ESwGkmpbfo37RAl+rlhjtG38+apy5Z8IQ+
 ynPNfLOHt042F+WRnpVzF50Z6zTarRKFfQADQc4RUNAFjooztt2Ngnr55DUnoQx8lj
 RqnHH3EY4uFLBY9QmnwsDwb2fuaRnmMI6gThYSQPZxAH/ARJ/FwRHD4oyJsOacDCKl
 jw8LWtR5QpyUX6QjF8UyTIfLrdl8wfWjHd9WPb8jcKmN8pGhh7wjczm5YFiLFXtWaZ
 WxkyiNJJQRMWamqnb8MXGex2B/NIJEiY7zp9RfEOmMZIBTdXmypxKxMIijlIk+Z+Fo
 hYtG1WnQiAcLQ==
Message-ID: <ae1fc3c4-578f-48b1-8ff3-063e03fa4de2@kernel.org>
Date: Tue, 25 Nov 2025 15:01:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yangyang Zang <zangyangyang66@gmail.com>, jaegeuk@kernel.org
References: <20251125062638.3189156-1-zangyangyang1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20251125062638.3189156-1-zangyangyang1@xiaomi.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/25/2025 2:26 PM,
 Yangyang Zang wrote: > Commit 42482e81248f
 ("resize.f2fs: add caution message for resize") > introduced the `-F' option
 to force resizing f2fs without displaying > the caution m [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vNn37-0001LA-Qm
Subject: Re: [f2fs-dev] [PATCH v3] resize.f2fs: add -g to give default
 options
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/25/2025 2:26 PM, Yangyang Zang wrote:
> Commit 42482e81248f ("resize.f2fs: add caution message for resize")
> introduced the `-F' option to force resizing f2fs without displaying
> the caution message. And `add_default_options()` implies that `-g'
> enables `-F' for resize by default. However resize.f2fs does not
> currently support the `-g' option. This patch adds `-g' for it.
> 
> Fixes: 42482e81248f ("resize.f2fs: add caution message for resize")
> Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
