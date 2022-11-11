Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E6362580E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Nov 2022 11:20:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otR9Y-0005WK-3v;
	Fri, 11 Nov 2022 10:20:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1otR96-0005Vn-Eh
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 10:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0gTY9KVhY5koHJUIdOKwq52LX+CaJmjCAz+4zXMgK8w=; b=i2RREa3QbSzJze0uyWyxpBnd8T
 PysfUoh7Xdts3/k1U/NjHTXg37nc430LVq+h64HMfPklkoysaPG1ktNDd6FpfoAXQS3Sr8iYJZqXR
 LGxNmlpJErV73OGumuhVGOGYuxUqTV2iuYkYN3lEIQ0FNhWfwrXof6WlINeOO8X/kUi8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0gTY9KVhY5koHJUIdOKwq52LX+CaJmjCAz+4zXMgK8w=; b=TP3ftYjqwGn6de2+P6WcFTLmYO
 OH5H69XP9X7hqQ6EA4xTdhKS/x3FT7kMlY/b90Yyk2fzCDVAiIC0UDjBtAzbMPgg3EmRm7lp6kugl
 if5J6N5VsdTnGv9dPuR9iYCEQT6Cfls/YYZT95I/aRdgZjyBbE4Y+R8jqh+eJ8OFFrDc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1otR94-004ESg-JH for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 10:20:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6951161F2F;
 Fri, 11 Nov 2022 10:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F24C433D7;
 Fri, 11 Nov 2022 10:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668162010;
 bh=H24VoR2zC1k3+kqFjlp5MPLEwbVf7+X5dDwcpSo7+EI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KsszgdB7pc2dR9r72LEkZt5Qv6cK7FFB6YI9/EJ6BnSRUQHrMOXVJq7HCbjCLyo15
 eIwo0LdwBJVDtEwvKWZ5Gwf4xhWhy8WGWEcLzWR+PX8j9ZsLu/ABGWmlgR7xlo3roE
 ZfSKx3/pS9VozjGmu9Wk7VmcTl8Cr9iHLr+EAsyQ7qChs1vDHUIh/PxeYP82EXO97u
 4aUKTyHJjqKXasL7cks28hpA0oByCGypBjGVqNsO2IlNQRbKKzXXHDRgYGgN7AHx8d
 hfJmfqdCsteN7JRieA1Oa/9ZOGvley+vn+/KC/0OFScuPK/qPVZ//jZ5mbWSf+WeQC
 dvgF9oAwr7YFA==
Message-ID: <a80962aa-412c-6dde-1329-0b2fb5648607@kernel.org>
Date: Fri, 11 Nov 2022 18:20:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20221111100830.953733-1-shengyong@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221111100830.953733-1-shengyong@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/11 18:08,
 Sheng Yong wrote: > If compress_extension
 is set, and a newly created file matches the > extension, the file could
 be marked as compression file. However, > if inline_data is also [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1otR94-004ESg-JH
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: fix to enable compress for
 newly created file if extension matches
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

On 2022/11/11 18:08, Sheng Yong wrote:
> If compress_extension is set, and a newly created file matches the
> extension, the file could be marked as compression file. However,
> if inline_data is also enabled, there is no chance to check its
> extension since f2fs_should_compress() always returns false.
> 
> This patch moves set_compress_inode(), which do extension check, in
> f2fs_should_compress() to check extensions before setting inline
> data flag.
> 
> Fixes: 7165841d578e ("f2fs: fix to check inline_data during compressed inode conversion")
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
