Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7C45B65E6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 04:59:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXw8r-0002CR-HB;
	Tue, 13 Sep 2022 02:59:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oXw8p-0002CL-HW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 02:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yk39hJSAL1s337j3y2QUcMrFO19OnLEQBFX5zV3Sg+Y=; b=AKiarKW8JFe/NHXp9gSto1xKq2
 O7f2OWHrZM6altDZMXwHVIDyTx2G1IeSUYnsWH4Ek1lSyvbMQg02S3I4NaOBSyxV6iEM+8+muzZQc
 JOwaLsTWhuo3c8W7W/FFJVgyPkzysUFbDQx5++m/FI5hskRhT8I+Q4TDMQsTo++12tH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yk39hJSAL1s337j3y2QUcMrFO19OnLEQBFX5zV3Sg+Y=; b=BGkwioC0qxQVWgtMJsLk8sy5tK
 BDk0fkvfAB2dVv92G1gDLQdplU2Lzu1dCOBVjdPdpSzGR4DoTqJf9RR26avyGpRt3vpCq9b+kqUYC
 LlyqSOM7Rb+fxe1NotgeFf25y80G5nJmxVEMSK49KVs0rRJKRBNh8ZFwLsUFIbFYWRqk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oXw8o-00041u-RQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 02:59:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9011BB80E11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Sep 2022 02:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A873C433D7;
 Tue, 13 Sep 2022 02:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663037939;
 bh=Iuuhzzq+GhRVr/IvNg5kSnLKv8rP3SeJsSTWDYFcbh0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=inEYw3f9y8DakPYxBvnlGpUl6JJckq91J5p6hIOUNDbGPw6BDpIBIHB1S+ijwegL7
 I1QmOuBrsMkJX4qolz4w3CUfzBrDZ0IDiwMfx4OpUqUBMk/9ChXu1QC3uIoQU39roK
 Az30b7douIb2pNnsZNd2eQxDyf/OH7I+n5464M9FfTM6gcZdkccEqxZEGA/AhJLJgp
 tFn8/g656rsFcHNZqYD06fJzXLL8eRFHG5uAqkYohJKSoCljaddOJVpDci5lJye0sr
 Ky8TZBMU9fg/5ZIiJs3XAtpYy+9LN3FHAykCeUJqcU0MTJ3Kpivy4a8DeWvZS6KJiv
 n03vR26zgDNhQ==
Message-ID: <934dca55-c3ec-56bb-63c4-83decd27d2f5@kernel.org>
Date: Tue, 13 Sep 2022 10:58:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220819231514.3609958-1-jaegeuk@kernel.org>
 <YwaD7mJpMLhEm5wd@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YwaD7mJpMLhEm5wd@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/25 4:02, Jaegeuk Kim wrote: > This avoids -EINVAL
 when trying to freeze f2fs. > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oXw8o-00041u-RQ
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: flush pending checkpoints when
 freezing super
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

On 2022/8/25 4:02, Jaegeuk Kim wrote:
> This avoids -EINVAL when trying to freeze f2fs.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
