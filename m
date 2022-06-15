Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DD654C330
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jun 2022 10:12:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1O89-0001aK-WD; Wed, 15 Jun 2022 08:12:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>)
 id 1o1O88-0001a6-DT; Wed, 15 Jun 2022 08:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3QnqSks6NcTUjFKZ7Y6wvGt9kJk5GEaGqFXMuSNmBgw=; b=TPbwAe8QKb/CnkwSLc39poNYLs
 M4EZe2Pu/w5NhQCgKmAX4zY0vc+vMp0Usouh5crjGTxA2Ro4kVpenDNnxxNy44FssnOBfk4JWLaAQ
 gm2cpZ/L2dWM7BBWfrqyfZxeiANmyYmmZa0XDiFUhAAF9z0cScWEc7VPMKkslN3Yh3Tg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3QnqSks6NcTUjFKZ7Y6wvGt9kJk5GEaGqFXMuSNmBgw=; b=WqfvtCVKYJnbp21u60SwtSjbQg
 Koft8Z5HtKva/gRKnmuCm41taAqDn+Oikm6R8UQ7fkj8vjBsom32U3zvnqfpUCKj35iefTnNqmpxc
 470fb51PcI+/5moqrjablCO8BxvRXpZDcE2rHWrk6A13YkJAVQbFPxWFgmevSwkAKAiQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1O85-002C58-FI; Wed, 15 Jun 2022 08:12:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1403361727;
 Wed, 15 Jun 2022 08:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353B6C34115;
 Wed, 15 Jun 2022 08:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655280703;
 bh=G8h+IDpJR0CvhZVQBHmA8xXUGMUALrZIeamkPUOOwAc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J6Y3XOcwoC/TgUHQEi+SmCxARb6tPwZNqAYZg5XUTUI3Q/ll5OApOdFtKbROVKu0J
 G3wBk9/2zrpVCGzGGdhz1ESbgkoh73YGsKSRIOJUxvsHV+/K5Zd6avT4WMepRjY9H4
 wamp6FUhQPTuGWEhQiYvx6IJuRvj3n1pbZp2ZHUm41s47toXZ4TP69nqNoX31VqQXs
 PJkwswu6LBuH667SA02KF13mHrfORzWm/2zDlI2HgW90bjJCTh4CmOq+CyWlVyareR
 TNZ8wmpjenOnCxxJfBdf7GMJYbuk/uABYuIiv48owX1ckCCiZaFExYBEBPHV4h2PdO
 DbPuKfjHUQGOA==
Message-ID: <5fdec03e-efb6-554b-55b3-49e7e7f2be5e@kernel.org>
Date: Wed, 15 Jun 2022 16:11:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-15-willy@infradead.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220608150249.3033815-15-willy@infradead.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/8 23:02,
 Matthew Wilcox (Oracle) wrote: > filemap_migrate_folio()
 fits f2fs's needs perfectly. > > Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> Acked-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o1O85-002C58-FI
Subject: Re: [f2fs-dev] [PATCH v2 14/19] f2fs: Convert to
 filemap_migrate_folio()
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ext4@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/8 23:02, Matthew Wilcox (Oracle) wrote:
> filemap_migrate_folio() fits f2fs's needs perfectly.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Acked-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
