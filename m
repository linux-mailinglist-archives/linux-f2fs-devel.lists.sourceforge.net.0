Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DCEA5D4C1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 04:32:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsCpP-0005hb-KC;
	Wed, 12 Mar 2025 03:32:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tsCpM-0005hT-TT
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 03:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sXebHCkdkldykEKFer+b3pjAsgnXGqIqgc4QVJkWMwc=; b=bNgiXpSXXFekZot7ecyEcUHurD
 GGcKCK987hw7UfeidKgN1AnALsB8w7Xx/Ju/YI4Emypc4SC5LOxzmD6OvAEAV2ZMSvxZARQ0xMRH5
 nDXCgVMfu0nP/PB0S8qsVGY04S/lfVyGaE6omd6QvXwHaqxy/7CI18pqOdJutpNw0lfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sXebHCkdkldykEKFer+b3pjAsgnXGqIqgc4QVJkWMwc=; b=MkGlIONADJupDrUsrEeKp0pw3w
 gbl8leA2/BIMPzqPIT8qREKjUccRszPWT9KrVgvrzG4VtJuYVD30OhDVRzilcS3zoueplr9xQggDt
 7G9KI41+TQTCvVmeyRxO8iaIv1M1ojE1gtSD/aP4R61Wnfl7cfBV2nXvfaaFg6TlLUcw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsCpH-0007cO-9M for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 03:32:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8E4AFA45CF3;
 Wed, 12 Mar 2025 03:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477B2C4CEE3;
 Wed, 12 Mar 2025 03:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741750320;
 bh=dkMPz5FPZ77gbnz+xKXfcsTjpiW5Ee0ph2LNBgGoRC0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=XDEnXJUFP6y7AxT4TSmBJmBsl8RcgbA6Uyp+V8aj3ve18AHmv5KggKapC5lybyJjc
 iyob2zbxGpVsCCrvjUA8HrAwTFTijJysNscvxTZ3QRMF4fF6BsBNGyOM2iyjNAORPV
 V2mV+QPzm7IBCJnwASYNjPYxCFQFpwQVwIO769XpzXZ7G5n9PqApGvp0xacgMrQpgn
 BpAFTC5rqmrtesm/cLxIVwDLJJYSFG3Ha595PWWJ4fGGaML2xkBg6v+GQNx8nboeLx
 ifi6caMtKK9g9O+X+/PGxv4Z7onG71fHc3Vm6/CjQuwwjwFAyX7MSedQeg5mJThtRg
 JAK+te4TI5moA==
Message-ID: <079fb2d6-4c92-44e1-bfed-894139a1caae@kernel.org>
Date: Wed, 12 Mar 2025 11:31:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250303172127.298602-1-sandeen@redhat.com>
 <20250303172127.298602-8-sandeen@redhat.com>
Content-Language: en-US
In-Reply-To: <20250303172127.298602-8-sandeen@redhat.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/4/25 01:12,
 Eric Sandeen wrote: > Defer the readonly-vs-norecovery
 check until after option parsing is done > so that option parsing does not
 require an active superblock for the test. > Add a he [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsCpH-0007cO-9M
Subject: Re: [f2fs-dev] [PATCH 7/9] f2fs: defer readonly check vs norecovery
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
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/4/25 01:12, Eric Sandeen wrote:
> Defer the readonly-vs-norecovery check until after option parsing is done
> so that option parsing does not require an active superblock for the test.
> Add a helpful message, while we're at it.
> 
> (I think could be moved back into parsing after we switch to the new mount
> API if desired, as the fs context will have RO state available.)
> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
