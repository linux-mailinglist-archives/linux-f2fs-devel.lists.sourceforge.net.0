Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 494A79BC2D7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2024 02:55:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t88n9-0005WI-OU;
	Tue, 05 Nov 2024 01:55:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t88n8-0005W5-PL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 01:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KPCghk9G4CTVEDAPMpdyPVr90+/gX1/kLM67tOCCkps=; b=SmEkeFOGpLp5ifNxXnnj5Dldvo
 qbrt4ZnEWx3zZVrx11yONAEgVPn0sWYaIv+11QcY4QYGrQM4nOs6gMQ8Qy63lQbvxLRhbRlZqUJbS
 E26J0g9nL9Jns649bcCS3yGpHGeQPrO0R84uYMGs+eE6dSY509HyktxU9YVmjYom8fkQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KPCghk9G4CTVEDAPMpdyPVr90+/gX1/kLM67tOCCkps=; b=RjtQa+Fza82jiKFkeeK6O/euyu
 lSRhmW9tQss/S+bRjlq9Vi2LCRA+lc+iPjJWCQEdFM/shfywTvvSO51jF0VjIlf6fONIdDAOyCLg6
 wsy9cIPD8Kdsk5DMJ9y3Nzm0gK6SHBnsxXZOgvR66rlQAxRguQUg7UE+5xdsm7Wn7i7c=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t88n8-0007Uf-5B for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 01:55:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5D14FA41C8A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Nov 2024 01:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50338C4CECE;
 Tue,  5 Nov 2024 01:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730771723;
 bh=KPCghk9G4CTVEDAPMpdyPVr90+/gX1/kLM67tOCCkps=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=smBWTUU3D1x/6h5lOLQaj3uAKlYENSq3kOdjYuGrZHdDjV/TEA/7tnPoo9El2FwH8
 exJ9mdh6YpjBcc4hsWMKmwRqJyLN2aXpV0savDkTB/duRKtlK5jTqjowjhWTzY7X2I
 njJ5p5/x5G5RoN+VuQjGrfhmYo+peTETSCwXJj9UcB18TOi4ip5iE3uIdGCFq4tKpY
 +QEgOCNQcg0YrnxREmEvy8xlT/H4V6VDg5/BSIS/s/4Rh3v8QbS5aNPmYda4PaXMfR
 CaqWNRUXBBGjhtpqDSQ0YN7W3/qBM3OCQbl8xC+t6Ti3mnBEqxPU7Dlv5UNKFXkWAu
 gnN2Y+0FIDmAw==
Message-ID: <f65d229d-aa24-4549-a5b7-c1699a61fbff@kernel.org>
Date: Tue, 5 Nov 2024 09:55:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20241101235318.300320-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20241101235318.300320-1-jaegeuk@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/2 7:53, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu
 <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t88n8-0007Uf-5B
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs_io: support 1GB dio buffer
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/11/2 7:53, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
