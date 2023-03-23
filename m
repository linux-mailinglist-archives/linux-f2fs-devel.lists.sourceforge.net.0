Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 267126C6C2F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 16:22:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfMlR-0001VT-9Y;
	Thu, 23 Mar 2023 15:22:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pfMlQ-0001VJ-0x
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 15:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fuIcRxzDmaaYO2FRaBGKyaInwgScCO9AA1I7g8/5oeU=; b=hjp+qFZD+NLYtANczOdhflYLBb
 NdJvwVGInz/swlZFWc3pYSs26HlNLsfcteURjL8xyeJqrAF0VJfvo7WLpWoRlWRGMpD9Us5y8E1O/
 Y3kl4aamo/7eCNORDTzqVppI/E2m2qSrQeRWclw28TTjsNWDRgRio1SLoNE6PBoCnQ3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fuIcRxzDmaaYO2FRaBGKyaInwgScCO9AA1I7g8/5oeU=; b=kMDzC5jBt/Q3FVPqHyfyKEJ2+q
 YkP1HUVLIIHNQzcgV4/4X4KUWm4bkhJ2QlPPtnJFErMnRZPRIW3cN4rz8UJpnxOt0Py4VkvfdVUaX
 Yeaq9po1VCX938eojvXqWbcuMuK+EE2ruyE/wriK/XnV/QS1Efnc9X0jJKFBhTFCuXv8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfMlP-0007WF-KY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 15:22:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4152E627A9;
 Thu, 23 Mar 2023 15:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68B4C433D2;
 Thu, 23 Mar 2023 15:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679584917;
 bh=YvVGKCdwQu+XxQ/xz4BpccBC+1S6ABeihvmlP/NHXcs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GhvzEMrE7FW3uFrKxxKzEi4uVsoIOIoH9LGEbPtLI2AbBfHfRkqobbr0pJbfgyYkC
 4p8KHqzmxllt2n0gQK5O4FeV0Hl/lkeSWhKjrGiOpHk3h4FHKqu4GL5j8V2xpnM7t8
 75opAcCa4zzDhzfQIg4LEd6foW6UvDJoX5hTd+Ky87OJOY+GcLUhEmtH5dgluT0b3R
 vzrpu5y3wWqdM2CqBL+6lMm9lWNc5ctqA6srqIotSMF0nEpeiKRgihjHopaxJOb+xo
 BqhCV6Sk1Jwpza9w69ZFMTprqr8uj7fIQz4KSgnusH91/7/VjD8T0VFvl5GoCfz6/s
 B/+8VJFddjnxA==
Message-ID: <679df776-6ad0-df80-d00f-30467009ebbe@kernel.org>
Date: Thu, 23 Mar 2023 23:21:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230308140623.35942-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230308140623.35942-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/3/8 22:06, Yangtao Li wrote: > BIW reduce the s_flag
 array size and make s_flag constant. > > Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfMlP-0007WF-KY
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: convert to MAX_SBI_FLAG instead of
 32 in stat_show()
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

On 2023/3/8 22:06, Yangtao Li wrote:
> BIW reduce the s_flag array size and make s_flag constant.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
