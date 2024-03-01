Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EBF86D894
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Mar 2024 02:16:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfrV9-0002YJ-QQ;
	Fri, 01 Mar 2024 01:15:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rfrV8-0002YB-Lt
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 01:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Os2ZvJodebo3c52WwXjV1O0ecLUEXayLgMCnTR13i/0=; b=Tam40JZUunSfvk2ksz2XZJajrB
 FEXvvLJBZzRPqWFMm9PLmp7l28C2z6f06UGqnnpB0gH0KIx8O22aCPNB5xxrUdfg83N7shngnWsBn
 TAPn87gO4lwfK62YDjKXd28XeK5oDNj6Jd5a9aHKvAnOCs/989rWxnFoBVoXGukH6CPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Os2ZvJodebo3c52WwXjV1O0ecLUEXayLgMCnTR13i/0=; b=lZQ0lQGNgPQIBBgEOGoX8EaQIC
 3j6rAw+mCGGnXueTemB9GJSiIHeEqewtivJhmOdA4lYPOixO4Ahad1X+uj+F8lavWiI1dvgbKsq+S
 zMIIDTq9Of5cZUorHq8A1dmkexs964SnQuWwxp1+rlF0jtsmD5IGUO82eHUGFmkLJW8Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rfrV4-0002Pj-QC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 01:15:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D5EE61197;
 Fri,  1 Mar 2024 01:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C109C433F1;
 Fri,  1 Mar 2024 01:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709255736;
 bh=C93BUuyWefWIHd961kpiGpVzFvnTiGjz9VvWBdFszQk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MaRpmYTFVIE6Vs0hf2Kj+mp1qbjMPivsvKxvSqSUTptitSMJcCbTI0czh+6c1bGTV
 1RZ4kQdDOOPIEpsjZsC7O9clv1XikchBQofj3NCc1ikXqh7AiUNAsTEhXhhRqmSS9X
 06waoeyn/L3jJoL5NCYmUgI8X3LgDmN5gU2qfMxlHZOmuhIFR0lDCeYGNZeh6NfGVq
 LSe6QE+hODlXtat+nocTvJKar3VXA9k/5IooxyZ3b4y6aFy248xvi64U1hGL+FE+eW
 zPsCxCGaujHoGoMxesj+rZp3N0X4yVZk7aoYuiHCu/UQx3hzc1t+mZJbtD9s9Hbcxi
 P69kJkQHj6VcQ==
Message-ID: <356f3dfc-1dff-45d1-862c-4784af763b14@kernel.org>
Date: Fri, 1 Mar 2024 09:15:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1709121594-22314-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1709121594-22314-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/28 19:59, Zhiguo Niu wrote: > If GET_SEGNO return
 NULL_SEGNO for some unecpected case, > update_sit_entry will access invalid
 memory address, > cause system crash. It is better to do sanity [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
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
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rfrV4-0002Pj-QC
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check in
 update_sit_entry
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/28 19:59, Zhiguo Niu wrote:
> If GET_SEGNO return NULL_SEGNO for some unecpected case,
> update_sit_entry will access invalid memory address,
> cause system crash. It is better to do sanity check about
> GET_SEGNO just like update_segment_mtime & locate_dirty_segment.
> 
> Also remove some redundant judgment code.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
