Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A88F60ED9A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Oct 2022 03:50:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ons2K-0002Vy-MU;
	Thu, 27 Oct 2022 01:50:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ons2J-0002Vs-2m
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 01:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h3bhnCbskjMe518eKFtl8vYkrEULU5jRdk+pLWmDUKo=; b=PhWD7yY9ub1QRXM1Flpfe/2g6p
 BtjuCHVvXe2a+fpXDNHhDaOj3xRdN22GRTpG/epuJaWjnJ74nbfACcqTOOVxiwyxnT8HhkeL+PNgL
 Nv+oNSqbAA9L/PDJkCoZVVmM780O5LIgSqI7WyTJYUXBOmJAfy+gDXpzV2UlrRoa2LoA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h3bhnCbskjMe518eKFtl8vYkrEULU5jRdk+pLWmDUKo=; b=i/CfkMHQzMw0esMFFElp2pRyRM
 2XbY6mJxgSSXQuxGvAtxkKdZfdhzNIqZ1rwUi45zzl9W9A1i/czADj1SXaLP+DwROOIwtWDlhiCPw
 ksH0wLbPnjfrKVjQrvad6e4iujm9BrnAjtEnvZB1BPUcgBaTxKldXTyjTMueXgnhdIKw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ons2I-001L7V-E7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 01:50:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0FC1D62056
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Oct 2022 01:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D0BC433C1;
 Thu, 27 Oct 2022 01:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666835416;
 bh=9r3lqgGPcDjT+4jQOcIBTl7K7GeVbKmf/TyASW9/37I=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=t80l3foRX6O/9IFgANuhULcwZVbvs/f5valfitFAM3dm6SU+8tWE2SbVjz18Gh/Ew
 YoC7IzR7iVch+yqtd4SFEmJHWskh6Kh2IXt+6lFjKL7oltzYQgpP5cLTa5bloPS6vP
 NA+djexdVlxoKfxErDpw/g4y0cAgAsbDsZzbAQVq0IvieTiU9YFLzEc7cr0sZnqzOa
 PadnLWxK+cXuX9ZHhlBMzQ3DN6YbE63lj3eLPN/oG6uKDUUTI1tEQortF8kVVCFCml
 JMhLm//eLNkprYyFOVeLOOMK+07NvvTiFaBDKClntkmi5SoS4wgm+NKcTcf5TFnK5O
 KhRl2KeKpXckA==
Message-ID: <afa670ca-2b20-85be-163f-188af0b5ad08@kernel.org>
Date: Thu, 27 Oct 2022 09:50:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20221024233634.803695-1-jaegeuk@kernel.org>
 <Y1lpAJiPCMSXf1d5@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y1lpAJiPCMSXf1d5@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/27 1:06, Jaegeuk Kim wrote: > The below commit
 disallows to set compression on empty created file which > has a inline_data.
 Let's fix it. > > Fixes: 7165841d578e ("f2fs: fix to check inlin [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ons2I-001L7V-E7
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: allow to set compression for
 inlined file
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/27 1:06, Jaegeuk Kim wrote:
> The below commit disallows to set compression on empty created file which
> has a inline_data. Let's fix it.
> 
> Fixes: 7165841d578e ("f2fs: fix to check inline_data during compressed inode conversion")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
