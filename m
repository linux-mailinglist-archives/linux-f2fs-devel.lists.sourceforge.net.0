Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 899CA85B389
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 08:04:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcKAi-0007wB-Im;
	Tue, 20 Feb 2024 07:04:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcKAh-0007w0-Hg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 07:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cFhPsDX625BRcdXvHwFeb3Y3Xw1TqLwd7BvhzCO1F7A=; b=eJqV/7V6a+SgEad2Y52ABx4F59
 zHttlh12FJLCsJ0BU+un0DfIzsUclkgMdOZ/4cJwJKcHUAEpFuiYkY1I3DUOhg6Azjs8uGT+PMOLq
 VU3a38/0EOaNNvxpR5EhcqsQoQ/jUEKlIyWzkiTXZcC05zSdWtPRWW4RchTDK8AvY6mQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cFhPsDX625BRcdXvHwFeb3Y3Xw1TqLwd7BvhzCO1F7A=; b=L79nrF3d4i28yYKjVI098/Xc1Y
 A2YmnW8W5cRevJeiQ2ZO13Wrgc1/Uh2ayl+FFJC5pC3jKQmO68uG2Pt6TyeFLYLzpKCkISzUxQsB3
 STW0h8lVVaFiUDlxUU/K6SaJo41m2VgGUDo7yLKvNrcIFbRS6qHm59x/AuhpbtFXEjaI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcKAf-0007Kq-RC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 07:04:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 60DB6CE17E1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Feb 2024 07:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B983CC433F1;
 Tue, 20 Feb 2024 07:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708412634;
 bh=mK3/+1CIk9h4sPEMSZq6eWNT6lI3qCL1uD9W0cWW7Oc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=UB7e3AwCRHXypLAaksxeFrbJrHFTEnUJvXDHvr3qNapyvRA6Fb6LnuZAX3OA1ZgHt
 9v9sx2HasFkqJz+/UIcmKNN+ghY1yn2t+GuBxyUm/jzmY89LHowieqkUdtNhlVbotH
 zXzsZJvZJNbGOvFeN6VUkJIaV9YkJ+PoHozJCDA59/HG7e8JeQuKly17SA/Xq/4/Xb
 vrCwLgqx9NeyBbiLfvr1ZFenisI1QmAWAqX/zs4hUEOlOijS/2gYMOdbevy8NtQpnG
 7w4uwj+MfTBX3+lmq5Oa3T9ZWt8Sjn8RBX9eazegAunpeSE1UmCIMYCOqt4sHxZAf7
 3hAWIxIUHkwyA==
Message-ID: <4965a052-5918-4b5a-ac00-b5e33c0d9c7b@kernel.org>
Date: Tue, 20 Feb 2024 15:03:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240207005105.3744811-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240207005105.3744811-1-jaegeuk@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/7 8:51, Jaegeuk Kim wrote: > Let's deprecate an
 unused io_bits feature to save CPU cycles and memory. > > Signed-off-by:
 Jaegeuk
 Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcKAf-0007Kq-RC
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: deprecate io_bits
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

On 2024/2/7 8:51, Jaegeuk Kim wrote:
> Let's deprecate an unused io_bits feature to save CPU cycles and memory.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
