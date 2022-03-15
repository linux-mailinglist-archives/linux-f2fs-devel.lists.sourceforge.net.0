Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D08614D9592
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Mar 2022 08:48:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nU1un-0006yw-3L; Tue, 15 Mar 2022 07:48:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nU1uj-0006yp-Jp
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 07:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8WF68RSJW8w5Di93b1aXe5ytRFHvtrNuS7OSDnsz9oc=; b=OQIfKgMWxQioKqK0j++KdhOzzj
 M4L46vXUwjeLeJ7SeCVRhz6Z5Mg98m71L8d+roNneDin0r9QWhm2NVKxrVjgZf2e3ZqVBOL0LUf7u
 j3nNKPgdn2fdL9CGMHEYO2RnufqNbdLTsQaCGF7AyCerzFywmhvj8BasCVWU34NVU5y8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8WF68RSJW8w5Di93b1aXe5ytRFHvtrNuS7OSDnsz9oc=; b=X63QGC0YCuGCJGIjASYkWmze6T
 TtLOwsIBKW3oASVZwwks3mLKnv7jpIxpBUhiuUa4h0s5bJ4TF2sZ7qDTK1cYyjUQFRP6RMiRtuzNd
 MLPczVX2OIBf/jjdN2zC97n3zMOTKzZz8udg+PvQ2w8FK+NrusJzuv/G5xpZwhB7Nmj8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nU1ue-00GIf8-Gp
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 07:48:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 31E51B81118;
 Tue, 15 Mar 2022 07:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEECC340E8;
 Tue, 15 Mar 2022 07:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647330475;
 bh=y8w6Yp7xlaSwProEFYTPKDoItN59Uid9xYaKJ4N5T08=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D5tG9J3ZzLhGUNaKkXeCuN2OaIDdqBpnz60saHQtmOSIa/HCRzyiCyTGluZZOopJh
 uSzD51u5Ra9t+GvDT8yEGP7K6YMS12dhJKXvC+etu+ePvKxim+pIcxQMYDOmVVJ6ss
 FMSWVCY29hYMIYG5wULvQmt9wZ5X80U/9SZlDDWn9qDh538ZyyY+yZJ7+u4qT2iv8M
 4fjoZah88kdqaRgez6snRGOsoaQv0NcbKGuhL/oJReRixbBS/BL5WYyEWGXAYFr7jx
 oZOEyAn1gpHoDqo5EbGefL0kgz7zgsMgpFWDceJ3wuWjAZl0VBcb02Sfcdr/IJUHEa
 GsXa6paP4Lciw==
Message-ID: <55f225da-ae76-77d7-04f6-b631bfa17b53@kernel.org>
Date: Tue, 15 Mar 2022 15:47:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Wang Xiaojun <wangxiaojun11@huawei.com>, jaegeuk@kernel.org
References: <20220314071515.93565-1-wangxiaojun11@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220314071515.93565-1-wangxiaojun11@huawei.com>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/14 15:15, Wang Xiaojun via Linux-f2fs-devel wrote:
 > iput() has already judged the incoming parameter, so there is > no need
 to repeat the judgment here. > > Signed-off-by: Wang Xiaojun <wan [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nU1ue-00GIf8-Gp
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove redundant parameter judgment
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

On 2022/3/14 15:15, Wang Xiaojun via Linux-f2fs-devel wrote:
> iput() has already judged the incoming parameter, so there is
> no need to repeat the judgment here.
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
