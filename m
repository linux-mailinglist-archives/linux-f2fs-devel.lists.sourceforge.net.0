Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7C290C0E5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jun 2024 03:04:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sJNGS-00010H-46;
	Tue, 18 Jun 2024 01:04:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sJNGQ-000101-Hc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iyFpyQE/3e00k/SOi1R4it4pVYm3Qv1WKc4+j1QBy1o=; b=VkBByLZvOgoLTlZ6YBUruS2oQ+
 yHXP+yF26+bfbOZOUQ+XxcofRHdZsWrDY/wj5UyiCiG3a9RiuPM/O5ibkXvMdHYOLbjx4e37RzWYj
 5Q2X38cYaoHq5/4N5j6QsR+HrvwXJ4Xo3WpDlIGKe5LQjic1iOdpqVR9QZaT2+0H9z4A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iyFpyQE/3e00k/SOi1R4it4pVYm3Qv1WKc4+j1QBy1o=; b=iPj2qw11Niuy/YDl4Nk8HQfSQO
 dgvbsO8zwM9npcY+luT4Y5sBpQkFAXqjRVOFx1wk+tR4zKWxN0lMkuijY/xgUtMPzljLus29oRTlx
 qgcXicwYHVpQAjyqcidBX7NSRt8RMoK1kg8fd4eSTyjGLQW7UMx+Z47RnscCT1OzOwFY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sJNGQ-00066g-Rk for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:03:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6C341CE13F9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Jun 2024 01:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1030C2BD10;
 Tue, 18 Jun 2024 01:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718672625;
 bh=/swPX5W6fAnNAGqwBtdSnQTYwnfC0j2x33mqYPjbDds=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=qLDqtAXspqkGVmptyAuy0Wvklru0L2/sDTEmv0HEJcKNB8dIQvYjs61GwyTnb6RfJ
 tGrRGkqbWNjCWckIWxLCcnITqUkj2pPC+uNDKrPpvi2yvf8N6Q21b3g2i2Nzno3vvS
 FV8wFFvO28yXvLVqMuG/V+kXSoqlEAhk207GYX5ASTpRwWF5U9Mlj2pKvv9e5vJ/V7
 rO+gmYvZbk3TfYbufBaxJd8rlDC5ROhbpZkuZk58C8dulwrOUf3rHTAZw/iXq0+fpK
 JvTD3b0chM71gWwA5w3wbCpznMtcg3nMafOBgdv2ymgmt0S27wddJM49FIVG3DQLPo
 bEMrK/Zhs8VaA==
Message-ID: <8547fb4d-e046-4b7e-b3f9-b52ed09fd645@kernel.org>
Date: Tue, 18 Jun 2024 09:03:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240612193831.106524-1-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240612193831.106524-1-jaegeuk@kernel.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/13 3:38, Jaegeuk Kim wrote: > Let's set REQ_RAHEAD
 per rac by single source. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJNGQ-00066g-Rk
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up set REQ_RAHEAD given rac
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

On 2024/6/13 3:38, Jaegeuk Kim wrote:
> Let's set REQ_RAHEAD per rac by single source.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
