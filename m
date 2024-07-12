Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE9392F61B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2024 09:24:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sSAdV-0004sO-Te;
	Fri, 12 Jul 2024 07:24:09 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sSAdU-0004sG-JL
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 07:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xzNrA/TSJLASDe0oz+Ym4XCRdWn47lOwfsxFlNmVk+k=; b=FrcnljAIlekdaikW7fnILTbuQY
 rNwrdsD0pb9ZHl6mXnurjdLTaUIcGF3jgRMdTtE/jSP1UArD7dU/kwdHhiZOS8oA0PEHe32MJ+f+s
 W5FSX49JRafbAVzodCcuBH8A6EzPmzcFJ9IQusohotdfpUznzQ+QBVinQdkAUeYkM1+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xzNrA/TSJLASDe0oz+Ym4XCRdWn47lOwfsxFlNmVk+k=; b=hYcuOupLa1mfNt9Q0+wAKqySm8
 FSige94VffQoS+BpMAZLxWLC5g6M8Q6RAKg72SLVfBBVi6e5BLTzHDJIXbx/8GV4SOw6ZbQsscMCW
 ETMHkW/7CI+BlzsepTQ8Jo7I4u9yru+hrOW2xmjxRFRzkgfjkty0lLUHvs3TKlbtozmo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sSAdU-0005CD-3L for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 07:24:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ED48D61E1C;
 Fri, 12 Jul 2024 07:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2B3C3277B;
 Fri, 12 Jul 2024 07:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720769036;
 bh=GTTtD9y/JWJ+MaUYc7bkysWR54S+lYhg/UQCdbU9kPM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Riap1uj8h6fPv1Tgiy4BC5NxE45PBfxl3k3wK65qvIeOCV73dG51p1rUhYTt4Bys0
 uuF/Gda+xyb+YH8Xulx+9CfGNw19lV8Zf62iz43Qy9n6/KNCwTYDs5qeW+DjeIRAf4
 FketK9PGv08soqsQDBLmYsZ/NhmT4HJuHyNBWlMTyFQyYOBq1AgDMhiKwMGkL35rBo
 1rV0FljQNFhMJxxhAnXYNJPxGNJqjHbNnszpI5SDnaKPMrVjdEZLsInJk7E6GFRS8+
 dS2E2hlZ4+Zx9pXZB6STuZ+a5FNokvu0ThdD2XfmYj+cuj3qEreZ7VJYQ0FcAPez0y
 SMfhREGuhCpPA==
Message-ID: <cdafa166-2b34-49cb-bcc0-9d99a118aad9@kernel.org>
Date: Fri, 12 Jul 2024 15:23:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20240712020133.140148-1-shengyong@oppo.com>
 <20240712020133.140148-4-shengyong@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240712020133.140148-4-shengyong@oppo.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/12 10:01, Sheng Yong wrote: > For zoned model, the
 first device (devices[0]) is not zoned device, > whose zoned_model is not
 F2FS_ZONED_HM. Let's skip it and check write > pointer of left de [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sSAdU-0005CD-3L
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: fix checking wp of all devices
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/12 10:01, Sheng Yong wrote:
> For zoned model, the first device (devices[0]) is not zoned device,
> whose zoned_model is not F2FS_ZONED_HM. Let's skip it and check write
> pointer of left devices continuously.
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
