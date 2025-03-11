Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F37A5BFB5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 12:49:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1try6b-00073p-Ld;
	Tue, 11 Mar 2025 11:49:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1try6Z-00073h-QF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 11:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZV8SfdmAYYRjxZYl+60/mnv/ptgzISctLkr76mAkXhI=; b=f1AnesNNn9vjU5KCGYbz5OQFdJ
 yJemkB7VXRbh9HbBsLLmjRmYosK1ex9QY+uzgsKLM5HqeAPhn2fNbxuT2rJyNSRspNK4ZLYLEwaiQ
 uuvFzUVoWZ0TMEa2wBF2m3NZwtl+W9eDiNS3VgRAWG4vH01A2xh5MhkPtHgTIiqN6vQc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZV8SfdmAYYRjxZYl+60/mnv/ptgzISctLkr76mAkXhI=; b=BVO+SwXZaZDOUON9f7cNPLgsDT
 OIMs/yv+ugjbQjHBKevV0ZXNj2UhhDW+fIMt9+Ic4R4BfEmGw4iVDOpA2Lr0qOAi7n5/fzG7fVPeE
 onB9cuCiGAeA/JdNy3HzteoTZXZ3sKBEdY8YD6y/jgbi4rdxYzf+BL2jR3dT50jr5sgA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1try6U-0003Ox-VU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 11:49:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C84EC5C5C43;
 Tue, 11 Mar 2025 11:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C71AC4CEE9;
 Tue, 11 Mar 2025 11:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741693733;
 bh=ct1RD5Dm6Apm9DcwI7XbOMNgTuO9NkqnuJ8nAT5LQqk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=pXEEMMWpBGQjI7QDoUTKp7aHbBl3dKuT95/mUUumVuP6bS8hOCAAnCOVklo0Rc6kH
 i7bXA8Ese0b/ZTRW3QLP1npyf8+Ws+hUA+Sg4nnEkIdBegDmdypio4SUPt7CXslPVG
 VELsElybZiwM5nIPqLSAHSkUko+ArtNhXozvhP7YDn1v6n9F9DAsoww77BFWQvqQvB
 qHNpk5BQBhq9X2e/kcluQGIjlNdmsdJ/8+ol7UAbVDGWu1HpCDI8nueHU7B3/Vx0eW
 lYNgmFHAtTA4dgo6jkzHPWulU0ZtGSteNo8fAnw5e9EwCMLja1KMa+AhW847UeuiN6
 5SbewQNfaeFyQ==
Message-ID: <9562210b-bf6e-4bbc-860f-40aec418ea36@kernel.org>
Date: Tue, 11 Mar 2025 19:48:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250307182151.3397003-1-willy@infradead.org>
 <20250307182151.3397003-2-willy@infradead.org>
Content-Language: en-US
In-Reply-To: <20250307182151.3397003-2-willy@infradead.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/8/25 02:21,
 Matthew Wilcox (Oracle) wrote: > We're almost
 able to remove a_ops->writepage. This check is unnecessary > as we'll never
 call into __f2fs_write_data_pages() for character > devices. [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1try6U-0003Ox-VU
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: Remove check for ->writepage
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
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/8/25 02:21, Matthew Wilcox (Oracle) wrote:
> We're almost able to remove a_ops->writepage.  This check is unnecessary
> as we'll never call into __f2fs_write_data_pages() for character
> devices.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
