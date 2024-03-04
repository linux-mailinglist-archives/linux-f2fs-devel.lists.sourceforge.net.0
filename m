Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1861F86F82B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Mar 2024 02:26:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rgx5Q-0003Z4-7t;
	Mon, 04 Mar 2024 01:25:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rgx5O-0003Yv-W0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 01:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rHYCZBqAmBX0CoFcujP2wCeuu/jRNClBVT5hnT6MToo=; b=HTyTzdxwrENtAeokrp9IMVG+p/
 liqozNAyBl3dGEyEFLhulsM0NcQjXNivOsroPaLN2JjeLNc0kVYDjwvsAlWqcsxFiUibzPJ6g2Erj
 NQ+jT+2UQ7iLhnAjKdeSWJCgTD6QbaMqS2hJdg9YUQ51AZpyY/NAA9zYsv0NsZYN6OKs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rHYCZBqAmBX0CoFcujP2wCeuu/jRNClBVT5hnT6MToo=; b=KJ1ECw4L1WqjE9Nq+Mgt4Xv0op
 zK4bAaTq/W6UGGbJDzUiK79FYdLyp6YDINhjyuGQk+NeCW/4hiAv6lUtt47MYVsyixUuB2ek5IruV
 tyNE9vRjitsx0uDOw0o2RYia9eHCAiiUQ/tjzUKUS/8b1uVBWUwGEHfrMRWTXVtAENDc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rgx5E-0001tI-7z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 01:25:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8DF8CCE0D92;
 Mon,  4 Mar 2024 01:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08882C433C7;
 Mon,  4 Mar 2024 01:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709515528;
 bh=pbEla8fsO5S9tFM5YQ5Jg2RZxp5KAhMIEyBCKb7QDe4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BcgTMRwFyru1beE1rEGlZwJaFGcYHbNTONO6IkTTlZAClcIMhuLylkUcRgIbu7l5b
 50JNRkZfAghoksI7SsizTo6a8UWwjjcOrGZS76DioS7PNC9LnaIgirwYkEvM+oy6sJ
 ZALp3Wnvz0wXZxuxqPFXi0TFx1X35rPjYfLFVh1QW7IqcZcghrfvWBIdOanGQ23oin
 o4nLGBOtUQQF1ITzEWUM5kuK/t32nzF3KEb5ONzFU5KlX25T0WJD/A3uY/R2upVi6i
 +omJnCXHPPbExL3tEVvgCFOAxIzc4fxrNzY27Rzpd1j4pXanuS7AuHYA/+LCorUokG
 pi6yx322q93Nw==
Message-ID: <70320312-de6e-48a1-8074-c4e16e65555e@kernel.org>
Date: Mon, 4 Mar 2024 09:25:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1709281555-11373-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1709281555-11373-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/1 16:25, Zhiguo Niu wrote: > __allocate_new_segment
 may return error when get_new_segment > fails, so its caller should check
 its return value. > > Signed-off-by: Zhiguo Niu <zhiguo.niu@unis [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rgx5E-0001tI-7z
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix to check return value
 __allocate_new_segment
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

On 2024/3/1 16:25, Zhiguo Niu wrote:
> __allocate_new_segment may return error when get_new_segment
> fails, so its caller should check its return value.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
