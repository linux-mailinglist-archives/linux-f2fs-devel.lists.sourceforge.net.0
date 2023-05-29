Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2C37147DE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 May 2023 12:25:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3a4N-0004du-4g;
	Mon, 29 May 2023 10:25:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q3a4F-0004dn-1z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 10:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nKO1AmfkJgXzA7HHgGEQg4IKtEzM+c/6Utx+qrCfOsM=; b=Mio4HLDPDN48/5TngBPFO0AmyL
 GF1sEfhmSO/4VxdACj5fGZmhZDThv9CASANrWw4gw73Km9Zpz5JvpFHD9BvqGM4m4FzqtQK8uzGaa
 a0gtvWBCIHzmyB5kSB3vT1ru6cgPsmVk87PkFCsdqf3fIE8txf4ERiAONaOzo05Iw+iM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nKO1AmfkJgXzA7HHgGEQg4IKtEzM+c/6Utx+qrCfOsM=; b=fcQL7RXK/R5a4TB/l5RfMmSh9W
 YoMNfesKGvt9UNdvmP5vbI0wNdXUKuRGzPVbsGSJAw0Ul5aAku2J0NQlt66fQvuLtAF7zY7ywCjtg
 m8MGZuE5MQOBy8aXxiGzuWZVSFlH/J+GJPN5uD626mpnVFVXIhvr84PQFPyGfkyaTj4M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q3a4F-005eW0-08 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 10:25:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9952962275;
 Mon, 29 May 2023 10:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0B8C43444;
 Mon, 29 May 2023 10:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685355929;
 bh=mhmseRew1rTCm9zFzSEkDkJPwSum8ODdYqdgHcRs1tQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rImqZZFWn1Z5wwnr0T9nik+nA4fB2I6kyceTt80Ut5bW1Qi+LtLkYW53sET8AA9s5
 j38Zb0ae9NV5+somZ0caRc92HiPGxWkcGvTa5jZpYgdEzo1hDdgm0jsGLggnQLbd2e
 BDXI6Shvhv8W5dRYiRX3xfXWPLS0Cs1hKIOdG9HXvXmvHVyuzt7pJL6HhBq4kJc58w
 pmyEFTuhvTlNO3gzt0BK0AjEk/xhZ9CSJQ6H6OT/QlypRdUOaSgHycuUIHVx99xLg1
 i4FU33TqQMwOBKWltsomjJZbJ6nGQNIjMPTGwCrvN1ILBU6T3Nw7DQUf/npbMmuZsl
 NOjwknuidvWrg==
Message-ID: <f542a922-affe-23ae-f023-05ec5ca20b9c@kernel.org>
Date: Mon, 29 May 2023 18:25:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Chunhai Guo <guochunhai@vivo.com>
References: <20230527170640.37930-1-guochunhai@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230527170640.37930-1-guochunhai@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/28 1:06, Chunhai Guo wrote: > find_fsync_dnodes()
 detect the looped node chain by comparing the loop > counter with free blocks.
 While it may take tens of seconds to quit when > the free blo [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q3a4F-005eW0-08
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: Detect looped node chain efficiently
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 frank.li@vivo.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/28 1:06, Chunhai Guo wrote:
> find_fsync_dnodes() detect the looped node chain by comparing the loop
> counter with free blocks. While it may take tens of seconds to quit when
> the free blocks are large enough. We can use Floyd's cycle detection
> algorithm to make the detection more efficient.
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
